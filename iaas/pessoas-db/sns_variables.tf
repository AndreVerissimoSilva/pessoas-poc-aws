variable "create_sns_topic" {
  description = "Whether to create the SNS topic"
  type        = bool
  default     = true
}

variable "sns_topic_name" {
  description = "The name of the SNS topic to create"
  type        = string
  default     = null
}

variable "sns_topic_name_prefix" {
  description = "The prefix name of the SNS topic to create"
  type        = string
  default     = null
}

variable "sns_topic_display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "sns_topic_policy" {
  description = "The fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "sns_topic_delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = null
}

variable "sns_topic_app_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sns_topic_app_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sns_topic_app_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sns_topic_http_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sns_topic_http_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sns_topic_http_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sns_topic_lambda_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sns_topic_lambda_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sns_topic_lambda_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sns_topic_sqs_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sns_topic_sqs_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sns_topic_sqs_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sns_topic_kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = null
}

variable "sns_topic_fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic"
  type        = bool
  default     = false
}

variable "sns_topic_tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "sns_topic_content_based_deduplication" {
  description = "Boolean indicating whether or not to enable content-based deduplication for FIFO topics."
  type        = bool
  default     = false
}