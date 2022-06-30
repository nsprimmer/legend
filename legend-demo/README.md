# Legend Demo

This directory serves to provide a streamlined method for standing up the full Legend stack for individual demonstration purposes. The configurations and infrastructure here are not configured for use outside of a local system.

## Gitlab Application Configuration

## MongoDB

MongoDB will be running in a docker container still.

Command: `docker run -d --name mongodb -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password mongo:latest`

## Legend Engine

Maven Central URL: https://search.maven.org/remotecontent?filepath=org/finos/legend/engine/legend-engine-server/3.1.0/legend-engine-server-3.1.0-shaded.jar

Command: `java -cp legend-engine-server-3.1.0-shaded.jar org.finos.legend.engine.server.Server server engine.demo.json`

## Legend SDLC

Maven Central URL: https://search.maven.org/remotecontent?filepath=org/finos/legend/sdlc/legend-sdlc-server/0.75.0/legend-sdlc-server-0.75.0-shaded.jar

Command: `java -cp legend-sdlc-server-0.75.0-shaded.jar org.finos.legend.sdlc.server.LegendSDLCServer server sdlc.demo.json`

## Legend Depot

Git Clone Command: `git clone https://github.com/finos/legend-depot.git`

Install command: `mvn -DskipTests clean install`

Run Command: `java -cp $HOME/.m2/repository/org/finos/legend/depot/legend-depot-store-server/0.1.0-SNAPSHOT/legend-depot-store-server-0.1.0-SNAPSHOT.jar org.finos.legend.depot.store.server.LegendDepotStoreServer server ./depot-store.demo.json`

Run Command: `java -cp $HOME/.m2/repository/org/finos/legend/depot/legend-depot-server/0.1.0-SNAPSHOT/legend-depot-server-0.1.0-SNAPSHOT.jar org.finos.legend.depot.server.LegendDepotServer server ./depot-server.demo.json`

## Legend Studio


## Legend Query
