output "public_subnets" {
  value = module.vpc.public_subnets
}

output "key-pair" {
  value = data.aws_key_pair.ec2_key.key_name
}

output "website_url" {
  description = "Website URL (HTTPS)"
  value       = aws_cloudfront_distribution.distribution.domain_name
}

output "s3_url" {
  description = "S3 hosting URL (HTTP)"
  value       = aws_s3_bucket_website_configuration.hosting.website_endpoint
}
