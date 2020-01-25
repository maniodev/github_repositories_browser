FROM ruby:2.6.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/github_browser
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

ENV RAILS_ENV='production'
ENV RACK_ENV='production'

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

COPY . .
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
