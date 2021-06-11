# frozen_string_literal: true

require "http"
require "jq"
require "json"

RESULT_LIMIT = 200

FORMAT_STRING_EVENTS =
  ".data[] |
    {
        title: .title,
        description: .description,
        date: .slots[0].from | split(\"T\")[0],
        time:
        {
            from: .slots[0].from,
            to: .slots[-1].to
        },
        organiser:
        {
            name: .animal.userName,
        },
        place:
        {
            id: .place.id,
            name: .place.title,
            description: .place.description,
            area: .place.city
        },
        imageUrl:.images[0].mediumImageUrl,
        tags:.tags,
        websiteUrl: .websiteUrl
    }
  "

FORMAT_STRING_PLACES =
  ".data[] |
    {
        id: .id,
        title: .title,
        description: .description,
        street: .street,
        cityCode: .cityCode,
        city: .city,
        country: .country,
        imageUrl:.images[0].mediumImageUrl
    }
  "

SEARCH_STRINGS = {
  "events" => FORMAT_STRING_EVENTS,
  "places" => FORMAT_STRING_PLACES
}.freeze

def format_data(data, key)
  jq = JQ(data, parse_json: true)
  jq.search(SEARCH_STRINGS[key])
end

def write_data(data, file_name)
  Dir.mkdir("_data") unless Dir.exist?("_data")
  File.write(format("_data/%s.json", file_name), JSON.generate(data))
end

def check_config(config)
  raise "HOFFNUNG3000 Error: Jekyl _config.yml file must contain a hoffnung3000 block" unless config["hoffnung3000"]
  unless config["hoffnung3000"]["url"]
    raise "HOFFNUNG3000 Error: Jekyl _config.yml file must contain a hoffnung3000 > url value"
  end

  config
end

def url(config)
  check_config(config)["hoffnung3000"]["url"]
end

def fetch_data(url, key)
  HTTP.get(format("%<url>s/api/%<key>s", { url: url, key: key }), { params: { limit: RESULT_LIMIT } }).body
end

def get_hoffnung(config, key)
  url = url(config)
  data = fetch_data(url, key)
  formatted_data = format_data(data, key)
  write_data(formatted_data, key)
end
