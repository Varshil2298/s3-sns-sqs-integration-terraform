data "aws_sqs_queue" "sqs_queue" {
  for_each = var.sns_topics
  name = each.value.queue_name

}

resource "aws_sns_topic" "sns_topics" {
  for_each = var.sns_topics
  name = each.value.topic_name
}

resource "aws_sns_topic_subscription" "sqs_subscriptions" {
  for_each = var.sns_topics
  topic_arn = aws_sns_topic.sns_topics[each.key].arn
  protocol  = "sqs"
  endpoint  = data.aws_sqs_queue.sqs_queue[each.key].arn
}
  

resource "aws_sns_topic_policy" "sns_policies" {
  for_each = var.sns_topics

  arn = aws_sns_topic.sns_topics[each.key].arn

  policy = jsonencode({
    Version = "2012-10-17",
    Id      = "example-ID",
    Statement = [
      {
        Sid      = "Example SNS topic policy",
        Effect   = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Action   = "SNS:Publish",
        Resource = aws_sns_topic.sns_topics[each.key].arn,
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = var.account_id
          },
          ArnLike = {
            "aws:SourceArn" = "arn:aws:s3:::${each.value.bucket}"
          }
        }
      }
    ]
  })
}
