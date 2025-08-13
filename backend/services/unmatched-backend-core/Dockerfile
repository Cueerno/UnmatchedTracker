FROM openjdk:21-slim AS builder
WORKDIR /app

RUN apt-get update \
 && apt-get install -y maven \
 && rm -rf /var/lib/apt/lists/*

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests -B

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar


EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]