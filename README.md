# Jekyll::Hoffnung3000

A Jekyll plugin for archiving HOFFNUNG3000 festivals.

## Prerequisites

This gem uses `ruby-jq` gem to bind to [jq](http://stedolan.github.io/jq/) which requires the Oniguruma library to provide regex support.

If any system dependencies are missing please see the [jq FAQ](https://github.com/stedolan/jq/wiki/FAQ#installation) for help.
## Installation

Add this line to your application's Gemfile:

```ruby
group :jekyll_plugins do
    gem 'jekyll-hoffnung3000', '0.1.0'
end
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll-hoffnung3000

## Usage

Add these lines to your _config.yml replacing the url with the address of your running HOFFNUNG3000 instance.

```ruby
hoffnung3000:
    url: "https://your-hoffnung3000-instance.org"
```

With this config set you can use the command line to fetch event data which will be written to `_data/events.json`.

```sh
$ bundle exec jekyll hoffnung3000 events
```

Events are formatted in the following way as array of JSON objects:

```json
[
    {
        "title": "Anti-Capitalist Knitting",
        "description": "Anti-Capitalist Knitting is an experimental knitting workshop with an emphasis on sustainability, focusing on exploring materials and using simple techniques to create artwork........",
        "date": "2020-06-06",
        "time": {
            "from": "2020-06-06T10:00:00.000Z",
            "to": "2020-06-06T12:00:00.000Z"
        },
        "organiser": {
            "name": "Name of Organiser",
        },
        "venue": {
            "id": 1,
            "name": "museum of neoliberalism [online location]",
            "description": "A small, free museum about how an obscure and extreme ideological cult of the 1970s rose to power and now shapes our lives in dramatic and often terrible ways......",
            "area": "London"
        },
        "imageUrl": "https://image-url/medium.jpg",
        "tags": [
            "Workshop",
            "Art",
            "Anticapitalism",
            "Mental-health",
            "Gender",
            "Feminism"
        ],
        "websiteUrl": "https://event-website.org"
    }
]
```

Places are formatted in the following way as array of JSON objects:

```json
[
    {
        "id": 1,
        "title": "Place name",
        "description": "Description of this place",
        "street": "1 Street",
        "cityCode": "XXX123",
        "city": "City",
        "country": "Country",
        "imageUrl": "https://image-url/medium.jpg"
    }
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jekyll-hoffnung3000. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/jekyll-hoffnung3000/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Hoffnung3000 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-hoffnung3000/blob/master/CODE_OF_CONDUCT.md).
