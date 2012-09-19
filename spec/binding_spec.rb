require 'spec_helper'

describe RyBinding do

  let(:game){ Storage.save(:game, Game.new('x', HumanPlayer, 'o', EasyComputer, 3, ConsoleUI)) }
  let(:options){ {:test => 'testing'} }
  let(:binding){ RyBinding.new(game) }
  
  it "#new should create a new RyBinding full of instance variables related to the game" do
    binding.class.should == RyBinding
    binding.instance_variables.should == [:@player1, :@player2, :@board, :@current_player, :@ui]
  end
  
  it "#get_binding should return a binding" do
    bound = binding.get_binding
    bound.class.should == Binding
  end

end