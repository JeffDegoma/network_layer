variable "subnet_cidr_public" {
  type              =   "list" 
  default           =   ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
}


variable "subnet_cidr_private" {
  type              = "list"
  default           = [ "10.20.4.0/24", "10.20.5.0/24", "10.20.6.0/24"]
}


variable "vpc_cidr" {
	default =   "10.20.0.0/16"
}

variable "environment" {
    default =   "dev"
}

variable "server_port" {
  description       =   "webserver port for HTTP requests"
  default           =   80
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
