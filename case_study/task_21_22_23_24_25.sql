use case_study_database;
/*21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
 và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
 */
create view v_nhan_vien as
select nv.*
from nhan_vien as nv
join hop_dong as hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where ngay_lam_hop_dong ='2019-12-12' and  dia_chi like '% Hải Châu%';
 
/*22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.*/
set sql_safe_updates = 0;
update v_nhan_vien set dia_chi='Liên Chiểu';
set sql_safe_updates = 1;

/*23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.*/
delimiter //
create procedure sp_xoa_khach_hang (In id_khach_hang int)
begin
	update khach_hang set is_delete = 1
    where ma_khach_hang=id_khach_hang;
end//
delimiter ;
set sql_safe_updates = 0;
call sp_xoa_khach_hang(2);

/*24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải 
thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
*/
delimiter //
create procedure sp_them_moi_hop_dong (sp_ngay_lam_hop_dong DATETIME, sp_ngay_ket_thuc DATETIME, sp_tien_dat_coc DOUBLE , sp_ma_nhan_vien int, sp_ma_khach_hang INT,sp_ma_dich_vu INT)
begin
	declare is_ngay_lam_hop_dong boolean;
    declare is_ngay_ket_thuc boolean;
	declare is_tien_dat_coc boolean;
	declare is_ma_nhan_vien boolean;
	declare is_ma_khach_hang boolean;
	declare is_ma_dich_vu boolean;
    
    set is_ngay_lam_hop_dong = datediff(sp_ngay_lam_hop_dong,curdate())>=0;
    set is_ngay_ket_thuc = datediff(sp_ngay_ket_thuc,sp_ngay_lam_hop_dong)>=0;
    set is_tien_dat_coc = sp_tien_dat_coc >=0;
    set is_ma_nhan_vien = sp_ma_nhan_vien in (select ma_nhan_vien from nhan_vien);
    set is_ma_khach_hang = sp_ma_khach_hang in (select ma_khach_hang from khach_hang);
    set is_ma_dich_vu = sp_ma_dich_vu in (select ma_dich_vu from dich_vu);
    
    if (is_ngay_lam_hop_dong and is_ngay_ket_thuc and is_tien_dat_coc and is_ma_nhan_vien and is_ma_khach_hang and is_ma_dich_vu) then 
	insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
    values (sp_ngay_lam_hop_dong, sp_ngay_ket_thuc, sp_tien_dat_coc, sp_ma_nhan_vien, sp_ma_khach_hang, sp_ma_dich_vu);
    end if;
end //
delimiter ;    
call sp_them_moi_hop_dong('2022-08-14','2022-08-15',0,2,10,2);

/*
25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
*/

delimiter //
create trigger tr_xoa_hop_dong
after update on hop_dong
for each row
begin
	declare dem int;
    select count(ma_hop_dong)into dem from hop_dong where is_delete =0;
	insert into history_hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu,ngay_delete,so_hop_dong_con_lai,is_delete)
    values (old.ngay_lam_hop_dong,old.ngay_ket_thuc,old.tien_dat_coc,old.ma_nhan_vien,old.ma_khach_hang,old.ma_dich_vu,now(),dem,1);
end //
delimiter ;
drop trigger tr_xoa_hop_dong;

set sql_safe_updates =0;
update hop_dong set is_delete =1
where ma_hop_dong=9;
set sql_safe_updates =1;

create table history_hop_dong(
id int primary key auto_increment,
ngay_lam_hop_dong DATETIME,
ngay_ket_thuc DATETIME,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
ngay_delete DATETIME,
so_hop_dong_con_lai int,
is_delete bit default 0);
drop table history_hop_dong;



