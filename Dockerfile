FROM registry.cn-shanghai.aliyuncs.com/mydlq/openjdk:8u201-jdk-alpine3.9
VOLUME /tmp

ADD tale.jar tale.jar

RUN sh -c 'touch /tale.jar'
ENV JAVA_OPTS="-Xmx512M -Xms256M -Xss256k -Duser.timezone=Asia/Shanghai"
ENV APP_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /tale.jar $APP_OPTS" ]
