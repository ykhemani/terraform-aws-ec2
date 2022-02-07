variable "region" {
  type        = string
  description = "AWS Region in which to deploy our instance."
  default     = "us-east-1"
}

variable "prefix" {
  type        = string
  description = "Naming prefix"
}

variable "ami_filter" {
  type        = string
  description = "AMI filter - e.g. ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "ami_owner" {
  type        = string
  description = "Owner of AMI - e.g. 099720109477"
  default     = "099720109477"
}

variable "ami_id" {
  type        = string
  description = "Optional AMI ID - use this if not blank string, otherwise use AMI per ami_filter and ami_owner."
  default     = ""
}

variable "instance_count" {
  type        = number
  description = "Number of instances to provision."
  default     = 1
}

variable "instance_type" {
  type        = string
  description = "Instance size."
  default     = "t2.medium"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type."
  default     = "gp2"
}

variable "root_volume_size" {
  type        = number
  description = "Root volume size in GB."
  default     = 50
}

variable "public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address to ec2 instance."
  default     = false
}

variable "global_tags" {
  type        = map(string)
  description = "Default tags to apply to AWS resources. Meant to be defined via Variable Sets in your Terraform Cloud organization, but can be overriden if needed."
  default     = {}
}

variable "local_tags" {
  type        = map(string)
  description = "Local tags to apply to cloud resources."
  default     = {}
}
