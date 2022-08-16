use case_study_database;
-- 6: 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1
-- của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu as dv
join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where dv.ma_dich_vu not in 
	(select ma_dich_vu 
    from hop_dong 
    where year(ngay_lam_hop_dong)=2021 and (month(ngay_lam_hop_dong) in(1,2,3)))
group by ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT  dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu as dv
join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu as ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where year(ngay_lam_hop_dong)=2020 and dv.ma_dich_vu not in 
	(select  ma_dich_vu 
    from hop_dong 
    where year(ngay_lam_hop_dong)=2021)
group by ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cach1: distinct
SELECT distinct ho_ten 
from khach_hang;

-- cach2: group by
SELECT ho_ten 
from khach_hang
group by ho_ten;

-- cach3: union
SELECT ho_ten 
from khach_hang union
SELECT ho_ten 
from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT month(ngay_lam_hop_dong)as thang,count(ma_khach_hang)as so_lan_dat_phong
from hop_dong
where year(ngay_lam_hop_dong)=2021
group by thang
order by thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc,
-- tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,sum(ifnull(so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong as hd
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong
order by hd.ma_hop_dong;