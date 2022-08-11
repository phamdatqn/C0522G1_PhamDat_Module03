USE quan_ly_sinh_vien;
-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from `subject`
order by credit desc
limit 1;

-- 2. Hiển thị các thông tin môn học có điểm thi lớn nhất.
select `subject`.subject_id,subject_name,credit,max(mark) as max_mark
from `subject` 
join mark on mark.subject_id = `subject`.subject_id ;

-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.student_id, student_name, avg(mark) as diem_trung_binh
from student
join mark on student.student_id = mark.student_id
group by student.student_id
order by diem_trung_binh desc;
