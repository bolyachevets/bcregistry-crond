FROM alpine
ENV TZ=PST8PDT
WORKDIR /
ARG SOURCE_REPO=webdevops
ARG GOCROND_VERSION=23.2.0
ADD https://github.com/$SOURCE_REPO/go-crond/releases/download/$GOCROND_VERSION/go-crond.linux.amd64 /usr/bin/go-crond
USER root
RUN chmod +x /usr/bin/go-crond
RUN echo $TZ > /etc/timezone
USER 26
ENTRYPOINT ["go-crond", "/crons/crontab", "--allow-unprivileged"]
