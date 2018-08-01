require_relative('controllers/manufacturer_controller')
require_relative('controllers/shop_controller')
require_relative('controllers/stock_controller')
require_relative('controllers/tracker_controller')

also_reload('./models/*')

get '/' do
  erb(:index)
end
