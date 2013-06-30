require 'debugger'
class Genre

  GENRES = []

  def initialize
    GENRES << self
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def songs
    @songs ||= []
  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

  def self.all
    GENRES
  end

  def self.reset_genres
    GENRES.clear
  end


end