# RedmineRest
[![Gem Version](https://badge.fury.io/rb/redmine_rest.svg)](https://badge.fury.io/rb/redmine_rest)

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

```ruby
RedmineRest::Models.configure_models user: 'user', password: 'password', site: 'URL'
# or by using apikey:
RedmineRest::Models.configure_models apikey: 'apikey', site: 'URL'

include RedmineRest::Models
issues_by_project = Issue.all.group_by_project
issues_by_project.each do |project, issues|
  puts project.name
  issues.each { |i| puts i.subject }
  puts
end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Nondv/redmine_rest.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
