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