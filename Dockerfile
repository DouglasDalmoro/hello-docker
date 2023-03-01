FROM maven:3.8.4-openjdk-17-slim
WORKDIR /app
COPY pom.xml /app
RUN mvn dependency:go-offline
COPY src/ ./src/
RUN mvn package
EXPOSE 9320
CMD ["java", "-jar", "target/hellodocker-0.0.1-SNAPSHOT.jar", "--server.port=9320"]