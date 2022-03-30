create database `quan_ly_ban_hang`;
use `quan_ly_ban_hang`;

create table `customer`(
customer_id varchar(20) unique primary key not null,
customer_name varchar(30),
customer_age int
);
create table `order`(
order_id varchar(20) unique primary key not null,
customer_id varchar(20),
order_date datetime,
total_price int,
foreign key (customer_id) references `customer`(customer_id)
);
create table `product`(
product_id varchar(20) unique primary key not null,
product_name varchar(30),
product_price int
);
create table `order_detail`(
order_id varchar(20),
product_id varchar(20),
order_quantity int,
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references `product`(product_id)
);
