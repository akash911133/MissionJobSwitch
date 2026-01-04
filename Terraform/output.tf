output "public-ip" {
  value = aws_instance.my-bastion-instance.public_ip
}

output "instance-az" {
  value = aws_instance.my-bastion-instance.availability_zone
}
