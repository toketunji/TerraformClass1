########################
# VARIABLE DECLARATION #
########################

#Basic connection information
variable "aws_access_key"       { default = "xxxxxxxxxx" }  
variable "aws_secret_key"       { default = "xxxxxxxxxx" } 
variable "region"               { default  = "eu-west-1" } 
variable "azs"                  { default = { "eu-west-1"  = "a,b"} }


#Network

variable "vpc_cidr"             { default = "10.0.0.0/16" }
variable "subnet_bits"          { default = "2" }

#TAG variables
variable "owner" {
  default = "TOPE"
}

variable "environ"  {
  default = "PROD"
}

variable "app_name" {
  default = "TERRAFORM_VPC"
}

