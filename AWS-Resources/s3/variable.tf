variable "s3_buckets" {
  description = "A map of S3 bucket configurations"
  type = map(object({
    bucket_name = string
    topic_name  = string
    events      = list(string)
  }))
  default = {
    "bucket1" = {
      bucket_name = "demo-bucket-1673",
      topic_name  = "demo-topic-1",
      events      = ["s3:ObjectCreated:*"]
    },
    "bucket2" = {
      bucket_name = "demo-bucket-2728",
      topic_name  = "demo-topic-2",
      events      = ["s3:ObjectCreated:*"]
    },  
    "bucket3" = {
      bucket_name = "demo-bucket-3092",
      topic_name  = "demo-topic-3",
      events      = ["s3:ObjectCreated:*"]
   }
  } 
}

