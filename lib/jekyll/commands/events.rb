require 'http'
require 'jq'
require 'json'

module Jekyll
    module Commands
      class Events < Command
        class << self
          def init_with_program(prog)
            prog.command(:events) do |c|
              c.action do |args, options|
                
                response = HTTP.get(args[0]).body
          
                jq = JQ(response, parse_json: true)
                
                data = jq.search('.data[] | {title: .title, description: .description, date: .date, time: {from: .slots[0].from, to: .slots[-1].to}, organiser: {name: .animal.userName, about: .organiser_biog}, venue: {id: null, name: .place.title, description: .place.description, area: .place.city }, imageUrl:.images[0].mediumImageUrl, tags:.tags, websiteUrl: .websiteUrl}')
      
                Dir.mkdir("_data") unless Dir.exists?("_data")
                File.write("_data/events.json", JSON.generate(data))
              end
            end
          end
        end
      end
    end
  end
