drop database SellingWeb
create database SellingWeb
use SellingWeb

create table Category(
	id int primary key identity(1,1),
	name nvarchar(50),
	parent int, 
	status bit
)

insert into Category values(N'GAMING, WORKSTATION PC', 0, 1)
insert into Category values(N'LINH KIỆN MÁY TÍNH', 0, 1)
insert into Category values(N'LAPTOPS & TABLETS', 0, 1)
insert into Category values(N'GAMING GEARS', 0, 1)
insert into Category values(N'THIẾT BỊ MẠNG', 0, 1)
insert into Category values(N'PHỤ KIỆN, TẢN NHIỆT PC', 0, 1)
insert into Category values(N'THIẾT BỊ VĂN PHÒNG', 0, 1)
insert into Category values(N'GAMING PC - CHƠI GAME', 1, 1)
insert into Category values(N'WORKSTATION - ĐỒ HỌA', 1, 1)
insert into Category values(N'MÁY TÍNH ĐỒNG BỘ', 1, 1)
insert into Category values(N'BỘ THỰC TẾ ẢO', 1, 1)
insert into Category values(N'HOME, OFFICE PC - GIẢI TRÍ', 1, 1)
insert into Category values(N'MAINBOARD - BO MẠCH CHỦ', 2, 1)
insert into Category values(N'CPU - BỘ VI XỬ LÍ', 2, 1)
insert into Category values(N'MONITOR - MÀN HÌNH PC', 2, 1)
insert into Category values(N'RAM - BỘ NHỚ TRONG', 2, 1)
insert into Category values(N'Ổ CỨNG HDD', 2, 1)
insert into Category values(N'VGA - CARD MÀN HÌNH', 2, 1)
insert into Category values(N'CASE - VỎ MÁY TÍNH', 2, 1)
insert into Category values(N'PSU - NGUỒN MÁY TÍNH', 2, 1)
insert into Category values(N'BÀN PHÍM CHUỘT', 2, 1)
insert into Category values(N'SSD - Ổ THỂ RẮN', 2, 1)
insert into Category values(N'GAMING LAPTOP', 3, 1)
insert into Category values(N'LAPTOP VĂN PHÒNG', 3, 1)
insert into Category values(N'PHỤ KIỆN - BALO LAPTOP', 3, 1)
insert into Category values(N'ĐẾ TẢN NHIỆT LAPTOP', 3, 1)
insert into Category values(N'BALO GAMING', 4, 1)
insert into Category values(N'BÀN DI CHUỘT', 4, 1)
insert into Category values(N'BÀN PHÍM GAMING', 4, 1)
insert into Category values(N'BÀN, GHẾ GAME', 4, 1)
insert into Category values(N'CHUỘT GAMING', 4, 1)
insert into Category values(N'GAMING - HEADPHONE', 4, 1)
insert into Category values(N'GIÁ TREO TAI NGHE', 4, 1)
insert into Category values(N'MÁY CHƠI GAME CONSOLE', 4, 1)
insert into Category values(N'MICROPHONE', 4, 1)
insert into Category values(N'TAY CẦM CHƠI GAME', 4, 1)
insert into Category values(N'SWITCH', 5, 1)
insert into Category values(N'ROUTER WIFI, ACCESSPOINT', 5, 1)
insert into Category values(N'MODEM ADSL INTERNET', 5, 1)
insert into Category values(N'CARD MẠNG - WIRELESS', 5, 1)
insert into Category values(N'DÂY RISER', 6, 1)
insert into Category values(N'GIÁ ĐỠ VGA', 6, 1)
insert into Category values(N'TẢN NHIỆT KHÍ CHO PC', 6, 1)
insert into Category values(N'TẢN NƯỚC ALL IN ONE', 6, 1)
insert into Category values(N'TẢN NƯỚC CUSTOM', 6, 1)
insert into Category values(N'QUẠT TẢN NHIỆT PC', 6, 1)
insert into Category values(N'BÀN PHÍM CHUỘT KHÔNG DÂY', 7, 1)
insert into Category values(N'BỘ CHIA USB', 7, 1)
insert into Category values(N'BỘ LƯU ĐIỆN', 7, 1)
insert into Category values(N'LOA MÁY TÍNH', 7, 1)
insert into Category values(N'HDD BOX', 7, 1)
insert into Category values(N'LOA VĂN PHÒNG', 7, 1)
insert into Category values(N'PHẦN MỀM BẢN QUYỀN', 7, 1)
insert into Category values(N'USB FLASH', 7, 1)
insert into Category values(N'WEBCOME', 7, 1)
insert into Category values(N'MÁY IN LASER', 7, 1)
insert into Category values(N'BỘ LƯU ĐIỆN', 7, 1)

create table Product(
	id varchar(32) primary key,
	name nvarchar(max),
	quantity int,
	price money,
	picture varchar(max),
	description nvarchar(max),
	status int,
	lastmodifier date
)

create table Category_Product(
	productID varchar(32) foreign key references Product(id),
	categoryID int foreign key references Category(id),
)

--primary key Category_Product

create table Customer(
	id varchar(32) primary key,
	name nvarchar(50),
	address nvarchar(50),
	phone varchar(30),
	username varchar(30),
	password VARCHAR(128),
	status bit
)

create table Invoice (
	id varchar(32) primary key,
	date datetime default getdate(),
	customerId varchar(32) foreign key references Customer(id),
	name nvarchar(50),
	address nvarchar(50),
	phone varchar(20),
	total money,
	status int
)

create table InvoiceDetail(
	invoiceId varchar(32) foreign key references Invoice(id),
	productId varchar(32) foreign key references Product(id),
	quantity int,
	price money, 
	primary key( invoiceId, productId)
)

create table Admin (
	username varchar(30) primary key,
	password varchar(128),
	status bit default 1
)

insert into admin values('admin','$2a$10$r7CTAAZ6MLLBWoIUPZBEdeL8Y7qB7UGhL9JF4jTcE5q3dh7Lm8pWW',1)