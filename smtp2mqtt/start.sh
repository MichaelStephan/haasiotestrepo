#!/usr/bin/env bashio

if ! bashio::services.available "mqtt"; then
    bashio::log.error "No internal MQTT service found"
else
    bashio::log.info "MQTT service found, fetching credentials ..."
    MQTT_HOST=$(bashio::services mqtt "host")
    MQTT_USER=$(bashio::services mqtt "username")
    MQTT_PASSWORD=$(bashio::services mqtt "password")
fi

./app/smtp2mqtt -mqtt tcp://${MQTT_HOST}:1883 -user ${MQTT_USER} -password ${MQTT_PASSWORD} -topic /smtp2mqtt