FROM alpine/git as fetch-hapi
WORKDIR /tmp
RUN git clone https://github.com/hapifhir/hapi-fhir-jpaserver-starter.git /tmp

##

FROM maven:3.6.3-jdk-11-slim as build-hapi
WORKDIR /tmp
COPY --from=fetch-hapi /tmp /tmp
RUN mvn -ntp clean install -DskipTests

##

FROM tomcat:9.0.38-jdk11-openjdk-slim-buster
RUN mkdir -p /data/hapi/lucenefiles && chmod 775 /data/hapi/lucenefiles

COPY --from=build-hapi ./tmp/target/ROOT /usr/local/tomcat/webapps/ROOT

COPY ./templates/. /usr/local/tomcat/webapps/ROOT/WEB-INF/templates
COPY ./img/. /usr/local/tomcat/webapps/ROOT/img/

EXPOSE 8080

CMD ["catalina.sh", "run"]