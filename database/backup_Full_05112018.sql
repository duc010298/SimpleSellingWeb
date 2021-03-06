USE [master]
GO
/****** Object:  Database [SellingWeb]    Script Date: 11/05/2018 09:13:13 ******/
CREATE DATABASE [SellingWeb] ON  PRIMARY 
( NAME = N'SellingWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SellingWeb.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SellingWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SellingWeb_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SellingWeb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SellingWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SellingWeb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SellingWeb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SellingWeb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SellingWeb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SellingWeb] SET ARITHABORT OFF
GO
ALTER DATABASE [SellingWeb] SET AUTO_CLOSE ON
GO
ALTER DATABASE [SellingWeb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SellingWeb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SellingWeb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SellingWeb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SellingWeb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SellingWeb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SellingWeb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SellingWeb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SellingWeb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SellingWeb] SET  ENABLE_BROKER
GO
ALTER DATABASE [SellingWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SellingWeb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SellingWeb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SellingWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SellingWeb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SellingWeb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SellingWeb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SellingWeb] SET  READ_WRITE
GO
ALTER DATABASE [SellingWeb] SET RECOVERY SIMPLE
GO
ALTER DATABASE [SellingWeb] SET  MULTI_USER
GO
ALTER DATABASE [SellingWeb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SellingWeb] SET DB_CHAINING OFF
GO
USE [SellingWeb]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/05/2018 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[id] [varchar](32) NOT NULL,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[picture] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
	[lastmodifier] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'030f3e598bc34fbc81a8e472bf89e4b6', N'Laptop Dell Inspiron 5567 M5I5384W', 3, 15540000.0000, N'https://www.tncstore.vn/image/cache/catalog/LapTop/dell/Inspiron%205567A/9006_dell_inspiron-500x500.jpg', N'Mô tả sản phẩm
Intel Core™ i5 7200U (2*2.5Ghz, 3MB cache) 
Bộ nhớ trong	4GB DDR4 2400Mhz 
VGA	AMD Radeon R7 M445 2G DDR5 
Ổ cứng	1TB SATA 5400rpm 
Ổ quang	DVDRW 
Card Reader	yes 
Bảo mật, công nghệ	Led Keyboard 
Màn hình 15.6” LED-Backlit', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'0354c52bd3d64ccfae27324ba0e6c64e', N'Bàn phím không dây Logitech K270', 3, 449000.0000, N'https://www.tncstore.vn/image/cache/catalog/ban%20phim/K270%20/K270-a-500x500.jpg', N'Mô tả sản phẩm
kết nối liên kết nhanh chóng
Các keycaps siêu mỏng
Thiết kế nhỏ gọn, đơn giản
Phím gõ nhanh và thoải mái', 0, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'06662ebf3d0d44069f477cc467d41d2b', N'Bo mạch chủ ASUS ROG STRIX Z370G GAMING', 0, 5259000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/asus%20z390/bo-mach-chu-z390-E-3-500x500.jpg', N'Mô tả sản phẩm
Socket : 1151

Chipset : Z390

Slot : 4 Khe RAM

Hỗ trợ NVME', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'08b3e68811154e1f91fba4b625f91785', N'Bàn phím không dây Logitech Bluetooth k480', 3, 999000.0000, N'https://www.tncstore.vn/image/cache/catalog/ban%20phim%20khong%20day/B%C3%A0n%20ph%C3%ADm%20v%C3%A0%20chu%E1%BB%99t%20Logitech%20Bluetooth%20k480/b%C3%A0n-ph%C3%ADm-v%C3%A0-chu%E1%BB%99t-logitech-bluetooth-k480-a-500x500.jpg', N'Mô tả sản phẩm
Có thể kết nối cùng lúc 3 thiết bị 
Khoảng cách hoạt động : 10m
Phím dạng chiclet bo tròn,phát ra tiếng kêu vừa đủ
Lực nhấn nhẹ nên có thể nhặp liệu trong thời gian dài
Thiết kế thời trang', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'08da18313f4646bd94b1f89743b845a2', N'Laptop Asus A556UR-DM263D', 3, 13490000.0000, N'https://www.tncstore.vn/image/cache/catalog/Laptop%20asus/A556UR-DM263D/laptop-asus-a556ur-dm263d-a-500x500.jpg', N'Mô tả sản phẩm
Bộ vi xử lý Intel Core i5-7200U
Dung lượng 500GB SATA3
Bộ nhớ trong 4GB DDR4 2133Mhz
VGA nVidia Geforce GT930MX 2GB
Màn hình 15.6" (16:9) LED backlit Full HD.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'0b2831577a6a443db14cc1a0b4df58c9', N'GAMING PC - COD 1070Ti', 15, 30625000.0000, N'https://www.tncstore.vn/image/cache/catalog/11112/COD%20PC/ava_ava%20112-500x500.jpg', N'Mô tả sản phẩm
- CPU: Intel Core i5 8400 2.8Ghz Turbo Up to 4Ghz/9MB/6 Cores, 6 Threads

- Mainboard: ASUS ROG STRIX B360-G GAMING

- RAM: Kingston HyperX Fury 16G (2x8GB) DDR4 Bus 2400Mhz

- Card đồ họa: ASUS ROG STRIX GEFORCE GTX 1070 TI A8G

- Nguồn: Andyson GX600 80Plus Gold

- SSD: Ổ cứng SSD ADATA XPG SX6000 128GB M2 NVMe 2280

- Vỏ Case NZXT H500 (Black/Red)

- Tản nhiệt khí: CPU DeepCool GAMMAXX GT', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'0c3653930d3145678681601c487aab23', N'Bo mạch chủ ASUS ROG STRIX X470-F GAMING', 10, 6599000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/asus%20x470%20F%20gaming/bo-mach-chu-asus-rog-strix-x470-f-gaming-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
- Socket AM4 cho bộ xử lý AMD Ryzen ™ 

- Công nghệ chiếu sáng RGB đồng bộ hoạt động với một danh mục rộng các thiết bị PC có khả năng đồng bộ hóa Aura Sync 

- Tích hợp M.2 Heatsink cung cấp khả năng làm mát cho ổ M.2, mang lại hiệu suất lưu trữ ổn định và tăng độ tin cậy 

- Kết nối trò chơi: Intel Gigabit Ethernet, LANGaurd, đôi M.2, USB 3.1 Gen 2 

- Tối ưu hóa 5 cách: Tự động điều chỉnh toàn bộ hệ thống, cung cấp các tính năng ép xung và làm mát được thiết kế riêng cho bộ máy của bạn ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'0d891a9fc8a443f992bd4d0d53c4602e', N'Bo mạch chủ ASUS ROG STRIX Z370G GAMING', 0, 4899000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/z370G%20Gaming/mainboard-asus-rog-strix-z370g-gaming-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Socket LGA1151 cho các bộ vi xử lý máy tính để bàn Intel® Core™ Thế hệ thứ 8.

Aura Sync RGB: Đồng bộ hệ thống đèn LED với một loạt các phụ kiện PC tương thích.

Tối ưu 5 Chiều: Tinh chỉnh tự động toàn hệ thống, cung cấp các cấu hình ép xung và làm mát được tùy chỉnh cho hệ thống của bạn.

Âm thanh gaming: SupremeFX S1220A kết hợp với Sonic Studio III mang tới quang cảnh âm thanh đưa bạn nhập tâm sâu hơn vào hành động.

GKhả năng kết nối gaming: Các đầu cắm M.2 Kép và USB 3.1 Thế hệ 2 Loại A.', 0, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'0de1f8a590f94780bebc533627767803', N'Màn hình Acer ET241Y 23.8'''' FHD 60Hz', 3, 3370000.0000, N'https://www.tncstore.vn/image/cache/catalog/man%20hinh/M%C3%A0n%20h%C3%ACnh%20Acer/Acer%20ET241Y/man-hinh-acer-et241y-fhd-60hz-tncstore-d-500x500.jpg', N'Mô tả sản phẩm
Màn hình Acer ET241Y 23.8'''' FHD 60Hz – Đen

- Kích thước: 23.8 inch 

- Tấm nền: IPS 

- Độ phân giải: Full HD (1920x1080) 

- Tốc độ làm mới: 60Hz 

- Thời gian đáp ứng: 4ms 

- Cổng kết nối: VGA, HDMI

- Phụ kiện: Cáp VGA', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'10a1ab0a5df64aa3a85c01c1c8ccc81b', N'Card Màn Hình ASUS Turbo RTX 2080 Ti GAMING OC 11G', 5, 33190000.0000, N'https://www.tncstore.vn/image/cache/catalog/vga/asus/Turbo%202080ti/card-man-hinh-asus-turbo-rtx-2080-ti-gaming-oc-11gb-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
Asus Turbo GeForce RTX 2080Ti

- Dung lượng bộ nhớ: 11GB GDDR6

- Băng thông: 352-bit 

- Giao diện: PCI-E 3.0 x 16

- Kết nối: DisplayPort 1.4 x3, HDMI 2.0b x1, USB Type-C ™ (support VirtualLinkTM) x1

- Nguồn đề nghị: 650W.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'1248a26bf9ac47f0b8c5c99b64bdcc38', N'GAMING PC - GLACIER 1050', 15, 10964000.0000, N'https://www.tncstore.vn/image/cache/catalog/case%20gaming%20/Glacier%2010503gb/Artboard%203-500x500.png', N'Mô tả sản phẩm
- CPU : Intel Pentium G5400 3.70 GHz / 4MB / UHD 610 / Socket 1151 (Coffelake)

- MAIN: Asrock H310M-HDV

- VGA : Galax GeForce GTX 1050 OC

- RAM : 8GB DDR4-2400 ( 4GB x 2 ) - Đã gồm ưu đãi tặng RAM

- PSU : Raidmax 400W RX-400XT

- CASE: Xigmatek Scorpio

- SSD : Apacer Panther 2.5 inch Sata III 120GB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'1783a35f5d3d4c599f46eb5008b76f81', N'Chuột Cougar Minos x2', 3, 380000.0000, N'https://www.tncstore.vn/image/cache/catalog/chu%E1%BB%99t/cougar/minos%20x2/chuot-cougar-minos-x2-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: Cougar
- Led : Cam

- Có Dây', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'1cb64c95643e4deabb62f6bcf5175b78', N'Ram Kingston HyperX Fury White 8GB DDR4 Bus 2400 MHz', 1, 2289000.0000, N'https://www.tncstore.vn/image/cache/catalog/Chuot/fury/1r-500x500.jpg', N'Mô tả sản phẩm
- Nhà sản xuất Kingston (USA)

- Model HX424C15FB/8

- Chuẩn RAM DDR4

- Bus hỗ trợ 2400MHz

- Dung lượng 8 GB (1x8GB)

- Điện áp 1.2v', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'1ef7c9de6f1c437a86f874dfe8546a2d', N'Túi đựng bàn phím Razer keyboard bag', 5, 899000.0000, N'https://www.tncstore.vn/image/cache/catalog/razer/t%C3%BAi%20b%C3%A0n%20ph%C3%ADm/Razer-Keyboard-Bag-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Tear-resistant, weather-proof heavy duty 1680D ballistic nylon outer shell to withstand everyday abuse.

Water-resistant Ripstop nylon inner lining for added durability.

Padded carrying strap.

Single shoulder sling design for added mobility.

Built in compartments for up to one gaming keyboard, gaming peripherals and portable gaming devices', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'20bcfc27851341bbb7f1c1f59ad79eb0', N'CPU Intel Core i7 - 7740X 4.3 GHz Turbo 4.5 GHz', 5, 8799000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/7740x/cpu-intel-core-i7-7740x-43-ghz-turbo-45-ghz-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Bộ vi xử lí Intel Core i7 - 7740X cấu tạo bởi 4 lõi vi xử lý 8 phân luồng

- Bên cạnh đó tần số cơ sở của bộ xử lý là 4,3 GHz  và nguồn điện tiêu thụ 112 watt

- BVXL intel core i7 được intel xây dựng trên công nghệ mới nhất

- Hãng sản xuất: intel

- socket: 2066', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'210edc45c7b940dca1f66b58196cc6ac', N'Microphone Razer Seirēn - Elite USB Digital', 5, 4444000.0000, N'https://www.tncstore.vn/image/cache/catalog/Microphone/microphone-razer-reir%C4%93n-lite-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Kết nối USB

- Công tắc bật tắt Bộ lọc cao tần

- Hỗ trợ Razer Synapse

- Cáp nối USB với USB mini

- Cáp mở rộng âm thanh 3,5mm', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'224c7445eb7b4736b97a1d79e9c93619', N'Màn hình LCD ACER NITRO VG270UP - 27INCH 2K IPS 144HZ FREESYNC', 3, 9650000.0000, N'https://www.tncstore.vn/image/cache/catalog/123/4-500x500.jpg', N'Mô tả sản phẩm
- Kích thước màn hình:    27"

- Độ phân giải tối đa:        2560 x 1440 @144 Hz

- Loại hình Panel:             IPS

- Thời gian đáp ứng:        1ms (VRB)

- Độ sáng:                          350 nits (cd/m2)

- Xem góc:                         178°(H),178°(V)

- Màu:                              16,7 triệu

- Bit / Color gamut 8 Bit / 99% sRGB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'2289672a770c4f20a8410479aeae3707', N'Giá treo tai nghe Corsair ST100 RGB Headset Soundcard 7.1', 20, 2149000.0000, N'https://www.tncstore.vn/image/cache/catalog/Gi%C3%A1%20treo%20tai%20nghe/Corsair/St100/gia-treo-tai-nghe-corsair-st100rgb-premium-headset-soundcard-7-1-surround-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
Giá treo tai nghe Corsair ST100 RGB + Soundcard 7.1 

Giá treo tai nghe siêu cao cấp 

LED RGB 16.8 triệu màu, đồng bộ bằng phần mềm CUE 

Tích hợp chíp xử lý âm thanh 7.1 cao cấp, hỗ trợ mọi loại tai nghe 

Tích hợp 2 cổng USB3.1 Type A.', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'261479da14934d0daa72fbf1148a4bed', N'Túi đeo chéo Razer Blade Nylon Stealth Bag - 17''''', 5, 2399000.0000, N'https://www.tncstore.vn/image/cache/catalog/razer/nylon%20bag/cap-cheo-razer-17-stealth-messenger-satchel-tncstore-2-500x500.jpg', N'Mô tả sản phẩm
Kích thước và Trọng lượng:
Chiều rộng 450mm 
Chiều sâu 65mm
Chiều cao 302mm 
Trọng lượng 1.14kg', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'2b8487c6123e43f290530ecbc9a32adf', N'1STPLAYER Black Window PS-700AX BFM', 5, 1799000.0000, N'https://www.tncstore.vn/image/cache/catalog/ngu%E1%BB%93n%20case/1st%20player/aa-500x500.jpg', N'Mô tả sản phẩm
- Tiêu chuẩn 80+ bronze

- Công nghệ bảo vệ an toàn điện và quạt làm mát 140 mm

- Công suất thực:700W

- Bảo hành: 36 Tháng

- Hãng sản xuất: 1STPLAYER', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'2c4d8f733c564826af05d0e09e1ad382', N'Bundle Bánh nướng - 1070 Ti', 5, 13500000.0000, N'https://www.tncstore.vn/image/cache/catalog/1111/Banh%20nuong/1-500x500.jpg', N'Mô tả sản phẩm
Bundle gồm 3 sản phẩm:

- Card đồ họa: GALAX GeForce GTX 1070 Ti EX 8Gb

- Nguồn: Thermaltake Smart RGB 700W - 80plus

- SSD: Galax One 240GB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'2c4e60fe742e4214a6a9dcfc42145ffb', N'Bàn phím không dây cảm ứng K400', 3, 1099000.0000, N'https://www.tncstore.vn/image/cache/catalog/ban%20phim/K400/K400-a-500x500.jpg', N'Mô tả sản phẩm
Mã hàng: K400 PLUS
Bảo hành: 12 Tháng
Hãng sản xuất: Logitech
Xuất xứ: Chính Hãng
Bàn phím: Không giây cảm ứng', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'2ead60673dca4118b79770225b193545', N'Bo mạch chủ ASUS ROG STRIX Z370-H GAMING', 10, 4899000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/Mainboard%20ASUS%20ROG%20STRIX%20Z370-H%20GAMING/mainboard-asus-rog-strix-z370-h-gaming-500x500.jpg', N'Mô tả sản phẩm
- Socket: 1151

- Chipset: Z370

- Supports NVIDIA 2-Way SLI Technology 

- Supports AMD 3-Way CrossFireX Technology', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'2f38f931be184ab5a888b77707ae7eaf', N'Ổ cứng HDD Seagate BarraCuda 6TB 5400RPM Sata3', 10, 4699000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/Seagate/6-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: SEAGATE
- Vòng quay: 5400rpm
- Dung lượng ổ: 6TB 
- Dung lượng bộ nhớ đệm (Cache): 256MB.
- Tốc độ  6Gb/s', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'30a57511f6964c2985e6a642033ea2c5', N'GAMING PC - Mini Monster 1070Ti', 15, 24577000.0000, N'https://www.tncstore.vn/image/cache/catalog/1111/mini%20monster/ava_ava%201-500x500.jpg', N'Mô tả sản phẩm
- CPU : AMD Ryzen 5 2400G 4 Cores 8 Threads 3.6 GHz

- MAIN: ASUS Prime B350M-A

- VGA : GALAX GeForce GTX 1070 Ti EX 8Gb

- RAM : GEIL D4 EVO POTENZA AMD 8GB 2666

- PSU : Andyson GX600 80Plus Gold

- CASE: Phanteks Eclipse P300

- SSD : Galax One 240GB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'3242cd0a51d84f579b1e3919f2ef693c', N'Bàn phím cơ Corsair K68 Mechanical Cherry MX Red', 2, 2799000.0000, N'https://www.tncstore.vn/image/cache/catalog/b%C3%A0n%20ph%C3%ADm%20c%C6%A1/Corsair/k68/ban-phim-co-corsair-k68-mechanical-cherry-mx-red-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Bàn phím cơ chống nước đầu tiên trên thế giới tiêu chuẩn IP32

- Sử dụng công tắc cơ khí Cherry MX Red của Đức 

- LED 1 màu đỏ 

- Hỗ trợ phần mềm Corsair Utility Engine', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'33a883f4d8c24da298195ea9a7e3fa83', N'Bo mạch chủ Asus Prime B450 Plus', 10, 2990000.0000, N'https://www.tncstore.vn/image/cache/catalog/Main/Main%20Asus/B450/bo-mach-chu-asus-prime-b450-plus-2-500x500.jpg', N'Mô tả sản phẩm
Hãng sản xuất : Asus

CPU hỗ trợ : AMD Socket AM4 AMD Ryzen™ thế hệ thứ 2/Ryzen™ với card đồ họa Radeon™ Vega Graphics/Ryzen™ thế hệ thứ nhất bộ vi xử lý

Chipset : AMD B450

Kích thước : Dạng thiết kế ATX :12.0 inch x 9.2 inch ( 30.5 cm x 23.4 cm )', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'34c9a6082c9c4dbba75e002aba9a12a6', N'CPU Intel Core i7 - 7800X 3.5 GHz Turbo 4.0 GHz', 5, 11989000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/7740x/cpu-intel-core-i7-7740x-43-ghz-turbo-45-ghz-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Bộ vi xử lí Intel Core i7 - 7800X cấu tạo bởi 6 lõi vi xử lý 12 phân luồng

- Bên cạnh đó tần số cơ sở của bộ xử lý là 3,5 GHz  và nguồn điện tiêu thụ 140 watt

- BVXL intel core i7 được intel xây dựng trên công nghệ mới nhất

- Hãng sản xuất: intel

- socket: 2066', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'35980672f3bf4ca2805f61089688f951', N'Ổ Cứng HDD Seagate 250GB Sata3', 10, 850000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/seagate250gb_1-500x500.jpg', N'Mô tả sản phẩm
Dung lượng: 250Gb
Giao thức kết nối: SATA3 6Gbps
Tốc độ: 7200RPM', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'35aacc170ec749edae1ee8793d289ef5', N'Bàn phím cơ ASUS ROG CLAYMORE CORE - red switch', 2, 3769000.0000, N'https://www.tncstore.vn/image/cache/catalog/b%C3%A0n%20ph%C3%ADm%20c%C6%A1/gigabyte/asus%20claymore%20core/ban-phim-co-asus-claymore-blue-switch-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Kích thước: chuẩn TKL ( 360x145x45mm)

Switch: MX CHERRY red

Độ bền: 50tr lần nhấn

Cáp kết nối: USB 

Độ trễ: 1000hz

Tương thích: window 10, 8.1, 7

Trọng lượng: 715g', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'3792665bc9954723a6f33f6ef568b034', N'Bo mạch chủ ASUS ROG STRIX B360-H GAMING', 10, 2990000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/asus%20rog%20strix%20b360%20H%20Gaming/bo-mach-chu-asus-rog-strix-b360-h-gaming-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Quạt thông minh Fan Xpert giảm tiếng ồn, tiết kiệm điện, làm mát hiệu quả

Linh kiện đạt chuẩn 5X Protection III vững chắc

Hỗ trợ kết nối M.2 cực nhanh hiện nay

Âm thanh chất lượng cao SupremeFX 1220A và Sonic Studio III

Có đèn RGB Aura Sync, phù hợp với hệ thống đèn RGB của bạn', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'3976c15dac68417aadbbb3e2a64af885', N'Ổ cứng HDD laptop Western Digital Blue 1TB', 10, 1750000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/%20c%E1%BB%A9ng%20HDD%20laptop%20Western%20Digital%20Blue%201TB/11-500x500.jpg', N'Mô tả sản phẩm
- Dung lượng:	1Tb 
- Tốc độ quay:	5400rpm 
- Bộ nhớ Cache:	8Mb 
- Chuẩn giao tiếp:	SATA3 
- Kích thước:	2.5Inch', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'3dade0c6430442bfa2fdbff1050d54f5', N'Chuột không dây DareU LM115G Black', 3, 199000.0000, N'https://www.tncstore.vn/image/cache/catalog/chu%E1%BB%99t/dareu%20l115g/chuot-khong-day-dareu-lm115g-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
Sensor: PAW3512

Sóng 2.4G

DPI: 800-1200-1600

Switch: Silent (3 triệu lần click)

Kích thước: 107.5*59.15*38.29mm

Pin: 01* AA

Trọng lượng: 90g +/- 10g', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'3e4e38972e9140568f1fbdf33e38bb81', N'Đế làm mát Thermaltake notebook Massive 20 RGB', 2, 1190000.0000, N'https://www.tncstore.vn/image/cache/catalog/%20T%E1%BA%A3n%20Nhi%E1%BB%87t%20Laptop/Thermalter%20Massive/de-lam-mat-notebook-thermaltake-massive-20rgb-1-tncstore-500x500.jpg', N'Mô tả sản phẩm
 - Hỗ trợ notebook: 10" ~ 19"
- Kích thước: 471 x 354.5 x 46.5mm
- Kích thước quạt: 200 x 200 x 18mm
- Tốc độ quạt: 600~800 R.P.M
- Độ ồn:  30 dBA
- Trọng lượng: 1520g
- Chất liệu: Nhựa', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'3fb1db1307214cdfad14462e69cd1539', N'Bo mạch chủ MSI B450 TOMAHAWK', 10, 2789000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/msi/450%20tomahaw/bo-mach-chu-b450-tomahaw-4-500x500.jpg', N'Mô tả sản phẩm
Socket : AM4
Memory chanel : Dual
Max memory : 64GB
Khe Sata 3 : 6
Khe m2 : 1', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'41bf4d5f61794f019d5cb66a76168c82', N'Bộ nguồn máy tính Gigabyte GP-PB500 -500w', 5, 1289000.0000, N'https://www.tncstore.vn/image/cache/catalog/ngu%E1%BB%93n%20case/gigabyte/bp500/nguon-gigabyte-pb500-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
- 80 PLUS Bronze certified

- 120mm Silent Fan

- Single +12V rail

- OPP/UVP/OVP/SCP/OCP/OTP Fully protection', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'437ee288617d4d09b6dc4658a03ace4e', N'Bàn phím không dây Logitech K800', 3, 2499000.0000, N'https://www.tncstore.vn/image/cache/catalog/ban%20phim/K800/K800-a-500x500.jpg', N'Mô tả sản phẩm
Hàng chính hãng Logitech
Đèn cảm ứng nhiệt để có thể dùng được khi sử dụng vào ban đêm
Điều chỉnh được ánh sáng của đèn bàn phím
Sử dụng pin sạc, dùng được gần 7 ngày sau mỗi lần sạc
Receiver nano sử dụng công nghệ Unifying
Sử dụng công nghệ Wireless không dây tần số 2.4Ghz', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'47844fc992084cfe81111733ccf1df35', N'Case Segotep K6 ( Mid Tower)', 0, 699000.0000, N'https://www.tncstore.vn/image/cache/catalog/V%E1%BB%8F%20case/segotep/Case%20Segotep%20K6/case-segotep-k6-mid-tower-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'4795cbbc54ac4733a629bb5dd59c7bf0', N'm2SSD Intel 600p Series 128GB M.2 80mm PCIe NVMe 3.0x4', 3, 1589000.0000, N'https://www.tncstore.vn/image/cache/catalog/SSD/m2SSD%20Intel%20600p%20Series%20256GB/intel-600p-series-256gb-m2-80mm-pcie-nvme-30x4-1-500x500.jpg', N'Mô tả sản phẩm
Hệ số hình dạng: M.2 22 x 80mm
Giao diện: PCIe NVMe 3.0 x4
Bảo vệ dữ liệu mất mát năng lượng được nâng cao: Không
Mã hóa phần cứng: AES 256 bit
Công nghệ chịu đựng cao (HET): Không
Theo dõi và ghi nhật ký nhiệt độ: Không
Bảo vệ dữ liệu đầu cuối-đầu cuối: Không
Công nghệ phản hồi thông minh Intel®: Có
Công nghệ khởi động nhanh Intel®: Có
Viễn thông Tẩy xóa Bảo đảm Intel®: Không', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'4831d9915bc74dd686830db692c267a2', N'GAMING PC - HYPERION 1080TI', 15, 57074000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamepc/hyper/hyperion_ava%201-500x500.jpg', N'Mô tả sản phẩm
- CPU : AMD Ryzen 7 2700X 3.7 GHz (4.3 GHz Turbo)

- VGA: ASUS ROG STRIX GTX 1080TI - 11G - GAMING

- Main: MSI X470 GAMING PLUS

- Ram: Adata XPG Spectrix D40 32GB (4x8GB) RGB DDR4 3000MHz

- Nguồn: Corsair CX750M 750W 80 PLUS Bronze

- HDD: Seagate Barracuda 2TB 3.5" SATA3

- SSD: ADATA XPG SX6000 128GB M2 NVMe 2280

- Case: Phanteks Eclipse P400 Black/Red Tempered Glass- RGB

- Tản nhiệt: Cooler Master MasterLiquid ML240R RGB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'4a04bb15b27043f1af969d621e9f646b', N'Bàn di chuột 1stPlayer BaBoon King BK-37-H', 3, 599000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/Gamepad%20BaBoon%20King/mousepad-baboon-king-1-500x500.jpg', N'Mô tả sản phẩm
Chất liệu cao cấp
Khả năng đọc cảm biến liên tục và chính xác
Kiểu dáng hiện đại

', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'4a764bd5d7cd4e04b0e20a65d3b8122d', N'Case Corsair 570X RGB ATX Mid Tower', 3, 4899000.0000, N'https://www.tncstore.vn/image/cache/catalog/case/corsair%20570x/case-corsair-570x-rgb-atx-mid-tower-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Kích thước: 480 x 234 x 512mm

- Kích thước VGA tối đa: 370mm

- Kích thước tản nhiệt CPU tối đa: 170mm

- Khay gắn ổ cứng: SSD x2, HDD x2

- Quạt tản nhiệt phía trên: tối đa Radiator 240mm

- Quạt tản nhiệt phía trước: tối đa Radiator 360mm', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'4cc597bbfe2f4553b07b85af2390621d', N'GAMING PC - BASIC 2200G', 15, 9274000.0000, N'https://www.tncstore.vn/image/cache/catalog/11112/basic/AVATAR_ava%201-500x500.png', N'Mô tả sản phẩm
- CPU: AMD Ryzen™ 3 2200G 4 Cores 4 Threads 3.5 GHz

- Mainboard: ASUS Prime B350M-A

- RAM: Apacer Panther Rage 4Gb DDR4-2400 Led White

- Nguồn: Raidmax 400W RX-400XT

- SSD: Apacer Panther AS340 2.5" Sata III 120GB

-  Vỏ case: XIGMATEK XA-10

- Màn hình: LG 20MP48A-P', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'4ce7dc37376749d2a14c707b8b8c8ab9', N'Bo Mạch Chủ ASUS EX-B360M-V3', 10, 1989000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/EX-B360M-V3/bo-mach-chu-ex-b360m-v3-1-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: Asus

- Chipset: B360

- Bảo hành: 36 Tháng

- Hỗ trợ socket: 1151v2

- Multi-VGA output support: HDMI/DVI-D', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'4e03847262e8412591eea78e68931cb4', N'Keyboard Filco Majestouch 2 Brown switch 87 black', 2, 3179000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/Filco%20Majestouch%202%20Blue%20switch%2087%20black%20/filco-majestouch-2-blue-switch-87-black-2-500x500.jpg', N'Mô tả sản phẩm
Bàn phím cơ của Filco đến từ Nhật Bản 
Độ bền rất cao, đã được cộng đồng thế giới ghi nhận 
Chân chống phụ bọc cao su giúp tăng khả năng ma sát với mặt bàn 
Bảng mạch được thiết kế 2 lớp, tối đa độ bền bỉ khi sử dụng lâu dài 
Có 4 loại switch khác nhau phù hợp với nhiều nhu cầu sử dụng 
NKeyroll Over - Có khả năng nhận 100% số lượng phím bấm cùng một thời điểm 
Có thể được sử dụng với cổng USB và PS2 
Khi dùng với cổng PS2 sẽ tăng tốc độ phản hồi tín hiệu lên 1000Hz ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'50037d8f4e414ab68103656e1c023c54', N'Bo mạch chủ ASUS ROG STRIX Z370-F GAMING', 10, 5199000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/Mainboard%20ASUS%20ROG%20STRIX%20Z370-F%20GAMING/mainboard-asus-rog-strix-z370-f-gaming-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Socket: 1151

- Chipset: Z370

- Supports NVIDIA 2-Way SLI Technology 

- Supports AMD 3-Way CrossFireX Technology', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'5114854131954da99c7a2e8a20059f6a', N'Chuột Corsair GLAIVE RGB', 5, 1949000.0000, N'https://www.tncstore.vn/image/cache/catalog/chu%E1%BB%99t/chuot-corsair-glaive-rgb-e-500x500.jpg', N'Mô tả sản phẩm
- Hình dạng cong : Thiết kế để bạn có thể chơi lâu hơn mà không mệt mỏi.
- Tuỳ chỉnh, cảm biến quang học DPI 16,000
- Hiệu chỉnh điều chỉnh bề mặt tiện ích : Tối ưu hóa độ chính xác của cảm biến và khả năng phản ứng cho bề mặt
- tùy chỉnh led RGB
- Hỗ trợ tốc độ làm mới lên đến 1000Hz / 1ms để có thể phản hồi ngay lập tức đối với các chuyển động', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'54715854cb7249b4bde231a006a02234', N'Bàn phím ASUS Cerberus', 2, 1500000.0000, N'https://www.tncstore.vn/image/cache/catalog/b%C3%A0n%20ph%C3%ADm%20c%C6%A1/asus/cerberus/ban-phim-asus-cerberus-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Tấm kim loại SECC nguyên khối - Độ bền bụi

Thiết kế chống đổ nước với lỗ thoát nước - Bảo vệ chống đổ chất lỏng

12 phím macro - Độ linh hoạt chiến thuật

Chân bọc hoàn toàn bằng cao su - Tăng ma sát cho các chuyển động mạnh', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'5505dd8f14d540ed8b2f07b1ca09dc77', N'Chuột Corsair HARPOON RGB Gaming', 5, 499000.0000, N'https://www.tncstore.vn/image/cache/catalog/Chuot/Corsair%20HARPOON%20RGB%20Gaming/corsair-harpoon-rgb-2-500x500.jpg', N'Mô tả sản phẩm
Sensor: Pixart PMW3320
Switch chính: Omron - 20 triệu lượt bấm
Cân nặng: 85g / 0.19 lbs
Kích cỡ: 111.5 x 68.3 x 40.4 mm
Số nút: 6 nút + cuộn chuột', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'555919bc7fcc49eda7ffff2823785ae1', N'CPU Intel Core i5-7400 (6M Cache, 3.0GHz) SK 1151', 5, 4249000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/i5-7400-500x500.jpg', N'Mô tả sản phẩm
Bộ vi xử lí Intel Core i5-7400 là 4 lõi vi xử lý 4 phân luồng.
Bên cạnh đó tần số cơ sở của bộ xử lý là 3,0GHz, có tần số Turbo Boost của 3.00GHz và nguồn điện tiêu thụ 65 watt.
Ngoài ra BVXL intel core i5 được intel xây dựng trên công nghệ mới nhất 14nm +. iGPU cập nhật có tên HD600 của Intel.
Sản phẩm hiện có bán tại TNC Store.
Lưu ý: Hãy UP phiên bản BIOS mới nhất dành cho các dòng Bo Mạch Chủ Chipset B150x / H170x / Z170x', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'5584c54b28ed4f72b06686d94e0ceb28', N'Bàn phím bluetooth Logitech K380', 3, 799000.0000, N'https://www.tncstore.vn/image/cache/catalog/ban%20phim%20khong%20day/k380/Untitled2-500x500.jpg', N'Mô tả sản phẩm
Hãng sản xuất: Logitech
Kiểu kết nối: Bluetooth
Thiết kế nhỏ gọn
Khoảng cách kết nối: 10m
Thời gian sử dụng lâu', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'5ba95db3184c4139809fc76d0a2a5a5a', N'Chuột Asus ROG Spatha - Super MMO Gaming Mouse', 5, 3499000.0000, N'https://www.tncstore.vn/image/cache/catalog/chu%E1%BB%99t/asus/chuot-asus-rog-spatha-super-mmo-gaming-mouse-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
- Thiết kế 12 nút lập trình được, được tối ưu cho chơi game MMO

- Hiệu ứng led RGB đẹp mắt

- Bộ nhớ flash tích hợp để lưu các cấu hình

- 8200 DPI, 150 ips, gia tốc 30g và hỗ trợ tốc độ lấy nét USB 2000Hz trong chế độ có dây cho khả năng theo dõi chuột chuẩn xác từng điểm ảnh', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'60832c73141a4a1198db6ef8e0ffc362', N'Laptop ASUS S510UQ-BQ260', 3, 14699000.0000, N'https://www.tncstore.vn/image/cache/catalog/Laptop%20asus/UX410UQ-GV066/UX410UQ-GV066-b-500x500.jpg', N'Mô tả sản phẩm
Bộ vi xử lý	Intel® Core™ i5-7200U 2.5Ghz up to 3.1Ghz 3Mcache 
Chipset	Intel HM170 
Bộ nhớ trong	4GB DDR4 2133 (On board ) 
VGA	Nvidia Geforce 940MX 2G DDR3 
Ổ cứng	500HDD 5200rpm 
Màn hình	14.0" Anti-glare Full HD 1920 x 1080 / 300nits Led Backlit', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'617a95bc094c46c19f273b29f23ffc06', N'CPU AMD Ryzen 3 1200 3.1 Upto 3.4GHz Socket AM4', 5, 3380000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/1200/18190938_291365891288917_1145354959_n%20copy%20copy-500x500.jpg', N'Mô tả sản phẩm
Số Nhân : 4 (Cores) 

Số Luồng : 4 (Threads) 

Tốc độ xung mặc định : 3.5Ghz (Default) 

Tốc độ Xung nhịp OC : 3.7Ghz (Tubor Boost) 

Bộ nhớ đệm : 2MB (L2 Cache) 

Bộ nhớ đệm : 8MB (L3 Cache) ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'65825fa8e6d248f9bac270cbcab1bc79', N'RAM ADATA 16GB (2x8GB) DDR4 2400MHz DRD LED đỏ', 0, 5049000.0000, N'https://www.tncstore.vn/image/cache/catalog/RAM/RAM%20ADATA%2016GB%20(2x8GB)%20DDR4%202400MHz%20AX4U2400W8G16-DRD%20-%20LED%20%C4%91%E1%BB%8F-C-500x500.jpg', N'Mô tả sản phẩm
- Kingston HyperX Fury 4G DDR4 can handle even the toughest battle.

- FURY DDR4 runs at 1.2V, even at 2666MHz, so it stays cooler while you play.

- Specs: DDR4 , 2400MHz , CL14 , 1.2V 

- Timings: 2400MHz, 14-14-14, 1.2V', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'661b5a5394d64fc583515690f553cd31', N'Bo mạch chủ ASUS ROG STRIX B250G GAMING', 10, 2389000.0000, N'https://www.tncstore.vn/image/cache/catalog/Main/Main%20Asus/MAINBOARD%20ASUS%20ROG%20STRIX%20B250G%20GAMING/mainboard-asus-rog-strix-b250g-gaming-e-500x500.jpg', N'Mô tả sản phẩm
MAINBOARD ASUS ROG STRIX B250G GAMING
Supports 7th/ 6th Generation Intel® Core™ Processors
4 x DIMM, Max. 64GB, DDR4 2400/2133 MHz Non-ECC
Integrated Graphics Processor- Intel® HD Graphics support 
Multi-VGA output support : HDMI/DVI ports.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'6a2158ed663d4dbdafbda819a6744dce', N'Chuột Corsair Scimitar RGB', 5, 2158000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/Chu%E1%BB%99t%20Corsair%20Scimitar%20RGB/chuot-corsair-scimitar-rgb-a-500x500.jpg', N'Mô tả sản phẩm
- Mắt đọc: Quang học
- DPI: 100 - 12000 DPI
- Số nút: 17 nút có thể lập trình
- Polling rate: 125/250/500/1000 (Hz)
- Đèn led: 4 vùng RGB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'6b601ae181f84a45973473e823b55ff8', N'Tay cầm Sony PS4 DUALSHOCK 4 đỏ', 10, 1349000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/Tay%20c%E1%BA%A7m%20Sony%20PS4%20DUALSHOCK%204%20%C4%91%E1%BB%8F/tay-cam-ps4-dualshock-4-do-a-500x500.jpg', N'Mô tả sản phẩm
Tay cầm PS4 không dây
Thiết kế tay cầm thuận tiện với các nút bấm nhạy, cảm ứng đa điểm
Đèn LED định vị có thể đổi màu
Tích hợp bộ rung cho trải nghiệm game chân thật
Tích hợp loa ngoài và jack cắm tai nghe 3.5mm
Kết nối: cổng USB, Bluetooth', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'6ec8147efb34463b8de39c7d58fc7bc0', N'Case SAMA Baron Narshor Whte Black', 3, 899000.0000, N'https://www.tncstore.vn/image/cache/catalog/V%E1%BB%8F%20case/sama/BARON%20NASHOR/case-sama-baron-narshor-c-500x500.jpg', N'Mô tả sản phẩm
Hãng sản xuất: SAMA
Hỗ trợ mainboard: MicroATX, Mini-ITX
Kích thước: (dài x rộng x cao) mm 465 x 230 x 455 mm
Vật liệu: Thép SPCC 0.9mm - ABS + Lưới kim loại
Cổng kết nối: 2*USB 2.0 + 1*USB 3.0 + HD Audio + Card Reader + Điều tốc quạt', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'6f3f5b8f61c44987bad7642269096fea', N'GAMING PC - Ryzen 5 Hellfire', 15, 17838000.0000, N'https://www.tncstore.vn/image/cache/catalog/case%20gaming%20/ryzen%205%20hellfire/22-500x500.jpg', N'Mô tả sản phẩm
chi tiết hệ thống:
- CPU : CPU AMD Ryzen 5 1400 3.2GHz

- MAIN: Mainboard GA-AB350M-Gaming 3

- VGA : GIGABYTE GV-N105TOC-4GD

- RAM : Ram G.SKILL RIPJAWS V-8GB (4GBx2) DDR4 2133MHz

- PSU : Antec BP400PX 400W

- CASE: SAMA E-Sport F2 Black - red

- SSD : Zotac T400 120GB SATA3 6Gb/s

- Card wifi: ASUS Wifi PCE-AC55BT (Giá chưa bao gồm sản phẩm này)', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'7122aba65bbe4e85b2d29d716f295230', N'Bàn Di Asus ROG Sheath - Gaming', 3, 899000.0000, N'https://www.tncstore.vn/image/cache/catalog/b%C3%A0n%20di/Asus/Rog%20Sheath/ban-di-rog-sheath-gaming-tncstore-d-500x500.jpg', N'Mô tả sản phẩm
Tối ưu cho khả năng di chuột mượt mà
Kích cỡ khổng lồ cho tất cả các thiết bị chơi game của bạn
Đế cao su màu đỏ ROG chống trượt
Đường khâu bền, chống rách.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'715b4bcce7274094bf2c99bdde4736d6', N'Case Segotep K8 Steel & Tempered Glass', 0, 1499000.0000, N'https://www.tncstore.vn/image/cache/catalog/V%E1%BB%8F%20case/segotep%20k8/case-segotep-k8-steel-tempered-glass-tncstore-b-500x500.jpg', N'Mô tả sản phẩm
- Kích thước :  473mm x 230mm x 485mm 
- Cân nặng : 9kg
- Lắp đặt : 3 quạt 120mm phía trước, 3 trên nóc, 1 phía sau 
- VGA : dài 420mm; Tản nhiệt CPU : cao 180mm; 3 x Ssd + 2 Hdd
- Khung thép dày cùng 3 hông mặt kính, tối ưu lắp linh kiện to và tản nhiệt nước .                                                                   
- Hỗ trợ Mainboard E-ATX, ATX, Micro ATX, mini-ITX ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'72b5e7451fa8424d9de28eec7d326470', N'Laptop ASUS Gaming ROG GX800VH', 3, 149999008.0000, N'https://www.tncstore.vn/image/cache/catalog/LapTop/Asus/Laptop%20ASUS%20Gaming%20ROG%20GX800VH/laptop-asus-gaming-rog-gx800vh-a-500x500.jpg', N'Mô tả sản phẩm
Bộ vi xử lý Core™ i7 7820HK
Chipset Intel® CM238 Express Chipset
Bộ nhớ trong 32GB DDR4 2800MHz SDRAM
VGA NVIDIA GeForce GTX 1080 SLI , với 16GB VRAM
Màn hình 18.4" (16:9) Đèn LED nền UHD (3840x2160).', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'731f5bb5a73142b68b2fe92563274a5a', N'Ổ cứng HDD Seagate NAS 3TB, Sata3, 64MB Cache, 5900 Rpm', 10, 2599000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/%20HDD%20Seagate%20%20NAS%203TB/Seagate%20%20NAS%203TB-c-500x500.jpg', N'Mô tả sản phẩm
Dung lượng tối đa 8TB để hỗ trợ 1-8 vịnh Hệ thống NAS
Lên đến nhanh hơn so với các nhãn hiệu khác 25%. điều khiển khôi phục lỗi mở rộng cho toàn vẹn dữ liệu tốt hơn
Cấu quyền lực tiên tiến chỉnh tùy chọn năng lượng thấp luôn luôn mở các ứng dụng NAS
Cứu phục hồi dịch vụ Tùy chọn có sẵn để bảo vệ dữ liệu 360 độ
36 tháng bảo hành. 64 MB bộ nhớ cache', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'749ddb6edff34db2a74463edf632e7c1', N'Card màn hình Asus Geforce PH-GTX 1060 3GB', 5, 5899000.0000, N'https://www.tncstore.vn/image/cache/catalog/vga/asus/Asus%20Geforce%201060%203GB/card-man-hinh-asus-geforce-gtx-1060-3gb-1-tncstore-500x500.jpg', N'Mô tả sản phẩm
- VRAM 3GB GDDR5

- GPU Boost Clock : 1708 MHz / GPU Base Clock : 1506 MHz
- CUDA Core 1152

- Kích cỡ : 18.3 cm x 12.1 cm x3.8 cm
- PCI Express 3.0', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'76848dd5b928441aae8979f06ad818a2', N'Bàn phím không dây Logitech K400 Plus', 3, 889000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/B%C3%A0n%20ph%C3%ADm%20v%C3%A0%20chu%E1%BB%99t%20Logitech%20Wireless%20K400%20Plus/b%C3%A0n-ph%C3%ADm-v%C3%A0-chu%E1%BB%99t-logitech-wireless-k400-plus-a-500x500.jpg', N'Mô tả sản phẩm
- Bàn phím không dây với khoảng cách sử dụng khoảng 8m. 
- Có chuột kiểu touchPad ngay trên bàn phím, rất tiện lợi với khách hàng đang 
sử dụng máy tính HTPC để xem phim HD
 - K400r có một số nâng cấp như hỗ trợ khi sử dụng với win 10
-  một số phím có thể lập trình được, chuột cảm ứng có thể cuộn, zoom,kéo thả. ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'77762e1585ae471d8739cbb8a51eca02', N'Case Segotep T5 Steel & Tempered Glass (Full Tower)', 3, 2499000.0000, N'https://www.tncstore.vn/image/cache/catalog/case/Reynor%20Tower%20T5/aa3-500x500.jpg', N'Mô tả sản phẩm
- Main hỗ trợ : ATX, mATX, E-ATX, ITX, SSI-EEB server board, up to 305mm x 330mm
- Hỗ trợ lên tới 7 fan
- Hỗ trợ tản nhiệt nước : lên tới hai hệ thống tản nhiệt nước  360mm/280mm 
- Hỗ trợ tối đa 3 SSD hoặc 2 HDD 
- GPU Support : 420mm
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'7ceec18a297d4582a6a7914f3c12ee43', N'Microphone Razer Seirēn Pro - Elite USB Digital', 5, 6499000.0000, N'https://www.tncstore.vn/image/cache/catalog/Microphone/microphone-razer-reiren-pro-lite-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Kết nối USB

- Công tắc bật tắt Bộ lọc cao tần

- Hỗ trợ Razer Synapse

- Cáp nối USB với USB mini

- Cáp mở rộng âm thanh 3,5mm', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'7fa0ff6156404ac4b2d83f84d5d57076', N'GAMING PC - Dream Stream', 15, 20673000.0000, N'https://www.tncstore.vn/image/cache/catalog/case%20gaming%20/Dream%20Stream/1_ava%201-500x500.jpg', N'Mô tả sản phẩm
- CPU : AMD Ryzen 5 2600 3.4GHz socket AM4

- MAIN: ASUS Prime B350M-A

- VGA : Asus Geforce PH-GTX 1060 3GB

- RAM : G.Skill Sniper X 16GB (2X8GB) DDR4 2400MHz

- PSU : Corsair Series VS 450W 80 Plus

- CASE: XIGMATEK ASTRO Rainbow RGB Fan

- HDD:  Seagate BarraCuda 1TB 7200RPM Sata3

- SSD : Apacer Panther 2.5 inch Sata III 120GB Optical (Quà tặng kèm)', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'81595d14f1684e8d992f3008eb90a1b1', N'CPU i5-8600 (9M Cache, up to 4.30 GHz) - Coffee Lake', 5, 6399000.0000, N'https://www.tncstore.vn/image/cache/catalog/11112/2-500x500.jpg', N'Mô tả sản phẩm
- Dòng CPU: Core i5 Coffee Lake

- Socket: LGA1151

- Tốc độ: 3.10Ghz

- Tốc độ: Tubor tối đa	Up to 4.30Ghz

- Cache: 9Mb

- Nhân CPU: 6 Core

- Luồng CPU: 6 Threads

- VXL đồ họa: Intel® HD Graphics 630

- Điện áp tiêu thụ tối đa: 65W', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'81e9f450ad3a41a48263bbf0974ccae5', N'm2SSD Intel Optane 32GB PCIe NVMe 3.0x2', 3, 2199000.0000, N'https://www.tncstore.vn/image/cache/catalog/SSD/m2SSD%20Intel%20600p%20Series%20256GB/intel-600p-series-256gb-m2-80mm-pcie-nvme-30x4-1-500x500.jpg', N'Mô tả sản phẩm
Hệ số hình dạng: M.2 22 x 80mm
Giao diện: PCIe NVMe 3.0 x4
Bảo vệ dữ liệu mất mát năng lượng được nâng cao: Không
Mã hóa phần cứng: AES 256 bit
Công nghệ chịu đựng cao (HET): Không
Theo dõi và ghi nhật ký nhiệt độ: Không
Bảo vệ dữ liệu đầu cuối-đầu cuối: Không
Công nghệ phản hồi thông minh Intel®: Có
Công nghệ khởi động nhanh Intel®: Có
Viễn thông Tẩy xóa Bảo đảm Intel®: Không', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'8435599dfadf40999e2efd1de92a994c', N'Màn hình AOC 23''''I2381 LED IPS', 3, 3060000.0000, N'https://www.tncstore.vn/image/cache/catalog/VGA%201080/monitor-aoc-23i2381-led-ips-a-500x500.jpg', N'Mô tả sản phẩm
AOC series 81 là dòng sản phẩm được thiết kế bắt mắt. 
Màn hình dạng gương siêu mỏng mở rộng tràn mép gắn trên chân 
đế kim loại lệch tâm tinh tế, tạo cảm giác thanh lịch. Với thiết kế ấn
tượng kết hợp với công nghệ tấm nền IPS tiên tiến mang tới màu 
sắc ổn định và sắc nét ngày cả những góc nhìn rộng', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'85221c94688246bf92f9d11c5ca89503', N'Bàn di chuột Razer Destruction 2', 3, 999000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/Mouse%20Pad%20Razer%20Destruction%202/mouse-pad-razer-destruction-a-500x500.jpg', N'Mô tả sản phẩm
Kích cỡ: 355mm x 255mm 
Độ dày: 2,2mm 
Chất liệu: Nhựa cứng 
Bề mặt được nghiên cứu và thử nghiệm bởi các game thủ chuyên nghiệp, đem lại sự cân bằng giữa tốc độ và độ chính xác. 
Các tinh thể bạc được đính vào bề mặt giúp tăng tối đa hiệu quả sử dụng 
Đế cao su cực chắn chắn đảm bảo pad sẽ không bao giờ bị xê dịch khi sử dụng', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'8610001b97a84ad8b87495f70883c009', N'Bàn di chuột 1stPlayer BaBoon King BK-20-M', 3, 399000.0000, N'https://www.tncstore.vn/image/cache/catalog/1111/123-500x500.jpg', N'Mô tả sản phẩm
- Kích thước: 400x325mm

- Độ dày: 4mm

- Khâu viền: Có
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'88b7ca6185114975b261750c1b647436', N'RAM Laptop Kingston 4GB DDR4 Bus 2400', 3, 1299000.0000, N'https://www.tncstore.vn/image/cache/catalog/RAM/KingSton/laptop/ram-laptop-kingston-4gb-ddr4-bus-2133-a-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: kingston

- bộ nhớ: 4GB

- bus: 2400

- bảo hành: 36 Tháng

- điện áp: 1.35v', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'8b22873ebdb94792919a7cf2df7ec7b7', N'Ram Adata Gammax D10 8GB DDR4 2400-đỏ', 1, 2359000.0000, N'https://www.tncstore.vn/image/cache/catalog/ram/adata/gammax%20d10%20%C4%91%E1%BB%8F/ram-adata-Gammax-D10-8gb-ddr4-2400-do-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Hãng: ADATA

Model: AX4U240038G16-SRG

Loại RAM: DDR4

Dung lượng: 8GB

Bus: 2400

Color: Màu đỏ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'8bb6de4caf5b4b02a887a52c702bd304', N'Bo mạch chủ MSI X470 Gaming Pro Carbon', 10, 5999000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/Bo%20m%E1%BA%A1ch%20ch%E1%BB%A7%20MSI%20X470%20Gaming%20Pro%20Carbon/bo-mach-chu-msi-x470-gaming-pro-carbon-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: MSI

- Chipset: X470

- Bảo hành: 36 Tháng

- Hỗ trợ socket: AMD 4

- Mystic Light and Mystic Light Sync: 16.8 million colors', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'8dd0fe32c088489daf853b6fcd029afb', N'Bàn DXRACER GD/1000/N Black Gaming Desk USA', 3, 6649000.0000, N'https://www.tncstore.vn/image/cache/catalog/banghegame/ban1-500x500.jpg', N'Mô tả sản phẩm
Chất liệu: Khung thép, mặt bàn bằng gỗ, nhựa ABS cao cấp
Kích thước: Dài 1.2m - Cao 80cm - Rộng 80cm', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'8f9a485f1d484f8695a7918576838363', N'CPU AMD Ryzen 3 1200 3.1 Upto 3.4GHz Socket AM4', 5, 2619000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/1200/18190938_291365891288917_1145354959_n%20copy%20copy-500x500.jpg', N'Mô tả sản phẩm
Số Nhân : 4 (Cores) 

Số Luồng : 4 (Threads) 

Tốc độ xung mặc định : 3.1Ghz (Default) 

Tốc độ Xung nhịp OC : 3.4Ghz (Tubor Boost) 

Bộ nhớ đệm : 2MB (L2 Cache) 

Bộ nhớ đệm : 8MB (L3 Cache) 

Khả năng ép xung: Có (Unlocked) 

Mức tiêu thụ điện : 65W (TDP) ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'9238e8c0067247e5bc9f4d6588858bbd', N'Card Màn Hình AORUS GeForce GTX 1080 Ti Xtreme Edition', 5, 25429000.0000, N'https://www.tncstore.vn/image/cache/catalog/vga/gigabyte/AORUS%20GeForce%C2%AE%20GTX%201080%20Ti%20Xtreme%20Edition/3-500x500.jpg', N'Mô tả sản phẩm
Powered by GeForce® GTX 1080 Ti
Integrated with 11GB GDDR5X 352-bit memory interface
WINDFORCE Stack 3X 100mm Fan Cooling System
Boost: 1746 MHz / Base: 1632 MHz in OC mode 
Boost: 1721 MHz / Base: 1607 MHz in Gaming mode
Tặng chuột Chuột Roccat Lua Tri-button khi mua VGA Gigabyte GTX 1080ti ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'92dfa160135e4482bbc3930959c4c8a8', N'Máy chơi game SONY Playstation PS4 SLIM 500GB TRẮNG', 3, 8190000.0000, N'https://www.tncstore.vn/image/cache/catalog/m%C3%A1y%20ch%C6%A1i%20game%20console/slim%20500gb%20tr%E1%BA%AFng/may-choi-game-sony-playstation-ps4-slim-500gb-trang-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Hệ máy : Asia 

Model : CUH - 2000 Series 

Sản phẩm Fullbox bao gồm : 

01 tay game 

01 cáp HDMI 

01 tai nghe mono 

01 cáp Micro USB 

01 dây nguồn 

01 sách hướng dẫn
', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'977db05da87a42b09b515de605d44b52', N'Kit Ram Kingmax DDR4 16GB ( 2x8GB )-3000-RGB', 6, 4599000.0000, N'https://www.tncstore.vn/image/cache/catalog/1111/d%C3%A1-500x500.jpg', N'Mô tả sản phẩm
- Memory Type DDR4 U-DIMM

- Data rate 3000MHz

- Pin 288-Pin

- Bandwidth 24.0GB/s

- Capacity 8GB/16GB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'9c90cf23cce64f509e2ae1fee30d2850', N'Bo mạch chủ Asrock H310M-HDV', 10, 1670000.0000, N'https://www.tncstore.vn/image/cache/catalog/Main/Main%20Asrock/H310%20HDV/bo-mach-chu-asrock-h310-hdv-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Hỗ trợ bộ vi xử lý 8th Generation Intel® Core™  (Socket 1151)

Hỗ trợ Ram DDR4 2666

Sở hữu 1 PCIe 3.0 x16, 1 PCIe 2.0 x1

Cổng xuất hình có sẵn : DVI-D, D-Sub, HDMI

7.1 CH HD Audio (Realtek ALC887 Audio Codec), ELNA Audio Caps', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'9e58503de97e4420b94aae5b85ffb96a', N'Ram Kingston HyperX Predator 16GB (2x8GB) DDR4 2933MHz RGB', 3, 4990000.0000, N'https://www.tncstore.vn/image/cache/catalog/ram/Kingston/kingston%20hyper%20x%20predator%20rgb%20bus%202933/ram-kingston-hyper-x-predator-16gb-2x8gb-ddr4-bus-2933mhz-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Ram Kingston HyperX Predator 

- Dung lượng: 16GB 

- Loại bộ nhớ: DDR4 

- Bus: 2933MHz 

- hỗ trợ led RGB ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'9f49fd4362124988bbeec854e9361e61', N'Màn hình Asus 21.5"VP228NE LED', 3, 2489000.0000, N'https://www.tncstore.vn/image/cache/catalog/m%C3%A0n%20h%C3%ACnh%20asus/Asus%20PG258Q/man-hinh-asus-215vp228ne-led-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: Asus

- Kích thước màn hình: (WxHxD): 513x373x199.4mm

-  Độ phân giải: 1920x1080

- Các cổng I /O: D-Sub, DVI-D

- Kích thước panel: Màn hình Wide 21.5"(54.6cm) 16:9', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'9fa67e5be5414d01b351bdbcc8c83a10', N'Màn hình Acer Nitro VG270 Led IPS 75Hz', 3, 4799000.0000, N'https://www.tncstore.vn/image/cache/catalog/m%C3%A0n%20acer/nitro/man-hinh-acer-nitro-vg270-1-500x500.jpg', N'Mô tả sản phẩm
Độ sáng : 250 nits
Độ tương phản: 100tr : 1
Thời gian phản hồi: 1ms
Tốc độ làm tươi: 75 Hz

Tấm nền: IPS', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'a07bd33215a14984b2a83ff3b7b411f5', N'Ghế AK Racing Office Series K500A nâu', 3, 799000.0000, N'https://www.tncstore.vn/image/cache/catalog/ak%20racing/ghe-ak-racing-office-series-k500a-nau-a-500x500.JPG', N'Mô tả sản phẩm
Chất liệu: da PU

Kê tay: có thể nâng lên - hạ xuống

Khung chân: kim loại sơn tĩnh điện đen

Trọng lượng tối đa: 150kg

Ngả lưng: 170* + 12*

Phụ kiện đi kèm: đệm kê lưng, đệm kê đầu', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'a3472206dde24696aa204a4cf9fc23ea', N'GAMING PC - RED DEVIL 1060', 15, 15414000.0000, N'https://www.tncstore.vn/image/cache/catalog/11112/sniper%20red/ava_ava%202_ava%201-500x500.jpg', N'Mô tả sản phẩm
- CPU: AMD Ryzen™ 3 2200G 4 Cores 4 Threads 3.5 GHz

- Mainboard: ASUS Prime B350M-A

- Ram: Kingmax ZEUS DDR4 8GB Bus 3000 RGB

- VGA: MSI GEFORCE GTX 1060 3GT OC

- Nguồn: Corsair Series VS 450W 80 Plus

- Ổ cứng HDD: Seagate BarraCuda 1TB 7200RPM Sata3

- Vỏ Case: Xigmatek Scorpio
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'a4588d23735c496fb02f5f4263e02845', N'Đế Tản Nhiệt K15', 2, 199000.0000, N'https://www.tncstore.vn/image/cache/catalog/E-Blue%20Mazer%20-%20Type%20G/Untitled-1-500x500.jpg', N'Mô tả sản phẩm
- Phù hợp với laptop từ 15.6 inch. 
- Thiết kế hiện đại, công suất làm mát hiệu quả, giúp tăng tuổi thọ của máy tính. 
- Tốc độ quạt:	700 ~ 1400RPM 
- Kết nối đơn giản qua cổng USB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'a69f091a1a0a49749ffc923283cc7b93', N'Ổ cứng HDD Seagate Barracuda 2TB 3.5" SATA3 64MB Cache/ 7200RPM', 10, 1690000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/BARRACUDA/2tb/41H888-QJdL-500x500.jpg', N'Mô tả sản phẩm
Hãng sản xuất: Seagate
Dung lượng: 2TB 
Chuẩn cắm: SATA3
Bộ nhớ đệm: 64M 
Tốc độ vòng quay: 7200rpm', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'a73ec51111a74ab48c465e14b610acc9', N'Màn Hình Acer XB271HU bmiprz 144Hz', 3, 18890000.0000, N'https://www.tncstore.vn/image/cache/catalog/man%20hinh/M%C3%A0n%20h%C3%ACnh%20Acer/Acer%20XB271HU%20bmiprz/man-hinh-acer-xb271hu-bmiprz-144hz-tncstore-3-500x500.jpg', N'Mô tả sản phẩm
- Kích Thước Màn Hình: 27" WQHD (2560 x 1440)

- Tấm Nền: IPS (178°x178°)

- Cổng Hỗ Trợ: DisplayPort, HDMI, USB 3.0

- Thời Gian Đáp Ứng: 4 ms GTG

- Độ Tương Phản: 350 Nit', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'aa632c62e96549158625a39cbe8572c7', N'Ram PC Adata 8GB DDR4 2400 AX4U240038G16-SBG', 3, 2270000.0000, N'https://www.tncstore.vn/image/cache/catalog/ram/ram-pc-adata-8gb-ddr4-2400-ax4u240038g16-sbg-2-500x500.jpg', N'Mô tả sản phẩm
Hãng: ADATA
Model: AX4U240038G16-SBG
Loại RAM: DDR4
Dung lượng: 8GB
Bus: 2400', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'ab458d0be1304ed2b570215b317253a2', N'Tay cầm Sony PS4 DUALSHOCK 4 trắng', 10, 1349000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/Tay%20c%E1%BA%A7m%20Sony%20PS4%20DUALSHOCK%204%20tr%E1%BA%AFng/1-500x500.jpg', N'Mô tả sản phẩm
Tay cầm PS4 không dây
Thiết kế tay cầm thuận tiện với các nút bấm nhạy, cảm ứng đa điểm
Đèn LED định vị có thể đổi màu
Tích hợp bộ rung cho trải nghiệm game chân thật
Tích hợp loa ngoài và jack cắm tai nghe 3.5mm
Kết nối: cổng USB, Bluetooth', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'afb2dd8a20bd49a3858da625f67dd72b', N'Laptop ACER Predator Helios PH315-51-7533', 3, 33780000.0000, N'https://www.tncstore.vn/image/cache/catalog/laptop/laptop%20acer/predator/laptop-acer-predator-helios-ph315-51-7533-1-500x500.jpg', N'Mô tả sản phẩm
- CPU : Intel® Core i7-8750H (2.2Ghz Upto 4.1GHz, 9MB Cache, 6Cores 12Threads)

- RAM : 8GB DDR4 2400MHz

- HDD : 128GB SSD + 1TB HDD

- VGA : NVIDIA® GeForce® GTX1060 6GB GDDR5

- Màn hình : 15.6” Full HD (1920x1080) IPS

- OS : Linux 

- Pin : 4 Cell 48Whr

- Cân nặng : 2.7kg', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'afff24654c4b4364a00cab4fd767ee30', N'Ổ cứng HDD Seagate BarraCuda 2TB 2.5inch', 10, 2259000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/Seagate/2-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: SEAGATE
- Vòng quay: 5400rpm
- Dung lượng ổ: 2TB 
- Dung lượng bộ nhớ đệm (Cache): 128MB.
- Tốc độ  6Gb/s', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'b221fa21038544ce9644d30c47c8ff99', N'Bàn di Asus ROG Whetstone', 3, 899000.0000, N'https://www.tncstore.vn/image/cache/catalog/b%C3%A0n%20di/Asus/ROG%20Whetstone/ban-di-asus-rog-whetstone-tncstore-q-500x500.jpg', N'Mô tả sản phẩm
Thiết kế linh động cho các buổi tiệc LAN
Hoa văn bề mặt lấy cảm hứng từ văn hóa Maya cho khả năng điều khiển chuẩn xác từng điểm ảnh
Chất liệu nhựa silicôn chống trượt, bền, không mùi và có thể giặt được.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'b257e51e732e400b8e9746a94c4c848d', N'Ghế NobleChairs EPIC Series White', 3, 11590000.0000, N'https://www.tncstore.vn/image/cache/catalog/gh%E1%BA%BF/noblechairs/tr%E1%BA%AFng%20tinh%20kh%C3%B4i/1-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: NobleChairs

- Trọng lượng tối đa: 120Kg

- Trọng lượng: 28kg

- Chất Liệu: Kim Loại, Nhựa, Da,

- Ngả: 180 độ
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'b570858fe67a4b8ea230a54cd1882439', N'Vỏ case Thermaltake The Tower 900 E-ATX', 3, 5790000.0000, N'https://www.tncstore.vn/image/cache/catalog/case/Thermaltake%20The%20Tower%20900/vo-case-thermaltake-the-tower-900-1-tncstore-500x500.jpg', N'Mô tả sản phẩm
* Kiểu case: Full Tower.
* Kích thước: 752 x 423 x 483mm
* Cân nặng: 24.5kg.
* Cửa sổ kính cường lực 3*5mm.
* Kèm dây riser 200mm tiêu chuẩn.
* Hỗ trợ main: USB 3.0 x 4, HD Audio x 1
* Cổng I/O: USB 3.0 x 2, USB 2.0 x 2, HD Audio x 1
* Hỗ trợ chiều dài VGA: 400mm.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'b58c804252764055bb53af81701fc4fe', N'Case Segotep K10 Tempered Glass', 3, 2399000.0000, N'https://www.tncstore.vn/image/cache/catalog/case%20segotep/segotep%20k10/case-segotep-k10-tempered-glass-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- CHẤT LIỆU: Kính cường lực 6 ly
- KÍCH THƯỚC: 210 x 590 x 600
- HỖ TRỢ: 12 FAN (4 trước, 2 sau, 3 đáy, 3 nóc)', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'b59fddb8c9194b1f8e65f7b2291b0754', N'Nguồn 1STPLAYER DK PS-600AX Bronze Full Modular', 5, 1099000.0000, N'https://www.tncstore.vn/image/cache/catalog/ngu%E1%BB%93n%20case/Ngu%E1%BB%93n%201STPLAYER%20DK%20PS-600AX%20Bronze%20Full%20Modular/nguon-1stplayerdk-ps-600ax-bronze-full-modular-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
- Đầu nối: SATA, IDE, 4 + 4Pin, 6 + 2Pin, 20 + 4Pin 
- AC Đầu vào: 100-240V 
- Đầu ra: 5V SB / 2.5A, -12V / 0.3A 
- Công suất: 600w
- Loại công suất: Nguồn cung cấp máy chủ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'b661963fd4044b2d8ed660898aa943f9', N'Laptop Asus TUF GAMING FX504GE-E4059T', 3, 25899000.0000, N'https://www.tncstore.vn/image/cache/catalog/laptop/asus/Laptop%20Asus%20TUF%20GAMING%20FX504GD-E4262T/laptop-asus-tuf-gaming-fx504gd-e4262t-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
 - Cpu: Intel Core i7-8750H (2.2GHz Upto 4.1GHz, 6 Cores 12 Threads, 9MB)

- Ram:  8GB DDR4 2666MHz

- Ổ cứng: 1TB SATA3 SSHD with 8GB SSD Flash Drive (5400rpm)

- Màn hình: 15.6" Full HD IPS(1920x1080)

- VGA: nVidia GeForce GTX 1050Ti 4GB GDR5', 1, CAST(0xE83E0B00 AS Date))
GO
print 'Processed 100 total records'
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'b85427b3afe44bebb837abcf2b39d68a', N'WORKSTATION PC - Xeon 1060', 15, 26890000.0000, N'https://www.tncstore.vn/image/cache/catalog/11112/xeon%201060/Avatar_ava%201-500x500.jpg', N'Mô tả sản phẩm
- CPU: Intel Xeon E-2136 3.3 GHz Turbo up to 4.5GHz/12MB/6 Cores, 12 Threads

- Bo mạch chủ: Asus WS C246 PRO

- RAM: Kingston ECC 8GB Bus 2400Mhz

- VGA: ASUS DUAL GEFORCE GTX1060-O3G

- Nguồn: Andyson GX600 80Plus Gold

- HDD: Seagate BarraCuda 1TB 7200RPM Sata3

- Vỏ case: Vitra Nefertiti X9 RGB E-ATX
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'baa60f215f8d4cd383287bd9d8d2a2bc', N'Bo mạch chủ ASUS Prime B450M-A', 10, 1999000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/asus%20b450m-a/bo-mach-chu-asus-prime-b450m-a-1-500x500.jpg', N'Mô tả sản phẩm
Hãng sản xuất : Asus

Chipset : AM4

Graphic : AMD Ryzen™ with Radeon™ Vega Graphics Processors 
Audio : Realtek® ALC887 8-Channel High Definition Audio CODEC 
Size : mATX Form Factor  :9.6 inch x 9.5 inch ( 24.4 cm x 24 cm )', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'bba7ba6be3f44a28b4a914f41d8d2044', N'Máy chơi game SONY Playstation PS4 SLIM 500GB', 3, 8190000.0000, N'https://www.tncstore.vn/image/cache/catalog/m%C3%A1y%20ch%C6%A1i%20game%20console/slim%20500gb/may-choi-game-sony-playstation-ps4-slim-500gb-tnctore-1-500x500.jpg', N'Mô tả sản phẩm
Hệ máy : Asia 

Model : CUH - 2000 Series 

Sản phẩm Fullbox bao gồm : 

01 tay game 

01 cáp HDMI 

01 tai nghe mono 

01 cáp Micro USB 

01 dây nguồn 

01 sách hướng dẫn
', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'bc0e5e59e13349369e52438602d01d01', N'Ổ cứng HDD Seagate 3TB 7200rpm, Sata3 64MB Cache', 10, 2499000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/HDD%20Seagate%203TB/hdd-seagate-3tb-a-500x500.jpg', N'Mô tả sản phẩm
HDD 3.5 Inch (Ổ cứng Desktop) Seagate Barracuda 3TB - Dung lượng:	3Tb 
- Tốc độ quay:	7200rpm 
- Bộ nhớ Cache:	64Mb 
- Chuẩn giao tiếp:	SATA3 
- Kích thước:	3.5Inch', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'bd1034aaf5454bfea5caf56d5721fa11', N'Tay cầm chơi game MSI GC30', 10, 900000.0000, N'https://www.tncstore.vn/image/cache/catalog/tay%20c%E1%BA%A7m/tay%20c%E1%BA%A7m%20msi%20gc30/tay-cam-msi-gc30-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Support for Wireless

Support PC, Android and Popular Consoles

Long-acting Lithium Battery Lasting at least 8 Hours Gaming

Dual Vibration Motors Inside

Durable Switches with Excellent Feel

Additional D-Pad Cover

2M Cable & 30 CM Cable for Android', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'be8ca903ce7a440e81ceb1fd56abda90', N'Corsair RM1000M 1000W 80 Plus Gold Modular PSU', 5, 4449000.0000, N'https://www.tncstore.vn/image/cache/catalog/ngu%E1%BB%93n%20case/RM1000/6-500x500.jpg', N'Mô tả sản phẩm

', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'bffd7c7318d6411e8eabddbd45f0178b', N'Chuột E-Blue Cobra II EMS151BK Optical USB Black', 2, 319000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/E-Blue%20Cobra%20II%20EMS151BK%20Optical%20USB%20Black/eblue-cobra-ii-ems151bk-optical-usb-black-1-500x500.jpg', N'Mô tả sản phẩm
Chuẩn Chuột: Có dây / Optical
Độ phân giải: 400/800/1600DPI
Thiết kế bắt mắt với đèn LED nổi bật
Phím điều chỉnh chế độ DPI trên thân chuột, đổi màu LED khi chuyển chế độ DPI.
Nút bấm Back – Forward phù hợp với cả nhu cầu văn phòng', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'c11a3fe5123b41fcbd676fa63b5d96dc', N'm2SSD Intel Optane 32GB PCIe NVMe 3.0x2', 3, 1289000.0000, N'https://www.tncstore.vn/image/cache/catalog/SSD/intel%20optane%2032gb/m2ssd-intel-optane-32gb-pcie-nvme-30-x2-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
- Dung lượng: 32GB 

- Kích thước: M.2 22 x 80mm 

- Kết nối: M2 

- Tốc độ Đọc/Ghi: Upto 135MBps / 290MBps 

- Đọc / Ghi ngẫu nhiên: 240000 IOPs / 6500 IOPs 

- Tuổi thọ: 1.6 triệu giờ 

- Điện năng tiêu thụ (ide): 1W, Active 3.5W', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'c122d6434c494e4e82edadb9ed3968c4', N'Laptop Acer AN515-52-75FT', 3, 26890000.0000, N'https://www.tncstore.vn/image/cache/catalog/222/1-500x500.jpg', N'Mô tả sản phẩm
- CPU : Intel® Core i7-8750H (2.2GHz Upto 4.1GHz, 6 Cores 12 Threads, 9MB Cache)

- RAM : 8GB DDR4

- HDD : 128GB SSD + 1TB HDD 5400rpm

- VGA : NVIDIA GeForce GTX 1050Ti 4GB GDDR5

- Màn hình : 15.6" FullHD (1920x1080) IPS LED

- Pin : 4 Cell', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'c2c838b812644ab085304713d2c1fdd7', N'Laptop Acer Aspire VX5-591G-52YZ NH.GM2SV.002', 3, 21089000.0000, N'https://www.tncstore.vn/image/cache/catalog/laptop/laptop%20acer/laptop-acer-aspire-vx5-591g-52yz-nhgm2sv002-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Bộ vi xử lý : Intel® Core™ i5 7300HQ Kabylake 

- Chipset : Intel® HM175 

- Bộ nhớ trong : 8GB DDR4 

- VGA : NVIDIA GeForce GTX 1050 4GB GDDR5 VRAM 

- Màn hình : 15.6” Full HD 1920 x 1080 (non-glare, color blast)

- 128GB SSD + 1TB SATA 5400rpm

Khuyến mại Balo Acer + chuột Roccat Kova trị giá 1.599.000đ
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'c2f987264bcc4b6d9013bd0cc6637343', N'Máy chơi game SONY Playstation PS4 SLIM 500GB', 3, 8190000.0000, N'https://www.tncstore.vn/image/cache/catalog/m%C3%A1y%20ch%C6%A1i%20game%20console/g-500x500.jpg', N'Mô tả sản phẩm
Hệ máy : Asia 
Model : CUH - 2000 Series 
- Sản phẩm Fullbox bao gồm : 
1 tay game dualshock , cáp HDMI, tai nghe Sony Mono 
', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'c63cc38b530741dc97277f5190031d1b', N'GAMING PC - DREAMING PC 1080TI', 15, 105074000.0000, N'https://www.tncstore.vn/image/cache/catalog/case%20gaming%20/dreaming%20pc%201080ti/333-500x500.jpg', N'Mô tả sản phẩm
Cùng xem qua chi tiết hệ thống hệ thống : 

- CPU : AMD Ryzen Threadripper 1950X 3.4GHz

- MAIN: MSI X399 GAMING PRO CARBON AC

- VGA : MSI GTX 1080Ti LIGHTNING 11GB

- RAM : G.Skill TRIDENT Z RGB - 64GB (8GBx8) DDR4 3000GHz

- PSU : Corsair HX750 - 750 Watt Modular 80 Plus Platinum

- CASE: Cougar CONQUER Ultimate Dream Masterpiece

- HDD : Western Blue 2TB/5400 Sata3 64M

- SSD : Samsung 850 EVO 250Gb M2SATA 6Gb/s

- Tản nhiệt CPU : Corsair Hydro Series H100i v2 Extreme Performance 

- Card wifi: ASUS Wifi PCE-AC55BT (Giá chưa bao gồm sản phẩm này)', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'cb931f45eb8c426d9008a8e0e1c6b68f', N'CPU Intel Core i7 - 7820X 3.6 GHz Turbo 4.3 Up to 4.5 GHz', 5, 19498000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/7740x/cpu-intel-core-i7-7740x-43-ghz-turbo-45-ghz-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Bộ vi xử lí Intel Core i7 - 7820X cấu tạo bởi 8 lõi vi xử lý 16 phân luồng

- Bên cạnh đó tần số cơ sở của bộ xử lý là 3,6 GHz  và nguồn điện tiêu thụ 140 watt

- BVXL intel core i7 được intel xây dựng trên công nghệ mới nhất

- Hãng sản xuất: intel

- socket: 2066', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'ce9dcfd63c2c4a6daa68b3c057f0ee16', N'Laptop Asus S510UA-BQ414T', 3, 14790000.0000, N'https://www.tncstore.vn/image/cache/catalog/laptop/asus/vivobook%20S510UQ/laptop-asus-s510uq-bq475t%20-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Bộ vi xử lý: Intel Core i5-8250U (4 x 1.6 GHz/6MB cache) - Max Turbo Frequency: 3.4GHz – COFFEE LAKE 

Bộ nhớ trong: 1 x 4GB DDR4 2400Mhz 

Ổ cứng: 1TB SATA3 (5400rpm) 

Màn hình: 15.6" FHD IPS (1920x1080) LED Backlight (Anti-glare)

', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'd4e1618dc6394a919ca8118c442c9da4', N'Laptop Gaming MSI GT83 Titan 8RG 037VN', 3, 141999008.0000, N'https://www.tncstore.vn/image/cache/catalog/LapTop/MSI/Laptop%20Gaming%20MSI%20GT83%20Titan%208RG%20037VN/laptop-gaming-msi-gt83-titan-8rg-037vn-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
 - Cpu: Intel Core i7-8850H Processor (2.6Ghz, up to 4.3GHz, 

9MB SmartCache, 6 Cores, 12 Threads)

- Ram:  32GB DDR4

- Ổ cứng: Super Raid 4-512GB (256GB*2)  NVMe SSD +1TB (SATA) 7200rpm

- Màn hình: 18.4" FHD (1920*1080), IPS-Level Anti-Glare

- VGA: GeForce GTX 1080 SLI, 8GB GDDR5X', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'd62e3c708c8943eb804db90ad503bd3e', N'Bàn phím cơ 1stPlayer Firerose MK3 RGB Black (Blue switch)', 2, 1099000.0000, N'https://www.tncstore.vn/image/cache/catalog/ban%20phim/mk3%20rgb/mk3-rgb-a-500x500.jpg', N'Mô tả sản phẩm
Thiết kế tiêu chuẩn dễ sử dụng 
Tính năng NKRO đầy đủ tất cả các phím 
Led RGB 16.8 triệu màu với nhiều hiệu ứng tuyệt đẹp 
Công tắc cơ học chất lượng cao, độ bền 50 triệu lần bấm 
TÍNH NĂNG ĐẶC BIỆT: SWITCH CÓ THỂ THÁO RỜI 
Đặc biệt với tính năng chống nước đạt tiêu chuẩn IPX7.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'd654cb91b1ab48b9b0833182e3642d38', N'Corsair AX1200i 1200W Digital 80 Plus Platinum Modular PSU', 5, 7858000.0000, N'https://www.tncstore.vn/image/cache/catalog/ngu%E1%BB%93n%20case/AX1200i/1-500x500.jpg', N'Mô tả sản phẩm', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'd69f835d56554d64a3c3864a8eaf28c4', N'CPU AMD Ryzen 5 1400 3.2GHz - 3.4GHz socket AM4', 5, 4309000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/1400/61ws2nE8ElL._SL1500_-500x500.jpg', N'Mô tả sản phẩm
AMD SenseMI Technology
Socket AM4
Max Turbo Frequency 3.40 GHz
4 Core 8 Threads
Thermal Design Power 65W.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'd8216994ffcd41a6bbaeeded777e8054', N'Corsair RM Series RM650X - 80 Plus Gold Full Modular', 5, 2999000.0000, N'https://www.tncstore.vn/image/cache/catalog/ngu%E1%BB%93n%20consair%20RM%20650X/1-500x500.jpg', N'Mô tả sản phẩm
Model: Corsair RM Series 650X - 80 Plus Gold - Full Modular
Xuất xứ: Chính hãng
Trọng lượng: 1,9 kg
Tình trạng: Mới 100%
Nguồn điện: 650W
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'da9e9cfb813c4db2af80df240777d548', N'Ghế NobleChairs EPIC Series Black /Red', 3, 11590000.0000, N'https://www.tncstore.vn/image/cache/catalog/gh%E1%BA%BF/noblechairs/dendo/Epic-PU-Red01-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: NobleChairs

- Trọng lượng tối đa: 120Kg

- Trọng lượng: 28kg

- Chất Liệu: Kim Loại, Nhựa, Da,

- Ngả: 180 độ', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'dc8d881e5d794d6cb0a556a6de81f3ce', N'CPU Intel Core i7-6700 (3.4 GHz, 8MB, HD 530 Graphics, Socket 1151)', 5, 7399000.0000, N'https://www.tncstore.vn/image/cache/catalog/CPU/44-500x500.jpg', N'Mô tả sản phẩm
Bộ vi xử lí Intel Core i7-6700 là 4 lõi vi xử lý 8 phân luồng.
Bên cạnh đó tần số cơ sở của bộ xử lý là 3,4GHz, có tần số Turbo Boost của 4.00GHz và nguồn điện tiêu thụ 65 watt.
Ngoài ra BVXL intel core i7 được intel xây dựng trên công nghệ mới nhất 14nm +. iGPU cập nhật có tên HD530 của Intel. Sản phẩm hiện có bán tại TNC Store.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'dd8f9480ec0b4b3d980e4c4337bb74c4', N'm2SSD Intel Optane 16GB PCIe NVMe 3.0 x2 (Đọc: 900 MB/s, Ghi: 145 MB/s)', 3, 949000.0000, N'https://www.tncstore.vn/image/cache/catalog/SSD/intel%20optane%2032gb/m2ssd-intel-optane-32gb-pcie-nvme-30-x2-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
- Dung lượng: 16GB 

- Kích thước: M.2 22 x 80mm 

- Kết nối: M2 

- Tốc độ Đọc/Ghi: Upto 900MBps / 145MBps 

- Đọc / Ghi ngẫu nhiên: 240000 IOPs / 6500 IOPs 

- Tuổi thọ: 1.6 triệu giờ 

- Điện năng tiêu thụ (ide): 1W, Active 3.5W', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'e11fded1095e4a3b8c6f079d158aeb1c', N'Màn hình Acer 23.8" R241Y LED IPS', 3, 3879000.0000, N'https://www.tncstore.vn/image/cache/catalog/m%C3%A0n%20acer/R241Y/ma-hinh-acer-24-r241y-led-ips-1-500x500.jpg', N'Mô tả sản phẩm
Screen Size : 23.8 inch

Resolution : Full HD

Refesh rate : 60Hz

Panel : IPS
Aspect Ratio : 16:9', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'e9067615aff64d869af81c0efc7d8fbd', N'KIT RAM Kingston HyperX Fury Black 8G/2400 (4GB *2)', 0, 2394000.0000, N'https://www.tncstore.vn/image/cache/catalog/%20T%E1%BA%A3n%20Nhi%E1%BB%87t%20Laptop/ram/ram-kingston-hyperx-fury-black-4g2400-tncstore-b-500x500.jpg', N'Mô tả sản phẩm
- Kingston HyperX Fury 4G DDR4 can handle even the toughest battle.

- FURY DDR4 runs at 1.2V, even at 2666MHz, so it stays cooler while you play.

- Specs: DDR4 , 2400MHz , CL14 , 1.2V 

- Timings: 2400MHz, 14-14-14, 1.2V', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'ea7c5d0b18bb45179702588aec30c22b', N'WORKSTATION PC - RENDER MASTER 1070Ti', 15, 38526000.0000, N'https://www.tncstore.vn/image/cache/catalog/case%20gaming%20/dragon%20lair/maxresdefault-500x500.jpg', N'Mô tả sản phẩm
- CPU AMD Ryzen 7 2700X 3.7 GHz (4.3 GHz Turbo)

- VGA MSI GTX 1070 Ti Gaming X 8GB

- Ram Kingston HyperX Predator 16GB (2x8GB) DDR4 2933MHz RGB

- Bo mạch chủ MSI X470 GAMING PLUS

- Vỏ Case NZXT H500i Smart (Matte Black/ Red)

- Ổ cứng HDD Seagate Barracuda 2TB 3.5" SATA3

- Ổ Cứng SSD Intel 545s Series Sata3 128GB (Đọc 550MB/s, Ghi 440MB/s) .

- Nguồn Case Corsair CX750M 750W 80 PLUS Bronze', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'eb2e8d2b1f8742648ff68b06e94b27e4', N'Màn hình AOC 23"I2380SD LED IPS', 3, 2699000.0000, N'https://www.tncstore.vn/image/cache/catalog/corsair/man-hinh-aoc-i2380sd-led-23inch-1470207949-500x500.jpg', N'Mô tả sản phẩm', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'eda264a46a4c4fdeb9a3ba3b4af8fffa', N'Bundle COD Black Ops - 1070 Ti', 5, 15699000.0000, N'https://www.tncstore.vn/image/cache/catalog/bundle/bundle%20111-500x500.jpg', N'Mô tả sản phẩm
Bundle gồm 3 sản phẩm:

- Card đồ họa: ASUS ROG STRIX GEFORCE GTX 1070 TI A8G

- Nguồn: Thermaltake Smart Pro RGB 650W

- SSD: Ổ cứng SSD ADATA XPG SX6000 128GB M2 NVMe 2280', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f0081c0b371d4e68abc3f41afec0878a', N'Tay cầm chơi game Razer Raiju - Gaming Controller for PS4', 10, 3999000.0000, N'https://www.tncstore.vn/image/cache/catalog/tay%20c%E1%BA%A7m/Tay%20c%E1%BA%A7m%20ch%C6%A1i%20game%20Razer%20Raiju%20-%20Gaming%20Controller%20for%20PS4/tay-cam-choi-game-razer-raiju-gaming-controller-for-ps4-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Bộ điều khiển Pro-Gaming cho PS4

- Bốn nút lập trình đầy đủ bổ sung

- Hình dáng và Trọng lượng Ergonomic

- Bảng điều khiển nhanh để dễ dàng tuỳ chỉnh hồ sơ và âm thanh

- Thiết bị ngắt kích hoạt tùy chọn', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f029bfc5891749459cd69f0e5a8cafa0', N'Dây Riser Thermaltake Gaming PCI-E 3.0 X 16', 20, 890000.0000, N'https://www.tncstore.vn/image/cache/catalog/D%C3%A2y%20Riser/Thermaltake%20Ac%20053/riser-cable-thermaltake-gaming-pci-e-3x16-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Chiều dài cáp: 200mm (7,9 inch)

- Khối lượng tịnh: 0,08kg / 0,17 lb

- Màu: Đen

- Vật chất: PCB & Đồng

- Giao diện: PCI-E 3.0', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f37d1fc70d1543858ea92c8bdc5912ee', N'Bo mạch chủ Asus Prime Z390-A', 10, 1999000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/asus%20prime%20z390-a/bo-mach-chu-z390-a-2-500x500.jpg', N'Mô tả sản phẩm
Kích cỡ ATX

Socket : 1151

Slot : 4 Khe RAM DDR4 ( Max 64GB)

Hỗ trợ khe M2 NVME
', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f471f8350fb443ce8130def9803c0720', N'GAMING PC - Glacier 2 1050Ti', 15, 11983000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamepc/Glacier2/1_ava%201-500x500.jpg', N'Mô tả sản phẩm
- CPU : Intel Pentium G5400 3.70 GHz / 4MB / UHD 610 / Socket 1151 (Coffelake)

- MAIN: ASUS EX-B360M-V3

- VGA : Vga Inno3D GeForce GTX 1050 Ti Twin X2 4Gb GDDR5

- RAM : G.SKILL RIPJAWS 8GB DDR4 2666MHz (4GB x 2) - Đã gồm ưu đãi tặng RAM

- PSU : Nguồn Raidmax 400W RX-400XT

- CASE: Xigmatek Sirocon

- SSD : Apacer Panther 2.5 inch Sata III 120GB', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f509f21a90894654b5c34f6fe4194430', N'Màn hình AOC 23.8"I2490VXQ LED IPS', 3, 3689000.0000, N'https://www.tncstore.vn/image/cache/catalog/m%C3%A0n%20h%C3%ACnh%20AOC/I2490VXQ%20LED%20IPS/man-hinh-aoc-238i2490vxq-led-ips-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Kích thước: 23,8 inch

- Thời gian đáp ứng: 4 ms

- Độ phân giải: 1920x1080

- Kích thước màn hình: 527.04x296.46mm

- Refresh rate: 60Hz', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f6e11bf25cc84686b13e7826e5bdfd7b', N'Bo Mạch Chủ ASUS ROG CROSSHAIR VII HERO', 10, 8499000.0000, N'https://www.tncstore.vn/image/cache/catalog/Main/Main%20Asus/ROG%20CROSSHAIR%20VII%20HERO/bo-mach-chu-asus-rog-crosshair-vii-hero-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: Asus

- Chipset: AMD X470

- Bảo hành: 36 Tháng

- Hỗ trợ socket: AM4 AMD Ryzen 2nd Generation

- Hỗ trợ Công nghệ NVIDIA SLI 2 Chiều; Công nghệ AMD 3-Way CrossFireX', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f75d5852a9f448d681b333031d999631', N'Tay cầm Sony PS4 DUALSHOCK 4 trắng', 10, 1349000.0000, N'https://www.tncstore.vn/image/cache/catalog/gamegears/Tay%20c%E1%BA%A7m%20Sony%20PS4%20DUALSHOCK%204%20v%C3%A0ng%20/tay-cam-ps4-dualshock-4-vang-a-500x500.jpg', N'Mô tả sản phẩm
Tay cầm PS4 không dây
Thiết kế tay cầm thuận tiện với các nút bấm nhạy, cảm ứng đa điểm
Đèn LED định vị có thể đổi màu
Tích hợp bộ rung cho trải nghiệm game chân thật
Tích hợp loa ngoài và jack cắm tai nghe 3.5mm
Kết nối: cổng USB, Bluetooth', 1, CAST(0xE93E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f7c2f19a768e49f2bac4012268ff510c', N'Bo mạch chủ Asus C246M Pro', 10, 6680000.0000, N'https://www.tncstore.vn/image/cache/catalog/main/Asus%20C246M%20pro/bo-mach-chu-c246m-pro-1-500x500.jpg', N'Mô tả sản phẩm
Processor / System Bus 1 x Socket LGA1151 : Xeon E-2100 family,Pentium,Celeron,Intel i7/i5/i3 

Core Logic Intel® C246 Chipset

Memory Total Slots : 4 (2-channel) 

Capacity : Maximum up to 64GB UDIMM

Memory Type : Dual Channel DDR4 2666/2400 /2133 

Memory Size :16GB, 8GB UDIMM

Form Factor U ATX (9.6"x9.6", 244mm x 244mm)', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f99207e7bb7649eda0f99b579d0641e9', N'Màn hình Acer Predator Z35P', 3, 27999000.0000, N'https://www.tncstore.vn/image/cache/catalog/man%20hinh/M%C3%A0n%20h%C3%ACnh%20Acer/Acer%20Predator%20Z35P/acer-predator-z35p-1-500x500.jpg', N'Mô tả sản phẩm
35" QHD Curved 1800R UltraWide Screen with 3440 x 1440 resolution
Refresh Rate: 100Hz - Using Display Port
Response Time: 4ms, Pixel Pitch: 0.34mm
2 x 9W speakers
Signal inputs: 1 x HDMI (V1.4), 1 x Display port (V1.2) & USB 3.0.', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f99b7a883b8b4d69a8b76f134bdcc61b', N'HDD Western Caviar Blue 3TB/5400 Sata3 64M', 30, 2639000.0000, N'https://www.tncstore.vn/image/cache/catalog/HDD/western%20blue%203tb/hdd-western-caviar-blue-3tb5400-sata3-64m-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
- Dung lượng: 3Tb

- Tốc độ quay: 5400rpm

- Bộ nhớ Cache: 64Mb

- Chuẩn giao tiếp:	SATA3

- Kích thước:	3.5Inch', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'f9df9a209eec44b698d530e21eac2db9', N'Case Segotep SG-K7 (Full Tower)', 3, 2399000.0000, N'https://www.tncstore.vn/image/cache/catalog/V%E1%BB%8F%20case/Case%20Segotep%20SG-K7/Case%20Segotep%20SG-K7-b-500x500.jpg', N'Mô tả sản phẩm
Tên sản phẩm: Segotep K7. 
Kích thước: 476mm x 205 mm x 455mm. 
Trọng lượng: 7kg. 
Cài đặt: 3 trước 120mm fan hâm mộ, 2 trên đầu, 1 phía sau 
VGA: CPU tản nhiệt 320mm', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'fb7037c9f688458fa3e548dbdf816d12', N'Balo Razer Tactical Backpack 14', 5, 3199000.0000, N'https://www.tncstore.vn/image/cache/catalog/razer/balo%20tactical/razer-tactical-backpack-140-tncstore-1-500x500.jpg', N'Mô tả sản phẩm
Made from robust 1680D ballistic nylon

Tear- and water-resistant exterior

Scratch proof interior

Soft padded shoulder straps and back panel

Adjustable chest buckle

2 large interior compartments', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'fc1170479ffb47ff83d5a5601c20cb8d', N'Laptop Acer Nitro 5 AN515-52-51LW', 3, 23789000.0000, N'https://www.tncstore.vn/image/cache/catalog/222/1-500x500.jpg', N'Mô tả sản phẩm
CPU: Intel Core i5 8300H

RAM: DDR4 8GB (1 x 8GB) 2666MHz; 2 slots, up to 32GB

GPU: GeForce GTX 1050Ti 4GB

Màn hình: 15.6" FHD (1920×1080), IPS

Ổ cứng SSD:	SSD M.2 128GB, 1 slot SSD NVMe M.2 PCIe Gen3 X4 hoặc M.2 SATA III

Ổ cứng HDD:	1TB HDD 7200 rpm

Pin:	4 Cell , 48 Whr', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'fd55e6d99419417783e31ad1be2d04b5', N'VGA GALAX GeForce GTX 1070 Ti EX 8Gb', 5, 12899000.0000, N'https://www.tncstore.vn/image/cache/catalog/vga/1070ti/VGA%20GALAX%20GeForce%20GTX%201070%20Ti%20EX%208Gb/vga-galax-gtx-1070-ti-ex-8gb-tncstore-a-500x500.jpg', N'Mô tả sản phẩm
- Hãng sản xuất: Galax
- Hỗ trợ NVIDIA Sli
- Bộ kết nối màn hình - DP1.4, HDMI 2.0b, DL-DVI
- Xung nhịp: cơ sở (MHz) 1607; OC (MHz) 1683
- Giao diện bộ nhớ 256 bit GDDR5', 1, CAST(0xE83E0B00 AS Date))
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [picture], [description], [status], [lastmodifier]) VALUES (N'ffce3a6dd9ea4d79b7fb05d5c1baf011', N'Bàn gaming C', 3, 1899000.0000, N'https://www.tncstore.vn/image/cache/catalog/B%C3%A0n%20gh%E1%BA%BF/bangaming-1-500x500.jpg', N'Mô tả sản phẩm
- Chân bàn được thiết kế đúc nguyên khối bằng thép 

- Phần sắt được sơn tinh điện không bị bong tróc theo thời gian

- Các vần tiếp giáp và chân bàn đều được bọc nhựa

- Mặt bàn vân gỗ tối màu sang trọng

- Kích thước bàn : Dài 1m2 - Rộng 66cm - Cao 75cm

', 1, CAST(0xE83E0B00 AS Date))
/****** Object:  Table [dbo].[Category]    Script Date: 11/05/2018 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[parent] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (1, N'GAMING, WORKSTATION PC', 0, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (2, N'LINH KIỆN MÁY TÍNH', 0, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (3, N'LAPTOPS & TABLETS', 0, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (4, N'GAMING GEARS', 0, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (5, N'THIẾT BỊ MẠNG', 0, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (6, N'PHỤ KIỆN, TẢN NHIỆT PC', 0, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (7, N'THIẾT BỊ VĂN PHÒNG', 0, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (8, N'GAMING PC - CHƠI GAME', 1, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (9, N'WORKSTATION - ĐỒ HỌA', 1, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (10, N'MÁY TÍNH ĐỒNG BỘ', 1, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (11, N'BỘ THỰC TẾ ẢO', 1, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (12, N'HOME, OFFICE PC - GIẢI TRÍ', 1, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (13, N'MAINBOARD - BO MẠCH CHỦ', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (14, N'CPU - BỘ VI XỬ LÍ', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (15, N'MONITOR - MÀN HÌNH PC', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (16, N'RAM - BỘ NHỚ TRONG', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (17, N'Ổ CỨNG HDD', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (18, N'VGA - CARD MÀN HÌNH', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (19, N'CASE - VỎ MÁY TÍNH', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (20, N'PSU - NGUỒN MÁY TÍNH', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (21, N'BÀN PHÍM CHUỘT', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (22, N'SSD - Ổ THỂ RẮN', 2, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (23, N'GAMING LAPTOP', 3, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (24, N'LAPTOP VĂN PHÒNG', 3, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (25, N'PHỤ KIỆN - BALO LAPTOP', 3, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (26, N'ĐẾ TẢN NHIỆT LAPTOP', 3, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (27, N'BALO GAMING', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (28, N'BÀN DI CHUỘT', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (29, N'BÀN PHÍM GAMING', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (30, N'BÀN, GHẾ GAME', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (31, N'CHUỘT GAMING', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (32, N'GAMING - HEADPHONE', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (33, N'GIÁ TREO TAI NGHE', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (34, N'MÁY CHƠI GAME CONSOLE', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (35, N'MICROPHONE', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (36, N'TAY CẦM CHƠI GAME', 4, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (37, N'SWITCH', 5, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (38, N'ROUTER WIFI, ACCESSPOINT', 5, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (39, N'MODEM ADSL INTERNET', 5, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (40, N'CARD MẠNG - WIRELESS', 5, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (41, N'DÂY RISER', 6, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (42, N'GIÁ ĐỠ VGA', 6, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (43, N'TẢN NHIỆT KHÍ CHO PC', 6, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (44, N'TẢN NƯỚC ALL IN ONE', 6, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (45, N'TẢN NƯỚC CUSTOM', 6, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (46, N'QUẠT TẢN NHIỆT PC', 6, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (47, N'BÀN PHÍM CHUỘT KHÔNG DÂY', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (48, N'BỘ CHIA USB', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (49, N'BỘ LƯU ĐIỆN', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (50, N'LOA MÁY TÍNH', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (51, N'HDD BOX', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (52, N'LOA VĂN PHÒNG', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (53, N'PHẦN MỀM BẢN QUYỀN', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (54, N'USB FLASH', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (55, N'WEBCOME', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (56, N'MÁY IN LASER', 7, 1)
INSERT [dbo].[Category] ([id], [name], [parent], [status]) VALUES (57, N'BỘ LƯU ĐIỆN', 7, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 11/05/2018 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](128) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([username], [password], [status]) VALUES (N'admin', N'$2a$10$r7CTAAZ6MLLBWoIUPZBEdeL8Y7qB7UGhL9JF4jTcE5q3dh7Lm8pWW', 1)
/****** Object:  Table [dbo].[Customer]    Script Date: 11/05/2018 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [varchar](32) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [varchar](30) NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](128) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/05/2018 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [varchar](32) NOT NULL,
	[date] [datetime] NULL,
	[customerId] [varchar](32) NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[total] [money] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category_Product]    Script Date: 11/05/2018 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category_Product](
	[productID] [varchar](32) NULL,
	[categoryID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'4cc597bbfe2f4553b07b85af2390621d', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'0b2831577a6a443db14cc1a0b4df58c9', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'7fa0ff6156404ac4b2d83f84d5d57076', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'c63cc38b530741dc97277f5190031d1b', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'a3472206dde24696aa204a4cf9fc23ea', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'6f3f5b8f61c44987bad7642269096fea', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'ea7c5d0b18bb45179702588aec30c22b', 9)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'b85427b3afe44bebb837abcf2b39d68a', 9)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'3fb1db1307214cdfad14462e69cd1539', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'8bb6de4caf5b4b02a887a52c702bd304', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f7c2f19a768e49f2bac4012268ff510c', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'4ce7dc37376749d2a14c707b8b8c8ab9', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'33a883f4d8c24da298195ea9a7e3fa83', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'3792665bc9954723a6f33f6ef568b034', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'0c3653930d3145678681601c487aab23', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'50037d8f4e414ab68103656e1c023c54', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'2ead60673dca4118b79770225b193545', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'd69f835d56554d64a3c3864a8eaf28c4', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'555919bc7fcc49eda7ffff2823785ae1', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'20bcfc27851341bbb7f1c1f59ad79eb0', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'34c9a6082c9c4dbba75e002aba9a12a6', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'224c7445eb7b4736b97a1d79e9c93619', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'e11fded1095e4a3b8c6f079d158aeb1c', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f99207e7bb7649eda0f99b579d0641e9', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'a73ec51111a74ab48c465e14b610acc9', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'eb2e8d2b1f8742648ff68b06e94b27e4', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'8435599dfadf40999e2efd1de92a994c', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'65825fa8e6d248f9bac270cbcab1bc79', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'8b22873ebdb94792919a7cf2df7ec7b7', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'1cb64c95643e4deabb62f6bcf5175b78', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'9e58503de97e4420b94aae5b85ffb96a', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'88b7ca6185114975b261750c1b647436', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'aa632c62e96549158625a39cbe8572c7', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f99b7a883b8b4d69a8b76f134bdcc61b', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'3976c15dac68417aadbbb3e2a64af885', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'731f5bb5a73142b68b2fe92563274a5a', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'35980672f3bf4ca2805f61089688f951', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'eda264a46a4c4fdeb9a3ba3b4af8fffa', 18)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'9238e8c0067247e5bc9f4d6588858bbd', 18)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'749ddb6edff34db2a74463edf632e7c1', 18)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'10a1ab0a5df64aa3a85c01c1c8ccc81b', 18)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'47844fc992084cfe81111733ccf1df35', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'715b4bcce7274094bf2c99bdde4736d6', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f9df9a209eec44b698d530e21eac2db9', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'77762e1585ae471d8739cbb8a51eca02', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'b59fddb8c9194b1f8e65f7b2291b0754', 20)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'2b8487c6123e43f290530ecbc9a32adf', 20)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'41bf4d5f61794f019d5cb66a76168c82', 20)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'd654cb91b1ab48b9b0833182e3642d38', 20)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'5584c54b28ed4f72b06686d94e0ceb28', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'437ee288617d4d09b6dc4658a03ace4e', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'1783a35f5d3d4c599f46eb5008b76f81', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'3dade0c6430442bfa2fdbff1050d54f5', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'c11a3fe5123b41fcbd676fa63b5d96dc', 22)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'81e9f450ad3a41a48263bbf0974ccae5', 22)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'4795cbbc54ac4733a629bb5dd59c7bf0', 22)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'c122d6434c494e4e82edadb9ed3968c4', 23)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'c2c838b812644ab085304713d2c1fdd7', 23)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'afb2dd8a20bd49a3858da625f67dd72b', 23)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'030f3e598bc34fbc81a8e472bf89e4b6', 24)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'0354c52bd3d64ccfae27324ba0e6c64e', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'1ef7c9de6f1c437a86f874dfe8546a2d', 27)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'fb7037c9f688458fa3e548dbdf816d12', 27)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'261479da14934d0daa72fbf1148a4bed', 27)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'85221c94688246bf92f9d11c5ca89503', 28)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'4a04bb15b27043f1af969d621e9f646b', 28)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'8610001b97a84ad8b87495f70883c009', 28)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'd62e3c708c8943eb804db90ad503bd3e', 29)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'4e03847262e8412591eea78e68931cb4', 29)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'54715854cb7249b4bde231a006a02234', 29)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'3242cd0a51d84f579b1e3919f2ef693c', 29)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'35aacc170ec749edae1ee8793d289ef5', 29)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'a07bd33215a14984b2a83ff3b7b411f5', 30)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'5ba95db3184c4139809fc76d0a2a5a5a', 31)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'5505dd8f14d540ed8b2f07b1ca09dc77', 31)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'6a2158ed663d4dbdafbda819a6744dce', 31)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f029bfc5891749459cd69f0e5a8cafa0', 33)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'2289672a770c4f20a8410479aeae3707', 33)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'c2f987264bcc4b6d9013bd0cc6637343', 34)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'92dfa160135e4482bbc3930959c4c8a8', 34)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'7ceec18a297d4582a6a7914f3c12ee43', 32)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'210edc45c7b940dca1f66b58196cc6ac', 32)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'bd1034aaf5454bfea5caf56d5721fa11', 36)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f0081c0b371d4e68abc3f41afec0878a', 36)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'6b601ae181f84a45973473e823b55ff8', 36)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'1248a26bf9ac47f0b8c5c99b64bdcc38', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f471f8350fb443ce8130def9803c0720', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'4831d9915bc74dd686830db692c267a2', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'30a57511f6964c2985e6a642033ea2c5', 8)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'9c90cf23cce64f509e2ae1fee30d2850', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'baa60f215f8d4cd383287bd9d8d2a2bc', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f37d1fc70d1543858ea92c8bdc5912ee', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f6e11bf25cc84686b13e7826e5bdfd7b', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'661b5a5394d64fc583515690f553cd31', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'bba7ba6be3f44a28b4a914f41d8d2044', 34)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'06662ebf3d0d44069f477cc467d41d2b', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'81595d14f1684e8d992f3008eb90a1b1', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'8f9a485f1d484f8695a7918576838363', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'617a95bc094c46c19f273b29f23ffc06', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'cb931f45eb8c426d9008a8e0e1c6b68f', 14)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'dc8d881e5d794d6cb0a556a6de81f3ce', 14)
GO
print 'Processed 100 total records'
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'9f49fd4362124988bbeec854e9361e61', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'0de1f8a590f94780bebc533627767803', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'9fa67e5be5414d01b351bdbcc8c83a10', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f509f21a90894654b5c34f6fe4194430', 15)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'977db05da87a42b09b515de605d44b52', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'e9067615aff64d869af81c0efc7d8fbd', 16)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'2c4d8f733c564826af05d0e09e1ad382', 18)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'b58c804252764055bb53af81701fc4fe', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'dd8f9480ec0b4b3d980e4c4337bb74c4', 22)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'd4e1618dc6394a919ca8118c442c9da4', 23)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'bc0e5e59e13349369e52438602d01d01', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'afff24654c4b4364a00cab4fd767ee30', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'a69f091a1a0a49749ffc923283cc7b93', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'2f38f931be184ab5a888b77707ae7eaf', 17)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'fd55e6d99419417783e31ad1be2d04b5', 18)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'b570858fe67a4b8ea230a54cd1882439', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'4a764bd5d7cd4e04b0e20a65d3b8122d', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'6ec8147efb34463b8de39c7d58fc7bc0', 19)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'd8216994ffcd41a6bbaeeded777e8054', 20)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'be8ca903ce7a440e81ceb1fd56abda90', 20)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'2c4e60fe742e4214a6a9dcfc42145ffb', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'08b3e68811154e1f91fba4b625f91785', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'0d891a9fc8a443f992bd4d0d53c4602e', 13)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'76848dd5b928441aae8979f06ad818a2', 21)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'fc1170479ffb47ff83d5a5601c20cb8d', 23)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'72b5e7451fa8424d9de28eec7d326470', 23)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'b661963fd4044b2d8ed660898aa943f9', 23)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'08da18313f4646bd94b1f89743b845a2', 24)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'ce9dcfd63c2c4a6daa68b3c057f0ee16', 24)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'60832c73141a4a1198db6ef8e0ffc362', 24)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'3e4e38972e9140568f1fbdf33e38bb81', 26)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'a4588d23735c496fb02f5f4263e02845', 26)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'7122aba65bbe4e85b2d29d716f295230', 28)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'b221fa21038544ce9644d30c47c8ff99', 28)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'8dd0fe32c088489daf853b6fcd029afb', 30)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'ffce3a6dd9ea4d79b7fb05d5c1baf011', 30)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'b257e51e732e400b8e9746a94c4c848d', 30)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'da9e9cfb813c4db2af80df240777d548', 30)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'bffd7c7318d6411e8eabddbd45f0178b', 31)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'5114854131954da99c7a2e8a20059f6a', 31)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'ab458d0be1304ed2b570215b317253a2', 36)
INSERT [dbo].[Category_Product] ([productID], [categoryID]) VALUES (N'f75d5852a9f448d681b333031d999631', 36)
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 11/05/2018 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[invoiceId] [varchar](32) NOT NULL,
	[productId] [varchar](32) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[invoiceId] ASC,
	[productId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__Admin__status__1B0907CE]    Script Date: 11/05/2018 09:13:14 ******/
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ((1)) FOR [status]
GO
/****** Object:  Default [DF__Invoice__date__0F975522]    Script Date: 11/05/2018 09:13:14 ******/
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT (getdate()) FOR [date]
GO
/****** Object:  ForeignKey [FK__Invoice__custome__108B795B]    Script Date: 11/05/2018 09:13:14 ******/
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([id])
GO
/****** Object:  ForeignKey [FK__Category___categ__07020F21]    Script Date: 11/05/2018 09:13:14 ******/
ALTER TABLE [dbo].[Category_Product]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
/****** Object:  ForeignKey [FK__Category___produ__060DEAE8]    Script Date: 11/05/2018 09:13:14 ******/
ALTER TABLE [dbo].[Category_Product]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([id])
GO
/****** Object:  ForeignKey [FK__InvoiceDe__invoi__15502E78]    Script Date: 11/05/2018 09:13:14 ******/
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD FOREIGN KEY([invoiceId])
REFERENCES [dbo].[Invoice] ([id])
GO
/****** Object:  ForeignKey [FK__InvoiceDe__produ__164452B1]    Script Date: 11/05/2018 09:13:14 ******/
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
