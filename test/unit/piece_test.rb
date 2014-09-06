require 'test_helper'
 
class PieceTest < ActiveSupport::TestCase

  test "new piece has approval false" do
    puts 'test 1'
    p = Piece.new
    assert p.approved == false, 'piece approval should be false'
  end
  
  test "Guitar is supported" do
    p = Piece.where(:instrument => "Guitar")
    assert (p.length > 0)
  end
  
  test "fixtures work" do
    p=pieces(:one)
    assert (p.title == "piece one")
  end
end
    
