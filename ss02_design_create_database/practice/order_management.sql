CREATE DATABASE IF NOT EXISTS order_management;
USE order_management;

CREATE TABLE don_vi_khach (
    ma_don_vi_khach INT PRIMARY KEY,
    ten_don_vi_khach VARCHAR(45),
    dia_chi VARCHAR(45),
    dien_thoai VARCHAR(45)
);

CREATE TABLE nguoi_dat (
    ma_so_nguoi_dat INT PRIMARY KEY,
    ho_ten_nguoi_dat VARCHAR(45)
);

CREATE TABLE hang (
    ma_hang INT PRIMARY KEY,
    ten_hang VARCHAR(45),
    don_vi_tinh VARCHAR(45),
    mo_ta_hang VARCHAR(60)
);

CREATE TABLE dat (
    ma_so_nguoi_dat INT,
    ma_hang INT,
    PRIMARY KEY (ma_so_nguoi_dat , ma_hang),
    FOREIGN KEY (ma_so_nguoi_dat)
        REFERENCES nguoi_dat (ma_so_nguoi_dat),
    FOREIGN KEY (ma_hang)
        REFERENCES hang (ma_hang),
    so_don_hang INT,
    ngay_dat DATE,
    so_luong INT
);

CREATE TABLE noi_giao (
    ma_so_noi_giao INT PRIMARY KEY,
    ten_noi_giao VARCHAR(45)
);

CREATE TABLE nguoi_giao (
    ma_so_nguoi_giao INT PRIMARY KEY,
    ho_ten_nguoi_giao VARCHAR(45)
);

CREATE TABLE nguoi_nhan (
    ma_so_nguoi_nhan INT PRIMARY KEY,
    ho_ten_nguoi_nhan VARCHAR(45)
);

CREATE TABLE giao (
    ma_hang INT,
    ma_so_nguoi_giao INT,
    ma_so_noi_giao INT,
    ma_so_nguoi_nhan INT,
    PRIMARY KEY (ma_hang , ma_so_nguoi_giao , ma_so_noi_giao , ma_so_nguoi_nhan),
    FOREIGN KEY (ma_hang)
        REFERENCES hang (ma_hang),
    FOREIGN KEY (ma_so_nguoi_giao)
        REFERENCES nguoi_giao (ma_so_nguoi_giao),
    FOREIGN KEY (ma_so_noi_giao)
        REFERENCES noi_giao (ma_so_noi_giao),
    FOREIGN KEY (ma_so_nguoi_nhan)
        REFERENCES nguoi_nhan (ma_so_nguoi_nhan),
    so_phieu_giao INT,
    ngay_giao DATE,
    so_luong INT,
    don_gia DOUBLE
);

CREATE TABLE don_vi_nguoi_dat (
    ma_don_vi INT,
    ma_so_nguoi_dat INT,
    PRIMARY KEY (ma_don_vi , ma_so_nguoi_dat),
    FOREIGN KEY (ma_don_vi)
        REFERENCES don_vi_khach (ma_don_vi_khach),
    FOREIGN KEY (ma_so_nguoi_dat)
        REFERENCES nguoi_dat (ma_so_nguoi_dat)
);

CREATE TABLE don_vi_nguoi_nhan (
    ma_don_vi INT,
    ma_so_nguoi_nhan INT,
    PRIMARY KEY (ma_don_vi , ma_so_nguoi_nhan),
    FOREIGN KEY (ma_don_vi)
        REFERENCES don_vi_khach (ma_don_vi_khach),
    FOREIGN KEY (ma_so_nguoi_nhan)
        REFERENCES nguoi_nhan (ma_so_nguoi_nhan)
);

