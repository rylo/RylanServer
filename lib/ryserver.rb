require 'erb'

class RyServer
  
  def index
    respond_with('index')
  end
  
  def new_game
    game = Storage.save(:game, Game.new('x', HumanPlayer, 'o', EasyComputer, 3, ConsoleUI))
    body = format(game, 'game')
    respond_with(body)
  end
  
  def archive
    respond_with('archive')
  end
  
  def game_page(game)
    grid = game.board.grid.to_s
    respond_with(grid)
  end
  
  def format(content, template_name)
    bound = RyBinding.new(content).get_binding
    template = Template.get_template(template_name)
    result = ERB.new(File.read(template)).result bound    
    return result
  end
  
  def respond_with(body)
     Proc.new { |env| [200, {"Content-Type" => "text/html"}, [body]] }
  end
  
end