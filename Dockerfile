# Step 1: Use Maven image to build the project
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy all project files
COPY pom.xml .
COPY src ./src

# Run Maven build (skip tests for faster build)
RUN mvn clean package -DskipTests

# Step 2: Use lightweight JDK image to run the app
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the jar file from the previous stage
COPY --from=builder /app/target/*.jar app.jar

# Expose backend port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
