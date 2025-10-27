# Use official OpenJDK 17 image
FROM openjdk:17-jdk-slim

# Working directory inside container
WORKDIR /app

# Copy project files
COPY . .

# Give permission to mvnw (fixes "Permission denied")
RUN chmod +x mvnw

# Build the Spring Boot app
RUN ./mvnw clean package -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the generated jar file
CMD ["java", "-jar", "target/portfolio-backend-0.0.1-SNAPSHOT.jar"]
