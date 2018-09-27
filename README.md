# Hololens Adapter

This is a simple Consumer for the Messaging Bus's data that pipes the messages to a websocket.

The Hololens Adapter is based on the components:
* Kafka Client [librdkafka](https://github.com/geeknam/docker-confluent-python) version **0.11.1**
* Node Red Graphical programming framework [node-red](https://nodered.org/) 


## Contents

1. [Requirements](#requirements)
2. [Deployment](#deployment)
3. [Configuration](#configuration)
4. [Trouble-Shooting](#trouble-shooting)


## Requirements

1. Install [Docker](https://www.docker.com/community-edition#/download) version **1.10.0+**
2. Install [Docker Compose](https://docs.docker.com/compose/install/) version **1.6.0+**
3. Clone this repository


## Deployment


### Testing
Using `docker-compose`:

```bash
git clone https://github.com/iot-salzburg/dtz_hololens-adapter.git
cd dtz_hololens-adapter
sudo docker-compose up --build -d
```

The flag `-d` stands for running it in background (detached mode):

Watch the logs with:
```bash
sudo docker-compose logs -f
```


### Deployment in a docker swarm
Using `docker stack`:

If not already done, add a regitry instance to register the image
```bash
sudo docker service create --name registry --publish published=5001,target=5000 registry:2
curl 127.0.0.1:5001/v2/
```
This should output `{}`:


If running with docker-compose works, the stack will start by running:


```bash
git clone https://github.com/iot-salzburg/dtz_hololens-adapter.git
cd dtz_hololens-adapter
chmod +x st* sh*
./start-adapter.sh
```


Watch if everything worked fine with:

```bash
./show-adapter.sh
docker service logs -f hololens_adapter
```

The service will be available under `hostname:1880/`

## Configuration

The flows are stored on the samba share `il060` which can be defined in the `docker-compose.yml`.
They can be modified in the node-red UI `hostname:1880/`.

All other configurations can also be made in the docker-compose.yml.


## Trouble-shooting

#### Can't apt-get update in Dockerfile:
Restart the service

```sudo service docker restart```

or add the file `/etc/docker/daemon.json` with the content:
```
{
    "dns": [your_dns, "8.8.8.8", "8.8.8.4"]
}
```
where `your_dns` can be found with the command:

```bash
nmcli device show <interfacename> | grep IP4.DNS
```

####  Traceback of non zero code 4 or 128:

Restart service with
```sudo service docker restart```

or add your dns address as described above

