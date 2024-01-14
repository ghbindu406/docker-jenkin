# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Update the package repository and install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    openjdk-11-jdk

# Download and install Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y \
    jenkins

# Expose port 8080 for Jenkins web interface
EXPOSE 8080

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

