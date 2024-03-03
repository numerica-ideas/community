

def hello(event, context):
    response = {"statusCode": 200, "body": {"message": "Hello Serverless Framework!"}}

    return response
