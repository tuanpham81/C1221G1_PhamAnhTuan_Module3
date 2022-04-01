create database `bai_tap_ss4`;
create table products(
id int primary key auto_increment,
product_code varchar(50),
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status bit
);
INSERT INTO `bai_tap_ss4`.`products` (`id`, `product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`) VALUES (1, 'p', 'phone', 10, 5, 'white', 1);
INSERT INTO `bai_tap_ss4`.`products` (`id`, `product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`) VALUES (2, 'c', 'car', 100, 0, 'black', 0);
INSERT INTO `bai_tap_ss4`.`products` (`id`, `product_code`, `product_name`, `product_price`, `product_amount`, `product_description`, `product_status`) VALUES (3, 'b', 'bike', 20, 10, 'gray', 1);

ALTER TABLE products ADD UNIQUE product_code_idx(product_code);
ALTER TABLE products add index composite_product_idx(product_name, product_price);
explain select * from products where product_code = 1;
explain select * from products where product_amount = 10;
alter table products drop index product_code_idx;

create view view_demo as
select product_code, product_name,product_price, product_status
from products;
select * from view_demo;

alter view view_demo as
-- có thể sử dụng create or replace view
select product_code, product_name,product_price, product_status
from products
where product_name = 'car';
select * from view_demo;
drop view view_demo;

-- hiển thị sp
DELIMITER //
CREATE PROCEDURE display_all_products()
BEGIN
  SELECT * FROM products;
END //
DELIMITER ;
call display_all_products;

-- thêm sp
DELIMITER //
CREATE PROCEDURE add_new_product(id int, code varchar(50), name varchar(50), price int, amount int, description varchar(50), status bit)
BEGIN
  insert into products() value (id, code, name, price, amount, description, status);
END //
DELIMITER ;
drop procedure add_new_product;
call add_new_product(5,'k' , 'laptop', 20, 5, 'green',0);

-- chỉnh sửa sp theo id
DELIMITER //
CREATE PROCEDURE edit_product_by_id(edit_id int, new_code varchar(50), new_name varchar(50), new_price int, new_amount int, new_description varchar(50), new_status bit)
BEGIN
set sql_safe_updates = 0;
update products
set product_code = new_code,
product_name = new_name,
product_price = new_price,
product_amount = new_amount,
product_description = new_description,
product_status = new_status
where id = edit_id;
set sql_safe_updates = 0;
END //
DELIMITER ;
drop procedure edit_product_by_id;
call edit_product_by_id(2,'x1','aircraft',100000,1,'fcking fast',1);

-- xóa sp theo id
DELIMITER //
CREATE PROCEDURE delete_product_by_id(delete_id int)
BEGIN
set sql_safe_updates = 0;
delete from products where id= delete_id;
set sql_safe_updates = 1;
END //
DELIMITER ;
drop procedure delete_product_by_id;
call delete_product_by_id(1);
