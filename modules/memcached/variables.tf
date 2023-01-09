variable "cluster_id" {
  description = "Group identifier. ElastiCache converts this name to lowercase. Changing this value will re-create the resource"
  type        = string
}

variable "engine_version" {
  description = "Version number of the cache engine to be used. If not set, defaults to the latest version"
  type        = string
  default     = null
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections"
  type        = number
  default     = 11211
}

variable "node_type" {
  description = "The instance class used"
  type        = string
}

variable "security_group_ids" {
  description = "One or more VPC security groups associated with the cache cluster"
  type        = list(string)
  default     = null
}

variable "subnet_group_name" {
  description = "Name of the subnet group to be used for the cache cluster"
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "Whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "num_cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have; must be between 1 and 40. If this number is reduced on subsequent runs, the highest numbered nodes will be removed"
  type        = number
}

variable "az_mode" {
  description = <<-EOT
    Whether the nodes in this Memcached node group are created in a single availability zone or created across multiple AZs in the cluster's region.
    Valid values are `single-az` or `cross-az`, default is `single-az`. If you want to choose `cross-az`, `num_cache_nodes` must be greater than 1
  EOT
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "The availability zone for the cache cluster. If you want to create cache nodes in multi-AZ, use `preferred_availability_zones` instead. Defaults to system chosen availability zone"
  type        = string
  default     = null
}

variable "preferred_availability_zones" {
  description = <<-EOT
    List of the availability zones in which cache nodes are created. The number of availability zones listed must equal the value of `num_cache_nodes`.
    To deploy all the nodes in the same availability zone, use `availability_zone` instead, or repeat the AZ multiple times in the list.
    Defaults to System chosen Availability Zones. Detecting drift of existing node availability zone is not currently supported. Updating this argument by itself to migrate existing node availability zones is not currently supported and will show a perpetual difference"
  EOT
  type        = list(string)
  default     = null
}

variable "maintenance_window" {
  description = <<-EOT
    Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is `ddd:hh24:mi-ddd:hh24:mi` (24h clock UTC).
    The minimum maintenance window is a 60 minute period. Example: `sun:05:00-sun:09:00`"
  EOT
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "The name of the cluster parameter group. If not defined; `cluster_id` will be used"
  type        = string
  default     = null
}

variable "parameter_group_description" {
  description = "The description of the parameter group. Defaults to \"Managed by Terraform\""
  type        = string
  default     = null
}

variable "family" {
  description = "The family of the cluster parameter group"
  type        = string
  default     = null
}

variable "parameters" {
  description = "A list of parameter maps to apply"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "Map of key-value tags to be applied to resources"
  type        = map(string)
  default     = {}
}
