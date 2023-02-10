create database if not exists ss2_bai2_quan_ly_ban_hang;
use ss2_bai2_quan_ly_ban_hang;

create table customer (
cusId int not null auto_increment primary key,
cusName varchar (50) not null,
cusAge int not null default 0
);
create table `order` (
orderId int not null auto_increment primary key,
cusId int not null,
orderDate datetime not null,
totalprice float not null check (totalprice > 0),
foreign key (cusId) references customer (cusId)
);
create table product (
productId int not null auto_increment primary key,
productName varchar (50) not null,
productPrice float not null check (productPrice > 0)
);
create table order_detail
(
orderId int not null,
productId int not null,
odQTY int not null,
primary key (orderId, productId),
foreign key (orderId) references `order` (orderId),
foreign key (productId) references product (productId)
);