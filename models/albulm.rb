require('pg')
require_relative('../db/sql_runner')
require_relative('artist')
class Albulm

  attr_reader :id
  attr_accessor :title, :genre, :artist_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albulm
    (
      title,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def artist()
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    hash = results[0]
    artist = Artist.new(hash)
    return artist
  end

  def update()
  sql =
  "UPDATE albulm SET
(
  title,
  genre
) = ($1, $2) WHERE id= $3" #NEED REFRESH
values = [@title, @genre, @id]
SqlRunner.run(sql, values)

end

def self.delete_all()
  sql = "DELETE FROM albulm"
  SqlRunner.run(sql)
end


  def self.all()
    sql = "SELECT * FROM albulm"
    albulms = SqlRunner.run(sql)
    return albulms.map { |albulm| Albulm.new(albulm)  }
  end

end
