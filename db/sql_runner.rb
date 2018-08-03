require('pg')
class SqlRunner
  def self.run( sql, values = [] )
    begin
      db =
      # PG.connect({ dbname: 'shop_inventory', host: 'localhost' })
      PG.connect( {dbname: 'dpdh4gat2qral',
        host: 'ec2-54-235-193-34.compute-1.amazonaws.com',
        port: 5432, user: 'nhmhwceqaujxrq', password: '02a01889f26a520b1194b193a395430c4a725f54ff287e489b57b328160f9a99'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
