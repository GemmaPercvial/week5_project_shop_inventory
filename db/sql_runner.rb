gem 'pg'
require('pg')

PG.connect( {dbname: 'dcohf3u3fkg9pb',
host: 'ec2-174-129-247-1.compute-1.amazonaws.com',
port: 5432, user: 'lkviizleasmrdp', password: 'd48b9db0501e6c3a67bc5a10f3db4cc0fd061b0b7c5a955e10d9f061a3ec3d95'})

class SqlRunner
  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'shop_inventory', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
