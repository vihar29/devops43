// Declare a string


variable "simple-string" {
  type = string // no need of this if you give the value in double quotes
  default = "SIMPLE"
}
// Note : if you give the value in double quotes tf automatically considers  it as a string

variable "simple-number" {
  type = number // no need of giving them in double quotes if defaut value is number
  default = 100
}
variable "simple-boolean" {
  type = bool // no need of giving them in double quotes if defaut value is boolean
  default = true
}
variable "simple-list" {
  type = "list"
  default = [1 ,2]

}
resource "null_resource" "sample2" {
  provisioner "local-exec" {
    command = "echo -e \" string = ${var.simple-string}\n boolean = ${var.simple-boolean}\n number =${var.simple-number}\""
  }
  provisioner "local-exec" {
    command = "echo -e value1 = ${var.simple-list a[1] }"
  }
}

