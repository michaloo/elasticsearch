FROM ubuntu:14.04
MAINTAINER Michal Raczka me@michaloo.net

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-7-jre-headless curl

# Install Elasticsearch
RUN mkdir -p /opt/elasticsearch && \
    curl https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz | \
    tar -xz -C /opt/elasticsearch --strip-components=1

# Install plugins
RUN /opt/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf && \
    /opt/elasticsearch/bin/plugin -url http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip -install elasticsearch/kibana3 && \
    /opt/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ

# Expose port 9200
EXPOSE 9200

ENV PATH_CONF /opt/elasticsearch/config
ENV PATH_DATA /opt/elasticsearch/data


VOLUME [ "/opt/elasticsearch/data" ]

# add startup scripts and config files
WORKDIR /app
ADD ./bin    /app/bin
ADD ./config /app/config

# Start Elasticsearch
CMD ["/app/bin/start"]