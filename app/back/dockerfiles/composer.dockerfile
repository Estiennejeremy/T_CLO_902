FROM composer:2

ARG UID
ARG GID
ARG TOTO
ARG TOTO2
ARG TOTO3

ENV UID=${UID}
ENV GID=${GID}
ENV TOTO=arg1
ENV TOTO2=${arg1}
ENV TOTO3="${arg1}"

# MacOS staff group's gid is 20, so is the dialout group in alpine linux. We're not using it, let's just remove it.
RUN delgroup dialout

RUN echo 'UID' ${UID} UID arg1
RUN echo 'arg1' ${arg1} arg1
RUN echo 'TOTO' ${TOTO} TOTO
RUN echo 'TOTO2' ${TOTO2} TOTO2
RUN echo 'TOTO3' ${TOTO3} TOTO3

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

WORKDIR /var/www/html
