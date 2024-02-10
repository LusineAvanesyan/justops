resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_name
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "PublicReadGetObject",
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : "s3:GetObject",
          "Resource" : "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
        }
      ]
    }
  )
}

resource "aws_s3_object" "file" {
  for_each     = fileset(path.module, "content/**/*.{html,css,js}")
  bucket       = aws_s3_bucket.bucket.id
  key          = replace(each.value, "/^content//", "")
  source       = each.value
  content_type = lookup(local.content_types, regex("\\.[^.]+$", each.value), null)
  etag         = filemd5(each.value)
}

resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }
}
