resource "aws_lambda_function" "func_ddb_stream_new_item_failover" {
  function_name    = "${var.name}-func-ddb-stream-new-item-failover"
  filename         = data.archive_file.orig_pess_func_ddb_stream_new_item_failover_zip_file.output_path
  source_code_hash = data.archive_file.orig_pess_func_ddb_stream_new_item_failover_zip_file.output_base64sha256
  handler          = "handler.handler"
  role             = aws_iam_role.lambda_assume_role.arn
  runtime          = "python3.8"

  environment {
    variables = {
      S3_BUCKET_NAME_FAILOVER = "${aws_s3_bucket.orig-pessoas-db-failover.id}"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "archive_file" "orig_pess_func_ddb_stream_new_item_failover_zip_file" {
  output_path = "${path.module}/orig_pess_func_ddb_stream_new_item_failover_zip/orig_pess_func_ddb_stream_new_item_failover.zip"
  source_dir  = "${path.module}/orig_pess_func_ddb_stream_new_item_failover"
  excludes    = ["__init__.py", "*.pyc"]
  type        = "zip"
}

# resource "aws_lambda_event_source_mapping" "func_ddb_stream_new_item_failover" {
#   event_source_arn  = aws_sns_topic.this[0].arn
#   function_name     = aws_lambda_function.func_ddb_stream_new_item_failover.arn
#   starting_position = "LATEST"
# }
