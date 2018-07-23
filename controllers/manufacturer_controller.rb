require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/shop.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/stock.rb')
also_reload('../models/*')

get '/manufacturers' do
  "Hello World"
end
