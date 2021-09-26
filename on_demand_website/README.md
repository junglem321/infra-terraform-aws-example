<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | > 3, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend-instances"></a> [backend-instances](#module\_backend-instances) | ./modules/instances | n/a |
| <a name="module_db_mysql"></a> [db\_mysql](#module\_db\_mysql) | ./modules/database | n/a |
| <a name="module_frontend-instances"></a> [frontend-instances](#module\_frontend-instances) | ./modules/instances | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.alb_sg_be](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.alb_sg_fe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.instance_be](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.instance_fe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_port_be"></a> [app\_port\_be](#input\_app\_port\_be) | n/a | `number` | n/a | yes |
| <a name="input_app_port_fe"></a> [app\_port\_fe](#input\_app\_port\_fe) | n/a | `number` | n/a | yes |
| <a name="input_asg_name_be"></a> [asg\_name\_be](#input\_asg\_name\_be) | ASG instance backend | `string` | `null` | no |
| <a name="input_asg_name_fe"></a> [asg\_name\_fe](#input\_asg\_name\_fe) | ASG instance frontend | `string` | `null` | no |
| <a name="input_desired_capacity_be"></a> [desired\_capacity\_be](#input\_desired\_capacity\_be) | n/a | `number` | `1` | no |
| <a name="input_desired_capacity_fe"></a> [desired\_capacity\_fe](#input\_desired\_capacity\_fe) | n/a | `number` | `1` | no |
| <a name="input_max_size_be"></a> [max\_size\_be](#input\_max\_size\_be) | n/a | `number` | `2` | no |
| <a name="input_max_size_fe"></a> [max\_size\_fe](#input\_max\_size\_fe) | n/a | `number` | `2` | no |
| <a name="input_min_size_be"></a> [min\_size\_be](#input\_min\_size\_be) | n/a | `number` | `1` | no |
| <a name="input_min_size_fe"></a> [min\_size\_fe](#input\_min\_size\_fe) | n/a | `number` | `1` | no |
| <a name="input_password"></a> [password](#input\_password) | n/a | `string` | n/a | yes |
| <a name="input_path_to_public_key"></a> [path\_to\_public\_key](#input\_path\_to\_public\_key) | n/a | `string` | `"mykey.pub"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"ca-central-1"` | no |
| <a name="input_ssh_ip_host"></a> [ssh\_ip\_host](#input\_ssh\_ip\_host) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_username"></a> [username](#input\_username) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->