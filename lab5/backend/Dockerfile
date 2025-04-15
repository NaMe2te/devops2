FROM gradle:7.6.1-jdk17-alpine AS build
WORKDIR /home/gradle/src

COPY build.gradle.kts settings.gradle.kts gradlew.bat ./
COPY gradle ./gradle
RUN gradle dependencies

COPY src ./src

RUN gradle build --no-daemon

FROM eclipse-temurin:17-jre-alpine

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/meow-service-application.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/meow-service-application.jar"]