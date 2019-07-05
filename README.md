# terraform-aws-iam-group-with-user-self-service
This module is used to create an IAM group which has user self service permissions.

NOTE: When in the AWS console, the user must access their security credentials by the username dropdown in the top right > 'My Security Credentials'

### Example Configuration:
```
module "iam_group_prod_restricted_read_only" {
  source = "StratusGrid/iam-group-with-user-self-service/aws"
  version = "1.0.0"
  name = "${name_prefix}-prod-restricted-read-only"
}
```