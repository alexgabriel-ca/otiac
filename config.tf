module "config" {
  source  = "trussworks/config/aws"
  version = "8.1.0"
  config_logs_bucket = "awsconfigrecorderbucket"
    depends_on = [
    aws_s3_bucket.config_recorder
  ]
    tags = {
    Name = "OpenText Config Rule Creation"
    Environment = var.environment
  }
}