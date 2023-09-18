resource "aws_s3_bucket" "wordpress_files_bucket" {
  bucket = var.bucket_name
  tags = {
    name = "wordpress-bucket"
  }
}

locals {
  s3_origin_id = var.s3_origin_id
}

resource "aws_cloudfront_origin_access_control" "my_origin" {
  name                              = local.s3_origin_id
  description                       = "Origin access control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

data "aws_cloudfront_cache_policy" "cache-optimized" {
  name = "Managed-CachingOptimized"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.wordpress_files_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.my_origin.id
    origin_id                = local.s3_origin_id

  }

  enabled         = true
  is_ipv6_enabled = true
  comment         = "my-cloudfront"

  default_cache_behavior {
    cache_policy_id        = data.aws_cloudfront_cache_policy.cache-optimized.id
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid       = "AllowCloudFrontServicePrincipal"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.wordpress_files_bucket.arn}/*"]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["${aws_cloudfront_distribution.s3_distribution.arn}"]
    }
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
  }
}

resource "aws_s3_bucket_policy" "mybucket" {
  bucket = aws_s3_bucket.wordpress_files_bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
