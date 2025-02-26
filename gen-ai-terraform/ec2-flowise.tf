module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.6.0"

  name = "${local.prefix}-${local.project}-ec2-instance"

  ami           = var.ec2_ami # Ubuntu 24.04 LTS
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.instance.id]
  subnet_id              = var.public_subnets[0]

  # Flowise install script
  user_data = file("${path.module}/user-data/user-data.sh")

  tags = {
    Name        = "${local.prefix}-${local.project}-ec2-instance"
    Environment = local.environment
    Project     = local.project
  }
}

resource "aws_security_group" "instance" {
  name_prefix = "${local.prefix}-${local.project}-sg"
  # Flowise port 3000
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
