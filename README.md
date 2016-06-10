# Minimal Amazon DynamoDB image based on Alpine Linux for local development

This image is bases on `alpine` image, so it's only 192MB with Java JRE and DynamoDB installed.

You can pull this image from  docker hub:
```
  $ git pull onjin/dynamodb-alpine
```

Or build your own from repository:

```
  $ docker build -t dynamodb-alpine .
```

# What is Amazon DynamoDB

Amazon DynamoDB is a fully managed NoSQL database service that provides fast and predictable performance with seamless scalability. DynamoDB lets you offload the administrative burdens of operating and scaling a distributed database, so that you don't have to worry about hardware provisioning, setup and configuration, replication, software patching, or cluster scaling.


# How to use this image

Simple start:
```
  $ docker run -d onjin/dynamodb-alpine
```

Now you can open dynamodb shell:
```
  http://container-ip:8000/shell
```

Run with persisent dynamodb data:
```
  $ docker run -v /tmp/dynamodbdata:/var/dynamodb onjin/dynamodb-alpine
```


