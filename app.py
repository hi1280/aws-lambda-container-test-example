import os
import boto3
from botocore.config import Config
from src.pq_converter import LambdaProcessor

env = os.environ.get("ENV")
endpoint_url = os.environ.get("ENDPOINT_URL")

# boto3 session
session = boto3.Session()

if env == "development":
    print("Start Testing with Localstack")
    s3 = session.resource("s3", endpoint_url=endpoint_url, config=Config())
else:
    s3 = session.resource("s3")


def handler(event, context) -> dict:
    processor = LambdaProcessor(event=event, context=context, s3=s3)
    return processor.main()