FROM ruby:2.6.8-buster

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler:2.2.24
ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]