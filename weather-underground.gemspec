$:.unshift File.expand_path("../lib", __FILE__)
require "weather-underground"

Gem::Specification.new do |gem|
  gem.name    = "weather-underground"
  gem.version = WeatherUnderground::VERSION

  gem.authors     = [ "Sean Dague", "Jeff McFadden" ]
  gem.email       = [ "", "jeff.mcfadden@gmailcom" ]
  gem.homepage    = "http://github.com/sdague/weather-underground.rb/"
  gem.summary     = "Client library to the weatherunderground.com API."
  gem.description = "Client library to the weatherunderground.com API."

  gem.files = Dir["**/*"].select { |d| d =~ %r{^(README|bin/|data/|ext/|lib/|spec/|test/)} }

  gem.add_dependency "rest-client"
  gem.add_dependency "json"
  gem.add_dependency "happymapper"
end

