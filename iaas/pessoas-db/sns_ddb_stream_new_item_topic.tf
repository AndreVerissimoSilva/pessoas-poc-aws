resource "aws_sns_topic" "this" {
  count = var.create_sns_topic ? 1 : 0

  name        = "${var.name}-new-item-sns-topic"
  name_prefix = var.sns_topic_name_prefix

  display_name                             = "${var.name}-new-item-sns-topic"
  policy                                   = var.sns_topic_policy
  delivery_policy                          = var.sns_topic_delivery_policy
  application_success_feedback_role_arn    = var.sns_topic_app_success_feedback_role_arn
  application_success_feedback_sample_rate = var.sns_topic_app_success_feedback_sample_rate
  application_failure_feedback_role_arn    = var.sns_topic_app_failure_feedback_role_arn
  http_success_feedback_role_arn           = var.sns_topic_http_success_feedback_role_arn
  http_success_feedback_sample_rate        = var.sns_topic_http_success_feedback_sample_rate
  http_failure_feedback_role_arn           = var.sns_topic_http_failure_feedback_role_arn
  lambda_success_feedback_role_arn         = var.sns_topic_lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = var.sns_topic_lambda_success_feedback_sample_rate
  lambda_failure_feedback_role_arn         = var.sns_topic_lambda_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = var.sns_topic_sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = var.sns_topic_sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn            = var.sns_topic_sqs_failure_feedback_role_arn
  kms_master_key_id                        = var.sns_topic_kms_master_key_id
  fifo_topic                               = var.sns_topic_fifo_topic
  content_based_deduplication              = var.sns_topic_content_based_deduplication

  tags = var.sns_topic_tags
}

resource "aws_sns_topic_subscription" "lambda_subscription_failover" {
  topic_arn = aws_sns_topic.this[0].arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.func_ddb_stream_new_item_failover.arn
}