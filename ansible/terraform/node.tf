provider "aws" {
  region = "us-west-2"
}
variable "aws_ami" {
  default = "ami-0c98a6bf9be7285b5"
}

resource "aws_instance" "node1" {
  ami = var.aws_ami
  instance_type = "t2.micro"
  key_name = "sshvg"
  vpc_security_group_ids = ["sg-0f9f5f95328faead3"]
  tags = {
    Name ="NODE1"
  }

}
resource "aws_instance" "node2" {
  ami = var.aws_ami
  instance_type = "t2.micro"
  key_name = "sshvg"
  vpc_security_group_ids = ["sg-0f9f5f95328faead3"]
  tags = {
    Name ="NODE2"
  }

}
resource "local_file" "inventory" {
  filename = "../hosts-inventory"
  content = "${aws_instance.node1.public_ip}\n${aws_instance.node2.public_ip}"
}



