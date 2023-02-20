create database if not exists ss2_thuchanh_3_quan_ly_sinh_vien;
use ss2_thuchanh_3_quan_ly_sinh_vien;

create table class (
class_id varchar (10) not null,
class_name varchar (60) not null,
start_date datetime,
`status` bit,
primary key (class_id )
);

create table student (
student_id varchar(10) not null,
student_name varchar (30) not null,
address varchar (50),
phone varchar (20),
`status` bit,
class_id varchar (10) not null,
primary key (student_id),
foreign key (class_id) references class (class_id)
);

create table `subject` (
sub_id varchar(10) not null,
sub_name varchar (30) not null,
credit tinyint not null default 1 check (credit >=1),
`status` bit default 1,
primary key (sub_id) 
);

create table mark (
mark_id int not null auto_increment,
sub_id varchar(10) not null,
student_id varchar(10) not null,
mark float default 0 check (mark between 0 and 100),
primary key (mark_id),
foreign key (sub_id) references `subject` (sub_id),
foreign key (student_id) references student (student_id)
);

insert into class (class_id, class_name, start_date, status)
values ('A101', 'A1', '2008-12-20', 1),
       ('A102', 'A2', '2008-12-22', 1),
       ('B101', 'B3', '2008-12-24', 0);

insert into student (student_id ,student_name ,address,phone, status, class_id)
values ('SV01', 'Nguyen Van Hung', 'Ba Dinh - Ha Noi', '0908765432', 1,  'A101'),
       ('SV02', 'Le Thi Hoa', 'Le Chan - Hai Phong', '0905334322', 1,  'A101'),
       ('SV03', 'Tran Xuan Manhj', 'Tan Binh - HCM', '0772324252', 0,  'A102');
       
insert into `subject` (sub_id, sub_name, credit,status )
values ('T01', 'Toan CC 1', 5, 1),
       ('VL01', 'Vat Ly  1', 6, 1),
       ('TH01', 'Tin Van Phong', 5, 1),
       ('CT01', 'Ly Luan Chinh Tri', 10, 1);

insert into mark (mark_id, sub_id, student_id, mark)
values (1, 'T01', 'SV01', 8),
	   (2, 'T01', 'SV02', 10),
       (3, 'VL01', 'SV01', 12);
-- Hiển thị danh sách tất cả các học viên
select * from student;
-- Hiển thị danh sách các học viên đang theo học.
select * from student
where status = 1;
-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select * from `subject`
where credit <10;
-- Hiển thị danh sách học viên lớp A1
select s.student_id, s.student_name, c.class_name
from student s join class c on s.class_id = c.class_id
where class_name = 'A1';
-- Hiển thị điểm môn Toan CC1 của các học viên.
select S.student_id , s.sub_id, s.sub_name, m.mark
from subject s join mark m on m.sub_id = m.sub_id
               join student S on S.student_id = m.student_id
where sub_name = 'Toan CC 1';

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘n’
select * from student 
where student_name like 'n%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class
where month(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject`
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set class_id = 'A102' 
where student_name = 'Nguyen Van Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select S.student_name, Sub.sub_name, M.mark
from student S join mark M on S.student_id = M.student_id
join subject Sub on Sub.sub_id = M.sub_id
order by mark desc, student_name asc;

-- THUC HANH --
-- Hiển thị số lượng sinh viên ở từng nơi
select address, count(student_id) as 'so_luong_sinh_vien_tung_noi'
from student
group by (address);

-- Tính điểm trung bình các môn học của mỗi học viên
select S.student_id, S.student_name, avg(mark)
from student S join mark M on S.student_id = M.student_id
group by S.student_id, S.student_name;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select S.student_id, S.student_name, avg(mark)
from student S join mark M on S.student_id = M.student_id
group by S.student_id, S.student_name
having avg(mark) >15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select S.student_id, S.student_name, avg(mark)
from student S join mark M on S.student_id = M.student_id
group by S.student_id, S.student_name
having avg(mark) >= all (select avg(mark) from mark group by mark.student_id);

-- BAI TAP
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select Sub.sub_id, Sub.sub_name, Sub.credit
from `subject` Sub
where credit = (select max(Sub.credit) from `subject` Sub);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select Sub.sub_id, Sub.sub_name, M.mark
from `subject` Sub join mark M on Sub.sub_id = M.sub_id
where M.mark = (select max(M.mark) from mark M);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select S.student_id, S.student_name, avg(M.mark)
from student S join mark M on S.student_id = M.student_id
group by S.student_id, S.student_name
order by avg(M.mark) desc;    