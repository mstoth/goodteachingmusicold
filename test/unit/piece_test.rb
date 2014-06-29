require 'test_helper'
 
class PieceTest < ActiveSupport::TestCase
  
  test "Guitar is supported" do
    p = Piece.where(:instrument => "Guitar")
    puts "P IS "
    puts p
    assert (p.length > 0)
  end
  
  test "the truth" do
   assert true
  end
end
    