output "aws_security_group_elb_sg_details" {
  value = aws_security_group.elb_sg
}

output "aws_http_servers_public_dns" {
  value = aws_instance.http_servers
}
