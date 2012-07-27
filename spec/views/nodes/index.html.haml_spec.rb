require 'spec_helper'

describe "nodes/index" do
  before(:each) do
    assign(:nodes, [
      stub_model(Node,
        :name => "Name",
        :path => "Path",
        :order => "Order"
      ),
      stub_model(Node,
        :name => "Name",
        :path => "Path",
        :order => "Order"
      )
    ])
  end

  it "renders a list of nodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => "Order".to_s, :count => 2
  end
end
