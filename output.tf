output "instance_id" {
  value       = module.spot_instance.instance_id
  description = "实例ID"
}

output "instance_status" {
  value       = module.spot_instance.instance_status
  description = "实例状态"
}

output "private_ip" {
  value       = module.spot_instance.private_ip
  description = "私有IP"
}

output "public_ip" {
  value       = module.spot_instance.public_ip
  description = "公有IP"
}