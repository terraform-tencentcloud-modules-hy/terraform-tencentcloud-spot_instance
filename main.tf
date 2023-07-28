locals {
  instance_charge_type = "SPOTPAID"
  product              = "cvm"
}

data "tencentcloud_availability_zones_by_product" "this" {
  product = local.product
}

data "tencentcloud_instance_types" "this" {
  depends_on       = [data.tencentcloud_availability_zones_by_product.this]
  cpu_core_count   = var.cpu_core_count
  memory_size      = var.memory_size
  exclude_sold_out = true
  filter {
    name   = "instance-charge-type"
    values = [local.instance_charge_type]
  }
  filter {
    name   = "zone"
    values = [var.availability_zone!=null?var.availability_zone : data.tencentcloud_availability_zones_by_product.this.zones[0].name]
  }
  filter {
    name   = "instance-family"
    values = var.instance_family
  }
}

data "tencentcloud_images" "this" {
  image_type       = var.image_type
  image_name_regex = var.image_name_regex
}

resource "tencentcloud_instance" "spot" {
  instance_name        = var.instance_name
  instance_charge_type = local.instance_charge_type
  instance_type        = var.instance_type!=null?var.instance_type : data.tencentcloud_instance_types.this.instance_types[0].instance_type
  availability_zone    = var.availability_zone!=null?var.availability_zone : data.tencentcloud_availability_zones_by_product.this.zones[0].name
  image_id             = var.image_id!=null ?var.image_id : data.tencentcloud_images.this.images[0].image_id
  system_disk_type     = var.system_disk_type
  system_disk_size     = var.system_disk_size
  dynamic "data_disks" {
    for_each = var.data_disks
    content {
      data_disk_type = data_disks.value.data_disk_type
      data_disk_size = data_disks.value.data_disk_size
    }
  }
  tags = var.tags
}