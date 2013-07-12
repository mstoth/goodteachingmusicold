require 'spec_helper'

describe "pieces/index.html.erb" do
  before(:each) do
    assign(:pieces, [
      stub_model(Piece,
        :title => "Title",
        :composer => "Composer",
        :genre => "Genre"
      ),
      stub_model(Piece,
        :title => "Title",
        :composer => "Composer",
        :genre => "Genre"
      )
    ])
  end

  it "renders a list of pieces" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Composer".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
  end
end
