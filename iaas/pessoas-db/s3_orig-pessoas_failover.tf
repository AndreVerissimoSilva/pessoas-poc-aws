resource "aws_s3_bucket" "orig-pessoas-db-failover" {
  bucket = "orig-pessoas-db-failover"

  tags = {
    Name        = "orig-pessoas-db-failover"
    Terraform   = "true"
    ProjectName = "Originação de Pessoas Failover"
  }
}

resource "aws_s3_bucket_acl" "orig-pessoas-db-failover" {
  bucket = aws_s3_bucket.orig-pessoas-db-failover.id
  acl    = "private"
}

# resource "aws_s3_object" "pais_orig-tipo_doc" {
#   bucket = aws_s3_bucket.orig-pessoas-db-failover.id
#   key    = "pais_orig-tipo_doc"
#   #source = "path/to/file"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   # etag = filemd5("path/to/file")
# }

# resource "aws_s3_object" "id_pessoa" {
#   bucket = aws_s3_bucket.orig-pessoas-db-failover.id
#   key    = "id_pessoa"
#   #source = "path/to/file"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   #etag = filemd5("path/to/file")
# }