curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
  "name": "cloudant-source-users",
  "config": {
    "connector.class": "com.ibm.cloudant.kafka.connect.CloudantSourceConnector",
    "topics": "users",
    "cloudant.db.url": "${file:/data/cloudant_credentials.properties:CLOUDANT_URL}",
    "cloudant.db.username": "${file:/data/cloudant_credentials.properties:CLOUDANT_USERNAME}",
    "cloudant.db.password": "${file:/data/cloudant_credentials.properties:CLOUDANT_PASSWORD}",
    "cloudant.omit.design.docs": "true",
    "cloudant.value.schema.struct": "true",
    "errors.tolerance": "all",
    "errors.log.enable": true,
    "errors.log.include.messages": true,
    "validate.non.null": false,
    "header.converter": "org.apache.kafka.connect.storage.SimpleHeaderConverter",
    "transforms": "FilterDelete,Flatten",
    "transforms.FilterDelete.type": "io.confluent.connect.transforms.Filter$Value",
    "transforms.FilterDelete.filter.condition": "$.[?(@._deleted == true)]",
    "transforms.FilterDelete.filter.type": "exclude",
    "transforms.FilterDelete.missing.or.null.behavior": "exclude",
    "transforms.Flatten.type": "org.apache.kafka.connect.transforms.Flatten$Value",
    "transforms.Flatten.delimiter": "."
  }
}'
