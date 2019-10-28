variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "aws_access_key" {
  default = "AKIAJIO7E6CP5LKEYZ3Q"
}

variable "aws_secret_key" {
  default = "6wWeRIBt4SsmrPo5mgmeoOhz1a+CZVr1Vwkmlcsr"
}

variable "AMIS" {
  type = "map"
  default = {
    ap-south-1 = "ami-0912f71e06545ad88"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}

variable "azs" {
    default = {
        "ap-south-1" = "ap-south-1a, ap-south-1b, ap-south-1c"
    }
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "count" {
    default = 1
}
