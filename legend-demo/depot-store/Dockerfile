FROM maven:3-jdk-11 AS build

WORKDIR /app/
RUN git clone https://github.com/finos/legend-depot.git
WORKDIR /app/legend-depot
RUN mvn install
RUN mkdir -p /app/bin
RUN cp /app/legend-depot/legend-depot-server/target/legend-depot-server*.jar /app/bin/
RUN cp /app/legend-depot/legend-depot-store-server/target/legend-depot-store-server*.jar /app/bin/

FROM openjdk:11

COPY --from=build /app/bin/*.jar /app/
COPY entrypoint.sh /app/entrypoint.sh
COPY config/depot-store.demo.json /app/depot-store.demo.json
CMD ["/app/entrypoint.sh"]