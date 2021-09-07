curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
  "name": "db2-sink-users",
  "config": {
    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
    "connection.url": "${file:/data/db2_credentials.properties:DB_URL}",
    "connection.user":"${file:/data/db2_credentials.properties:DB_USERNAME}",
    "connection.password":"${file:/data/db2_credentials.properties:DB_PASSWORD}",
    "topics": "users",
    "table.name.format": "USERS",
    "transforms": "RenameField,ReplaceField,InsertDateCreated",
    "transforms.RenameField.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
    "transforms.RenameField.renames": "_id:USERID,firstName:FNAME,lastName:LNAME,address.street:STREET,address.state:STATE,address.country:COUNTRY",
    "transforms.ReplaceField.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
    "transforms.ReplaceField.blacklist": "_rev",
    "transforms.InsertDateCreated.type": "org.apache.kafka.connect.transforms.InsertField$Value",
    "transforms.InsertDateCreated.timestamp.field": "UPDATAEDTS",
    "insert.mode": "upsert",
    "pk.mode": "record_value",
    "pk.fields": "USERID",
    "max.retries": 0,
    "auto.create": false
  }
}'
