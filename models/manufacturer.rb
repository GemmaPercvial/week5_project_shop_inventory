require_relative('../db/sql_runner')

class Manufacturer

  attr_accessor(:id, :name, :address, :delivery_time, :shop_stock_level)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @delivery_time = options['delivery_time']
  end

  def shop()
    sql = "SELECT shop.* FROM shop INNER JOIN stock ON stock.shop_id = shop.id WHERE stock.manufacturer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|shop| Shop.new(shop)}
  end

  def save()
    sql = "INSERT INTO manufacturer(name, address, delivery_time) VALUES($1, $2, $3) RETURNING id"
    values = [@name, @address, @delivery_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM manufacturer WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM manufacturer"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE manufacturer SET(name, address, delivery_time) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @address, @delivery_time, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM manufacturer"
    results = SqlRunner.run(sql)
    return results.map {|hash| Manufacturer.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturer WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Manufacturer.new(results.first)
  end

  def manufacturer_name
    return "#{@name.capitalize}"
  end

end
