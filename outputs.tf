output "vpc_id" {
  value = aws_vpc.myprivNet
}
output "public_ip" {
  value       = aws_instance.server1.public_ip
  description = "my 1st server public ip"
}
output "public_ip2" {
  value       = aws_instance.server2.public_ip
  description = "my 2nd server public ip"
}
output "public_ip3" {
  value       = aws_instance.server3.public_ip
  description = "my 3rd server public ip"
}

output "lb-url" {
  value       = aws_lb.my-alb.dns_name
  description = "my lb url"
}


