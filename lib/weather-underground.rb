$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "weather-underground/utils"
require "weather-underground/base"
require "weather-underground/alerts"
require "weather-underground/current_observation"
require "weather-underground/forecast"
require "weather-underground/geo_lookup"
require "weather-underground/uploader"

module WeatherUnderground
  VERSION = '1.1.1'
end
