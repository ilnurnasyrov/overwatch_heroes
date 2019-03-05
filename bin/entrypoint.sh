#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

bundle install
bundle exec rake db:migrate
bundle exec whenever --update-crontab
bundle exec rake sync_data

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
