# learning-aws

## Installation

```sh
curl --output localstack-cli-3.6.0-linux-amd64-onefile.tar.gz \
    --location https://github.com/localstack/localstack-cli/releases/download/v3.6.0/localstack-cli-3.6.0-linux-amd64-onefile.tar.gz
```
```sh
sudo tar xvzf localstack-cli-3.6.0-linux-*-onefile.tar.gz -C /usr/local/bin
```

### Configure Auth Token

```sh
localstack auth set-token <YOUR_AUTH_TOKEN>
localstack start
```