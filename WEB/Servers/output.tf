output "Public_IP" {
  value = aws_instance.test_server.public_ip
}

output "subnet_id" {
  value = aws_subnet.subnet_1.id
}

output "image_owner" {
  value = aws_instance.test_server.iam_instance_profile
}