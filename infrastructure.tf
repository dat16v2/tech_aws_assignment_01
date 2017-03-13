variable "samaritan_aws_access_key" {}
variable "samaritan_aws_secret_key" {}

provider "aws" {
  access_key = "${var.samaritan_aws_access_key}"
  secret_key = "${var.samaritan_aws_secret_key}"
  region = "eu-central-1"
}


resource "aws_instance" "kea" {
  ami = "ami-9bf712f4"
  instance_type = "t2.nano"
  key_name = "kea_tech"
  security_groups = ["kea_tech"]
}
