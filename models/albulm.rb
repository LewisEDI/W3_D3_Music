require('pg')
require_relative('../db/sql_runner')
require_relative('artists')
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
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end
