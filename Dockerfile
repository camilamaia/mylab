FROM ruby:2.2.2

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev locales apt-utils debconf-utils openssl libssl-dev vim
ENV LANG=C.UTF-8 LANGUAGE=en_US:en LC_ALL=C.UTF-8

RUN mkdir /mylab
WORKDIR /mylab
ADD Gemfile /mylab/Gemfile
ADD Gemfile.lock /mylab/Gemfile.lock

RUN bundle install

ADD . /mylab

ENV RAILS_ENV production

EXPOSE 3000

ENV HOSTNAME mylab.ufsc.br
ENV DOMAIN ufsc.br

