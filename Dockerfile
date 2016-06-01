FROM ruby:2.3.1-alpine

ADD . /opt/app

VOLUME /opt/app/source
WORKDIR /opt/app

ENTRYPOINT ["ruby", "run.rb"]
CMD [""]
