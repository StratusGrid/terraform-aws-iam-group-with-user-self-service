<!-- BEGIN_TF_DOCS -->
<p align="center">                                                                                                                                            
                                                                                
  <img src="https://github.com/StratusGrid/terraform-readme-template/blob/main/header/stratusgrid-logo-smaller.jpg?raw=true" />
  <p align="center">
    <a href="https://stratusgrid.com/book-a-consultation">Contact Us Test</a>
    <a href="https://stratusgrid.com/cloud-cost-optimization-dashboard">Stratusphere FinOps</a>
    <a href="https://stratusgrid.com">StratusGrid Home</a>
    <a href="https://stratusgrid.com/blog">Blog</a>
  </p>
</p>

# terraform-aws-iam-group-with-user-self-service

GitHub: [StratusGrid/terraform-aws-iam-group-with-user-self-service](https://github.com/StratusGrid/terraform-aws-iam-group-with-user-self-service)

This module is used to create an IAM group which has user self service permissions.

<span style="color:red">NOTE:</span> When in AWS console, the user must access their security credentials by the username dropdown in the top right > 'My Security Credentials'

## Example usage of the module:
```hcl
module "iam_group_prod_restricted_read_only" {
  source = "StratusGrid/iam-group-with-user-self-service/aws"
  version = "2.0.0"
  name = "${name_prefix}-prod-restricted-read-only"
}
```
---

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy.group_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the group in IAM | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The path of the group in IAM | `string` | `"/"` | no |
| <a name="input_user_self_service"></a> [user\_self\_service](#input\_user\_self\_service) | True/False to add inline permissions for user self service to the group. Default is True | `string` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | Name of group created by module |

---

<span style="color:red">Note:</span> Manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml .`
<!-- END_TF_DOCS -->