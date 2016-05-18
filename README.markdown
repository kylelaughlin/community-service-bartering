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
the ``` rails server``` or the short form ```rails s``` command.



== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
