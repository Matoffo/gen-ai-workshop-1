module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.10.0"

  name = "${local.prefix}-${local.project}-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnet_cidrs
  private_subnets = var.private_subnet_cidrs

  enable_nat_gateway = false

  tags = {
    Name        = "${local.prefix}-${local.project}-vpc"
    Environment = local.environment
    Project     = local.project
  }
}
