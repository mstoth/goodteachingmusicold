class Piece < ActiveRecord::Base
  require 'youtube_it'
  require 'cgi'
  
  attr_accessible :composer, :genre, :title, :difficulty
  validates :composer, :title, :presence => true
  
  def link
    client = YouTubeIt::Client.new(:dev_key => "AIzaSyCnWDwzfm_x45frJJU7p28mC8EqT8qeWmI")
    result = client.videos_by(:query => self.title + ' by ' + self.composer, :max_results => 1)
    videos = result.videos
    if videos.count > 0
      return CGI.escapeHTML videos.first.player_url
    else
      return nil
    end
  end
  
end
