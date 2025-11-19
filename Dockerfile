FROM oeclipse-temurin:21-jdk
VOLUME /tmp
COPY target/*.jar app.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","/app.jar"]