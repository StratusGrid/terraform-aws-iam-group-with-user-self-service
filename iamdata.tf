#tfsec:ignore:aws-iam-no-policy-wildcards -- Ignores warning on wildcarded resources
data "aws_iam_policy_document" "iam_group_with_user_self_service" {
  statement {
    sid = "ListUsersAccessWithoutMFA"

    actions = [
      "iam:ListVirtualMFADevices"
    ]

    effect = "Allow"

    resources = [
      "*",
    ]
  }

  statement {
    sid = "SelfServiceAccessWithoutMFA"

    actions = [
      "iam:List*",
      "iam:GetUser",
      "iam:GetAccountPasswordPolicy",
      "iam:ChangePassword",
      "iam:CreateVirtualMFADevice",
      "iam:EnableMFADevice"
    ]

    effect = "Allow"

    resources = [
      "arn:aws:iam::*:user/$${aws:username}",
      "arn:aws:iam::*:mfa/$${aws:username}"
    ]
  }

  statement {
    sid = "SelfServiceAccessWithMFA"

    actions = [
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
    ]

    effect = "Allow"

    resources = [
      "arn:aws:iam::*:user/$${aws:username}",
      "arn:aws:iam::*:mfa/$${aws:username}"
    ]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"

      values = [
        "true"
      ]
    }
  }
}