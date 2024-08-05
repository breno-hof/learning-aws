#!/bin/bash

awslocal s3api create-bucket --bucket s3-localstack-poc
awslocal s3api list-buckets

awslocal s3api put-object \
  --bucket s3-localstack-poc \
  --key index.html \
  --body index.html

awslocal s3api list-objects \
  --bucket s3-localstack-poc