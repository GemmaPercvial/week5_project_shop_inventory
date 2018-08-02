require_relative("../db/sql_runner.rb")
require_relative("../models/manufacturer.rb")
require_relative("../models/shop.rb")
require_relative("../models/stock.rb")

Stock.delete_all()
Shop.delete_all()
Manufacturer.delete_all()

shop1 = Shop.new({
  "name" => "Next",
  "address" => "Gyle Shopping Centre, Edinburgh"})
shop1.save()

manufacturer_nike = Manufacturer.new({
  "name" => "Nike",
  "address" => "Oregon, USA",
  "delivery_time" => "7 working days"})
manufacturer_nike.save()

manufacturer_adidas = Manufacturer.new({
  "name" => "Adidas",
  "address" => "Herzogenaurach, Germany",
  "delivery_time" => "5 working days"})
manufacturer_adidas.save()

manufacturer_michael_kors = Manufacturer.new({
  "name" => "Mickael Kors",
  "address" => "New York, USA",
  "delivery_time" => "7 working days"})
manufacturer_michael_kors.save()

manufacturer_mango = Manufacturer.new({
  "name" => "Mango",
  "address" => "Barcelona, Spain",
  "delivery_time" => "5 working days"})
manufacturer_mango.save()

manufacturer_topshop = Manufacturer.new({
  "name" => "Topshop",
  "address" => "London, UK",
  "delivery_time" => "2-3 working days"})
manufacturer_topshop.save()

manufacturer_lipsy = Manufacturer.new({
  "name" => "Lipsy London",
  "address" => "London, UK",
  "delivery_time" => "2-3 working days"})
manufacturer_lipsy.save()

manufacturer_levis = Manufacturer.new({
  "name" => "Levis",
  "address" => "California, USA",
  "delivery_time" => "7 working days"})
manufacturer_levis.save()

manufacturer_superdry = Manufacturer.new({
  "name" => "Superdry",
  "address" => "Cheltenham, UK",
  "delivery_time" => "2-3 working days"})
manufacturer_superdry.save()

white_logo_tshirt1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_nike.id,
  "type" => "Logo T-shirt",
  "colour" => "White",
  "shop_stock_level" => "15",
  "price" => "30",
  "manufacturer_cost" => "10"})
white_logo_tshirt1.save()

black_trainers1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_nike.id,
  "type" => "Trainers",
  "colour" => "Black",
  "shop_stock_level" => "30",
  "price" => "60",
  "manufacturer_cost" => "25"})
black_trainers1.save()

black_tracksuit_jacket1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_adidas.id,
  "type" => "Tracksuit Jacket",
  "colour" => "Black",
  "shop_stock_level" => "20",
  "price" => "80",
  "manufacturer_cost" => "20"})
black_tracksuit_jacket1.save()

white_trainers1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_adidas.id,
  "type" => "Trainers",
  "colour" => "White",
  "shop_stock_level" => "20",
  "price" => "60",
  "manufacturer_cost" => "25"})
white_trainers1.save()

pink_handbag1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_michael_kors.id,
  "type" => "Handbag",
  "colour" => "Pink",
  "shop_stock_level" => "15",
  "price" => "100",
  "manufacturer_cost" => "40"})
pink_handbag1.save()

pink_dress1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_mango.id,
  "type" => "Dress",
  "colour" => "Pink",
  "shop_stock_level" => "10",
  "price" => "30",
  "manufacturer_cost" => "10"})
pink_dress1.save()

orange_yellow_dress1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_mango.id,
  "type" => "Dress",
  "colour" => "Orange and Yellow",
  "shop_stock_level" => "17",
  "price" => "40",
  "manufacturer_cost" => "15"})
orange_yellow_dress1.save()

green_white_dress1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_mango.id,
  "type" => "Dress",
  "colour" => "Green and White",
  "shop_stock_level" => "8",
  "price" => "35",
  "manufacturer_cost" => "15"})
green_white_dress1.save()

white_dress1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_topshop.id,
  "type" => "Dress",
  "colour" => "White",
  "shop_stock_level" => "13",
  "price" => "45",
  "manufacturer_cost" => "20"})
white_dress1.save()

blue_crop_top1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_topshop.id,
  "type" => "Crop Top",
  "colour" => "Blue",
  "shop_stock_level" => "17",
  "price" => "15",
  "manufacturer_cost" => "5"})
blue_crop_top1.save()

black_gold_trousers1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_topshop.id,
  "type" => "Trousers",
  "colour" => "Black and Gold",
  "shop_stock_level" => "21",
  "price" => "25",
  "manufacturer_cost" => "10"})
black_gold_trousers1.save()

clear_makeup_bag1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_topshop.id,
  "type" => "Make-up Bag",
  "colour" => "Clear",
  "shop_stock_level" => "3",
  "price" => "5",
  "manufacturer_cost" => "2"})
clear_makeup_bag1.save()

black_dress1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_lipsy.id,
  "type" => "Dress",
  "colour" => "Black",
  "shop_stock_level" => "10",
  "price" => "55",
  "manufacturer_cost" => "15"})
black_dress1.save()

black_heels1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_lipsy.id,
  "type" => "Heels",
  "colour" => "Black",
  "shop_stock_level" => "15",
  "price" => "35",
  "manufacturer_cost" => "10"})
black_heels1.save()

blue_jeans1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_levis.id,
  "type" => "Jeans",
  "colour" => "Light Blue",
  "shop_stock_level" => "20",
  "price" => "40",
  "manufacturer_cost" => "15"})
blue_jeans1.save()

blue_jeans2 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_levis.id,
  "type" => "Jeans",
  "colour" => "Dark Blue",
  "shop_stock_level" => "30",
  "price" => "40",
  "manufacturer_cost" => "15"})
blue_jeans2.save()

grey_jacket1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_superdry.id,
  "type" => "Jacket",
  "colour" => "Grey",
  "shop_stock_level" => "17",
  "price" => "65",
  "manufacturer_cost" => "40"})
grey_jacket1.save()

red_backpack1 = Stock.new({
  "shop_id" => shop1.id,
  "manufacturer_id" => manufacturer_superdry.id,
  "type" => "Backpack",
  "colour" => "Red",
  "shop_stock_level" => "6",
  "price" => "30",
  "manufacturer_cost" => "12"})
red_backpack1.save()
