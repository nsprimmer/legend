#!/bin/bash

echo "Container Start: $(time +%s)"
sed -i "s/__GITLAB_CLIENT_ID__/${GITLAB_CLIENT_ID}/g" /app/sdlc.demo.yaml
sed -i "s/__GITLAB_SECRET__/${GITLAB_SECRET}/g" /app/sdlc.demo.yaml
java -cp /app/legend-sdlc-server-shaded.jar org.finos.legend.sdlc.server.LegendSDLCServer server /app/sdlc.demo.yaml