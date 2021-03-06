create database `case_study_database`;
use `case_study_database`;

create table `vi_tri`(
ma_vi_tri int primary key,
ten_vi_tri varchar(45)
);

create table `trinh_do`(
ma_trinh_do int primary key,
teb_trinh_do varchar(45)
);

create table `bo_phan`(
ma_bo_phan int primary key,
ten_bo_phan varchar(45)
);

create table `nhan_vien`(
ma_nhan_vien int primary key,
ho_ten varchar(45) not null,
ngay_sinh datetime not null,
so_cmnd varchar(45) unique not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references `vi_tri`(ma_vi_tri),
foreign key (ma_trinh_do) references `trinh_do`(ma_trinh_do),
foreign key (ma_bo_phan) references `bo_phan`(ma_bo_phan)
);

create table `loai_khach`(
ma_loai_khach int primary key,
ten_loai_khach varchar(45)
);

create table `khach_hang`(
ma_khach_hang int primary key,
ma_loai_khach int,
ho_ten varchar(45) not null,
ngay_sinh datetime not null,
gioi_tinh bit default 1,
so_cmnd varchar(45) unique not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create table `dich_vu_di_kem`(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);

create table `hop_dong`(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int not null,
ma_khach_hang int not null,
ma_dich_vu int not null,
foreign key (ma_nhan_vien) references `nhan_vien`(ma_nhan_vien),
foreign key (ma_khach_hang) references `khach_hang`(ma_khach_hang),
foreign key (ma_dich_vu) references `dich_vu`(ma_dich_vu)
);

create table `hop_dong_chi_tiet`(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int not null,
ma_dich_vu_di_kem int not null,
so_luong int not null,
foreign key (ma_hop_dong) references `hop_dong`(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references `dich_vu_di_kem`(ma_dich_vu_di_kem)
);

create table `kieu_thue`(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);
	
create table `loai_dich_vu`(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);

create table `dich_vu`(
ma_dich_vu int primary key,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
foreign key (ma_kieu_thue) references `kieu_thue`(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references `loai_dich_vu`(ma_loai_dich_vu)
);
alter table `hop_dong` add ma_dich_vu int;
alter table `hop_dong` add foreign key (ma_dich_vu) references `dich_vu`(ma_dich_vu);
alter table `khach_hang` add foreign key (ma_loai_khach) references `loai_khach`(ma_loai_khach);

-- y??u c???u 1
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('1', 'Nguy???n V??n An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguy???n T???t Th??nh, ???? N???ng');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('2', 'L?? V??n B??nh', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('3', 'H??? Th??? Y???n', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('4', 'V?? C??ng To???n', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('5', 'Nguy???n B???nh Ph??t', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('6', 'Kh??c Nguy???n An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('7', 'Nguy???n H???u H??', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', 'haohao99@gmail.comhaohao99@gmail.com');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('8', 'Nguy???n H?? ????ng', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 H??ng V????ng, H?? N???i');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('9', 'T??ng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 H??m Nghi, ???? N???ng');
INSERT INTO `case_study_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('10', 'Nguy???n C??ng ?????o', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai');

INSERT INTO `case_study_database`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('1', 'Sale-Marketing');
INSERT INTO `case_study_database`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('2', 'H??nh ch??nh');
INSERT INTO `case_study_database`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('3', 'Ph???c v???');
INSERT INTO `case_study_database`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('4', 'Qu???n l??');

INSERT INTO `case_study_database`.`trinh_do` (`ma_trinh_do`, `teb_trinh_do`) VALUES ('1', 'Trung C???p');
INSERT INTO `case_study_database`.`trinh_do` (`ma_trinh_do`, `teb_trinh_do`) VALUES ('2', 'Cao ?????ng');
INSERT INTO `case_study_database`.`trinh_do` (`ma_trinh_do`, `teb_trinh_do`) VALUES ('3', '?????i H???c');
INSERT INTO `case_study_database`.`trinh_do` (`ma_trinh_do`, `teb_trinh_do`) VALUES ('4', 'Sau ?????i H???c');

INSERT INTO `case_study_database`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('1', 'Diamond');
INSERT INTO `case_study_database`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('2', 'Platinium');
INSERT INTO `case_study_database`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('3', 'Gold');
INSERT INTO `case_study_database`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('4', 'Silver');
INSERT INTO `case_study_database`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('5', 'Member');

INSERT INTO `case_study_database`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES (1, 5, 'Nguy???n Th??? H??o', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguy???n Ho??ng - ???? N???ng');
INSERT INTO `case_study_database`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES (2, 3, 'Ph???m Xu??n Di???u', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Th??i Phi??n, Qu???ng Tr???'),
(3, 1, 'Tr????ng ????nh Ngh???', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ??ng ??ch Khi??m, Vinh'),
(4, 1, 'D????ng V??n Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 L?? L???i, ???? N???ng'),
(5, 4, 'Ho??ng Tr???n Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 L?? Th??i T???, Gia Lai'),
(6, 4, 'T??n N??? M???c Ch??u', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Y??n Th???, ???? N???ng'),
(7, 1, 'Nguy???n M??? Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 L?? L???i, H??? Ch?? Minh'),
(8, 3, 'Nguy???n Th??? H??o', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguy???n V??n Linh, Kon Tum'),
(9, 1, 'Tr???n ?????i Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 L?? Th?????ng Ki???t, Qu???ng Ng??i'),
(10, 2, 'Nguy???n T??m ?????c', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ng?? Quy???n, ???? N???ng');

insert into vi_tri(ma_vi_tri,ten_vi_tri) value (1,"Qu???n l??"),(2,"Nh??n vi??n");

insert into bo_phan(ma_bo_phan,ten_bo_phan) value (1,"Sale-Marketing"),(2,"H??nh C??nh"),(3,"Ph???c V???"),(4,"Qu???n l??");

insert into loai_dich_vu(ma_loai_dich_vu,ten_loai_dich_vu) value (1,"Villa"),(2,"House"),(3,"Room");

insert into kieu_thue(ma_kieu_thue,ten_kieu_thue) value (1,"year"),(2,"month"),(3,"day"),(4,"hour");

insert into dich_vu(ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu)
values
(1,"Villa Beach Front", 25000, 10000000, 10, "vip", "C?? h??? b??i", 500, 4, 3, 1),
(2,"House Princess 01", 14000, 5000000, 7, "vip", "C?? th??m B???p N?????ng",null, 3, 2, 2),
(3,"Room Twin 01", 5000, 1000000, 2, "normal", "C?? TV",null, null, 4, 3),
(4,"Villa Beach Front", 22000, 9000000, 8, "normal", "C?? h??? b??i", 300, 3, 3, 1),
(5,"House Princess 02", 10000, 4000000, 5, "normal", "C?? th??m B???p N?????ng", null, 2, 3, 2),
(6,"Room Twin 02", 3000, 900000, 2, "normal", "C?? TV",null, null, 4, 3);

insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values (1,"2020-12-08", "2020-12-08", 0, 3, 1, 3),
(2,"2020-07-14", "2020-07-21", 200000, 7, 3,1),
(3,"2021-03-15", "2021-03-17", 50000, 3,4, 2),
(4,"2021-01-14", "2021-01-18", 100000, 7, 5, 5),
(5,"2021-07-14", "2021-07-15", 0, 7, 2, 6),
(6,"2021-06-01", "2021-06-03", 0, 7, 7, 6),
(7,"2021-09-02", "2021-09-05", 100000, 7, 4, 4),
(8,"2021-06-17", "2021-06-18", 150000, 3, 4, 1),
(9,"2020-11-19", "2020-11-19", 0, 3, 4, 3),
(10,"2021-04-12", "2021-04-14", 0, 10, 3, 5),
(11,"2021-04-25", "2021-04-25", 0, 2, 2, 1),
(12,"2021-05-25", "2021-05-27", 0, 7,10, 1);

insert into dich_vu_di_kem(ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values (1, "Karaoke", "10000", "gi???", "ti???n nghi, hi???n ?????i"),
(2,"Thu?? xe m??y", "10000", "Chi???c", "h???ng 1 xe"),
(3,"Thu?? xe ?????p", "20000", "Chi???c", "T???t"),
(4,"Buffer bu???i s??ng", "15000", "Su???t", "?????y ????? ????? ??n, tr??ng mi???ng"),
(5,"Buffer bu???i tr??a", "9000", "Su???t", "?????y ????? ????? ??n, tr??ng mi???ng"),
(6,"Buffer bu???i t???i", "16000", "Su???t", "?????y ????? ????? ??n, tr??ng mi???ng");

insert into hop_dong_chi_tiet (ma_hop_dong_chi_tiet,so_luong,ma_hop_dong,ma_dich_vu_di_kem)
value  (1,5,2,4),
(2,8,2,5),
(3,15,2,6),
(4,1,3,1),
(5,11,3,2),
(6,1,1,3),
(7,2,1,2),
(8,2,12,2);
 
-- y??u c???u 2:
select * from nhan_vien
where ho_ten regexp '^h|^t|^k' and char_length(ho_ten) < 15;
 
 -- y??u c???u 3;
select * from khach_hang
where (((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) between 18 and 65) and dia_chi regexp 'Qu???ng Tr???|???? N???ng';

-- y??u c???u 4
select khach_hang.ho_ten, count(hop_dong.ma_khach_hang)
from loai_khach join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where loai_khach.ma_loai_khach = 1
group by khach_hang.ho_ten
order by count(hop_dong.ma_khach_hang);

-- y??u c???u 5:
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) as `tong_tien`
from khach_hang 
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by khach_hang.ma_khach_hang;

-- y??u c???u 6
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where dich_vu.ma_dich_vu not in (select hop_dong.ma_dich_vu from dich_vu where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
group by dich_vu.ten_dich_vu;

-- y??u c???u 7
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu, hop_dong.ngay_lam_hop_dong
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where (hop_dong.ngay_lam_hop_dong between '2020-1-1' and '2020-12-31')
group by dich_vu.ma_dich_vu
having dich_vu.ma_dich_vu
not in (select dich_vu.ma_dich_vu
from dich_vu join hop_dong on dich_vu.ma_dich_vu= hop_dong.ma_dich_vu
where (hop_dong.ngay_lam_hop_dong between '2021-1-1' and '2021-12-31'));

-- y??u c???u 8
-- c??ch 1:
select khach_hang.ho_ten
from khach_hang;
-- c??ch 2:
select distinct khach_hang.ho_ten
from khach_hang;
-- c??ch 3:

-- y??u c???u 9:
select ngay_lam_hop_dong, count(ma_khach_hang) as 'so_lan_dat'
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong);

-- y??u c???u 10
select hop_dong.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- y??u c???u 11
select khach_hang.ho_ten, loai_khach.ten_loai_khach, khach_hang.dia_chi, dich_vu_di_kem.ten_dich_vu_di_kem
from khach_hang join loai_khach on khach_hang.ma_loai_khach= loai_khach.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where loai_khach.ten_loai_khach = 'Diamond' and khach_hang.dia_chi regexp 'Vinh|Qu???ng Ng??i';

-- y??u c???u 12
select hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.so_dien_thoai, ten_dich_vu, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem, tien_dat_coc 
from hop_dong left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where hop_dong.ngay_lam_hop_dong between '2020-10-01' and '2020-12-31'
group by hop_dong.ma_hop_dong
having dich_vu.ten_dich_vu
not in (select dich_vu.ten_dich_vu
from dich_vu join hop_dong on dich_vu.ma_dich_vu= hop_dong.ma_dich_vu
where (hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-06-30'))
;

-- y??u c???u 13
select dich_vu_di_kem.ma_dich_vu_di_kem, ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as 'so_luong_dat'
from hop_dong_chi_tiet join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by ten_dich_vu_di_kem
having so_luong_dat >= all(select sum(hop_dong_chi_tiet.so_luong) from hop_dong_chi_tiet group by ma_dich_vu_di_kem);

-- y??u c???u 14
select hop_dong.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(hop_dong_chi_tiet.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by ten_dich_vu_di_kem
having so_lan_su_dung = 1;

-- y??u c???u 15
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, trinh_do.teb_trinh_do, ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi, count(hop_dong.ma_nhan_vien)
from nhan_vien join trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
group by ma_nhan_vien
having count(hop_dong.ma_nhan_vien) <=3;

-- y??u c???u 16
-- c1:
set sql_safe_updates = 0;
delete from nhan_vien 
where ma_nhan_vien not in 
(select nhan_vien.ma_nhan_vien 
from (select * from nhan_vien) as `all_nhan_vien` left join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
-- That is, if you're doing an UPDATE/INSERT/DELETE on a table,
-- you can't reference that table in an inner query (you can however reference a field from that outer table...)
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021);
set sql_safe_updates = 1;

-- c2:
set sql_safe_updates=0;
 delete from nhan_vien
 where nhan_vien.ma_nhan_vien not in (
 select distinct hop_dong.ma_nhan_vien from hop_dong
 where (year(hop_dong.ngay_lam_hop_dong) between '2019' and '2021')
 );
 set sql_safe_updates=1;

-- y??u c???u 17
create view `vip_customer_view` as
select khach_hang.ma_khach_hang, loai_khach.ma_loai_khach, khach_hang.ho_ten, loai_khach.ten_loai_khach, dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) as `tong_tien`
from khach_hang 
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by khach_hang.ma_khach_hang
having tong_tien > 10000000 and ten_loai_khach = 'Platinium';
drop view vip_customer_view;
set sql_safe_updates = 0;
update khach_hang 
set khach_hang.ma_loai_khach = 1 where khach_hang.ma_khach_hang in (select ma_khach_hang from `vip_customer_view`);
set sql_safe_updates = 1;

-- y??u c???u 18
set sql_safe_updates=0;
set foreign_key_checks = 0;
 delete from khach_hang
 where khach_hang.ma_khach_hang in (
 select distinct hop_dong.ma_khach_hang from hop_dong
 where (year(hop_dong.ngay_lam_hop_dong) < '2021'));
 set sql_safe_updates=1;
 set foreign_key_checks = 1;

-- y??u c???u 19
create view `19_view` as
select dich_vu_di_kem.ma_dich_vu_di_kem
from hop_dong_chi_tiet join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where year(ngay_lam_hop_dong) = 2020
group by ten_dich_vu_di_kem
having sum(hop_dong_chi_tiet.so_luong) > 10;
select * from `19_view`;

set sql_safe_updates = 0;
update dich_vu_di_kem 
set gia = gia*2 where ma_dich_vu_di_kem = (select ma_dich_vu_di_kem from `19_view`);
set sql_safe_updates = 1;

-- y??u c???u 20
select nhan_vien.ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

-- y??u c???u 21
create view v_nhan_vien as
select ho_ten, count(hop_dong.ma_nhan_vien) as so_luong_hop_dong, nhan_vien.dia_chi
from nhan_vien
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
group by nhan_vien.ho_ten
having dia_chi regexp 'Y??n B??i';

-- y??u c???u 22
set sql_safe_updates = 0;
update nhan_vien 
set dia_chi = 'L?? Du???n' where dia_chi = (select dia_chi from `v_nhan_vien`);
set sql_safe_updates = 1;

-- y??u c???u 23
DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(IN id INT(11))
BEGIN
delete from khach_hang where ma_khach_hang = id;
END //
DELIMITER ;

-- y??u c???u 24
DELIMITER //
create procedure sp_them_moi_hop_dong(ma_hd int, ngay_lam_hd datetime, ngay_kt datetime, tien_dc double, ma_nv int, ma_kh int, ma_dv int)
BEGIN
if ((select ma_hop_dong from hop_dong where hop_dong.ma_hop_dong = ma_hd) is null
and(select ma_nhan_vien from nhan_vien where ma_nhan_vien = ma_nv) 
and(select ma_khach_hang from khach_hang where ma_khach_hang = ma_kh) 
and(select ma_dich_vu from dich_vu where ma_dich_vu = ma_dv) 
and(ngay_kt > ngay_lam_hd)) then
insert into hop_dong value (ma_hd, ngay_lam_hd, ngay_kt, tien_dc, ma_nv, ma_kh, ma_dv);
else
signal sqlstate '45000' set message_text = 'D??? li???u kh??ng h???p l???';
end if;
END //
DELIMITER ;
drop procedure sp_them_moi_hop_dong;
call sp_them_moi_hop_dong(14, '2020-01-01', '2020-02-02', 1000, 2, 2, 2)

