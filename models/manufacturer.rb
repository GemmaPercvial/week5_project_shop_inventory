require_relative('../db/sql_runner')

class Manufacturer

  attr_reader(:id, :name, :address, :delivery_time, :shop_stock_level)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @delivery_time = options['delivery_time']
  end

  def save()
    sql = "INSERT INTO manufacturer(name, address, delivery_time) VALUES($1, $2, $3) RETURNING id"
    values = [@name, @address, @delivery_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM manufacturer"
    SqlRunner.run( sql )
  end

  def shop()
    sql = "SELECT shop.* FROM shop INNER JOIN stock ON stock.shop_id = shop.id WHERE stock.manufacturer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|shop| Shop.new(shop)}
  end

end
