require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/shop.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/stock.rb')
also_reload('../models/*')

get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb (:"manufacturers/index")
end

get '/manufacturers/new' do
  @manufacturers = Manufacturer.all
  @stocks = Stock.all
  erb(:"manufacturers/new")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  erb(:"manufacturers/show")
end

post '/manufacturers' do
  @manufacturers = Manufacturer.all
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  redirect to "/manufacturers"
end

get '/manufacturers/:id/edit' do
  @manufacturer = Manufacturer.find(params['id'])
  erb(:"manufacturers/edit")
end

post '/manufacturers/:id' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.update
  redirect to "/manufacturers/" + params['id']
end

post '/manufacturers/:id/delete' do
  @manufacturers = Manufacturer.find(params['id'])
  @manufacturers.delete()
  redirect to "/manufacturers"
end
