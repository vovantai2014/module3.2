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
insert into customer (cusName,cusAge )
values ('Minh Quan', 10),
       ('Ngoc Oanh', 20),
       ('Hong Ha', 50);
insert into `order` (cusId,orderDate,totalprice)
values (1, '2006-03-21', 900000),
       (2, '2006-03-23', 1200000),
       (1, '2006-03-16', 715000);
insert into product (productName,productPrice)
values ('May Giat', 3),
       ('Tu Lanh', 5),
       ('Dieu Hoa', 7),
       ('Quat', 1),
       ('Bep Dien', 2);
       
insert into order_detail (orderId,productId, odQTY )
values (1,1,3),
	   (1,3,7),
       (1,4,2),
       (2,1,1),
       (3,1,8),
       (2,5,4),
       (2,3,3);
       select * from order_detail;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select orderId as oID, orderDate as oDate, totalprice as oPrice
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select C.cusId as ma_khach_hang, C.cusName as ten_khach_hang, O.orderDate as ngay_mua_hang, O.totalprice as tong_tien
from customer C join `order` O on C.cusId = O.cusId;

select P.productName as ten_san_pham, C.cusName as ten_khach_hang
from customer C join `order` O on C.cusId = O.cusId
join order_detail OD on OD.orderId = O.orderId
join product P on P.productId = OD.productId;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select C.cusName, O.orderId, O.totalprice 
from customer C join `order` O on C.cusId = O.cusId
where O.totalprice = null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select OD.orderId, O.orderDate, OD.odQTY * P.productPrice as tong_tien
from `order` O join order_detail OD on OD.orderId = O.orderId
join product P on P.productId = OD.productId;

       