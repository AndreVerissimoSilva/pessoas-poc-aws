import logging
import json
import boto3

LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)


def handler(event, context):
    for record in event['Records']:
        LOGGER.info(record['eventID'])
        LOGGER.info(record['eventName'])
        LOGGER.info(record['dynamodb'])

        response = []

        #snsClient = boto3.client('sns')
        #response = snsClient.publish(
        #    TargetArn="${aws_sns_topic.this.arn}",
        #    Message=json.dumps({'data': record}),
        #    MessageStructure='json'
        #)

    return {
        'statusCode': 200,
        'body': json.dumps(response)
    }
