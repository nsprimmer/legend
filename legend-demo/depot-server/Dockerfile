FROM maven:3-jdk-11 AS build
ARG VERSION

WORKDIR /app/
RUN git clone https://github.com/finos/legend-depot.git --branch legend-depot-${VERSION}
WORKDIR /app/legend-depot
RUN mvn install
RUN mkdir -p /app/bin
RUN cp /app/legend-depot/legend-depot-server/target/legend-depot-server-${VERSION}.jar /app/bin/legend-depot-server.jar

FROM openjdk:11

COPY --from=build /app/bin/legend-depot-server.jar /app/
COPY entrypoint.sh /app/entrypoint.sh
COPY config/depot-server.demo.json /app/depot-server.demo.json
CMD ["/app/entrypoint.sh"]