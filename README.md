# terraform-aws-adminaccess

## Introduction

This module manages basic administrative access in AWS.

## Usage

Instantiate the module by calling it from Terraform like this:

```hcl
module "aws-eks" {
  source = "dodevops/adminaccess/aws"
  version = "<version>"
  
  (...)
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- terraform (>=1.0.0)

- aws (>=3.33.0)

## Providers

The following providers are used by this module:

- aws (>=3.33.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_iam_group.adminGroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) (resource)
- [aws_iam_group_policy_attachment.assumeRoleForAdmin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) (resource)
- [aws_iam_policy.assumeRoleForAdmin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) (resource)
- [aws_iam_policy.iampolicyadmin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) (resource)
- [aws_iam_role.iamroleadmin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)
- [aws_iam_role_policy_attachment.iamrolepolicyattachmentadmin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) (resource)
- [aws_iam_policy_document.allowAll](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.assumeRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.assumeRoleForAdmin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)

## Required Inputs

The following input variables are required:

### project

Description: Project this configuration is for

Type: `string`

### stage

Description: Name of the stage for this state

Type: `string`

### trusted\_root\_account\_arn

Description: ARN of the account used as a root account for access purposes (= where the real users live in)

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### adminRoleArn

Description: ARN of the admin role
<!-- END_TF_DOCS -->

## Development

Use [the terraform module tools](https://github.com/dodevops/terraform-module-tools) to check and generate the documentation by running

    docker run -v "$PWD":/terraform ghcr.io/dodevops/terraform-module-tools:latest
