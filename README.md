# Dandelion

[Dandelion](http://dandelion.herokuapp.com/) is a collaborative story-telling web application.

# Development
## Dependencies

- git
- bundler
- ruby 2.1.1 (it's recommended to use [RVM](https://rvm.io/))
- libpq-dev
- a Javascript runtime.  See [ExecJS](https://github.com/sstephenson/execjs) for more.  NodeJS works well

## Setup

    bundle install
    rake db:migrate RAILS_ENV=development
    rake db:seed

## Running

    bin/rails server


