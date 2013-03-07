require 'spec_helper'

describe "pieces/new.html.erb" do
  before(:each) do
    assign(:piece, stub_model(Piece,
      :title => "MyString",
      :composer => "MyString",
      :genre => "MyString"
    ).as_new_record)
  end

  it "renders new piece form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pieces_path, :method => "post" do
      assert_select "input#piece_title", :name => "piece[title]"
      assert_select "input#piece_composer", :name => "piece[composer]"
      assert_select "input#piece_genre", :name => "piece[genre]"
    end
  end
end
