output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.tf_instance.public_ip
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.tf_bucket.bucket
}
