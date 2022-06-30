#!/bin/bash

echo "Container Start: $(time +%s)"
sed -i "s/__GITLAB_CLIENT_ID__/${GITLAB_CLIENT_ID}/g" /app/depot-server.demo.json
sed -i "s/__GITLAB_SECRET__/${GITLAB_SECRET}/g" /app/depot-server.demo.json
java -cp /app/legend-depot-server-0.1.0-SNAPSHOT.jar org.finos.legend.depot.server.LegendDepotServer server /app/depot-server.demo.json