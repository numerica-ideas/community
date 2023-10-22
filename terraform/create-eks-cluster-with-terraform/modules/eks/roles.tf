data "aws_iam_role" "eks_role" {
  name = var.eks_role
}

data "aws_iam_role" "node_role" {
  name = var.node_role
}
