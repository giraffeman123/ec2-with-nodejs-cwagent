provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "nodejs_api" {
  source            = "./modules/ec2"
  environment       = "dev"
  application       = "fsa-api"
  app_port          = 3000
  db_host           = "flight-db.xaldigital.mx"
  db_user           = "root"
  db_pwd            = "holamundo123"
  db_name           = "flight-db"
  answer_endpoint   = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow"
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id
  ec2_ami_id        = "ami-024e6efaf93d85776"
  ec2_instance_type = "t2.micro"
  ec2_key_name      = "aws-test"
}