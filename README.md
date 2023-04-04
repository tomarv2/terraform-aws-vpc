<p align="center">
    <a href="https://github.com/tomarv2/terraform-aws-vpc/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-aws-vpc/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-aws-vpc" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-vpc/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-vpc" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-vpc/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-aws-vpc" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://twitter.com/intent/follow?screen_name=tomar_v2" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/tomar_v2?style=social&logo=twitter"></a>
</p>

## Terraform module for AWS VPC

### Versions

- Module tested for Terraform 1.0.1.
- AWS provider version [4.23](https://registry.terraform.io/providers/hashicorp/aws/latest).
- `main` branch: Provider versions not pinned to keep up with Terraform releases.
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-aws-vpc/tags" alt="GitHub tag">
  <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-vpc" /></a>).

### Usage

#### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```

**Note:** With this option please take care of remote state storage

#### Option 2:

##### Recommended method (stores remote state in S3 using `prjid` and `teamid` to create directory structure):

- Create python 3.8+ virtual environment

```
python3 -m venv <venv name>
```

- Install package:

```
pip install tfremote --upgrade
```

- Set below environment variables:

```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export TF_AWS_PROFILE=<profile from ~/.ws/credentials>
```

or

- Set below environment variables:

```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export AWS_ACCESS_KEY_ID=<aws_access_key_id>
export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
```

- Updated `examples` directory with required values.

- Run and verify the output before deploying:

```
tf -c=aws plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:

```
tf -c=aws apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:

```
tf -c=aws destroy -var='teamid=foo' -var='prjid=bar'
```

**Note:** Read more on [tfremote](https://github.com/tomarv2/tfremote)

##### VPC with default settings

```
module "vpc" {
  source = "github.com/tomarv2/terraform-aws-vpc.git"

  #------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

##### Coming up:

- New version of VPC module to cover cases like `shared vpc`.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 4.23  |
| <a name="requirement_random"></a> [random](#requirement_random)          | ~> 3.1   |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)          | ~> 4.23 |
| <a name="provider_random"></a> [random](#provider_random) | ~> 3.1  |

## Modules

| Name                                         | Source                        | Version |
| -------------------------------------------- | ----------------------------- | ------- |
| <a name="module_vpc"></a> [vpc](#module_vpc) | terraform-aws-modules/vpc/aws | 3.14.2  |

## Resources

| Name                                                                                                                                  | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [random_string.naming](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                         | resource    |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name                                                                                                                                                                           | Description                                                                                                                                                                                                                                                                   | Type                | Default                | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | ---------------------- | :------: |
| <a name="input_cidr_block"></a> [cidr_block](#input_cidr_block)                                                                                                                | The CIDR block for the VPC                                                                                                                                                                                                                                                    | `string`            | `"10.4.0.0/16"`        |    no    |
| <a name="input_create_flow_log_cloudwatch_iam_role"></a> [create_flow_log_cloudwatch_iam_role](#input_create_flow_log_cloudwatch_iam_role)                                     | Whether to create IAM role for VPC Flow Logs                                                                                                                                                                                                                                  | `bool`              | `false`                |    no    |
| <a name="input_create_flow_log_cloudwatch_log_group"></a> [create_flow_log_cloudwatch_log_group](#input_create_flow_log_cloudwatch_log_group)                                  | Whether to create CloudWatch log group for VPC Flow Logs                                                                                                                                                                                                                      | `bool`              | `false`                |    no    |
| <a name="input_create_igw"></a> [create_igw](#input_create_igw)                                                                                                                | Controls if an Internet Gateway is created for public subnets and the related routes that connect them.                                                                                                                                                                       | `bool`              | `true`                 |    no    |
| <a name="input_extra_tags"></a> [custom_tags](#input_custom_tags)                                                                                                              | Extra custom tags                                                                                                                                                                                                                                                             | `any`               | `null`                 |    no    |
| <a name="input_default_security_group_egress"></a> [default_security_group_egress](#input_default_security_group_egress)                                                       | List of maps of egress rules to set on the default security group                                                                                                                                                                                                             | `list(map(string))` | `[]`                   |    no    |
| <a name="input_default_security_group_ingress"></a> [default_security_group_ingress](#input_default_security_group_ingress)                                                    | List of maps of ingress rules to set on the default security group                                                                                                                                                                                                            | `list(map(string))` | `[]`                   |    no    |
| <a name="input_default_security_group_tags"></a> [default_security_group_tags](#input_default_security_group_tags)                                                             | Additional tags for the default security group                                                                                                                                                                                                                                | `map(string)`       | `{}`                   |    no    |
| <a name="input_enable_dns_hostnames"></a> [enable_dns_hostnames](#input_enable_dns_hostnames)                                                                                  | Should be true to enable DNS hostnames in the VPC                                                                                                                                                                                                                             | `bool`              | `true`                 |    no    |
| <a name="input_enable_flow_log"></a> [enable_flow_log](#input_enable_flow_log)                                                                                                 | Whether or not to enable VPC Flow Logs                                                                                                                                                                                                                                        | `bool`              | `false`                |    no    |
| <a name="input_enable_nat_gateway"></a> [enable_nat_gateway](#input_enable_nat_gateway)                                                                                        | Should be true if you want to provision NAT Gateways for each of your private networks                                                                                                                                                                                        | `bool`              | `true`                 |    no    |
| <a name="input_flow_log_cloudwatch_iam_role_arn"></a> [flow_log_cloudwatch_iam_role_arn](#input_flow_log_cloudwatch_iam_role_arn)                                              | The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow_log_destination_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided.                                                                                    | `string`            | `""`                   |    no    |
| <a name="input_flow_log_cloudwatch_log_group_kms_key_id"></a> [flow_log_cloudwatch_log_group_kms_key_id](#input_flow_log_cloudwatch_log_group_kms_key_id)                      | The ARN of the KMS Key to use when encrypting log data for VPC flow logs.                                                                                                                                                                                                     | `string`            | `null`                 |    no    |
| <a name="input_flow_log_cloudwatch_log_group_name_prefix"></a> [flow_log_cloudwatch_log_group_name_prefix](#input_flow_log_cloudwatch_log_group_name_prefix)                   | Specifies the name prefix of CloudWatch Log Group for VPC flow logs.                                                                                                                                                                                                          | `string`            | `"/aws/vpc-flow-log/"` |    no    |
| <a name="input_flow_log_cloudwatch_log_group_retention_in_days"></a> [flow_log_cloudwatch_log_group_retention_in_days](#input_flow_log_cloudwatch_log_group_retention_in_days) | Specifies the number of days you want to retain log events in the specified log group for VPC flow logs.                                                                                                                                                                      | `number`            | `null`                 |    no    |
| <a name="input_flow_log_destination_arn"></a> [flow_log_destination_arn](#input_flow_log_destination_arn)                                                                      | The ARN of the CloudWatch log group or S3 bucket where VPC Flow Logs will be pushed. If this ARN is a S3 bucket the appropriate permissions need to be set on that bucket's policy. When create_flow_log_cloudwatch_log_group is set to false this argument must be provided. | `string`            | `""`                   |    no    |
| <a name="input_flow_log_destination_type"></a> [flow_log_destination_type](#input_flow_log_destination_type)                                                                   | Type of flow log destination. Can be s3 or cloud-watch-logs.                                                                                                                                                                                                                  | `string`            | `"cloud-watch-logs"`   |    no    |
| <a name="input_flow_log_file_format"></a> [flow_log_file_format](#input_flow_log_file_format)                                                                                  | (Optional) The format for the flow log. Valid values: `plain-text`, `parquet`.                                                                                                                                                                                                | `string`            | `"plain-text"`         |    no    |
| <a name="input_flow_log_hive_compatible_partitions"></a> [flow_log_hive_compatible_partitions](#input_flow_log_hive_compatible_partitions)                                     | (Optional) Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3.                                                                                                                                                                               | `bool`              | `false`                |    no    |
| <a name="input_flow_log_log_format"></a> [flow_log_log_format](#input_flow_log_log_format)                                                                                     | The fields to include in the flow log record, in the order in which they should appear.                                                                                                                                                                                       | `string`            | `null`                 |    no    |
| <a name="input_flow_log_max_aggregation_interval"></a> [flow_log_max_aggregation_interval](#input_flow_log_max_aggregation_interval)                                           | The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds.                                                                                                                   | `number`            | `600`                  |    no    |
| <a name="input_flow_log_per_hour_partition"></a> [flow_log_per_hour_partition](#input_flow_log_per_hour_partition)                                                             | (Optional) Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries.                                                                                                                                                         | `bool`              | `false`                |    no    |
| <a name="input_flow_log_traffic_type"></a> [flow_log_traffic_type](#input_flow_log_traffic_type)                                                                               | The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL.                                                                                                                                                                                                            | `string`            | `"ALL"`                |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                                                                                  | Name of the resource                                                                                                                                                                                                                                                          | `string`            | `null`                 |    no    |
| <a name="input_one_nat_gateway_per_az"></a> [one_nat_gateway_per_az](#input_one_nat_gateway_per_az)                                                                            | Should be true if you want only one NAT Gateway per availability zone. Requires var.azs to be set, and the number of public_subnets created to be greater than or equal to the number of availability zones specified in var.azs.                                             | `bool`              | `true`                 |    no    |
| <a name="input_private_subnet_tags"></a> [private_subnet_tags](#input_private_subnet_tags)                                                                                     | Tags to add to any created private subnets                                                                                                                                                                                                                                    | `any`               | `null`                 |    no    |
| <a name="input_private_subnets"></a> [private_subnets](#input_private_subnets)                                                                                                 | A list of private subnets inside the VPC                                                                                                                                                                                                                                      | `list(string)`      | `[]`                   |    no    |
| <a name="input_prjid"></a> [prjid](#input_prjid)                                                                                                                               | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'                                                                                                                                                                      | `string`            | n/a                    |   yes    |
| <a name="input_public_subnet_tags"></a> [public_subnet_tags](#input_public_subnet_tags)                                                                                        | Tags to add to any created public subnets                                                                                                                                                                                                                                     | `any`               | `null`                 |    no    |
| <a name="input_public_subnets"></a> [public_subnets](#input_public_subnets)                                                                                                    | A list of public subnets inside the VPC                                                                                                                                                                                                                                       | `list(string)`      | `[]`                   |    no    |
| <a name="input_single_nat_gateway"></a> [single_nat_gateway](#input_single_nat_gateway)                                                                                        | Should be true if you want to provision a single shared NAT Gateway across all of your private networks                                                                                                                                                                       | `bool`              | `true`                 |    no    |
| <a name="input_teamid"></a> [teamid](#input_teamid)                                                                                                                            | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'                                                                                                                                                                           | `string`            | n/a                    |   yes    |
| <a name="input_vpc_flow_log_permissions_boundary"></a> [vpc_flow_log_permissions_boundary](#input_vpc_flow_log_permissions_boundary)                                           | The ARN of the Permissions Boundary for the VPC Flow Log IAM Role                                                                                                                                                                                                             | `string`            | `null`                 |    no    |
| <a name="input_vpc_flow_log_tags"></a> [vpc_flow_log_tags](#input_vpc_flow_log_tags)                                                                                           | Additional tags for the VPC Flow Logs                                                                                                                                                                                                                                         | `map(string)`       | `{}`                   |    no    |

## Outputs

| Name                                                                                                                 | Description                                 |
| -------------------------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| <a name="output_default_security_group_id"></a> [default_security_group_id](#output_default_security_group_id)       | The ID of the security group created by VPC |
| <a name="output_internet_gateway_route_id"></a> [internet_gateway_route_id](#output_internet_gateway_route_id)       | ID of the internet gateway route            |
| <a name="output_private_route_table_ids"></a> [private_route_table_ids](#output_private_route_table_ids)             | List of IDs of private route tables         |
| <a name="output_private_subnet_arns"></a> [private_subnet_arns](#output_private_subnet_arns)                         | List of ARNs of private subnets             |
| <a name="output_private_subnets"></a> [private_subnets](#output_private_subnets)                                     | List of IDs of private subnets              |
| <a name="output_private_subnets_cidr_blocks"></a> [private_subnets_cidr_blocks](#output_private_subnets_cidr_blocks) | List of cidr_blocks of private subnets      |
| <a name="output_public_route_table_ids"></a> [public_route_table_ids](#output_public_route_table_ids)                | List of IDs of public route tables          |
| <a name="output_public_subnet_arns"></a> [public_subnet_arns](#output_public_subnet_arns)                            | List of ARNs of public subnets              |
| <a name="output_public_subnets"></a> [public_subnets](#output_public_subnets)                                        | List of IDs of public subnets               |
| <a name="output_public_subnets_cidr_blocks"></a> [public_subnets_cidr_blocks](#output_public_subnets_cidr_blocks)    | List of cidr_blocks of public subnets       |
| <a name="output_security_group"></a> [security_group](#output_security_group)                                        | List of cidr_blocks of private subnets      |
| <a name="output_subnet_arns"></a> [subnet_arns](#output_subnet_arns)                                                 | List of subnets ARNs                        |
| <a name="output_subnets"></a> [subnets](#output_subnets)                                                             | List of subnets IDs                         |
| <a name="output_vpc_id"></a> [vpc_id](#output_vpc_id)                                                                | The ID of the VPC                           |

<!-- END_TF_DOCS -->
