require_relative('../db/sql_runner')
require("pry-byebug")

class Stock

  attr_accessor(:id, :shop_id, :manufacturer_id, :type, :colour, :shop_stock_level, :price, :manufacturer_cost)

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @shop_id = options['shop_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @type = options['type']
    @colour = options['colour']
    @shop_stock_level = options['shop_stock_level'].to_i
    @price = options['price'].to_i
    @manufacturer_cost = options['manufacturer_cost'].to_i
  end

  def shop()
    sql = "SELECT * FROM shop WHERE id = $1"
    values = [@shop_id]
    results = SqlRunner.run(sql, values)
    return Shop.new(results.first)
  end

  def manufacturer()
    sql = "SELECT * FROM manufacturer WHERE id = $1"
    values = [@manufacturer_id]
    results = SqlRunner.run(sql, values)
    return Manufacturer.new(results.first)
  end

  def save()
    sql = "INSERT INTO stock(shop_id, manufacturer_id, type, colour, shop_stock_level, price, manufacturer_cost) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values = [@shop_id, @manufacturer_id, @type, @colour, @shop_stock_level, @price, @manufacturer_cost]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM stock WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM stock"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE stock SET(shop_id, manufacturer_id, type, colour, shop_stock_level, price, manufacturer_cost) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@shop_id, @manufacturer_id, @type, @colour, @shop_stock_level, @price, @manufacturer_cost, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM stock"
    results = SqlRunner.run(sql)
    return results.map {|hash| Stock.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM stock WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Stock.new(results.first)
  end

  def garment_name
    return "#{@colour.capitalize} #{@type}"
  end

  def high_low_stock_level
    if shop_stock_level < 10
      return "Low"
    elsif shop_stock_level > 50
      return "High"
    else return "Medium"
  end
end

end
