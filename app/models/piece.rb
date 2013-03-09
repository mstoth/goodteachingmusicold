class Piece < ActiveRecord::Base
  validate :must_be_unique
  
  require 'youtube_it'
  require 'cgi'
  
  attr_accessible :composer, :genre, :title, :difficulty
  validates :composer, :title, :presence => true
  
  def link
    if @saved_link.nil? 
      client = YouTubeIt::Client.new(:dev_key => "AIzaSyCnWDwzfm_x45frJJU7p28mC8EqT8qeWmI")
      result = client.videos_by(:query => self.title + ' by ' + self.composer, :max_results => 1)
      videos = result.videos
      if videos.count > 0
        @saved_link = CGI.escapeHTML videos.first.player_url
        return @saved_link
      else
        return nil
      end
    else
      return @saved_link
    end
  end
  
  def must_be_unique
    if self.class.where(title: title, composer: composer).exists?
      errors.add(:base, 'Piece must be unique')
    end
  end
  
end
