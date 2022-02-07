terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.0"
}

locals {
  tags = merge(
    var.global_tags,
    var.local_tags
  )
}

provider "aws" {
  region = var.region
  default_tags {
    tags = local.tags
  }
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_filter]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami_owner]
}

locals {
  # ami_id precedence:
  # 1. var.ami_id
  # 3. aws_ami
  ami_id = var.ami_id != "" ? var.ami_id : data.aws_ami.ami.id
}

resource "aws_instance" "instance" {
  count                       = var.instance_count
  ami                         = local.ami_id
  instance_type               = var.instance_type
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }

  tags = {
    Name = "${var.prefix}-demo-${count.index}"
  }
}
