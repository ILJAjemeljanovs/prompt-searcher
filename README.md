# README

## Setup steps:
`sudo docker-compose run rails rails db:create`
`sudo docker-compose run rails rails db:migrate`
`sudo docker-compose up`

Then while instance is up in the second terminal launch
`sudo docker-compose run rails rails db:seed`

Then it is ready to be used at your `localhost:3000`
