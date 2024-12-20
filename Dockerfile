 # Use Maven image to build the application
FROM maven:3.8.7-eclipse-temurin-17 AS builder

# Set working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml .
COPY src ./src

# Build the Maven project
RUN mvn clean package

# Use a lightweight Tomcat image to run the app
FROM tomcat:9.0.79-jdk17-temurin

# Set working directory
WORKDIR /usr/local/tomcat/webapps/

# Copy the WAR file generated by Maven to Tomcat's webapps directory
COPY --from=builder /app/target/*.war ./ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

