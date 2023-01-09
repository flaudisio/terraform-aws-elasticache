provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  name = "default"
}

locals {
  tags = {
    created-by = "Terraform"
  }
}

resource "aws_elasticache_subnet_group" "example" {
  name       = var.cluster_id
  subnet_ids = data.aws_subnets.selected.ids
}

module "memcached" {
  source = "../../modules/memcached"

  cluster_id = var.cluster_id

  engine_version = "1.6.12"
  port           = 11211

  node_type = "cache.t3.micro"

  security_group_ids = [data.aws_security_group.default.id]
  subnet_group_name  = aws_elasticache_subnet_group.example.name

  num_cache_nodes = 1
  az_mode         = "single-az"

  family = "memcached1.6"

  tags = local.tags
}
