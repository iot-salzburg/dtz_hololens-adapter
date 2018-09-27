

FROM nodered/node-red-docker:v8


USER root

RUN cd /data
RUN npm install --quiet --no-progress node-red-contrib-kafka-node node-red-contrib-rdkafka

