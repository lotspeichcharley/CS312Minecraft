output "minecraft_server_ip" {
  value = aws_eip.mc_ip.public_ip
}