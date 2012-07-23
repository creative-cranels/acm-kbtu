require 'spec_helper'

describe "pages/show" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "Title",
      :path => "Path",
      :body => "Body",
      :parent => "Parent"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Path/)
    rendered.should match(/Body/)
    rendered.should match(/Parent/)
  end
end
