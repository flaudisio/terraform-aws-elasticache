# ------------------------------------------------------------------------------
# PARAMETER GROUP
# ------------------------------------------------------------------------------

resource "aws_elasticache_parameter_group" "this" {
  name        = var.parameter_group_name != null ? var.parameter_group_name : var.cluster_id
  description = var.parameter_group_description

  family = var.family

  dynamic "parameter" {
    for_each = var.parameters

    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = var.tags
}

# ------------------------------------------------------------------------------
# ELASTICACHE CLUSTER
# ------------------------------------------------------------------------------

resource "aws_elasticache_cluster" "this" {
  cluster_id = var.cluster_id

  engine         = "memcached"
  engine_version = var.engine_version
  port           = var.port

  node_type = var.node_type

  security_group_ids = var.security_group_ids
  subnet_group_name  = var.subnet_group_name

  num_cache_nodes              = var.num_cache_nodes
  az_mode                      = var.az_mode
  availability_zone            = var.availability_zone
  preferred_availability_zones = var.preferred_availability_zones

  parameter_group_name = var.parameter_group_name

  apply_immediately  = var.apply_immediately
  maintenance_window = var.maintenance_window

  tags = var.tags
}
