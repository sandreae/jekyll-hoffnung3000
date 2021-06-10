require "http"
require "jq"
require "json"

FORMAT_STRING =
  ".data[] |
    {
      title: .title,
      description: .description,
      date: .date, time:
        {
          from: .slots[0].from,
          to: .slots[-1].to
        },
      organiser:
        {
          name: .animal.userName,
          about: .organiser_biog
        },
      venue:
        {
          id: null,
          name: .place.title,
          description: .place.description,
          area: .place.city
        },
      imageUrl:.images[0].mediumImageUrl,
      tags:.tags,
      websiteUrl: .websiteUrl
    }
  ".freeze

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

module Jekyll
  module Commands
    # Commands for archiving a HOFFNUNG3000 festival in a Jekyll website
    class Hoffnung3000 < Command
      class << self
        def init_with_program(prog)
          prog.command(:hoffnung3000) do |c|
            c.description "Archival tool for HOFFNUNG3000 festivals."
            c.syntax "hoffnung3000 <subcommand>"
            c.command(:events) do |f|
              f.description "Fetch all events and write to _data folder as events.json."
              f.action do |_args, _options|
                config = check_config(Jekyll.configuration({}))
                response = HTTP.get(format("%s/api/events", config["hoffnung3000"]["url"]))
                jq = JQ(response.body, parse_json: true)
                write_data(jq.search(FORMAT_STRING), "events")
              end
            end
          end
        end
      end
    end
  end
end
