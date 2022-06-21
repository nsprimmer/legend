FROM maven:3-jdk-11

WORKDIR /app/
RUN git clone https://github.com/finos/legend-depot.git
WORKDIR /app/legend-depot
RUN mvn install
RUN mkdir -p /app/bin
RUN cp /app/legend-depot/legend-depot-server/target/legend-depot-server*.jar /app/bin/
RUN cp /app/legend-depot/legend-depot-store-server/target/legend-depot-store-server*.jar /app/bin/

