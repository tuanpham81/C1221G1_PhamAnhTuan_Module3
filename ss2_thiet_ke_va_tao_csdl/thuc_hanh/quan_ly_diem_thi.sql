create database `quan_ly_diem_thi`;
use `quan_ly_diem_thi`;
create table `quan_ly_diem_thi`.`hoc_sinh`(
ma_hs varchar(20) primary key,
ten_hs varchar(50),
ngay_sinh datetime,
lop varchar(20),
giao_vien varchar(20)
);
create table `quan_ly_diem_thi`.`mon_hoc`(
ma_mon_hoc varchar(20) primary key,
ten_mon_hoc varchar(50)	
);
create table `quan_ly_diem_thi`.`bang_diem`(
ma_hs varchar(20),
ma_mon_hoc varchar(20),
diem_thi int,
ngay_kiem_tra datetime,
primary key (ma_hs, ma_mon_hoc),
foreign key(ma_hs) references hoc_sinh(ma_hs),
foreign key(ma_mon_hoc) references mon_hoc(ma_mon_hoc)
);
create table `quan_ly_diem_thi`.`giao_vien`(
ma_giao_vien varchar(20) primary key,
ten_giao_vien varchar(50),
sdt varchar(10)
);
alter table mon_hoc add ma_giao_vien varchar(20);
alter table mon_hoc add constraint fk_ma_giao_vien foreign key(ma_giao_vien) references giao_vien(ma_giao_vien);
