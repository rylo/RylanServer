require 'spec_helper'

describe Template do
  
  let(:template){ Template }
  
  it 'should return a view file' do
    template_name = 'game'
    template.get_template(template_name).gsub('/', ' ').split.last.should == template_name += '.html.erb'
  end
  
end