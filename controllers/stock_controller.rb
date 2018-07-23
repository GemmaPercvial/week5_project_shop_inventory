require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/shop.rb')
require_relative('../models/manufacturer.rb')
also_reload('./models/*')

get '/stock' do
  p "hello"
end
