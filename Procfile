mongo: mongod --dbpath ./db
redis: redis-server ./config/redis.conf
sidekiq_indexer: bundle exec sidekiq -C config/sidekiq/indexer.yml
sidekiq_cron: bundle exec sidekiq -C config/sidekiq/cron.yml
api: bundle exec rails s -p 3000
spa: cd js && yarn serve