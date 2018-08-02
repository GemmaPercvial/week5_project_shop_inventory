require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/manufacturer_controller')
require_relative('controllers/shop_controller')
require_relative('controllers/stock_controller')
require_relative('controllers/tracker_controller')

get '/' do
  erb(:index)
end
