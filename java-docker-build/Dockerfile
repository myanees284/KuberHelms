FROM alpine
MAINTAINER Anees anees284@gmail.com

RUN apk update
RUN apk add --no-cache openjdk8
RUN apk add --no-cache maven

RUN mkdir -p /myapp
WORKDIR /myapp
ADD src /myapp/src
COPY pom.xml /myapp
RUN mvn package
RUN cd target
CMD java -jar target/app.jar
