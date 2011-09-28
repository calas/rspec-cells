require 'spec_helper'
require 'cells'

class DummyCell < Cell::Base
  def show
    "I'm Dummy."
  end
end


module RSpec::Rails
      
  describe CellExampleGroup do
    let(:group) do
      RSpec::Core::ExampleGroup.describe do
        include CellExampleGroup
      end
    end
    
    it "adds :type => :cell to the metadata" do
      group.metadata[:type].should eq(:cell)
    end
    
    it "responds to #render_cell" do
      group.new.render_cell(:dummy, :show).should == "I'm Dummy."
    end
  end
end
