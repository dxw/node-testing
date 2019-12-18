FROM node:12-buster

RUN apt-get update && \
    apt-get install --no-install-recommends -y optipng libjpeg-turbo-progs guetzli && \
    rm -r /var/lib/apt/lists/*

RUN yarn global add --prefix=/usr/local sass
