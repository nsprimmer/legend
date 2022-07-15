FROM maven:3-jdk-11 AS build
ARG GITLAB_USERNAME
ARG VERSION

WORKDIR /app/
RUN git clone https://github.com/finos/legend-depot.git --branch legend-depot-${VERSION}
WORKDIR /app/legend-depot
COPY config/authorisedIdentities.json /app/legend-depot/legend-depot-store-server/src/main/resources/authorisedIdentities.json
RUN sed -i "s/__GITLAB_USERNAME__/${GITLAB_USERNAME}/g" /app/legend-depot/legend-depot-store-server/src/main/resources/authorisedIdentities.json
RUN mvn install
RUN mkdir -p /app/bin
RUN cp /app/legend-depot/legend-depot-store-server/target/legend-depot-store-server-${VERSION}.jar /app/bin/legend-depot-store-server.jar

FROM openjdk:11

COPY --from=build /app/bin/legend-depot-store-server.jar /app/
COPY --from=build /app/legend-depot/legend-depot-store-server/src/main/resources/authorisedIdentities.json /config/authorisedIdentities.json
COPY entrypoint.sh /app/entrypoint.sh
COPY config/settings.xml /config/settings.xml
COPY config/depot-store.demo.json /app/depot-store.demo.json
CMD ["/app/entrypoint.sh"]