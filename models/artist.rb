require('pg')
require_relative('../db/sql_runner')
require_relative('albulm')
class Artist

  attr_reader :id
  attr_accessor :name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artist
    (
      name
      ) VALUES
      (
        $1
      )
      RETURNING id"
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i

    end

    def albulms()

      sql = "SELECT * FROM albulm WHERE artist_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      albulms = results.map { |hash| Albulm.new(hash) }
      return albulms
    end

    def update()
      sql =
      "UPDATE artist SET

      name
      = $1 WHERE id = $2" #NEED REFRESH
      values = [@name, @id]
      SqlRunner.run(sql, values)

    end

    def self.delete_all()
      sql = "DELETE FROM artist"
      SqlRunner.run(sql)
    end


    def self.all()
      sql = "SELECT * FROM artist"
      artists = SqlRunner.run(sql)
      return artists.map { |artist| Artist.new(artist)  }
    end

  end
