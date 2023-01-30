variable "subnets" {
  type = map(any)
  default = {
    subnet-a = {
      az   = "us-east-1a"
      cidr = "19.0.1.0/24"
    }
    subnet-b = {
      az   = "us-east-1b"
      cidr = "19.0.2.0/24"
    }
    subnet-c = {
      az   = "us-east-1c"
      cidr = "19.0.3.0/24"
    }

  }
}

variable "cidr_block" {
  type        = string
  description = "my vpc cidr block"
}

variable "vpc_name" {
  type        = string
  description = "my vpc name"
}

variable "region" {
  type        = string
  description = "my region"
}

variable "inbound_ports" {
  type        = list(number)
  description = "inbound ports for sg"
}

variable "domain" {
  type        = string
  description = "domain name"
}

variable "a-record" {
  type        = string
  description = "subdomain"
}

variable "ami" {
  type        = string
  description = "instance ami"
}

variable "instance_type" {
  type        = string
  description = "instance type"
}


variable "key_name" {
  type        = string
  description = "keypair name"
}

variable "filepath" {
  type        = string
  description = "filepath for my hosts"
}

variable "alb-sg" {
  type        = string
  description = "alb security name"
}