#!/bin/bash

# Project and Tomcat paths
PROJECT_DIR="/Users/nduvhomaguwada/IdeaProjects/University Portal"
TOMCAT_DIR="/usr/local/tomcat10"
WAR_NAME="UniversityPortal.war"

# Go to project directory
cd "$PROJECT_DIR" || exit

echo "Cleaning and building project..."
mvn clean package || { echo "Maven build failed!"; exit 1; }

# Copy WAR to Tomcat webapps
echo "Deploying WAR to Tomcat..."
cp target/$WAR_NAME $TOMCAT_DIR/webapps/universityportal.war || { echo "Copy failed!"; exit 1; }

# Restart Tomcat
echo "Restarting Tomcat..."
$TOMCAT_DIR/bin/shutdown.sh
sleep 3
$TOMCAT_DIR/bin/startup.sh

echo "Deployment complete! Access at http://localhost:8080/universityportal/"
