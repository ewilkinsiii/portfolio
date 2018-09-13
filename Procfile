web: bundle exec puma -C ./config/puma.rb
worker: DB_POOL_SIZE=${WORKER_CONCURRENCY:-20} bundle exec sidekiq -c ${WORKER_CONCURRENCY:-20} -t ${WORKER_TIMEOUT:-25} -q default,1 -q mailers,1

# === Heroku Release Phase, ignored by `heroku local`. See: https://devcenter.heroku.com/articles/release-phase
release: bin/heroku_release