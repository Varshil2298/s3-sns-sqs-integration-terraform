# Data block for SNS Topics
data "aws_sns_topic" "sns_topics" {
  for_each = var.s3_buckets
  name     = each.value.topic_name
}

# Resource for S3 Buckets
resource "aws_s3_bucket" "buckets" {
  for_each = var.s3_buckets
  bucket   = each.value.bucket_name
}

# Resource for S3 Bucket Public Access Block
resource "aws_s3_bucket_public_access_block" "public_access_blocks" {
  for_each = var.s3_buckets
  bucket   = aws_s3_bucket.buckets[each.key].bucket
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

# Resource for S3 Bucket Notifications
resource "aws_s3_bucket_notification" "bucket_notifications" {
  for_each = var.s3_buckets
  bucket   = aws_s3_bucket.buckets[each.key].id

  topic {
    topic_arn = data.aws_sns_topic.sns_topics[each.key].arn
    events    = each.value.events
  }
}
