resource "local_file" "public_ips" {
  filename = "glid/test/ansible/host-inventory"
  content  = <<EOT
${aws_instance.server1.public_ip}
${aws_instance.server1.public_ip}
${aws_instance.server1.public_ip}
  EOT
}