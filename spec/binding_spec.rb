require 'spec_helper'

describe RyBinding do
  let(:options){ {:test => 'testing'} }
  let(:binding){ RyBinding.new(options) }
  
  it "#new" do
    binded = RyBinding.new(options).get_binding
    binded.eval("test").should == 'testing'
  end
  
  it "#get_binding should return binding" do
    binded = binding.get_binding
    binded.eval("test").should == 'testing'
  end
end