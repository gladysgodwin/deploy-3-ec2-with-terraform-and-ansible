variable "privsubnet" {
  type        = string
  description = "list of my priv subnets cidr"
}

variable "pubsubnets" {
  type        = list(string)
  description = "my public subnets cidr"
}

variable "azs" {
  type        = list(string)
  description = "azs"
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