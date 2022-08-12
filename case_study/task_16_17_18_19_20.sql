 use case_study_database;
 
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- SET SQL_SAFE_UPDATES = 0 => Tắt “Safe Update Mode” tạm thời.
SET SQL_SAFE_UPDATES = 0;
update nhan_vien set is_delete =1 where ma_nhan_vien not in (
select ma_nhan_vien
from hop_dong
where year(ngay_lam_hop_dong)between 2019 and 2021);
select * from nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
create view khach_hang_tong_tien as 
select kh.ma_khach_hang,sum(ifnull(dv.chi_phi_thue,0)+(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)))as tong_tien 
FROM khach_hang as kh
left join loai_khach as lk on lk.ma_loai_khach=kh.ma_loai_khach
left join hop_dong as hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu=hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
where year(ngay_lam_hop_dong)=2021
group by hd.ma_hop_dong,hd.ma_khach_hang
;
SET SQL_SAFE_UPDATES = 0;
update khach_hang set ma_loai_khach = (select ma_loai_khach from loai_khach where ten_loai_khach ='Diamond'); 

(select tong_tien from khach_hang_tong_tien
where tong_tien >4000000);


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
