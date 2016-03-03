# RedmineRest

This is gem with some ActiveResource models for Redmine.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redmine_rest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redmine_rest

## Usage

    RedmineRest::Models.configure_models user: 'user', password: 'password', site: 'URL'
    # or by using apikey:
    RedmineRest::Models.configure_models apikey: 'apikey', site: 'URL'
    issue = RedmineRest::Models::Issue.find(1234)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Nondv/redmine_rest.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
