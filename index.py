def lambda_handler(event, context):
    key1 = "me" if not "key1" in event else event["key1"]
    message = "Hello {}!".format(key1)
    return {"message": message}
