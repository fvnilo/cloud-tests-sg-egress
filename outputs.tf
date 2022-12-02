output "bastion_dns" {
  value = aws_instance.bastion.public_dns
}

output "db_address" {
  value = aws_db_instance.mydb.address
}