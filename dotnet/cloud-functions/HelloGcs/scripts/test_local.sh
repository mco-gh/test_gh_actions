#!/bin/bash

echo "Trigger the function by sending a Cloud Storage CloudEvent"
set -v
curl localhost:8080 -v \
  -X POST \
  -H "Content-Type: application/json" \
  -H "ce-id: 123451234512345" \
  -H "ce-specversion: 1.0" \
  -H "ce-time: 2020-01-02T12:34:56.789Z" \
  -H "ce-type: google.cloud.storage.object.v1.finalized" \
  -H "ce-source: //storage.googleapis.com/projects/_/buckets/MY-BUCKET-NAME" \
  -H "ce-subject: objects/MY_FILE.txt" \
  -d '{
        "bucket": "MY_BUCKET",
        "contentType": "text/plain",
        "kind": "storage#object",
        "md5Hash": "...",
        "metageneration": "1",
        "name": "MY_FILE.txt",
        "size": "352",
        "storageClass": "MULTI_REGIONAL",
        "timeCreated": "2020-04-23T07:38:57.230Z",
        "timeStorageClassUpdated": "2020-04-23T07:38:57.230Z",
        "updated": "2020-04-23T07:38:57.230Z"
      }'
