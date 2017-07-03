FROM ruby:2.3

ENV APP_HOME=/home/app/pact_broker

RUN mkdir -p $APP_HOME

ADD . $APP_HOME/
RUN cd $APP_HOME

WORKDIR $APP_HOME
RUN gem install bundler
RUN bundle

EXPOSE 8080
CMD ["bundle", "exec", "rackup", "-o","0.0.0.0", "-p", "8080"]