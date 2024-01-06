# Use an official Tomcat runtime as a base image
FROM tomcat:9.0-jdk11-openjdk-slim

# Set the working directory in the container
WORKDIR /usr/local/tomcat/webapps/

# Remove the default ROOT application
RUN rm -rf ROOT

# Copy your web application WAR file into the webapps directory
COPY your-web-app.war ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
