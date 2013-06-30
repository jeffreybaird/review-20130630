class Song

  def genre
    @genre
  end

  def genre=(genre_object)
    raise "Invaild parameter" unless genre_object.class == Genre
    @genre = genre_object
    genre_object.songs << self
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
  end

end