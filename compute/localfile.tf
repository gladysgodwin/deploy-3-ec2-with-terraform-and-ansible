resource "local_file" "public_ips" {
  filename = "host-inventory"
  content  = <<EOT
${aws_instance.server1.public_ip}
${aws_instance.server2.public_ip}
${aws_instance.server3.public_ip}
  EOT
}
/*
resource "null_resource" "remote1" {
depends_on = [
aws_instance.server1,
aws_instance.server2,
aws_instance.server3
] 
connection {
 type     = "ssh"
 user     = ec2_user
 private_key = file("/home/glid/test/help.pem")
 host = "${var.host}" 
}

  provisioner "file" {
    source      = "host-inventory"
    destination = "/ec2_user/test/host-inventory"
  }

}
*/