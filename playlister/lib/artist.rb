class Artist

  ARTISTS = []

  def initialize
    ARTISTS << self
  end

  def name
    @name
  end

  def genres
    @genres ||= []
  end

  def name=(name)
    @name = name
  end

  def songs
    @songs ||= []
  end

  def songs=(songs)
    @songs = songs
  end

  def songs_count
    songs.length
  end

  def add_song(song)
    songs << song
    genres << song.genre
    song.artist = self
  end

  def self.reset_artists
    ARTISTS.clear
  end

  def self.all
    ARTISTS
  end

  def self.count
    ARTISTS.length
  end

end