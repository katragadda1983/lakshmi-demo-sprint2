FROM tomcat
COPY project/target/project-1.0-RAMA.war /usr/local/tomcat/weapps
CMD "catalina.sh" "run"
