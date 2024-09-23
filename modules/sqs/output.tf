output "sqs_queue_arn" {
  value = [for queue in aws_sqs_queue.sqs_queue : queue.arn]
}
 
 output "sqs_queue_id" {
   value = [for queue in aws_sqs_queue.sqs_queue : queue.id]
 }