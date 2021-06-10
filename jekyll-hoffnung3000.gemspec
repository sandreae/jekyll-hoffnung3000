# frozen_string_literal: true

require_relative "lib/jekyll/hoffnung3000/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-hoffnung3000"
  spec.version       = Jekyll::Hoffnung3000::VERSION
  spec.authors       = ["sandreae"]
  spec.email         = ["git@contact.samandreae.com"]

  spec.summary       = "HOFFNUNG3000 archival tool"
  spec.homepage      = "https://hoffnung3000.de"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "http", "~> 4.4.1"
  spec.add_dependency "ruby-jq", "~> 0.2.1"
  spec.add_dependency "json", "~> 2.5.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
