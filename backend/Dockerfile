FROM maven:3.8.1-jdk-11 AS build
WORKDIR /build/
COPY pom.xml /build/
COPY src /build/src/
RUN mvn clean package

FROM openjdk:11
WORKDIR /app
COPY public/images public/images
COPY --from=build /build/target/skor-backend.jar /app
EXPOSE 9000

ENTRYPOINT ["java", "-jar","skor-backend.jar"]