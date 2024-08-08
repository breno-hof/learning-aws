#!/bin/bash
pip install awscli-local[ver1]

zip function.zip /opt/code/localstack/files/lambda.js

awslocal lambda create-function \
  --function-name apigw-lambda \
  --runtime nodejs16.x \
  --handler lambda.apiHandler \
  --memory-size 128 \
  --zip-file fileb://function.zip \
  --role arn:aws:iam::000000000000:role/apigw

api_id=$(awslocal apigateway create-rest-api --name 'API Gateway Lambda integration' | grep 'id' | sed 's/"id":\s//' | sed 's/",//' | sed 's/"//')

parent_id=$(awslocal apigateway get-resources --rest-api-id $api_id | grep 'id' | sed 's/"id":\s//' | sed 's/",//' | sed 's/"//')

resource_id=$(awslocal apigateway create-resource \
  --rest-api-id $api_id \
  --parent-id $parent_id \
  --path-part "{somethingId}" | grep 'id' | sed 's/"id":\s//' | sed 's/",//' | sed 's/"//')

awslocal apigateway put-method \
  --rest-api-id $api_id \
  --resource-id $resource_id \
  --http-method GET \
  --request-parameters "method.request.path.somethingId=true" \
  --authorization-type "NONE"

awslocal apigateway put-integration \
  --rest-api-id $api_id \
  --resource-id $resource_id \
  --http-method GET \
  --type AWS_PROXY \
  --integration-http-method POST \
  --uri arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:apigw-lambda/invocations \
  --passthrough-behavior WHEN_NO_MATCH

awslocal apigateway create-deployment \
  --rest-api-id $api_id \
  --stage-name test
