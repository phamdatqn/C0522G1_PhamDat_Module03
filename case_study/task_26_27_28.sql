use case_study_database;

/*
26. Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau:
 Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo
 “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
*/
delimiter //
create trigger tr_cap_nhat_hop_dong
before update on hop_dong
for each row
begin
	declare so_ngay_thue int ;
    set so_ngay_thue = datediff(new.ngay_ket_thuc,ngay_lam_hop_dong);
    if(so_ngay_thue<2) then
		signal sqlstate '45000'
        set message_text = "LỖI: Ngày thuê phải lớn hơn 2 ngày !!!";
	end if;
end //
delimiter ;
drop trigger tr_cap_nhat_hop_dong;

update hop_dong 
set ngay_ket_thuc = '2020-12-12'
where ma_hop_dong = 1;

/*
27.	Tạo Function thực hiện yêu cầu sau:
a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã 
thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
 Mã của khách hàng được truyền vào như là 1 tham số của function này.
*/
delimiter //
create function func_dem_dich_vu()
returns int
deterministic
begin
	declare dem int;
    select count(temp.ma_dich_vu)into dem from 
	(select dv.ma_dich_vu,(ifnull(dv.chi_phi_thue,0)+sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)))as tong_chi_phi_thue
	FROM khach_hang as kh
	join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
	left join hop_dong as hd on kh.ma_khach_hang= hd.ma_khach_hang
	left join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
	left join hop_dong_chi_tiet as hdct on  hd.ma_hop_dong = hdct.ma_hop_dong
	left join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
	group by dv.ma_dich_vu
    having tong_chi_phi_thue >2000000) as temp;
    return dem;
end //
delimiter ;

select func_dem_dich_vu();


