variable "samaritan_aws_access_key" {}
variable "samaritan_aws_secret_key" {}

provider "aws" {
  access_key = "${var.samaritan_aws_access_key}"
  secret_key = "${var.samaritan_aws_secret_key}"
  region = "eu-central-1"
}


resource "aws_instance" "kea" {
  ami = "ami-9bf712f4"
  instance_type = "t2.small"
  key_name = "kea_tech"
  security_groups = ["kea_tech"]
  count = 1
  root_block_device {
    delete_on_termination = false
  }

  provisioner "file" {
    source = "/Users/ec/go/src/faker.clausen/root/stil-status"
    destination = "/home/centos"

    connection {
      type = "ssh"
      user = "centos"
      private_key = "${file("kea_tech.pem")}"
    }
  }

  provisioner "file" {
    source = "setup_script_down.sh"
    destination = "/home/centos/setup_script_down.sh"
    connection {
      type = "ssh"
      user = "centos"
      private_key = "${file("kea_tech.pem")}"
    }  

  }
 
  provisioner "file" {
    source = "keatech.service"
    destination = "/home/centos/keatech.service"
    connection {
      type = "ssh"
      user = "centos"
      private_key = "${file("kea_tech.pem")}"
    }
  }
 
  provisioner "remote-exec" {
    inline = [
      "chmod +x setup_script_down.sh",
      "sh setup_script_down.sh",
    ]
    connection {
      type = "ssh"
      user = "centos"
      private_key = "${file("kea_tech.pem")}"
    }
  }
}
