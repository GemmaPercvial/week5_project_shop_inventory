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

get '/stocks/:id' do
  @stock = Stock.find(params['id'])
  erb(:"stocks/show")
end

post '/stocks' do
  @stocks = Stock.all
  @stock = Stock.new(params)
  @stock.save()
  redirect to "/stocks"
end

get '/stocks/:id/edit' do
  @shops = Shop.all
  @manufacturers = Manufacturer.all
  @stock = Stock.find(params['id'])
  erb(:"stocks/edit")
end

post '/stocks/:id' do
  @stock = Stock.new(params)
  @stock.update
  redirect to "/stocks/" + params['id']
end

post '/stocks/:id/delete' do
  @stocks = Stock.find(params['id'])
  @stocks.delete
  redirect to "/stocks"
end
