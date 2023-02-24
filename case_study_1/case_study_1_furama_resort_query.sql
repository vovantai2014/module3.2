use case_study_1;
-- Câu 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien 
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%'
and char_length(ho_ten) <= 15;

-- Câu 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang 
where (year(curdate()) - year(ngay_sinh)between 18 and 50 ) 
and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';

-- Câu 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select KH.ma_khach_hang, KH.ho_ten, count(KH.ma_khach_hang) as so_lan_thue 
from khach_hang KH 
join hop_dong HD on KH.ma_khach_hang = HD.ma_khach_hang
join loai_khach LK on KH.ma_loai_khach = LK.ma_loai_khach
where LK.ten_loai_khach = 'Diamond'
group by KH.ma_khach_hang
order by so_lan_thue asc;

-- Câu 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select KH.ma_khach_hang, KH.ho_ten, LK.ten_loai_khach, 
	   HD.ma_hop_dong, DV.ten_dich_vu, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc,
       sum(DV.chi_phi_thue + (HDCT.so_luong * DVDK.gia)) as tong_tien
   from khach_hang KH
   left join loai_khach LK on KH.ma_loai_khach = LK.ma_loai_khach
   left join hop_dong HD on HD.ma_khach_hang = KH.ma_khach_hang
   left join dich_vu DV on DV.ma_dich_vu = HD.ma_dich_vu
   left join hop_dong_chi_tiet HDCT on HDCT.ma_hop_dong = HD.ma_hop_dong
   left join dich_vu_di_kem DVDK on DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
   group by KH.ma_khach_hang;
   
-- Câu 6: Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng 
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.chi_phi_thue, LDV.ten_loai_dich_vu
from dich_vu DV
join loai_dich_vu LDV on LDV.ma_loai_dich_vu = DV.ma_loai_dich_vu
where DV.ma_dich_vu NOT IN 
(
select DV.ma_dich_vu from dich_vu DV
join loai_dich_vu LDV on LDV.ma_loai_dich_vu = DV.ma_loai_dich_vu
join hop_dong HD on HD.ma_dich_vu = DV.ma_dich_vu
where month(HD.ngay_lam_hop_dong) between 1 and 3 and year(HD.ngay_lam_hop_dong) = 2021
);

-- Câu 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.so_nguoi_toi_da, DV.chi_phi_thue, LDV.ten_loai_dich_vu
from dich_vu DV
join loai_dich_vu LDV on LDV.ma_loai_dich_vu = DV.ma_loai_dich_vu
join hop_dong HD on HD.ma_dich_vu = DV.ma_dich_vu
where year(HD.ngay_lam_hop_dong) = 2020 and DV.ma_dich_vu NOT IN 
(
select DV.ma_dich_vu from dich_vu DV
join loai_dich_vu LDV on DV.ma_loai_dich_vu = LDV.ma_loai_dich_vu
join hop_dong HD on HD.ma_dich_vu = DV.ma_dich_vu
where year(HD.ngay_lam_hop_dong) = 2021
)
group by DV.ma_dich_vu;

-- Câu 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select ho_ten
from khach_hang  
group by ho_ten;

select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

select distinct ho_ten
from khach_hang;

-- Câu 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong),count( month(ngay_lam_hop_dong)) as so_luong_khach_da_dat_phong_2021 
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);

-- Câu 10: Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select
    HD.ma_hop_dong,
    HD.ngay_lam_hop_dong,
    HD.ngay_ket_thuc,
    HD.tien_dat_coc,
    SUM(HDCT.so_luong) as 'so_luong_dich_vu_di_kem'
from hop_dong HD
left join hop_dong_chi_tiet HDCT on HD.ma_hop_dong = HDCT.ma_hop_dong
group by ma_hop_dong
order by ma_hop_dong;

-- Câu 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select DVDK.*
from dich_vu_di_kem DVDK
join HDCT on DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
join khach_hang KH on HD.ma_khach_hang = KH.ma_khach_hang
join loai_khach LK on KH.ma_loai_khach = LK.ma_loai_khach
where
	(LK.ten_loai_khach = 'Diamond'
	 and (KH.dia_chi like '%Vinh'
	 or KH.dia_chi like '%Quảng Ngãi')
	);

-- Câu 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select HD.ma_hop_dong, NV.ho_ten, KH.ho_ten, KH.so_dien_thoai, 
       DV.ten_dich_vu, sum(HDCT.so_luong) as so_luong_dich_vu_di_kem,
       HD.tien_dat_coc
from khach_hang KH
join hop_dong HD on HD.ma_khach_hang = KH.ma_khach_hang
join nhan_vien NV on NV.ma_nhan_vien = HD.ma_nhan_vien
join hop_dong_chi_tiet HDCT on HDCT.ma_hop_dong = HD.ma_hop_dong
join dich_vu DV on DV.ma_dich_vu = HD.ma_dich_vu
where month(HD.ngay_lam_hop_dong) between 10 and 12 and year(HD.ngay_lam_hop_dong) = 2020 and HD.ma_hop_dong not in (
select HD.ma_hop_dong
from hop_dong HD
where month(HD.ngay_lam_hop_dong) between 1 and 6 and year(HD.ngay_lam_hop_dong) = 2021
);

-- Câu 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select DVDK.*, sum(HDCT.so_luong) as so_lan_su_dung
from dich_vu_di_kem DVDK
join hop_dong_chi_tiet HDCT on DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
group by HDCT.ma_dich_vu_di_kem
having so_lan_su_dung = (select sum(HDCT.so_luong)
    from hop_dong_chi_tiet HDCT
	join dich_vu_di_kem DVDK on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
    group by HDCT.ma_dich_vu_di_kem
    order by sum(HDCT.so_luong) desc
    limit 1);

