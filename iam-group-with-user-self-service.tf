resource "aws_iam_group" "group" {
  name = var.name
  path = var.path
}

resource "aws_iam_group_policy" "group_policy" {
  name  = var.name
  group = aws_iam_group.group.id
  count = var.user_self_service ? 1 : 0

  policy = data.aws_iam_policy_document.iam_group_with_user_self_service.json
}