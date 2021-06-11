# frozen_string_literal: true

require_relative "../hoffnung3000/main"

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
                get_hoffnung(Jekyll.configuration({}), "events")
              end
            end
            c.command(:places) do |f|
              f.description "Fetch all places and write to _data folder as places.json."
              f.action do |_args, _options|
                get_hoffnung(Jekyll.configuration({}), "places")
              end
            end
          end
        end
      end
    end
  end
end
