# Capistrano::DelayedJob

DelayedJob specific tasks for Capistrano v3:

- `cap production delayed_job:start`
- `cap production delayed_job:stop`
- `cap production delayed_job:restart`

## Installation

Add this line to your application's Gemfile:

    gem 'delayed_job', '~> 4.0.0'
    gem 'capistrano-delayed_job', github: 'takuyan/capistrano-delayed_job'

And then execute:

    $ bundle

## Usage

    # Capfile

    require 'capistrano/delayed_job'

    # config/deploy.rb

    after :restart, 'delayed_job:restart'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
