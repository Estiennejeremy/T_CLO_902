FROM composer:2

ARG UID
ARG GID
ARG TOTO

ENV UID=${UID}
ENV GID=${GID}
ENV TOTO="arg1"

# MacOS staff group's gid is 20, so is the dialout group in alpine linux. We're not using it, let's just remove it.
RUN delgroup dialout

RUN echo 'UID' ${UID} UID arg1
RUN echo 'TOTO' ${TOTO} TOTO arg1
RUN echo 'GID' ${GID} GID arg1

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

WORKDIR /var/www/html
