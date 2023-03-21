FROM openjdk:11

EXPOSE 8080

ADD target/kroton.jar kroton.jar

ENTRYPOINT ["java", "-jar", "/kroton.jar"]