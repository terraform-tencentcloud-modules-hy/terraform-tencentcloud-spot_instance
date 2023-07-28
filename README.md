# 腾讯云CVM创建spot实例模块

## cloudiac-tencentcloud-cvm_spot_instance

## examples
- simple
```hcl
provider "tencentcloud" {
  secret_id  = "AKIDjVDoKdnnqjPwLct3DsTzY0FMsNn9MOHz"
  secret_key = "av63pXAbrx0tfEkAVecSCmCTehAiKpBP"
  region     = "ap-shanghai"
}

module "spot_instance" {
  source            = "../../"
  instance_name     = "hy-test-spot"
  #  instance_type = "S5.MEDIUM2"
  instance_family   = ["S5"]
  cpu_core_count    = 2
  memory_size       = 2
  availability_zone = "ap-shanghai-2"
  #  image_id          = "img-487zeit5"
  image_type        = ["PUBLIC_IMAGE"]
  image_name_regex  = "Ubuntu.*64\\w*"
  system_disk_type  = "CLOUD_BSSD"
  system_disk_size  = 50
  tags              = { "类型" : "spot实例" }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | ~> 1.81.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | ~> 1.81.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_instance.spot](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/instance) | resource |
| [tencentcloud_availability_zones_by_product.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/availability_zones_by_product) | data source |
| [tencentcloud_images.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/images) | data source |
| [tencentcloud_instance_types.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/instance_types) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | 可用区(当availability\_zone为空时则会根据地域随机选择可用区) | `string` | `null` | no |
| <a name="input_cpu_core_count"></a> [cpu\_core\_count](#input\_cpu\_core\_count) | CPU核心数(instance\_type为空时可设置) | `number` | `2` | no |
| <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks) | 数据盘集合 | <pre>list(object({<br>    data_disk_type = string,<br>    data_disk_size = number<br>  }))</pre> | `[]` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | 镜像ID | `string` | `null` | no |
| <a name="input_image_name_regex"></a> [image\_name\_regex](#input\_image\_name\_regex) | 镜像名称正则表达式(image\_id为空时可设置) | `string` | `"TencentOS"` | no |
| <a name="input_image_type"></a> [image\_type](#input\_image\_type) | 镜像类型(image\_id为空时可设置) | `list(string)` | <pre>[<br>  "PUBLIC_IMAGE"<br>]</pre> | no |
| <a name="input_instance_family"></a> [instance\_family](#input\_instance\_family) | 实例簇(instance\_type为空时可设置) | `list(string)` | <pre>[<br>  "S5"<br>]</pre> | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | 实例名称 | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | 实例规格类型 | `string` | `null` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | 内存大小(instance\_type为空时可设置) | `number` | `2` | no |
| <a name="input_system_disk_size"></a> [system\_disk\_size](#input\_system\_disk\_size) | 系统盘大小(单位GB) | `number` | `50` | no |
| <a name="input_system_disk_type"></a> [system\_disk\_type](#input\_system\_disk\_type) | 系统盘类型 | `string` | `"CLOUD_BSSD"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | 实例标签 | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | 实例ID |
| <a name="output_instance_status"></a> [instance\_status](#output\_instance\_status) | 实例状态 |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | 私有IP |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | 公有IP |
