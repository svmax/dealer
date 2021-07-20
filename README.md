# README
Async dealer indexer

## Diagram:
![uml](https://github.com/svmax/dealer/blob/master/vendor/github/on.png)

## System dependencies:
* Ruby 2.7.1
* MongoDB
* Redis
* NodeJS
* Foreman
## Configurations using docker-compose:
* `docker-compose up`
* and fulfil DB with companies: `docker-compose run api bundle exec rake dealer:ensure_companies`

## Configurations manually:
### Front end
* `cd ./js`
* `npm install`
* Copy `.env.example >> .env`
* Setup your own google API key (https://developers.google.com/maps/documentation/javascript/get-api-key) and save it as ENV: `VUE_APP_GOOGLE_MAPS_API_KEY`
* `npm run serve`

### Setup DB
* `bundle exec rake db:mongoid:load_models`
* `bundle exec rake db:mongoid:create_indexes`

### Initial seed
* `bundle exec rake dealer:ensure_companies`
### Back end
* Copy `.env.example >> .env` and configure needed params for Faker API
* `mongod --dbpath ./db`
* `redis-server ./config/redis.conf`
* `bundle exec sidekiq -C config/sidekiq/indexer.yml`
* `bundle exec sidekiq -C config/sidekiq/cron.yml`
* `bundle exec rails s -p 3000`
## Tests and code quality (backend):
* `rubocop --config .rubocop.yml ./app`
* `rspec ./spec`

## Services:
* Based on the ability of the sidekiq to schedule jobs, there are already configured to be turned on every hour

