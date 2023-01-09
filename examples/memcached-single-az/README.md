# Memcached single-AZ example

This folder shows an example of how to deploy a Memcached cluster in a single availability zone.

## Usage

To apply this example, run:

```console
$ terraform init
$ terraform plan
$ terraform apply
```

To destroy the provisioned resources:

```console
$ terraform destroy
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.49.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_memcached"></a> [memcached](#module\_memcached) | ../../modules/memcached | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_subnet_group.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnets.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Group identifier. ElastiCache converts this name to lowercase. Changing this value will re-create the resource | `string` | `"memcached-single-az-example"` | no |

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
