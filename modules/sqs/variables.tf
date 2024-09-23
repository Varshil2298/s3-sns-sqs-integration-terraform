variable "region" {
  type = string
}

variable "account_id" {
  type = string
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
}
