create database if not exists quan_ly_diem_thi;
use quan_ly_diem_thi;

create table hoc_sinh (
maHS varchar(20) not null,
tenHS varchar (50),
ngaySinh date,
lop varchar (20),
gioiTinh bit,
primary key (maHS)
);

create table mon_hoc (
maMH varchar (20),
tenMH varchar (20),
primary key (maMH)
);

create table bang_diem (
maHS varchar(20),
maMH varchar (20),
diemThi int,
ngayKetThuc date,
primary key (maHS, maMH),
foreign key (maHS) references hoc_sinh (maHS),
foreign key (maMH) references mon_hoc (maMh)
);
create table giao_vien (
maGV varchar (20),
tenGV varchar (50),
soDT varchar (20),
primary key (maGV)
);

alter table mon_hoc add maGV varchar (20);
