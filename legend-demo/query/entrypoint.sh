#!/bin/bash

sed -i "s/__GITLAB_CLIENT_ID__/${GITLAB_CLIENT_ID}/g" /config/httpConfig.json
sed -i "s/__GITLAB_SECRET__/${GITLAB_SECRET}/g" /config/httpConfig.json

java -cp /app/bin/webapp-content:/app/bin/* org.finos.legend.server.shared.staticserver.Server server /config/httpConfig.json