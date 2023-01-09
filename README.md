# AWS ElastiCache modules

This repo contains modules for deploying and managing [ElastiCache](https://docs.aws.amazon.com/elasticache/index.html)
resources.

- [memcached](modules/memcached): module to provision a Memcached cluster.

Click on each module above to see its documentation. See the [examples](examples) folder for working usage examples.

## Using a Terraform module

To use a module in your Terraform templates, set the `source` argument to the Git URL of this repo. You should also set
the `ref` parameter to a specific version, as the `main` branch will occasionally have backward incompatible changes.

For example, to use `v0.1.0` of the `memcached` module:

```hcl
module "memcached" {
  source = "git::https://github.com/flaudisio/terraform-aws-elasticache.git//modules/memcached?ref=v0.1.0"

  # Module inputs
  cluster_id     = "my-cluster"
  engine_version = "1.6.12"
  # ...
}
```

## Tests

See the [test](test) folder for details.
