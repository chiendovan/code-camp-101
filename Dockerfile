FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs pkg-config
# for a JS runtime
RUN apt-get install -y nodejs && apt-get install -y shared-mime-info

# Install cmake to support pronto on local
RUN apt-get update && apt-get install -y cmake

ENV DIR /var/www

RUN mkdir $DIR
WORKDIR $DIR
ADD . $DIR

ENV BUNDLE_GEMFILE=$DIR/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install
