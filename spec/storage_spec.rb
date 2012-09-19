require 'spec_helper'

describe Storage do
  
  let(:storage){ Storage }
  let(:game){ Game.new('x', HumanPlayer, 'o', EasyComputer, 3, ConsoleUI) }
  let(:key){ :test }
  let(:value){ 'testing!' }

  it "#save should save a key and value pair" do
    storage.save(key, value).should == 'testing!'
  end
  
  it "#fetch should retrieve the value at the given key" do
    storage.fetch(:test).should == 'testing!'
    Storage.save(:game, game)
    storage.fetch(:game).should == game
  end
  
  it "#data should return the hash of data in storage" do
    storage.clear
    storage.save(key, value).should == 'testing!'
    storage.data.should == { :test => 'testing!' }
  end
  
  it "#clear should clear all data from a storage singleton class" do
    storage.clear
    storage.data.should == {}
  end

end