require 'fis/test'
require_relative '../lib/artist'
require_relative '../lib/song'
require_relative '../lib/genre'

extend Fis::Test

test 'Can initialize an Artist' do
  assert Artist.new
end

test 'An artist can have a name' do
  artist = Artist.new
  artist.name = "Adele"
  assert_equal artist.name, "Adele"
end

test "An artist has songs" do
  artist = Artist.new
  artist.songs = []
  assert_equal artist.songs, []
end

test 'The Artist class can reset the artists that have been created' do
  assert Artist.reset_artists
  assert_equal Artist.count, 0
end

test 'The Artist class can keep track of artists as they are created' do
  Artist.reset_artists
  artist = Artist.new
  assert Artist.all.include?(artist)
end

test 'The Artist class can count how many artists have been created' do
  assert Artist.count
end

test 'artists have songs' do
  artist = Artist.new
  songs = (1..4).collect{|i| Song.new}
  artist.songs = songs

  assert_equal artist.songs, songs
end

test 'An artist can count how many songs they have' do
  artist = Artist.new
  songs = [Song.new, Song.new]
  artist.songs = songs

  assert_equal artist.songs_count, 2
end

test 'a song can be added to an artist' do
  artist = Artist.new
  song = Song.new
  artist.add_song(song)

  assert artist.songs.include?(song)
end

test 'artists have genres' do
  artist = Artist.new
  song = Song.new

  song.genre = Genre.new.tap{|g| g.name = "rap"}
  artist.add_song(song)

  assert artist.genres.include?(song.genre)
end

# Genre Specs
test 'Can initialize a genre' do
  assert Genre.new
end

test 'A genre has a name' do
  genre = Genre.new
  genre.name = 'rap'

  assert_equal genre.name, 'rap'
end

test 'A genre has many songs' do
  genre = Genre.new.tap{|g| g.name = 'rap'}
  [1,2].each do
    song = Song.new
    song.genre = genre
  end

  assert_equal genre.songs.count, 2
end

test 'A genre has many artists' do
  genre = Genre.new.tap{|g| g.name = 'rap'}

  [1,2].each do
    artist = Artist.new
    song = Song.new
    song.genre = genre
    artist.add_song(song)
  end

  assert_equal genre.artists.count, 2
end

test 'A genres Artists are unique' do
  genre = Genre.new.tap{|g| g.name = 'rap'}
  artist = Artist.new

  [1,2].each do
    song = Song.new
    song.genre = genre
    artist.add_song(song)
  end

  assert_equal genre.artists.count, 1
end

# Same behavior as Artists
test 'The Genre class can keep track of all created genres' do
  Genre.reset_genres # You must implement a method like this
  genres = [1..5].collect do |i|
    Genre.new
  end

  assert_equal Genre.all, genres
end