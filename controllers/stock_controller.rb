require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/shop.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/stock.rb')
also_reload('../models/*')

get '/stocks' do
  @stocks = Stock.all
  erb (:"stocks/index")
end

get '/stocks/new' do
  @stocks = Stock.all
  erb(:"stocks/new")
end
