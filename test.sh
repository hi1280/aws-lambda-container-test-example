#!/bin/bash

AWS_PROFILE=localstack
aws --profile ${AWS_PROFILE} configure set aws_access_key_id _
aws --profile ${AWS_PROFILE} configure set aws_secret_access_key _
aws --profile ${AWS_PROFILE} configure set region ap-northeast-1

# Make a S3 bucket and put test data
aws s3 --endpoint-url=http://localstack:4566 mb s3://lambda-test-example --profile ${AWS_PROFILE} --cli-connect-timeout 6000
aws s3 --endpoint-url=http://localstack:4566 cp ./tests/data/c01.csv s3://lambda-test-example --profile ${AWS_PROFILE} --cli-connect-timeout 6000

# Unit Testing
pipenv run test