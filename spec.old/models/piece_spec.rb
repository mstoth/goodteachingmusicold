require 'spec_helper'

describe Piece do
  it "has a valid title" do
    FactoryGirl.create(:piece).should be_valid
  end
  it "is invalid without a title" 
  it "is invalid without a composer"
  it "must be unique at least by title or composer or both"
end
