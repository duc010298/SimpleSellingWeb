drop database SellingWeb
create database SellingWeb
use SellingWeb

create table Categogy(
	id int primary key identity(1,1),
	name nvarchar(50),
	parent int, 
	status bit
)

select id, name, parent from Categogy

insert into Categogy values(N'GAMING, WORKSTATION PC', 0, 1)
insert into Categogy values(N'LINH KIỆN MÁY TÍNH', 0, 1)
insert into Categogy values(N'LAPTOPS & TABLETS', 0, 1)
insert into Categogy values(N'GAMING GEARS', 0, 1)
insert into Categogy values(N'THIẾT BỊ MẠNG', 0, 1)
insert into Categogy values(N'PHỤ KIỆN, TẢN NHIỆT PC', 0, 1)
insert into Categogy values(N'THIẾT BỊ VĂN PHÒNG', 0, 1)
insert into Categogy values(N'GAMING PC - CHƠI GAME', 1, 1)
insert into Categogy values(N'WORKSTATION - ĐỒ HỌA', 1, 1)
insert into Categogy values(N'MÁY TÍNH ĐỒNG BỘ', 1, 1)
insert into Categogy values(N'BỘ THỰC TẾ ẢO', 1, 1)
insert into Categogy values(N'HOME, OFFICE PC - GIẢI TRÍ', 1, 1)
insert into Categogy values(N'MAINBOARD - BO MẠCH CHỦ', 2, 1)
insert into Categogy values(N'CPU - BỘ VI XỬ LÍ', 2, 1)
insert into Categogy values(N'MONITOR - MÀN HÌNH PC', 2, 1)
insert into Categogy values(N'RAM - BỘ NHỚ TRONG', 2, 1)
insert into Categogy values(N'Ổ CỨNG HDD', 2, 1)
insert into Categogy values(N'VGA - CARD MÀN HÌNH', 2, 1)
insert into Categogy values(N'CASE - VỎ MÁY TÍNH', 2, 1)
insert into Categogy values(N'PSU - NGUỒN MÁY TÍNH', 2, 1)
insert into Categogy values(N'BÀN PHÍM CHUỘT', 2, 1)
insert into Categogy values(N'SSD - Ổ THỂ RẮN', 2, 1)
insert into Categogy values(N'GAMING LAPTOP', 3, 1)
insert into Categogy values(N'LAPTOP VĂN PHÒNG', 3, 1)
insert into Categogy values(N'PHỤ KIỆN - BALO LAPTOP', 3, 1)
insert into Categogy values(N'ĐẾ TẢN NHIỆT LAPTOP', 3, 1)
insert into Categogy values(N'BALO GAMING', 4, 1)
insert into Categogy values(N'BÀN DI CHUỘT', 4, 1)
insert into Categogy values(N'BÀN PHÍM GAMING', 4, 1)
insert into Categogy values(N'BÀN, GHẾ GAME', 4, 1)
insert into Categogy values(N'CHUỘT GAMING', 4, 1)
insert into Categogy values(N'GAMING - HEADPHONE', 4, 1)
insert into Categogy values(N'GIÁ TREO TAI NGHE', 4, 1)
insert into Categogy values(N'MÁY CHƠI GAME CONSOLE', 4, 1)
insert into Categogy values(N'MICROPHONE', 4, 1)
insert into Categogy values(N'TAY CẦM CHƠI GAME', 4, 1)
insert into Categogy values(N'SWITCH', 5, 1)
insert into Categogy values(N'ROUTER WIFI, ACCESSPOINT', 5, 1)
insert into Categogy values(N'MODEM ADSL INTERNET', 5, 1)
insert into Categogy values(N'CARD MẠNG - WIRELESS', 5, 1)
insert into Categogy values(N'DÂY RISER', 6, 1)
insert into Categogy values(N'GIÁ ĐỠ VGA', 6, 1)
insert into Categogy values(N'TẢN NHIỆT KHÍ CHO PC', 6, 1)
insert into Categogy values(N'TẢN NƯỚC ALL IN ONE', 6, 1)
insert into Categogy values(N'TẢN NƯỚC CUSTOM', 6, 1)
insert into Categogy values(N'QUẠT TẢN NHIỆT PC', 6, 1)
insert into Categogy values(N'BÀN PHÍM CHUỘT KHÔNG DÂY', 7, 1)
insert into Categogy values(N'BỘ CHIA USB', 7, 1)
insert into Categogy values(N'BỘ LƯU ĐIỆN', 7, 1)
insert into Categogy values(N'LOA MÁY TÍNH', 7, 1)
insert into Categogy values(N'HDD BOX', 7, 1)
insert into Categogy values(N'LOA VĂN PHÒNG', 7, 1)
insert into Categogy values(N'PHẦN MỀM BẢN QUYỀN', 7, 1)
insert into Categogy values(N'USB FLASH', 7, 1)
insert into Categogy values(N'WEBCOME', 7, 1)
insert into Categogy values(N'MÁY IN LASER', 7, 1)
insert into Categogy values(N'BỘ LƯU ĐIỆN', 7, 1)

create table Product(
	id int primary key identity(1,1),
	name nvarchar(100),
	quantity int,
	price money,
	picture varchar(100),
	description nvarchar(max),
	status int,
	lastmodifier date
)

select top 50 id, name, quantity, price, picture, description from Product where status=1 order by convert(DateTime, lastmodifier,101) desc

create table Category_Product(
	productID int foreign key references Product(id),
	categoryID int foreign key references Categogy(id),
)

create table Customer(
	id int primary key identity(1,1),
	name nvarchar(50),
	address nvarchar(50),
	phone varchar(30),
	username varchar(30),
	password varchar(32),
	status bit
)
