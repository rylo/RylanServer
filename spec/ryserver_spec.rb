require 'spec_helper'

describe RyServer do

  before(:all) do
    Storage.save(:game, Game.new('x', HumanPlayer, 'o', EasyComputer, 3, UI))
  end

  let(:game){ Storage.fetch(:game) }
  let(:ryserver){ RyServer.new }

  it "#new_game should return index" do
    body = ryserver.format(game, 'game')
    ryserver.new_game.should == ryserver.respond_with(body)
  end

  it "#archive should return archive" do
    ryserver.archive.should == ryserver.respond_with('archive')
  end

  it "#index should return index" do
    ryserver.index.should == ryserver.respond_with('index')
  end
  
  it "#make_move should make a move on the stored game's grid" do
    move = 0
    game.current_player.should == game.player(1)
    ryserver.make_move(move)
    ryserver.fetch_game.board.grid[move].should == game.player(1).marker
  end

  it "#show_board should show the saved game's board" do
    ryserver.show_board
    ryserver.fetch_game.should == game
  end
  
  it "#show_board should save a new game if the game is nil" do
    ryserver.save_game(nil)
    ryserver.fetch_game.should == nil
    ryserver.show_board
    ryserver.fetch_game.should_not == nil
  end
  
  it "#separated should return the request's PATH_INFO as an array with values separated by slashes" do
    ryserver.separate('/test/1').should == ['', 'test', '1']
  end
  
  it "#fetch_game should return the currently saved game" do
    game = ryserver.save_game( Game.new('x', HumanPlayer, 'o', HumanPlayer, 3, ConsoleUI) )
    ryserver.fetch_game.should == game
  end
  
  it "#format should take in a game object and return it as a string" do
    formatted_game = ryserver.format(game, 'game')
    formatted_game.class.should == String
    formatted_game.should include("<div class='grid-space'>")
  end
  
  it "#game_check" do
    pending 'something'
    ryserver.computer_loop
  end
  
end
