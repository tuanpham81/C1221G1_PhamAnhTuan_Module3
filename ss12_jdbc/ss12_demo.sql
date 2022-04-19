CREATE DATABASE ss12_demo;
USE ss12_demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

select * from users where country like '%vietnam%';


DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    where users.id = user_id;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$
DELIMITER ;


create table Permision(
id int(11) primary key,
name varchar(50)
);
 
create table User_Permision(
permision_id int(11),
user_id int(11)
);

insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');


DELIMITER //
CREATE PROCEDURE list_all_user()
BEGIN
    SELECT * from users;
end //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE edit_user_by_id(edit_id INT, new_name varchar(50), new_email varchar(50), country varchar(50))
BEGIN
set sql_safe_updates = 0;
update users
set 'name' = new_name,
email = new_email,
country = new_country
where id = edit_id;
set sql_safe_updates = 0;
END //
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE delete_user_by_id(delete_id int)
BEGIN
set sql_safe_updates = 0;
delete from products where id= delete_id;
set sql_safe_updates = 1;	
END //
DELIMITER ;
