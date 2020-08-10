docker-compose run web bundle install
docker-compose run web rails db:setup
docker-compose build
docker-compose up
