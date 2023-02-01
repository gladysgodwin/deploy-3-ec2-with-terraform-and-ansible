resource "local_file" "public_ips" {
  filename = "host-inventory"
  content  = <<EOT
${aws_instance.server1.public_ip}
${aws_instance.server2.public_ip}
${aws_instance.server3.public_ip}
  EOT
}
