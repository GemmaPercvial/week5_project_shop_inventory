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

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  erb(:"manufacturers/show")
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
