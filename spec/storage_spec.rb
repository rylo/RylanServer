require 'spec_helper'

describe Storage do
  
  let(:storage){ Storage }
  let(:game){ Game.new('x', HumanPlayer, 'o', EasyComputer, 3, ConsoleUI) }

  it "#save should save a key and value pair" do
    key = :test
    value = 'testing!'
    storage.save(key, value).should == 'testing!'
  end
  
  it "#fetch should retrieve the value at the given key" do
    storage.fetch(:test).should == 'testing!'
  end
  
  it "#data should return the hash of data in storage" do
    storage.data.should == { :test => 'testing!' }
  end

end