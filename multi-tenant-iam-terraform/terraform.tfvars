customers = {
  customerA = {
    bucket_name = "customer-a-bucket"
    permissions = ["s3:GetObject"]
  }
  customerB = {
    bucket_name = "customer-b-bucket"
    permissions = ["s3:GetObject", "s3:PutObject"]
  }
}