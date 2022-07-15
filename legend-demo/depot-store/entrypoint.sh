#!/bin/bash

echo "Container Start: $(time +%s)"
sed -i "s/__GITLAB_CLIENT_ID__/${GITLAB_CLIENT_ID}/g" /app/depot-store.demo.json
sed -i "s/__GITLAB_SECRET__/${GITLAB_SECRET}/g" /app/depot-store.demo.json
sed -i "s/__GITLAB_PROJECT_ID__/${GITLAB_PROJECT_ID}/g" /config/settings.xml
sed -i "s/__GITLAB_DEPLOY_TOKEN_USERNAME__/${GITLAB_DEPLOY_TOKEN_USERNAME}/g" /config/settings.xml
sed -i "s/__GITLAB_DEPLOY_TOKEN_PASSWORD__/${GITLAB_DEPLOY_TOKEN_PASSWORD}/g" /config/settings.xml
java -cp /app/legend-depot-store-server.jar org.finos.legend.depot.store.server.LegendDepotStoreServer server /app/depot-store.demo.json