use quan_ly_sinh_vien;
-- lấy ra môn học có credit lớn nhất
select * from `subject`
where credit = (select max(credit) from `subject`);

-- hiển thị các thông tin môn học có điểm thi lớn nhất
select `subject`.sub_name, max(mark.mark)
from `subject` join mark on `subject`.sub_id = mark.sub_id;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.student_id, student.student_name, avg(mark.mark)
from student join mark on student.student_id = mark.student_id
group by mark.student_id;
