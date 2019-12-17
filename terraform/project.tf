variable "aws_ami" {
default = "ami-02c419e998e13412a"
}

resource "aws_instance" "web" {
  ami = var.aws_ami
  instance_type = "t2.micro"
}
