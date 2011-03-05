require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/weather-underground'

ENV['VERSION'] = WeatherUnderground::VERSION

Hoe.plugin :newgem
Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'weather-underground' do
  self.developer 'Sean Dague', 'sean@dague.net'
  self.developer 'Jeff McFadden', 'jeff.mcfadden@gmail.com'
  self.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  self.rubyforge_name       = 'sdaguegems' # self.name # TODO this is default value
  self.extra_rdoc_files = ["README.rdoc"]
  self.readme_file = "README.rdoc"
  self.extra_deps = [['temperature', '>= 1.0.0'], ['rest-client', '>=0'], ['happymapper','>=0'] ]
  # self.extra_deps         = [['activesupport','>= 2.0.2']]

end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]
