variable "customers" {
  type = map(object({
    bucket_name = string
    permissions = list(string)
  }))
}