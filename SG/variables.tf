variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 8080, 80, 443]
}

variable "name" {
  description = "VPC name"
  default = "VPC1"

}

variable "vpc_id" {
  default = ""
}

variable "open-internet" {
  description = "open internet CIDR block"
  default = ["0.0.0.0/0"]
}

variable "outbound-port" {
  default = "0"
}