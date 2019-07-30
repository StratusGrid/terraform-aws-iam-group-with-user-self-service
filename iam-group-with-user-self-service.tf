resource "aws_iam_group" "group" {
  name = var.name
  path = var.path
}

resource "aws_iam_group_policy" "group_policy" {
  name  = var.name
  group = aws_iam_group.group.id
  count = var.user_self_service ? 1 : 0

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ListUsersAccessWithoutMFA",
      "Action": [
        "iam:ListVirtualMFADevices"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "SelfServiceAccessWithoutMFA",
      "Action": [
        "iam:List*",
        "iam:GetUser",
        "iam:GetAccountPasswordPolicy",
        "iam:ChangePassword",
        "iam:CreateVirtualMFADevice",
        "iam:EnableMFADevice"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:iam::*:user/$${aws:username}",
        "arn:aws:iam::*:mfa/$${aws:username}"
      ]
    },
    {
      "Sid": "SelfServiceAccessWithMFA",
      "Effect": "Allow",
      "Action": [
        "iam:Get*",
        "iam:DeleteSSHPublicKey",
        "iam:GetSSHPublicKey",
        "iam:ListSSHPublicKeys",
        "iam:UpdateSSHPublicKey",
        "iam:UploadSSHPublicKey",
        "iam:CreateAccessKey",
        "iam:DeleteAccessKey",
        "iam:UpdateAccessKey",
        "iam:DeleteVirtualMFADevice",
        "iam:DeactivateMFADevice",
        "iam:ResyncMFADevice",
        "iam:UploadSigningCertificate",
        "iam:UpdateSigningCertificate",
        "iam:DeleteSigningCertificate",
        "iam:GenerateServiceLastAccessedDetails"
      ],
      "Resource": [
        "arn:aws:iam::*:user/$${aws:username}",
        "arn:aws:iam::*:mfa/$${aws:username}"
      ],
      "Condition": {"BoolIfExists": {"aws:MultiFactorAuthPresent": true}}
    }
  ]
}
EOF

}

