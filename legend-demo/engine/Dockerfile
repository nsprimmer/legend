FROM openjdk:11
ARG VERSION
ADD https://repo1.maven.org/maven2/org/finos/legend/engine/legend-engine-server/${VERSION}/legend-engine-server-${VERSION}-shaded.jar /app/legend-engine-server-shaded.jar
COPY config/engine.demo.json /app/engine.demo.json
COPY entrypoint.sh /app/entrypoint.sh
COPY config/vault.properties /app/vault.properties
WORKDIR /app
CMD ["/app/entrypoint.sh"]