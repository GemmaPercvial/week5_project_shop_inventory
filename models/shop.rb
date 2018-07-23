require_relative('../db/sql_runner')

class Shop

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO shop(name) VALUES($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM shop"
    SqlRunner.run( sql )
  end

  def manufacturer()
    sql = "SELECT manufacturer.* FROM manufacturer INNER JOIN stock ON stock.manufacturer_id = manufacturer.id WHERE stock.shop_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|manufacturer| Manufacturer.new(manufacturer)}
  end

end
