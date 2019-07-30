output "group_name" {
  description = "Name of group created by module"
  value       = aws_iam_group.group.id
}

