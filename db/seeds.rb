require_relative("../models/manufacturer.rb")
require_relative("../models/shop.rb")
require_relative("../models/stock.rb")
require("pry-byebug")

Stock.delete_all()
Shop.delete_all()
Manufacturer.delete_all()

shop = Shop.new({
  "name" => "Next"})
shop.save()

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

manufacturer_livis = Manufacturer.new({
  "name" => "Livis",
  "address" => "California, USA",
  "delivery_time" => "7 working days"})
manufacturer_livis.save()

manufacturer_superdry = Manufacturer.new({
  "name" => "Superdry",
  "address" => "Cheltenham, UK",
  "delivery_time" => "2-3 working days"})
manufacturer_superdry.save()
