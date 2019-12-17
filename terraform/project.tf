provider "aws" {
  region = "us-west-2"
}
variable "aws_ami" {
default = "ami-02c419e998e13412a"
}

resource "aws_instance" "web" {
  ami = var.aws_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0f9f5f95328faead3"]
  provisioner "remote-exec" {
    inline = [
    "yum install nginx -y"
    ]
  }
}
