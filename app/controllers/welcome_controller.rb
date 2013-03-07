class WelcomeController < ApplicationController

def index
  @pieces = Piece.find(:all)
  @difficulty = 'All'
  @genre = 'All'
end

def filter
  @genre = params[:piece][:genre]
  @difficulty = params[:piece][:difficulty]
  if @genre == 'All'
    if @difficulty == 'All'
      @pieces = Piece.find(:all)
    else
      @pieces = Piece.where(:difficulty => @difficulty)
    end    
  else
    if @difficulty == 'All'
      @pieces = Piece.where(:genre=>@genre)
    else
      @pieces = Piece.where(:genre=>@genre, :difficulty => @difficulty)
    end
  end
  render :index
end

end
