FROM node:12-buster

RUN apt-get update && \
    apt-get install --no-install-recommends -y ruby ruby-dev optipng libjpeg-turbo-progs guetzli locales && \
    rm -r /var/lib/apt/lists/*

RUN gem install sass

##
## The following ensures .scss files are interpreted as UTF-8
##
## https://github.com/jekyll/jekyll/issues/4268#issuecomment-167406574
##

ENV DEBIAN_FRONTEND noninteractive

# Install program to configure locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
