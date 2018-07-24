require_relative('../db/sql_runner')

class Shop

  attr_accessor(:id, :name, :address)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
  end

  def manufacturer()
    sql = "SELECT manufacturer.* FROM manufacturer INNER JOIN stock ON stock.manufacturer_id = manufacturer.id WHERE stock.shop_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map{|manufacturer| Manufacturer.new(manufacturer)}
  end

  def save()
    sql = "INSERT INTO shop(name, address) VALUES($1, $2) RETURNING id"
    values = [@name, @address]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM shop WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM shop"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE shop SET(name, address) = ($1, $2) WHERE id = $3"
    values = [@name, @address, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM shop"
    results = SqlRunner.run(sql)
    return results.map {|hash| Shop.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM shop WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Shop.new(results.first)
  end

  def shop_name
    return "#{@name.capitalize}"
  end

end
