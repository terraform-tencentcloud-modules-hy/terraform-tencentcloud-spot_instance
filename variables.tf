# 镜像
variable "image_id" {
  type        = string
  description = "镜像ID"
  default     = null
}

variable "image_type" {
  type        = list(string)
  description = "镜像类型(image_id为空时可设置)"
  default     = ["PUBLIC_IMAGE"]
}

variable "image_name_regex" {
  type        = string
  description = "镜像名称正则表达式(image_id为空时可设置)"
  default     = "TencentOS"
}

# 可用区
variable "availability_zone" {
  type        = string
  description = "可用区(当availability_zone为空时则会根据地域随机选择可用区)"
  default     = null
}

# 实例
variable "instance_name" {
  type        = string
  description = "实例名称"
  nullable    = false
}

variable "instance_type" {
  type        = string
  description = "实例规格类型"
  default     = null
}

variable "instance_family" {
  type        = list(string)
  description = "实例簇(instance_type为空时可设置)"
  default     = ["S5"]
}

variable "cpu_core_count" {
  type        = number
  description = "CPU核心数(instance_type为空时可设置)"
  default     = 2
}

variable "memory_size" {
  type        = number
  description = "内存大小(instance_type为空时可设置)"
  default     = 2
}

# 系统盘
variable "system_disk_type" {
  type        = string
  description = "系统盘类型"
  default     = "CLOUD_BSSD"
  validation {
    condition     = contains(["CLOUD_BSSD", "CLOUD_PREMIUM", "CLOUD_SSD"], var.system_disk_type)
    error_message = "系统盘类型错误"
  }
}

variable "system_disk_size" {
  type        = number
  description = "系统盘大小(单位GB)"
  default     = 50
  validation {
    condition     = var.system_disk_size>=0
    error_message = "系统盘大小不能小于0"
  }
}

# 数据盘
variable "data_disks" {
  type = list(object({
    data_disk_type = string,
    data_disk_size = number
  }))
  description = "数据盘集合"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "实例标签"
  default     = {}
}

