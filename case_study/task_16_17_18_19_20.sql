 use case_study_database;
 
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- SET SQL_SAFE_UPDATES = 0 => Tắt “Safe Update Mode” tạm thời.
SET SQL_SAFE_UPDATES = 0;
update nhan_vien set is_delete =1 where ma_nhan_vien not in (
select ma_nhan_vien
from hop_dong
where year(ngay_lam_hop_dong)between 2019 and 2021);
SET SQL_SAFE_UPDATES = 1;

select * from nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

create view khach_hang_tong_tien as 
select kh.ma_khach_hang,(ifnull(dv.chi_phi_thue,0)+sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)))as tong_tien 
FROM khach_hang as kh
left join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong as hd on kh.ma_khach_hang= hd.ma_khach_hang
left join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet as hdct on  hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(ngay_lam_hop_dong)=2021 and ten_loai_khach='Platinium'
group by hd.ma_hop_dong;

SET SQL_SAFE_UPDATES = 0;
update khach_hang set ma_loai_khach = 1
where ma_khach_hang in
	(select ma_khach_hang 
    from khach_hang_tong_tien
where tong_tien >10000000);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 .
set sql_safe_updates = 0;
update khach_hang 
set is_delete = 1 
where ma_khach_hang in (
	select ma_khach_hang 
	from hop_dong
where year(ngay_lam_hop_dong)<2021);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
create view w_dvdk_10_lan_sung_2020 as
select dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem as dvdk
join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(ngay_lam_hop_dong)=2020
group by hdct.ma_dich_vu_di_kem
having count(ifnull(hdct.ma_dich_vu_di_kem,0))>10;

set sql_safe_updates = 0;
update dich_vu_di_kem as dvdk 
set gia = gia/2 
where dvdk.ma_dich_vu_di_kem in 
	(select ma_dich_vu_di_kem classclassstudent
    from w_dvdk_10_lan_sung_2020); 


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten , email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien union all
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;
