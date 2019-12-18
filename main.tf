provider "aws" {
  version = "~> 2.42"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "main" {
  bucket        = var.domain_name
  force_destroy = true
  acl           = "public-read"

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  logging {
    target_bucket = aws_s3_bucket.logging.id
  }
}

resource "aws_s3_bucket" "logging" {
  bucket        = "log-${var.domain_name}"
  acl           = "log-delivery-write"
  force_destroy = true
}

resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_s3_bucket.main.website_domain
    zone_id                = aws_s3_bucket.main.hosted_zone_id
    evaluate_target_health = true
  }
}
