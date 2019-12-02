FROM node:12-buster

RUN apt-get update && \
    apt-get install --no-install-recommends -y ruby ruby-dev optipng libjpeg-turbo-progs guetzli && \
    rm -r /var/lib/apt/lists/*

RUN gem install sass
