require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/shop.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/stock.rb')

get '/tracker' do
  @shops = Shop.all
  @manufacturers = Manufacturer.all
  @stocks = Stock.all
  erb (:"tracker/index")
end
