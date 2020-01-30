output "region" {
    value = var.region
}

output "publicdns" {
    value = web_server.public_dns
}

output "publicip" {
    value = web_server.public_ip
}