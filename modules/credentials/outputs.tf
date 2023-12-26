# Output the nf-tower AWS user

output "aws_nf_tower_user" {
  value = aws_iam_user.nftower_user.name
}
