variable "allowed_ports" {
  default     = ["80", "443", "8080"]
  description = "List of ports allowed on servers"
}

variable "region-appserver" {
  type    = string
  default = "eu-central-1"
}

variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "my_ip" {
  type = string
  default = "91.214.85.149/32"
}