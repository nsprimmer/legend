#!/bin/bash

echo "Container Start: $(time +%s)"
sed -i "s/__GITLAB_CLIENT_ID__/${GITLAB_CLIENT_ID}/g" /app/engine.demo.json
sed -i "s/__GITLAB_SECRET__/${GITLAB_SECRET}/g" /app/engine.demo.json
java -cp /app/legend-engine-server-shaded.jar org.finos.legend.engine.server.Server server /app/engine.demo.json