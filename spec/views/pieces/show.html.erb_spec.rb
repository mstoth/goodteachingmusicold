require 'spec_helper'

describe "pieces/show.html.erb" do
  before(:each) do
    @piece = assign(:piece, stub_model(Piece,
      :title => "Title",
      :composer => "Composer",
      :genre => "Genre"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Composer/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Genre/)
  end
end
