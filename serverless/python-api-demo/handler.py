import json


def hello(event, context):
    body = {
        "message": "Hello Serverless Framework!",
        "input": event,
    }

    response = {"statusCode": 200, "body": body}

    return json.dumps(response)
