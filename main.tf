provider "aws" {
  version = "~> 2.42"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "main" {
  bucket        = var.domain_name
  force_destroy = true
  acl           = "public-read"
  policy        = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.domain_name}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "apex" {
  zone_id = aws_route53_zone.main.id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_s3_bucket.main.website_domain
    zone_id                = aws_s3_bucket.main.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "cname" {
  zone_id = aws_route53_zone.main.id
  name    = "www"
  type    = "CNAME"
  ttl = 300
  records        = [var.domain_name]
}

output "website_endpoint" {
  value = aws_s3_bucket.main.website_endpoint
}

output "website_domain" {
  value = aws_s3_bucket.main.website_domain
}
