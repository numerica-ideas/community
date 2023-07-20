import json
import boto3

# create a DynamoDB object using the AWS SDK
dynamodb = boto3.resource('dynamodb')
# use the DynamoDB object to select our table
table = dynamodb.Table('EmployeesDB')

# define the handler function that the Lambda service will use as an entry point
def lambda_handler(event, context):
    # extract the employeeId from the event object we got from the Lambda service
    employeeId = event['employeeId']
    
    # delete the employee from the DynamoDB table using the employeeId
    response = table.delete_item(
        Key={
            'employeeId': employeeId
        }
    )
    
    # return a properly formatted JSON object
    return {
        'statusCode': 200,
        'body': json.dumps('Employee deleted successfully')
    }
