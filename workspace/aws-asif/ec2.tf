

resource "aws_key_pair" "admin" {
  key_name   = "${var.environment}-admin"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmbQLYWEdxtaTNkB8ew884PzjwILSoegg+vixUt+XzVGUp9dvcAB8+8BfiZISO3a+WmOYhWFCXuxrzRljnioTu1hBXrZWqSI2MFv2LSj+Gdg6ovIhl8pVr0WedsZH+kKVwDZ2Ua5xdWbjaSg0AOXnCXNSc0v5LtTu1vs+UTi9rVyI/kJA2XiCuZpK2MbeVld3a0ocwy+/06f75fmcXtej0KmfMPYXV6X/glSGab0NjXeMPQITcDKIC48YS8n3FlymcoUYKDaqmFN3C4kU+OJkUwZdU7Fag4Bq0pfidm2huBN/TPnv60cw0mSpid7x3m0CTFLvtUJfcK3qz9mCKv7S7"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["1", "2"])

  name = "${var.environment}-instance-${each.key}"

  ami                    = var.linux_ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.admin.key_name
  monitoring             = false
  vpc_security_group_ids = [module.ec2_sg.security_group_id]
  subnet_id              = aws_subnet.ec2.id

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}
