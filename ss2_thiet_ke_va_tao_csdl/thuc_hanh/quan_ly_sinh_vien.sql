create database `quan_ly_sinh_vien`;
use `quan_ly_sinh_vien`;

create table `quan_ly_sinh_vien`.`class`(
class_id int auto_increment not null primary key,
class_name varchar(60) not null,
start_date datetime not	null,
`status` bit
);

create table `quan_ly_sinh_vien`.`student`(
student_id int auto_increment not null primary key,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
giao_vien varchar(20),
`status` bit,
class_id int not null,
foreign key (class_id) references class(class_id)
);

create table `quan_ly_sinh_vien`.`subject`(
sub_id int auto_increment not null primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1,
check(credit >=1),
`status` bit default 1
);

create table `quan_ly_sinh_vien`.`mark`(
mark_id int auto_increment not null primary key,
sub_id int not null unique,
student_id int not null unique,
mark float default 0,
check(mark between 0 and 100),
foreign key (sub_id) references subject(sub_id),
foreign key (student_id) references student(student_id)
);
