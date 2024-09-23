variable "account_id" {
  description = "The AWS account ID to use in the policy"
  default     = "743362591897"
}

variable "region" {
  default = "us-east-1"
}


variable "sqs_queues" {
  type = map(object({
    queue_name               = string
    delay_seconds            = number
    max_message_size         = number
    message_retention_seconds = number
    receive_wait_time_seconds = number
    sns_topic_name           = string
  }))
  default = {
    "queue1" = {
      queue_name               = "demo-queue-1",
      delay_seconds            = 0,
      max_message_size         = 262144,
      message_retention_seconds = 345600,
      receive_wait_time_seconds = 0,
      sns_topic_name           = "demo-topic-1"
    },
    "queue2" = {
      queue_name               = "demo-queue-2",
      delay_seconds            = 0,
      max_message_size         = 262144,
      message_retention_seconds = 345600,
      receive_wait_time_seconds = 0,
      sns_topic_name           = "demo-topic-2"
    }, 
    "queue3" = {
      queue_name               = "demo-queue-3",
      delay_seconds            = 0,
      max_message_size         = 262144,
      message_retention_seconds = 345600,
      receive_wait_time_seconds = 0,
      sns_topic_name           = "demo-topic-3"
    }
  }
}
