require 'spec_helper'

describe Piece do

  it "should be unapproved when created" do
    p = Piece.new()
    p.approved.should be false
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:piece)).to be_valid
  end
  
  it "is valid with a title and a composer" do
    piece = Piece.new(title: 'Prelude', composer: 'Bach')
    expect(piece).to be_valid
  end

  it "is invalid without a title" do
    expect(Piece.new(:title=>nil)).to have(1).errors_on(:title)
  end

  it "is invalid without a composer" do
    expect(Piece.new(:composer=>nil)).to have(1).errors_on(:composer)
  end

  it "is invalid if both composer and title are already paired" do
    Piece.create(title: "Prelude", composer: "Bach")
    piece = Piece.new(title: "Prelude", composer: "Bach")
    expect(piece).to have(1).errors_on(:title)
  end

  # fixtures are creating three pieces but I don't know why since I removed the YAML file!!!
  # so using a Z to keep it from selecting "piece one", "piece two", and "piece three" 
  it "returns a sorted array of pieces that match" do
    prelude = Piece.create(title: 'ZPrelude', composer: 'Bach')
    waltz = Piece.create(title: 'Waltz', composer: 'Chopin')
    postlude = Piece.create(title: 'ZPostlude', composer: 'Toth')
    expect(Piece.by_letter("Z")).to eq [postlude, prelude]
  end

end
