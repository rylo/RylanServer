require 'erb'

class RyServer
  
  def route(env)
    request = Rack::Request.new(env)
    params = separate(request.env["PATH_INFO"]) 
    if params[1] == 'game' && params[2] == 'new'
      new_game
    elsif params[1] == 'game' && params[2] =~ /\d/
      make_move(params[2].to_i)
    else
      respond_with('Page not found.')
    end
  end
  
  def separate(url)
    url.split('/')
  end
  
  def call(env)
    route(env)
  end

  def index
    respond_with('index')
  end

  def new_game
    game = save_game(Game.new('x', HumanPlayer, 'o', HumanPlayer, 3, UI))
    body = format(game, 'game')
    respond_with(body)
  end
  
  def fetch_game
    Storage.fetch(:game)
  end
  
  def save_game(game)
    Storage.save(:game, game)
  end

  def make_move(destination)
    show_board
    game = fetch_game
    game.board.set_move(game.current_player.marker, destination)

    until game.current_player.human? || game.board.game_over?
      game.set_current_player
      game.current_player.get_move(game.board)
    end
    
    if game.board.game_over?
      game.instance_variable_set(:@flash, game.report_end_state)
    else
      game.set_current_player
    end

    save_game(game)
    respond_with(format(game, 'game'))
  end

  def archive
    respond_with('archive')
  end

  def show_board
    if fetch_game.nil?
      new_game
    else
      game = fetch_game
      body = format(game, 'game')
      respond_with(body)
    end
  end
  
  def format(content, template_name)
    bound = RyBinding.new(content).get_binding
    template = Template.get_template(template_name)
    result = ERB.new(File.read(template)).result bound   
    return result
  end
  
  def respond_with(body)
    [200, {"Content-Type" => "text/html"}, [body]]
  end
  
end