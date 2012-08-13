#\ -p 4000

require 'sass'
require 'sass/plugin/rack'
require 'compass'
require 'serve'

# The project root directory
root = ::File.dirname(__FILE__)

Compass.add_project_configuration(root + '/config.compass')
Compass.configure_sass_plugin!

use Sass::Plugin::Rack  # Sass Middleware


# Other Rack Middleware
use Rack::ShowStatus      # Nice looking 404s and other messages
use Rack::ShowExceptions  # Nice looking errors

# Use Rack::Cascade and Rack::Directory on other platforms for static assets
run Rack::Cascade.new([
  Serve::RackAdapter.new(root + '/views'),
  Rack::Directory.new(root + '/public')
])
