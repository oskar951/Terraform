variable "ubuntu-ami" {
  description = "ubuntu ami"
  default     = "ami-00f6a0c18edb19300"
}

variable "instance-type" {
  description = "instance type"
  default = "t2.micro"

}

variable "pem-key" {
  default = "NewPair"
}

variable "subnet_id" {
  description = "subnet id"
  default = ""
}

variable "vpc_security_group_ids" {
  default = ""
}

variable "tags" {
  default = ""
}

variable "associate_public_ip_address" {
  default = ""
}