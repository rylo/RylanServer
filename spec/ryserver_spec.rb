require 'spec_helper'

describe RyServer do
  
  let(:ryserver){ RyServer.new }
  let(:game){ Game.new('x', HumanPlayer, 'o', EasyComputer, 3, ConsoleUI) } 

  it "#get_binding should do something" do
    pending 'stuff'
  end

  it "#new_game should return index" do
    proc = ryserver.new_game
    proc.call.last.should == ['index']
  end

  it "#archive should return archive" do
    proc = ryserver.archive
    proc.call.last.should == ['archive']
  end

  it "#index should return index" do
    proc = ryserver.index
    proc.call.last.should == ['index']
  end

  it "#game_page should return the game's grid" do
    proc = ryserver.game_page(game)
    proc.call.last.should == ["[\"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\"]"]
  end

end
