# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.${local.vpc_octet[var.environment]}.0.0/16"
}

resource "aws_subnet" "ec2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.${local.vpc_octet[var.environment]}.1.0/24"

  tags = {
    Name        = "ec2"
    Environment = var.environment
  }
}

resource "aws_subnet" "rds" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.${local.vpc_octet[var.environment]}.2.0/24"

  tags = {
    Name        = "rds"
    Environment = var.environment
  }
}
