#Docker commands required to build an image
#https://stackify.com/docker-build-a-beginners-guide-to-building-docker-images/
#https://docs.docker.com/get-started/02_our_app/cls
#Open cmd as administrator
#Launch command: "C:\Program Files\Docker\Docker\DockerCli.exe" -SwitchDaemon
#parent image from where we start
FROM eclipse-temurin:17-jdk-alpine
#installing curl command, due we will curl our api, will be run by aws service
RUN apk add curl
#adding tempory volume
VOLUME /tmp
#exposing port 8080
EXPOSE 8080
#copy jar to target
ADD target/springboot-aws-deploy-service.jar springboot-aws-deploy-service.jar
#run our JAR file
ENTRYPOINT ["java","-jar","/springboot-aws-deploy-service.jar"]