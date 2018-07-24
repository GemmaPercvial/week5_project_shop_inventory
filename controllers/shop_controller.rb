require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/shop.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/stock.rb')
also_reload('../models/*')

get '/shops' do
  @shops = Shop.all
  erb (:"shops/index")
end

get '/shops/:id' do
  @shop = Shop.find(params['id'])
  erb(:"shops/show")
end
