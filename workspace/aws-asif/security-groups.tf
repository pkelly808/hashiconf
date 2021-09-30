module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ec2-sg"
  description = "Security group for ec2 instances"
  vpc_id      = aws_vpc.main.id

  ingress_cidr_blocks = ["104.32.35.165/32"]
  ingress_rules       = ["ssh-tcp"]
}
