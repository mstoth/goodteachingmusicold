require 'test_helper'
 
class PieceTest < ActiveSupport::TestCase

  test "new piece has approval false" do
    p = Piece.new
    assert p.approved == false, 'piece approval should be false'
  end
  
  test "Guitar is supported" do
    p = Piece.new(:instrument => "Guitar")
    p.title = 'test'
    p.composer = 'test'
    p.save
    p = Piece.where(:instrument => "Guitar")
    assert (p.length > 0)
  end
  
  test "fixtures work" do
    p=pieces(:one)
    assert p.title == "one", 'piece title is not one'
  end
end
    
