Docker image with Elasticsearch and elasticsearch-kopf, kibana and elasticsearch-HQ plugins installed.

# Get started
To run that image with persistent data storage run:

`docker run -d --name data_elasticsearch -v /opt/elasticsearch/data tianon/true`

to create storage container and then you can start the elasticsearch itself:

`CID=$(docker run -d -P --volumes-from data_elasticsearch michaloo/elasticsearch)`

after getting container port:

`PORT=$(docker port $CID 9200)`

you can open:

`http://$PORT/_plugin/kopf/`

`http://$PORT/_plugin/kibana/`

`http://$PORT/_plugin/HQ/`



to cleanup:

`docker rm -f $CID && docker rm -v data_elasticsearch`
