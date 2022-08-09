USE case_study_database;

-- task 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT ma_nhan_vien, ho_ten
FROM nhan_vien
WHERE (ho_ten LIKE 'K%' OR ho_ten LIKE 'H%' OR ho_ten LIKE 'T%') AND char_length(ho_ten)<=15;

-- task 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT ma_khach_hang,ho_ten,ngay_sinh,DATEDIFF(CURDATE(), ngay_sinh) / 365 AS tuổi
FROM khach_hang
WHERE (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị') AND (select DATEDIFF(CURDATE(), ngay_sinh) / 365 between 18 and 50);

-- task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten, count(hop_dong.ma_khach_hang) AS so_lan_dat_phong
FROM khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
WHERE khach_hang.ma_khach_hang=1