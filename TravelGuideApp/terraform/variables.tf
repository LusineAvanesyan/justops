variable "provider_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "Vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnets" {
  description = "VPC public subnets cidr block"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_private_subnets" {
  description = "VPC private subnets cidr block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable Nat gateway for vpc"
  type        = bool
  default     = true
}

variable "enable_simple_nat_gateway" {
  description = "Enable one nate gateway for all azs"
  type        = bool
  default     = true
}

variable "public_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default = {
    type = "public"
  }
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default = {
    type = "private"
  }
}

variable "s3_name" {
  type    = string
  default = "aca-test-project-bucket"
}
