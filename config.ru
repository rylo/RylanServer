require 'rubygems'
require 'rack'
require '/Users/baku/Desktop/t3/lib/t3'

class RyServer
  
  def index
    respond_with('index')
  end
  
  def new_game
    g = T3::Game.new('x', T3::HumanPlayer, 'o', T3::EasyComputer, 3, T3::ConsoleUI)
    respond_with(g.inspect)
  end
  
  def archive
    respond_with('archive')
  end
  
  def respond_with(body)
     Proc.new { |env| [200, {"Content-Type" => "text/html"}, [body]] }
  end
  
end

builder = Rack::Builder.new do
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