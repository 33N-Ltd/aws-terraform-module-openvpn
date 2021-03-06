resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.ssm_ansible_bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "S3:*",
      "Resource": [
        "${aws_s3_bucket.ssm_ansible_bucket.arn}/*",
        "${aws_s3_bucket.ssm_ansible_bucket.arn}"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
POLICY

}

