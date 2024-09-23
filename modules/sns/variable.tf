variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "sns_topics" {
  description = "A map of SNS topic configurations"
  type = map(object({
    topic_name = string
    queue_name = string  # The SQS queue to subscribe to this SNS topic
    bucket     = string  # S3 bucket name for SNS policy
  }))
}
