variable "sample" {
  default = "bsbhs"
}
variable "sample2" {
  default = 100112

}
local {
  sample01 = "${var.sample}-${var.sample2}"
}

output "SAMPLE"{
  value = local.sample01

}