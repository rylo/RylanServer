require 'rubygems'
require 'rack'
require 'erb'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'storage'
require 'ryserver'
require 'template'
require 'binding'
require 'router'

require '/Users/rylan/Documents/Exercises/Ruby/t3-ruby-v2/lib/game'
require '/Users/rylan/Documents/Exercises/Ruby/t3-ruby-v2/lib/player'
require '/Users/rylan/Documents/Exercises/Ruby/t3-ruby-v2/lib/board'
require '/Users/rylan/Documents/Exercises/Ruby/t3-ruby-v2/lib/console'


builder = Rack::Builder.new do  
  use Rack::Static, :urls => ["/assets"]
  map '/' do
    run RyServer.new
  end
end

run builder