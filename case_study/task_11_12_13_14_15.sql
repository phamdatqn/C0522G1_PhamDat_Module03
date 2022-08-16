use case_study_database;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem as dvdk
join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' and (dia_chi like '% Vinh' or dia_chi like '% Quảng Ngãi');

/*
12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
 tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
*/

SELECT hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, hd.ngay_lam_hop_dong, dv.ten_dich_vu, SUM(IFNULL(hdct.so_luong, 0)) AS so_luong_dich_vu_di_kem, hd.tien_dat_coc
FROM hop_dong AS hd
JOIN nhan_vien AS nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
JOIN khach_hang AS kh ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN dich_vu AS dv ON dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet AS hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
WHERE (YEAR(ngay_lam_hop_dong) = 2020 AND MONTH(ngay_lam_hop_dong) IN (10 , 11, 12))
        AND hd.ma_hop_dong NOT IN 
			(SELECT ma_hop_dong 
            FROM hop_dong 
            WHERE YEAR(ngay_lam_hop_dong) = 2021 AND MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 6)
GROUP BY hd.ma_hop_dong;

/*
13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
*/
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem,sum(ifnull(hdct.so_luong,0))as so_luong
from dich_vu_di_kem as dvdk
join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem 
having so_luong = 
(select sum(ifnull(hdct.so_luong,0))as so_luong_temp
from dich_vu_di_kem as dvdk
join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem 
order by so_luong_temp desc
limit 1)
;

/*
14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
 ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
*/
select hdct.ma_hop_dong,dvdk.ten_dich_vu_di_kem,count(hdct.ma_dich_vu_di_kem)as so_lan_su_dung
from hop_dong_chi_tiet as hdct
join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem 
having so_lan_su_dung = 1;

/*
15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
 so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
*/
select nv.ma_nhan_vien, nv.ho_ten, ten_trinh_do, ten_bo_phan, nv.so_dien_thoai, dia_chi,count(ma_hop_dong)as so_lan_lap_hop_dong
from nhan_vien as nv
join trinh_do as td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan as bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having so_lan_lap_hop_dong<=3 
order by hd.ma_nhan_vien ;





