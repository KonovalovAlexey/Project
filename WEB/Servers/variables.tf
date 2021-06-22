variable "allowed_ports" {
  default     = ["80", "443", "8080"]
  description = "List of ports allowed on servers"
}


variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}


variable "dns-name" {
  type    = string
  default = "buleiko.link"
}

variable "web_name" {
  type    = string
  default = "pet"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "dev"
}

variable "public_subnets" {
  default = [
    "10.0.1.0/24",
    "10.0.2/0/24"
  ]
}

variable "private_subnets" {
  default = [
    "10.0.11.0/24",
    "10.0.22.0/24"
  ]
}
