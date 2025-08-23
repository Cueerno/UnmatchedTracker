FROM maven:3.9-eclipse-temurin-21 AS builder

ARG GIT_BRANCH
RUN if [ "$GIT_BRANCH" != "main" ]; then \
      echo "⚠️  Build is allowed only from the main branch, current: $GIT_BRANCH"; \
      exit 1; \
    fi

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests -B

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar


EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]