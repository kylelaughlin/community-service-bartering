#Neighborly

Neighborly is a web application that allows people to connect to find help right in their
own back yard.  Users can create 'requests' that outline a project or task that they need
assistance with.  Other users can view this request and make an 'offer' to help.  There is
no transfer of currency for services, just the transfer of time credits.

A time credit is earned for ever hour a user spends helping another with their request.
Once a person helps with a request, the agreed upon time credit is transferred from the
requesting user to the offering user. This helps create a stronger community allowing
people put their skills to use to get help in return.  

Neighborly is built on the Ruby (2.3.0) language, Ruby on Rails framework, postgresql database, and the Activerecord ORM.

##Getting Started

Below are the steps to get Neighborly running locally.

First, clone this repository to your local machine. Here is console input to
clone utilizing SSH.

```
git clone git@github.com:kylelaughlin/community-service-bartering.git
```

Next, install gems by running:

```
bundle installed
```

Setting up the postgresql database takes two steps:

1. Create the database:

```
rake db:create
```

2. Run migrations

```
rake db:migrate
```

Now the application is ready to be run locally.  To start the rails server, use
the ``` rails server``` or the short form ```rails s``` commands.  The application
can then be utilized in the browser at localhost:3000.

##Testing

This application utilizes Minitest as it's test suite. Running tests from the console
is acheived by simply running the ```rake``` command.

##Utilized Gems

Gems added to the default rails gems include the following

[sorcery] (https://github.com/NoamB/sorcery) - handles user authentication
[figaro] (https://github.com/laserlemon/figaro) - keeps configuration access keys, passwords and other valuable information from being posted to git
[paperclip] (https://github.com/thoughtbot/paperclip) - file uploading
[aws-sdk] (https://github.com/aws/aws-sdk-rails) - integrate AWS Services
[bootstrap-sass] (https://github.com/twbs/bootstrap-sass) - sass-powered version of bootsrtap 3
[rails_12factor] (https://github.com/heroku/rails_12factor) - configuration for heroku
