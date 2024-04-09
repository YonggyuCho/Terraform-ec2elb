terraform {
  backend "s3" {
    bucket = "yong0222"
    key    = "terraform"
    region = "ap-northeast-2"
  }
  
}