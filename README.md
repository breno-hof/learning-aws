# learning-aws

## Installation

```sh
curl --output localstack-cli-3.6.0-linux-amd64-onefile.tar.gz \
    --location https://github.com/localstack/localstack-cli/releases/download/v3.6.0/localstack-cli-3.6.0-linux-amd64-onefile.tar.gz
```
```sh
sudo tar xvzf localstack-cli-3.6.0-linux-*-onefile.tar.gz -C /usr/local/bin
```

## Configure Auth Token

```sh
localstack auth set-token <YOUR_AUTH_TOKEN>
localstack start
```
## Installing awslocal

```sh
pip install awscli-local[ver1]
```

## Creating an Simple Service Storage (AWS S3)

> to create s3 buckets
```sh
awslocal s3api create-bucket --bucket sample-bucket
```

> to list s3 buckets
```sh
awslocal s3api list-buckets
```

> to put objects on bucket
```sh
awslocal s3api put-object \
  --bucket sample-bucket \
  --key image.jpg \
  --body image.jpg
```

> to list objects on bucket
```sh
awslocal s3api list-objects \
  --bucket sample-bucket
```