import logging
import json
import boto3
import os

LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)


def handler(event, context):
    for record in event['Records']:
        LOGGER.info(record['eventID'])
        LOGGER.info(record['eventName'])
        LOGGER.info(record['dynamodb'])

        content = json.dumps({'data': record})
        s3Client = boto3.client('s3')

        s3ObjByDoc = s3Client.Object(
            os.environ['S3_BUCKET_NAME_FAILOVER'], 'byDoc/record.json')
        s3ObjByDoc.put(content)

        s3ObjByDoc = s3Client.Object(
            os.environ['S3_BUCKET_NAME_FAILOVER'], 'byIdCliente/record.json')
        s3ObjByDoc.put(content)

        # response = snsClient.publish(
        #    TargetArn="${aws_sns_topic.this.arn}",
        #    Message=json.dumps({'data': record}),
        #    MessageStructure='json'
        # )

    return {
        'statusCode': 200,
        'body': json.dumps(content)
    }
