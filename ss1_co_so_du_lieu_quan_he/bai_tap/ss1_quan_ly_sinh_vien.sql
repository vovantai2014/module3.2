create database if not exists ss1_quanlysinhvien;
use ss1_quanlysinhvien;
create table sinh_vien (
studentId int not null auto_increment,
studentName varchar (50),
studentAge int,
studentCountry varchar (50),
primary key (studentId)
);