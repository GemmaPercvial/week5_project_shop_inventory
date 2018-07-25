DROP TABLE stock;
DROP TABLE shop;
DROP TABLE manufacturer;

CREATE TABLE manufacturer(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255),
  delivery_time VARCHAR(255));

CREATE TABLE shop(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255));

CREATE TABLE stock(
  id SERIAL8 primary key,
  shop_id INT8 references shop(id),
  manufacturer_id INT8 references manufacturer(id) ON DELETE CASCADE,
  type VARCHAR(255),
  colour VARCHAR(255),
  shop_stock_level INT8,
  price INT8,
  manufacturer_cost INT8);
