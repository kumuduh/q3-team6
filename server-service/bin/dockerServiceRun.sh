        #!/bin/bash

service_name="server-service"
default_port="8091"
message_service="messaging-service"

#look for defined vars for the team name and port
#else set to defaults
if [ -z ${TEAM} ]; then TEAM="team6";fi
if [ -z ${SERVER_SERVICE_PORT} ]; then SERVER_SERVICE_PORT=${default_port};fi


project_dir="$(dirname $(cd -P -- "$(dirname -- "$0")" && pwd -P))"

echo Starting ${service_name} Docker image for ${TEAM} from ${project_dir} on Port:${SERVER_SERVICE_PORT}

#Get the local IP of the host
#for OSX
LOCAL_IP=`ipconfig getifaddr en0`
#for other
NETWORK_INTERFACE="ens33"
if [ -z ${LOCAL_IP} ]; then LOCAL_IP=`ip -f inet -o addr show ${NETWORK_INTERFACE}|cut -d\  -f 7 | cut -d/ -f 1`;fi

echo ${LOCAL_IP}

docker run --link team6-${message_service}:${message_service}  \
 --env ADVERTISED_HOST=${LOCAL_IP} \
 --env MESSAGING_SERVICE="10.162.231.12:2181" \
 -p ${SERVER_SERVICE_PORT}:${default_port} \
 --name "${TEAM}-${service_name}" \
 -d ${TEAM}/${service_name}


