#!/bin/bash

export DEPOT_JAR_PATH=""
export DEPOT_CONFIG_PATH=""
export DEPOT_CLASS_NAME=""

if [[ "${DEPOT_SERVER}" == "depot" ]]; then
    DEPOT_JAR_PATH="/app/bin/legend-depot-server-${VERSION}.jar"
    DEPOT_CONFIG_PATH="/config/depot-server.json"
    DEPOT_CLASS_NAME="org.finos.legend.depot.server.LegendDepotServer"
fi

if [[ "${DEPOT_SERVER}" == "depotStore" ]]; then
    DEPOT_JAR_PATH="/app/bin/legend-depot-store-server-${VERSION}.jar"
    DEPOT_CONFIG_PATH="/config/depot-store-server.json"
    DEPOT_CLASS_NAME="org.finos.legend.depot.store.server.LegendDepotStoreServer"
fi

if [[ -z "${DEPOT_SERVER}" ]] || [[ -z "${DEPOT_JAR_PATH}" ]] || [[ -z "${DEPOT_CONFIG_PATH}" ]]; then
    echo "ERROR: Depot server type unset, must be one of ['depot', 'depotStore']. Set this in 'DEPOT_SERVER' environment variable."
    exit 1
fi

/scripts/gen-config.sh

java \
    -XX:+ExitOnOutOfMemoryError \
    -XX:MaxRAMPercentage=60 \
    -Dfile.encoding=UTF8 \
    -jar ${DEPOT_JAR_PATH} \
    server ${DEPOT_CONFIG_PATH}