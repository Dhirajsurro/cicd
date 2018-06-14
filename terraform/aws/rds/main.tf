provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "<YOUR_NAME>-cloudnativedevops-${var.name}-bucket"
  acl    = "private"

  tags {
    App         = "${var.name}"
    Environment = "${var.Environment}"
  }
}

resource "aws_rds_cluster" "db" {
  cluster_identifier  = "cloudnativedevops-${var.name}-rds-cluster"
  engine              = "aurora-postgresql"
  database_name       = "${var.name}"
  master_username     = "foo"
  master_password     = "change-me-please"
  skip_final_snapshot = true

  tags {
    App         = "${var.name}"
    Environment = "${var.Environment}"
  }
}