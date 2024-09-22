# Stage 1: Build the application
FROM maven:3.9.4 AS build

# Set the working directory inside the container
WORKDIR /docker-spring-boot

# Copy the pom.xml and download dependencies (for caching)
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the application source code
COPY src ./src

# Package the application (skip tests to speed up the process)
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:21-jdk

# Set the working directory inside the container
WORKDIR /docker-spring-boot

# Copy the compiled JAR file from the build stage
COPY --from=build /docker-spring-boot/target/*.jar docker-spring-boot.jar

# Expose the port Spring Boot runs on (default 8080)
EXPOSE 8080

# Add a healthcheck (optional but recommended)
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl --fail http://localhost:8080/actuator/health || exit 1

# Command to run the application
ENTRYPOINT ["java", "-jar", "docker-spring-boot.jar"]
