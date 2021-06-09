# frozen_string_literal: true

require_relative "hoffnung3000/version"

module Jekyll
  module Hoffnung3000
    class Error < StandardError; end
    # Your code goes here...
  end
end

require "jekyll/commands/events.rb"