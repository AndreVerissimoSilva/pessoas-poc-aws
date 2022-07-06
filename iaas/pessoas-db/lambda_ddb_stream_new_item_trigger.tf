resource "aws_lambda_function" "func_ddb_stream_new_item_trigger" {
  function_name    = "${var.name}-func-ddb-stream-new-item-trigger"
  filename         = data.archive_file.orig_pess_func_ddb_stream_new_item_trigger_zip_file.output_path
  source_code_hash = data.archive_file.orig_pess_func_ddb_stream_new_item_trigger_zip_file.output_base64sha256
  handler          = "handler.handler"
  role             = aws_iam_role.lambda_assume_role.arn
  runtime          = "python3.8"

  lifecycle {
    create_before_destroy = true
  }
}

data "archive_file" "orig_pess_func_ddb_stream_new_item_trigger_zip_file" {
  output_path = "${path.module}/orig_pess_func_ddb_stream_new_item_trigger_zip/orig_pess_func_ddb_stream_new_item_trigger.zip"
  source_dir  = "${path.module}/orig_pess_func_ddb_stream_new_item_trigger"
  excludes    = ["__init__.py", "*.pyc"]
  type        = "zip"
}

resource "aws_lambda_event_source_mapping" "func_ddb_stream_new_item_trigger" {
  event_source_arn  = aws_dynamodb_table.this[0].stream_arn
  function_name     = aws_lambda_function.func_ddb_stream_new_item_trigger.arn
  starting_position = "LATEST"
}

resource "aws_lambda_function_event_invoke_config" "func_ddb_stream_new_item_trigger" {
  function_name = aws_lambda_function.func_ddb_stream_new_item_trigger.arn

  destination_config {
    on_success {
      destination = aws_sns_topic.this[0].arn
    }

    on_failure {
      destination = aws_sns_topic.this[0].arn
    }
  }
}