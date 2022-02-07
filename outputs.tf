output "private_ips" {
  value = aws_instance.instance[*].private_ip
}
