output "queue_url" {
  description = "The URL of the SQS queue"
  value       = aws_sqs_queue.terraform_queue.url
}