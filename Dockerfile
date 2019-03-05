# Pick the ruby version for your rails app. This one is a rails 4 app and using ruby 2.2.3. Consider using 2.5.0 at least.
FROM ruby:2.6.1
# Installing some needed things here. Including ghostscript because this rails app works with pdfs. You may consider making adjustments.
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get -y install cron

# Make the directory for the app
RUN mkdir /app
# Set the working directory of everything to the directory we just made.
WORKDIR /app
# Copy the gemfile and gemfile.lock so we can run bundle on it
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
# Install and run bundle to get the app ready
RUN gem install bundler
RUN bundle install
# Copy the Rails application into place
COPY . /app
# Expose port 3000 on the container
EXPOSE 3000
# Run the application on port 3000
CMD cron && bundle exec rails s -b 0.0.0.0 -p 3000
