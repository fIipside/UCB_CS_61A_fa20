.read data.sql


CREATE TABLE average_prices AS
  SELECT category as category, avg(MSRP) as average_price from products group by category;


CREATE TABLE lowest_prices AS
  SELECT store as store, item as item, min(price) as lowest_price from inventory group by item;


CREATE TABLE best_deal_helper AS
  SELECT name as name, min(MSRP / rating) as score from products group by category;

CREATE TABLE shopping_list AS
  SELECT item as item, store as store2 from best_deal_helper, lowest_prices where item = name;


CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs) from stores, shopping_list where store = store2;

