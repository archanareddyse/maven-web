 FROM tomcat:9.0
   COPY target/HelloWorldApp.war /usr/local/tomcat/webapps/
# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
