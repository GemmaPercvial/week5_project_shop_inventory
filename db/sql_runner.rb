require('pg')
class SqlRunner
  def self.run( sql, values = [] )
    begin
      PG.connect( {dbname: 'd6714dcan9mjuo',
        host: 'ec2-174-129-247-1.compute-1.amazonaws.com',
        port: 5432, user: 'kvhzmfmfqtehos', password: '716fd763fed4d7d56efdfe367b49583b6f757be3677d3a72a7564d77537afb83'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
