require 'spec_helper'

describe "pieces/edit.html.erb" do
  before(:each) do
    @piece = assign(:piece, stub_model(Piece,
      :new_record? => false,
      :title => "MyString",
      :composer => "MyString",
      :genre => "MyString"
    ))
  end

  it "renders the edit piece form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => piece_path(@piece), :method => "post" do
      assert_select "input#piece_title", :name => "piece[title]"
      assert_select "input#piece_composer", :name => "piece[composer]"
      assert_select "input#piece_genre", :name => "piece[genre]"
    end
  end
end
