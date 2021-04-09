variable "allowed_ports" {
  default     = ["80", "443", "8080"]
  description = "List of ports allowed on servers"
}

variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "dns-name" {
  type    = string
  default = "adv-host.co.uk"
}

variable "my_ip" {
  type = string
  default = "91.214.85.149/32"
}