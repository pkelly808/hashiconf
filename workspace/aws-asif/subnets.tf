resource "aws_subnet" "ec2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name        = "ec2"
    Environment = var.environment
  }
}

resource "aws_subnet" "rds" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name        = "rds"
    Environment = var.environment
  }
}
