class WelcomeController < ApplicationController

  def index
    @pieces = Piece.find(:all, :order=>:title)
    @difficulty = 'All'
    @genre = 'All'
    @sort_by = 'Title'
  end

  def filter
    @genre = params[:piece][:genre]
    @sort_by = params[:sort_by]
    @difficulty = params[:piece][:difficulty]

    if @genre == 'All'
      if @difficulty == 'All'
        @pieces = Piece.find(:all, :order => 'title')
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

    case @sort_by
    when 'Title'
      @pieces.sort!{|a,b| a.title <=> b.title}
    when 'Composer'
      @pieces.sort!{|a,b| a.composer <=> b.composer}
    when 'Genre'
      @pieces.sort!{|a,b| a.genre <=> b.genre}
    when 'Difficulty'
      @pieces.sort!{|a,b| a.difficulty <=> b.difficulty}
    else
      puts 'error'
    end

    render :index
  end

end
