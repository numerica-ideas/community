#create the vpc
resource "aws_vpc" "infrastructure_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  instance_tenancy     = "default"

  tags = {
    Name = var.vpc_name
  }
}

#Create an internet gateway It enables our vpc to connect to the internet
resource "aws_internet_gateway" "infrastructure_igw" {
  vpc_id = aws_vpc.infrastructure_vpc.id

  tags = {
    Name = var.igw_name

  }
  lifecycle {
    create_before_destroy = true
  }
}


# Create public subnets
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr_blocks)

  cidr_block                          = var.public_subnet_cidr_blocks[count.index]
  vpc_id                              = aws_vpc.infrastructure_vpc.id
  map_public_ip_on_launch             = true //it makes this a public subnet
  private_dns_hostname_type_on_launch = "ip-name"
  availability_zone                   = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.public_subnet_name_prefix}-${count.index + 1}"
  }
}

# Create private subnets
resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr_blocks)

  cidr_block                          = var.private_subnet_cidr_blocks[count.index]
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id                              = aws_vpc.infrastructure_vpc.id
  availability_zone                   = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.private_subnet_name_prefix}-${count.index + 1}"
  }
}

# Create route table for public subnets
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.infrastructure_vpc.id
  count  = length(aws_subnet.public_subnet)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.infrastructure_igw.id
  }
  tags = {
    Name = "${var.public_rt_name}-${count.index + 1}"
  }
}

# Create route table for private subnets
resource "aws_route_table" "private_route" {
  count  = length(aws_subnet.private_subnet)
  vpc_id = aws_vpc.infrastructure_vpc.id
  tags = {
    Name = "${var.private_rt_name}-${count.index + 1}"
  }
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public_rt_association" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route[count.index].id
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private_rt_association" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route[count.index].id
}

# resource "aws_eip" "nat_eip" {
#   count = 2
#   vpc   = true
# }

# resource "aws_nat_gateway" "nat_gateway" {
#   count         = length(aws_subnet.public_subnet)
#   allocation_id = aws_eip.nat_eip[count.index].id
#   subnet_id     = aws_subnet.public_subnet[count.index].id
# }


# resource "aws_route" "nat_gateway_route" {
#   count                  = 2
#   route_table_id         = aws_route_table.private_route[count.index + 2].id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat_gateway[count.index].id
# }
