#!/bin/bash
pip install awscli-local[ver1]

awslocal s3api create-bucket --bucket s3-localstack-poc

awslocal s3api list-buckets

awslocal s3api put-bucket-policy --bucket s3-localstack-poc --policy file://files/bucket_policy.json

awslocal s3api put-object \
--bucket s3-localstack-poc \
  --key index.html \
  --body files/index.html

awslocal s3api put-object \
  --bucket s3-localstack-poc \
  --key error.html \
  --body files/error.html

awslocal s3api list-objects \
  --bucket s3-localstack-poc

awslocal s3 website s3://s3-localstack-poc/ --index-document index.html --error-document error.html
