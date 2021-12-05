FROM ruby:2.7.2

# Update repo
RUN apt-get -y update
RUN apt-get -y install locales locales-all

RUN mkdir -p /app

# Copy the app code
COPY . /app

# Rack Evn
ENV RACK_ENV production
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Change workdir
WORKDIR /app

# Expose port 80
EXPOSE 80

# Gem setup
RUN gem install bundler
RUN bundle config --global frozen 1
RUN bundle install
