require_relative('../models/shop.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/stock.rb')

get '/shops' do
  @shops = Shop.all
  erb (:"shops/index")
end

get '/shops/:id' do
  @shop = Shop.find(params['id'])
  erb(:"shops/show")
end

get '/shops/:id/edit' do
  @shop = Shop.find(params['id'])
  erb(:"shops/edit")
end

post '/shops/:id' do
  @shop = Shop.new(params)
  @shop.update
  redirect to "/shops/" + params['id']
end
