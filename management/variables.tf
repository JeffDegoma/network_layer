variable "subnet_cidr_public" {
  type              =   "list" 
  default           =   ["10.20.1.0/24"]
}


variable "subnet_cidr_private" {
  type              = "list"
  default           = [ "10.20.4.0/24"]
}


variable "vpc_cidr" {
	default =   "10.20.0.0/16"
}

variable "environment" {
    default =   "management"
}

variable "cidr_range" {
  description       =   "cidr address"
  type              =   "list"
  default           =   ["0.0.0.0/0"]
}

variable "az" {
  type              =   "list"
  default           =   ["us-east-1a", "us-east-1b", "us-east-1c"]
}
