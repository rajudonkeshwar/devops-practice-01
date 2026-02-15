# Use lightweight Tomcat image
FROM tomcat:9.0-jdk17-temurin-jammy

# Remove default applications to reduce size
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat as ROOT app
COPY Java-Login-App/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080
