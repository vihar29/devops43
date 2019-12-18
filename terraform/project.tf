provider "aws" {
  region = "us-west-2"
}
variable "aws_ami" {
default = "ami-0c98a6bf9be7285b5"
}

resource "aws_instance" "web" {
  ami = var.aws_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0f9f5f95328faead3","sg-0c1e7ed2b4feb7930","sg-08d1de278ab886323"]
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }
    inline = [
      "cd /tmp" ,
      "git clone https://github.com/vihar29/devops43.git",
      "cd devops43/project/",
      "sh web.sh"
    ]
  }
}
