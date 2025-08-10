FROM openjdk:21-slim AS builder

RUN apt-get update \
  && apt-get install -y maven \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine AS runner
WORKDIR /app

COPY --from=builder /build/target/*.jar app.jar

EXPOSE 8080
ENV SPRING_PROFILES_ACTIVE=prod

ENTRYPOINT ["java", "-jar", "app.jar"]