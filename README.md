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

`http://$PORT/_plugin/kibana3/`

`http://$PORT/_plugin/HQ/`



to cleanup:

`docker rm -f $CID && docker rm -v data_elasticsearch`

# Run example

Provided example assumes using [crane](https://github.com/michaelsauter/crane).
Change dir to `examples/` and execute `crane lift`. This will bring three containers:

- michaloo/elasticsearch
- (michaloo/fluentd)[https://github.com/michaloo/fluentd]
- ubuntu:14.04 (as a log producer)

After lifting them up you can go to
`http://your-docker-host:9200/_plugin/kibana3/index.html#/dashboard/file/logstash.json`
to see the example logs (you may need to wait a minute for logs to show).
