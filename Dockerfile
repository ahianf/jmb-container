FROM arm32v7/openjdk:11-ea-jdk-slim

ENV JMB_VERSION 0.3.6

#No downloadable example config since 0.2.10
RUN mkdir -p /jmb/config
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION.jar /jmb/JMusicBot.jar

COPY ./config.txt /jmb/config
COPY ./docker-entrypoint.sh /jmb

RUN chmod +x /jmb/docker-entrypoint.sh

VOLUME /jmb/config

ENTRYPOINT ["/jmb/docker-entrypoint.sh"]
