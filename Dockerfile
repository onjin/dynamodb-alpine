#vim: set ft=dockerfile:
FROM alpine:3.3

ENV DDB_VERSION latest

RUN apk update && apk add openssl openjdk8 \
	&& wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_${DDB_VERSION}.tar.gz -O /tmp/dynamo.tar.gz \
	&& mkdir -p /opt/dynamodb \
	&& tar -xzvf /tmp/dynamo.tar.gz -C /opt/dynamodb \
	&& rm /tmp/dynamo.tar.gz \
	&& rm -r /var/cache/apk/*

WORKDIR /opt/dynamodb

VOLUME ["/var/dynamodb"]
EXPOSE 8000

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/opt/dynamodb/DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbPath", "/var/dynamodb"]
