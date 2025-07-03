terraform {
  backend "s3" {
    bucket = "krishnadevops-learn"
    key    = "env-dev/state"
    region = "us-east-1"
  }
}


module "tool-infra" {
  source = "./module-infra"
  for_each = var.tools

  ami_id = var.ami_id
  instance_type = each.value["instace_type"]
  name = each.key
  port = each.value["port"]
  zone_id = var.zone_id
}
variable "tools" {
  default = {
    vault = {
      instance_type = "t2.micro"
      port = 8200

    }
  }
}

variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}
variable "zone_id" {
  default = "Z02373281TX1LHFU7BPXU"
}