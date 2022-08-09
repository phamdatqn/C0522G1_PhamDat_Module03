use case_study_database;
select ma_nhan_vien, ho_ten,char_length(ho_ten) as ty
from nhan_vien
where ho_ten like 'K%' or ho_ten like 'H%' or ho_ten like 'T%' and char_length(ho_ten)<=15;