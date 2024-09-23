variable "account_id" {
  description = "The AWS account ID to use in the policy"
  default     =     "743362591897"
}

variable "region" {
  default = "us-east-1"
}


variable "sns_topics" {
  description = "A map of SNS topic configurations"
  type = map(object({
    topic_name = string
    queue_name = string  
    bucket     = string  
  }))
  default = {
    "topic1" = {
      topic_name = "demo-topic-1",
      queue_name = "demo-queue-1",
      bucket     = "demo-bucket-1673"
    },
    "topic2" = {
      topic_name = "demo-topic-2",
      queue_name = "demo-queue-2",
      bucket = "demo-bucket-2728"
    },   
    "topic3" = {
      topic_name = "demo-topic-3",
      queue_name = "demo-queue-3",
      bucket = "demo-bucket-3092"
    },
 }
}

