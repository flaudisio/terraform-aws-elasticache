variable "cluster_id" {
  description = "Group identifier. ElastiCache converts this name to lowercase. Changing this value will re-create the resource"
  type        = string
  default     = "memcached-single-az-example"
}
