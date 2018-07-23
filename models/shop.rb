require_relative('../db/sql_runner')

class Shop

  attr_accessor(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def manufacturer()
    sql = "SELECT manufacturer.* FROM manufacturer INNER JOIN stock ON stock.manufacturer_id = manufacturer.id WHERE stock.shop_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|manufacturer| Manufacturer.new(manufacturer)}
  end

  def save()
    sql = "INSERT INTO shop(name) VALUES($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM shop WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM shop"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE shop SET(name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM shop"
    results = SqlRunner.run(sql)
    return results.map {|hash| Shop.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM shop WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Shop.new(results.first)
  end

end
