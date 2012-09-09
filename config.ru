require 'rubygems'
require 'rack'
require 'erb'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'storage'
require 'ryserver'
require 'template'
require 'binding'
require 'router'

require '/Users/baku/Documents/Ruby/t3/lib/game'
require '/Users/baku/Documents/Ruby/t3/lib/player'
require '/Users/baku/Documents/Ruby/t3/lib/board'
require '/Users/baku/Documents/Ruby/t3/lib/console'


builder = Rack::Builder.new do
  
  use Rack::Static, :urls => ["/assets"]
  
  use Rack::CommonLogger
  server = RyServer.new
  
  map '/' do
    run server.index
  end

  map '/game' do    
    map '/new' do
      run server.new_game
    end

    map '/archive' do
      run server.archive
    end
  end
  
end


run builder

