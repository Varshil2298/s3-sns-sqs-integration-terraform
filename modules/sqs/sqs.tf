resource "aws_sqs_queue" "sqs_queue" {
  for_each = var.sqs_queues

  name                    = each.value.queue_name
  delay_seconds           = each.value.delay_seconds
  max_message_size        = each.value.max_message_size
  message_retention_seconds = each.value.message_retention_seconds
  receive_wait_time_seconds = each.value.receive_wait_time_seconds
}

 
resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  for_each = var.sqs_queues

  queue_url = aws_sqs_queue.sqs_queue[each.key].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowSNSToSendMessage"
        Effect    = "Allow"
        Principal = {
          Service = "sns.amazonaws.com"
        }
        Action   = "SQS:SendMessage"
        Resource = "arn:aws:sqs:${var.region}:${var.account_id}:${each.value.queue_name}"
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = "arn:aws:sns:${var.region}:${var.account_id}:${each.value.sns_topic_name}"
          }
        }
      }
    ]
  })
}


