# Use a base image with Java 17
FROM openjdk:17

WORKDIR /app

# Copy the necessary files and folders to the image
COPY mvnw pom.xml ./
COPY .mvn/ .mvn
RUN ./mvnw dependency:go-offline
COPY ./src ./src

# Package the application
RUN ./mvnw clean install -DskipTests

# Expose the application port
EXPOSE 8090

# Run the App
CMD ["./mvnw", "spring-boot:run"]
