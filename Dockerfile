# Stage One - Bootstrap laravel app with bootstrap.sh.

FROM lmctague/php:7.1-cli as bootstrap

LABEL maintainer="Liam McTague liamsmctague@gmail.com"

WORKDIR /app

COPY . /app/

RUN chmod +x bootstrap.sh \
    && /bin/bash bootstrap.sh

RUN chmod -R o+w storage bootstrap/cache

# Stage Two - Copy app into blank container.

FROM debian:stretch-slim

WORKDIR /app

COPY --from=bootstrap /app/. /app/
