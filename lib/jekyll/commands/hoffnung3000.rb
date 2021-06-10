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

module Jekyll
  module Commands
    class Hoffnung3000 < Command
      class << self
        def init_with_program(prog)
          config = Jekyll.configuration({})["hoffnung3000"]
          prog.command(:hoffnung3000) do |c|
            c.description "Archival tool for HOFNUNG3000 festivals."
            c.syntax "hoffnung3000 <subcommand> [options]"
            c.command(:events) do |f|
              f.action do |_args, _options|
                response = HTTP.get(format("%s/api/events", config["url"])).body
                jq = JQ(response, parse_json: true)
                write_data(jq.search(FORMAT_STRING), "events")
              end
            end
          end
        end
      end
    end
  end
end
