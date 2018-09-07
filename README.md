# Cloud Task Runner

CTR is a application to schedule and run calculating applications in different languages without caring about anything.

this application is implemented on ruby on rails web framework as a web application.

##Important notes
*_only python3 worker is working right now._ *

*_internalization only available for farsi now._ *


## System dependencies
this application can run in every machine can run ruby scripts, but I recommend to use Linux Distributions

you should install this applications at the first:

* [redis](https://redis.io)
* [docker-ce](https://www.docker.com)

after that you need to install some packages for example if you are using debian based OS like ubuntu:
```
apt-get update -qq && apt-get install -y -qq nodejs libpq-dev cmake
```
and then you need to clone project and run thease commands from project root:
```
gem install bundler
bundle install
```

##Configuration
for configuration you need copy this three sample files in same directory and set correct values
```
cp config/application.sample.yml config/application.yml
cp config/database.sample.yml config/database.yml
cp config/secrets.sample.yml config/secrets.yml
```

##Database
if you are using postgres configure your database in `config/application.yml`
else config your connection in `config/database.yml`
and then run this command:
```
rake db:setup db:seed
```

##Test suite
to running tests you can use `bundle exec rspec spec`
## Services
we have one service based on sidekiq and you can run many instance of it as a worker to scedule application tasks. I recommand run workers in a different host from web application. ensure redis and docker installed and database connection has been set and then run this command:
```
bundle exec sidekiq
```
##Deployment
to running web application you to need run:
```
rails s -e production -p _PORT_
```
then you can configure nginx or something else to proxy your port and ...