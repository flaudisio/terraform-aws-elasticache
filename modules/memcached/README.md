# Memcached module

This module can be used to create an [ElastiCache Memcached cluster](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/WhatIs.html)
on AWS.

## How to use this module?

- See the [repository README](../../README.md) for instructions on how to use modules.
- See the [examples](../../examples) folder for sample usage.
- See [variables.tf](variables.tf) for all the variables supported by this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Group identifier. ElastiCache converts this name to lowercase. Changing this value will re-create the resource | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The instance class used | `string` | n/a | yes |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | The initial number of cache nodes that the cache cluster will have; must be between 1 and 40. If this number is reduced on subsequent runs, the highest numbered nodes will be removed | `number` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone for the cache cluster. If you want to create cache nodes in multi-AZ, use `preferred_availability_zones` instead. Defaults to system chosen availability zone | `string` | `null` | no |
| <a name="input_az_mode"></a> [az\_mode](#input\_az\_mode) | Whether the nodes in this Memcached node group are created in a single availability zone or created across multiple AZs in the cluster's region.<br>Valid values are `single-az` or `cross-az`, default is `single-az`. If you want to choose `cross-az`, `num_cache_nodes` must be greater than 1 | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version number of the cache engine to be used. If not set, defaults to the latest version | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the cluster parameter group | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is `ddd:hh24:mi-ddd:hh24:mi` (24h clock UTC).<br>The minimum maintenance window is a 60 minute period. Example: `sun:05:00-sun:09:00`" | `string` | `null` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | The description of the parameter group. Defaults to "Managed by Terraform" | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | The name of the cluster parameter group. If not defined; `cluster_id` will be used | `string` | `null` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of parameter maps to apply | `list(map(string))` | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | The port number on which each of the cache nodes will accept connections | `number` | `11211` | no |
| <a name="input_preferred_availability_zones"></a> [preferred\_availability\_zones](#input\_preferred\_availability\_zones) | List of the availability zones in which cache nodes are created. The number of availability zones listed must equal the value of `num_cache_nodes`.<br>To deploy all the nodes in the same availability zone, use `availability_zone` instead, or repeat the AZ multiple times in the list.<br>Defaults to System chosen Availability Zones. Detecting drift of existing node availability zone is not currently supported. Updating this argument by itself to migrate existing node availability zones is not currently supported and will show a perpetual difference" | `list(string)` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | One or more VPC security groups associated with the cache cluster | `list(string)` | `null` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | Name of the subnet group to be used for the cache cluster | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of key-value tags to be applied to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_address"></a> [cluster\_address](#output\_cluster\_address) | The DNS name of the cluster without the port appended |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | The ARN of the Memcached cluster |
| <a name="output_cluster_cache_nodes"></a> [cluster\_cache\_nodes](#output\_cluster\_cache\_nodes) | The list of node objects including `id`, `address`, `port` and `availability_zone` |
| <a name="output_cluster_configuration_endpoint"></a> [cluster\_configuration\_endpoint](#output\_cluster\_configuration\_endpoint) | The configuration endpoint to allow host discovery |
| <a name="output_cluster_engine_version_actual"></a> [cluster\_engine\_version\_actual](#output\_cluster\_engine\_version\_actual) | The running version of the cache engine |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the Memcached cluster |
| <a name="output_cluster_port"></a> [cluster\_port](#output\_cluster\_port) | The port number on which each of the cache nodes accept connections |
| <a name="output_cluster_tags_all"></a> [cluster\_tags\_all](#output\_cluster\_tags\_all) | Map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_parameter_group_arn"></a> [parameter\_group\_arn](#output\_parameter\_group\_arn) | The ARN of the parameter group |
| <a name="output_parameter_group_id"></a> [parameter\_group\_id](#output\_parameter\_group\_id) | The name of the parameter group |
| <a name="output_parameter_group_name"></a> [parameter\_group\_name](#output\_parameter\_group\_name) | The name of the parameter group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
