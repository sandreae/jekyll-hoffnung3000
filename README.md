# Jekyll::Hoffnung3000

A Jekyll plugin for archiving HOFFNUNG3000 festivals.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-hoffnung3000'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll-hoffnung3000

## Usage

Add these lines to your _config.yml replacing the url with the address of your running HOFFNUNG3000 instance.

```
hoffnung3000:
    url: https://your-hoffnung3000-instance.org
```

With this config set you can use the command line to fetch event data which will be written to `_data/events.json`.

`bundle exec jekyll hoffnung3000 events`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jekyll-hoffnung3000. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/jekyll-hoffnung3000/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Hoffnung3000 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-hoffnung3000/blob/master/CODE_OF_CONDUCT.md).
