variable "s3_buckets" {
  description = "A map of S3 bucket configurations"
  type = map(object({
    bucket_name = string
    topic_name  = string
    events      = list(string)
  }))
} 