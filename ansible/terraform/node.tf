provider "aws" {
  region = "us-west-2"
}
variable "aws_ami" {
  default = "ami-021e78b340c8f907e"
}

resource "aws_instance" "node1" {
  ami = var.aws_ami
  instance_type = "t2.micro"
  key_name = "yourkey"
  vpc_security_group_ids = ["sg-0f9f5f95328faead3","sg-0c1e7ed2b4feb7930","sg-08d1de278ab886323"]
  iam_instance_profile = "EC2-READONLY"
  tags = {
    Name ="NODE1"
  }

}
#resource "aws_instance" "node2" {
 # ami = var.aws_ami
  #instance_type = "t2.micro"
  #key_name = "yourkey"
  #vpc_security_group_ids = ["sg-0f9f5f95328faead3"]
  #tags = {
   # Name ="NODE2"
  #}

#}
resource "local_file" "inventory" {
  filename = "../hosts-inventory"
  content = "${aws_instance.node1.public_ip}"
}



