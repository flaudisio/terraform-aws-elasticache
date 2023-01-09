output "cluster_arn" {
  description = "The ARN of the Memcached cluster"
  value       = module.memcached.cluster_arn
}

output "cluster_id" {
  description = "The ID of the Memcached cluster"
  value       = module.memcached.cluster_id
}

output "cluster_engine_version_actual" {
  description = "The running version of the cache engine"
  value       = module.memcached.cluster_engine_version_actual
}

output "cluster_cache_nodes" {
  description = "The list of node objects including `id`, `address`, `port` and `availability_zone`"
  value       = module.memcached.cluster_cache_nodes
}

output "cluster_address" {
  description = "The DNS name of the cluster without the port appended"
  value       = module.memcached.cluster_address
}

output "cluster_port" {
  description = "The port number on which each of the cache nodes accept connections"
  value       = module.memcached.cluster_port
}

output "cluster_configuration_endpoint" {
  description = "The configuration endpoint to allow host discovery"
  value       = module.memcached.cluster_configuration_endpoint
}

output "cluster_tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.memcached.cluster_tags_all
}

output "parameter_group_arn" {
  description = "The ARN of the parameter group"
  value       = module.memcached.parameter_group_arn
}

output "parameter_group_id" {
  description = "The name of the parameter group"
  value       = module.memcached.parameter_group_id
}

output "parameter_group_name" {
  description = "The name of the parameter group"
  value       = module.memcached.parameter_group_name
}
