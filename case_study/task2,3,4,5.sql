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
JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE loai_khach.ten_loai_khach='Diamond'
group by khach_hang.ma_khach_hang
order by so_lan_dat_phong ASC;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,(ifnull(dv.chi_phi_thue,0)+(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)))as chi_phi_thue
FROM khach_hang as kh
left join loai_khach as lk on lk.ma_loai_khach=kh.ma_loai_khach
left join hop_dong as hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu=hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
;
