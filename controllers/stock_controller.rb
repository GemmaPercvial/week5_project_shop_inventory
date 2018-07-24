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
  @shops = Shop.all
  @manufacturers = Manufacturer.all
  @stocks = Stock.all
  erb(:"stocks/new")
end

post '/stocks/create' do
  @stocks = Stock.all
  @stock = Stock.new(params)
  @stock.save()
  erb(:"stocks/create")
end

get '/stocks/:id/edit' do
  @stock = Stock.find(params['id'])
  erb(:"stock/edit")
end
