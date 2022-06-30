FROM openjdk:11
ARG VERSION
ADD https://repo1.maven.org/maven2/org/finos/legend/sdlc/legend-sdlc-server/${VERSION}/legend-sdlc-server-${VERSION}-shaded.jar /app/legend-sdlc-server-shaded.jar
COPY config/sdlc.demo.yaml /app/sdlc.demo.yaml
COPY entrypoint.sh /app/entrypoint.sh
WORKDIR /app
CMD ["/app/entrypoint.sh"]