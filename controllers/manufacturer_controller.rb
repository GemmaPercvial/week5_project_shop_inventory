require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/shop.rb')
also_reload('../models/*')

get '/manufacturer' do
  "Hello World"
end


  # @manufacturer = Manufacturer.all()
  # erb(:index)
# end
