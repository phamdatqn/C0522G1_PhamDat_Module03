CREATE DATABASE covert_erd_to_table;
USE covert_erd_to_table;

CREATE TABLE phieu_xuat (
    soPX INT PRIMARY KEY,
    ngay_xuat DATE
);

CREATE TABLE vat_tu (
    maVTu INT PRIMARY KEY,
    tenVTu VARCHAR(45)
);

CREATE TABLE chi_tiet_phieu_xuat (
    soPXVTu INT,
    maPXVTu INT,
    DGxuat DOUBLE,
    SLXuat DOUBLE,
    PRIMARY KEY (soPXVTu , maPXVTu),
    FOREIGN KEY (soPXVTu)
        REFERENCES phieu_xuat (soPX),
    FOREIGN KEY (maPXVTu)
        REFERENCES vat_tu (maVTu)
);

CREATE TABLE phieu_nhap (
    soPN INT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    soPNVTu INT,
    maPNVTu INT,
    DGNhap DOUBLE,
    SLNhap DOUBLE,
    PRIMARY KEY (soPNVTu , maPNVTu),
    FOREIGN KEY (soPNVTu)
        REFERENCES phieu_nhap (soPN),
    FOREIGN KEY (maPNVTu)
        REFERENCES vat_tu (maVTu)
);

CREATE TABLE nha_cung_cap (
    maNCC INT PRIMARY KEY,
    tenNCC VARCHAR(45),
    dia_chi VARCHAR(45),
    sDTNCC VARCHAR(45)
);

CREATE TABLE so_dien_thoai (
    sDT VARCHAR(45) PRIMARY KEY,
    maNCC INT,
    FOREIGN KEY (maNCC)
        REFERENCES nha_cung_cap (maNCC)
);

CREATE TABLE don_dat_hang (
    soDH INT PRIMARY KEY,
    ngayDH DATE
);

CREATE TABLE cung_cap (
    maNCC INT,
    soDHNCC INT,
    PRIMARY KEY (maNCC , soDHNCC),
    FOREIGN KEY (maNCC)
        REFERENCES nha_cung_cap (maNCC),
    FOREIGN KEY (soDHNCC)
        REFERENCES don_dat_hang (soDH)
);

CREATE TABLE chi_tiet_don_dat_hang (
    soDHVTu INT,
    maDHVTu INT,
    PRIMARY KEY (soDHVTu , maDHVTu),
    FOREIGN KEY (soDHVTu)
        REFERENCES don_dat_hang (soDH),
    FOREIGN KEY (maDHVTu)
        REFERENCES vat_tu (maVTu)
);
