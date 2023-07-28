output "instance_id" {
  value       = tencentcloud_instance.spot.id
  description = "实例ID"
}

output "instance_status" {
  value       = tencentcloud_instance.spot.instance_status
  description = "实例状态"
}

output "private_ip" {
  value       = tencentcloud_instance.spot.private_ip
  description = "私有IP"
}

output "public_ip" {
  value       = tencentcloud_instance.spot.public_ip
  description = "公有IP"
}