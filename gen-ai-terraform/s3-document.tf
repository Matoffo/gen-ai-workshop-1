module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.0.0"

  bucket     = "${local.prefix}-${local.project}-s3-bucket"
  acl        = "private"
  versioning = "disable"

  tags = {
    Name        = "${local.prefix}-${local.project}-s3-bucket"
    Environment = local.environment
    Project     = local.project
  }
}
