create database if not exists order_management;
use order_management;

create table don_vi_khach(
ma_don_vi_khach int primary key,
ten_don_vi_khach varchar(45),
dia_chi varchar(45),
dien_thoai varchar(45));

create table nguoi_dat(
ma_so_nguoi_dat int primary key,
ho_ten_nguoi_dat varchar(45));

create table hang(
ma_hang int primary key,
ten_hang varchar(45),
don_vi_tinh varchar(45),
mo_ta_hang varchar(60));

create table dat(
ma_so_nguoi_dat int,
ma_hang int,
primary key(ma_so_nguoi_dat,ma_hang),
foreign key(ma_so_nguoi_dat) references nguoi_dat(ma_so_nguoi_dat),
foreign key(ma_hang) references hang(ma_hang),
so_don_hang int,
ngay_dat date,
so_luong int);

create table noi_giao(
ma_so_noi_giao int primary key,
ten_noi_giao varchar(45));

create table nguoi_giao(
ma_so_nguoi_giao int primary key,
ho_ten_nguoi_giao varchar(45));

create table nguoi_nhan(
ma_so_nguoi_nhan int primary key,
ho_ten_nguoi_nhan varchar(45));

create table giao(
ma_hang int,
ma_so_nguoi_giao int,
ma_so_noi_giao int,
ma_so_nguoi_nhan int,
primary key(ma_hang,ma_so_nguoi_giao,ma_so_noi_giao,ma_so_nguoi_nhan),
foreign key(ma_hang) references hang(ma_hang),
foreign key(ma_so_nguoi_giao) references nguoi_giao(ma_so_nguoi_giao),
foreign key(ma_so_noi_giao) references noi_giao(ma_so_noi_giao),
foreign key(ma_so_nguoi_nhan) references nguoi_nhan(ma_so_nguoi_nhan),
so_phieu_giao int,
ngay_giao date,
so_luong int,
don_gia double);

create table don_vi_nguoi_dat(
ma_don_vi int,
ma_so_nguoi_dat int,
primary key(ma_don_vi,ma_so_nguoi_dat),
foreign key(ma_don_vi) references don_vi_khach(ma_don_vi_khach),
foreign key(ma_so_nguoi_dat) references nguoi_dat(ma_so_nguoi_dat));

create table don_vi_nguoi_nhan(
ma_don_vi int,
ma_so_nguoi_nhan int,
primary key(ma_don_vi,ma_so_nguoi_nhan),
foreign key(ma_don_vi) references don_vi_khach(ma_don_vi_khach),
foreign key(ma_so_nguoi_nhan) references nguoi_nhan(ma_so_nguoi_nhan));

