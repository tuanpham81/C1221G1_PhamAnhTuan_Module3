create database `quan_ly_xuat_nhap`;
use `quan_ly_xuat_nhap`;
create table `quan_ly_xuat_nhap`.`phieu_xuat`(
so_px varchar(20) not null primary key,
ngay_xuat datetime
);       

create table `quan_ly_xuat_nhap`.`vat_tu`(
ma_vt varchar(20) primary key,
ten_vt varchar(50)
);

create table `quan_ly_xuat_nhap`.`chi_tiet_phieu_xuat`(
so_px varchar(20),
ma_vt varchar(20) unique,
dg_xuat int,
sl_xuat int,
foreign key (so_px) references `phieu_xuat`(so_px),
foreign key (ma_vt) references `vat_tu`(ma_vt)
);

create table `quan_ly_xuat_nhap`.`phieu_nhap`(
so_pn varchar(20) not null primary key,
ngay_nhap datetime
);

create table `quan_ly_xuat_nhap`.`chi_tiet_phieu_nhap`(
so_pn varchar(20),
ma_vt varchar(20) unique,
dg_nhap int,
sl_nhap int,
foreign key (so_pn) references `phieu_nhap`(so_pn),
foreign key (ma_vt) references `vat_tu`(ma_vt)
);
create table `quan_ly_xuat_nhap`.`don_dat_hang`(
so_don_hang varchar(20) not null primary key,
ngay_don_hang datetime
);
create table `quan_ly_xuat_nhap`.`chi_tiet_don_dh`(
so_don_hang varchar(20),
ma_vt varchar(20) unique,
foreign key (so_don_hang) references `don_dat_hang`(so_don_hang),
foreign key (ma_vt) references `vat_tu`(ma_vt)
);
create table `quan_ly_xuat_nhap`.`nha_cung_cap`(
ma_ncc varchar(20) not null primary key,
ten_ncc varchar(50),
dia_chi_ncc varchar(50)
);
create table `quan_ly_xuat_nhap`.`so_dien_thoai_ncc`(
ma_ncc varchar(20) not null,
sdt varchar(10),
foreign key(ma_ncc) references `nha_cung_cap`(ma_ncc),
primary key(ma_ncc, sdt)
);
alter table `don_dat_hang` add `ma_ncc` varchar(20);
alter table `don_dat_hang` add foreign key (ma_ncc) references `nha_cung_cap`(ma_ncc);