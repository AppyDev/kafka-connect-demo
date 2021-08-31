# kafka-connect-demo

### Build Kafka Connect image and push to IBM Container Registry
> sh build-and-push.sh

### Apply configmap and secret
> kubectl apply -f event-streams-config.properties.yaml
> 
> kubectl apply -f kafka-connect-demo-config.properties.yaml
> 
> kubectl apply -f event-streams-sasl-jaas-secret.yaml
> 
> sh db-jks-secret.sh

### Deploy kafka connect
> kubectl apply -f kafka-connect-deployment.yaml

### Port Forward
> kubectl -n demo port-forward $(kubectl -n demo get pod -l app=kafka-connect-demo -o jsonpath="{.items[0].metadata.name}") 8083:8083 &

### Deploy connectors
> sh users-db2-sink.sh
> 
> sh users-cloudant-source.sh

### kafkahq deployment
> kubectl create configmap kafkahq-config --from-file=application.yml -n demo
> 
> kubectl apply -f kafkahq-deployment.yaml
> 
> kubectl -n demo port-forward $(kubectl -n demo get pod -l app=kafkahq -o jsonpath="{.items[0].metadata.name}") 8080:8080 &