USE [master]
GO
/****** Object:  Database [QuanLiTheThao]    Script Date: 8/8/2021 9:12:22 PM ******/
CREATE DATABASE [QuanLiTheThao]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLiTheThao', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLiTheThao.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLiTheThao_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLiTheThao_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLiTheThao] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLiTheThao].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLiTheThao] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLiTheThao] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLiTheThao] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLiTheThao] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLiTheThao] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLiTheThao] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLiTheThao] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLiTheThao] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLiTheThao] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLiTheThao] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLiTheThao] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLiTheThao]
GO
/****** Object:  Table [dbo].[BinhLuanSanPham]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BinhLuanSanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](4000) NOT NULL,
	[Username] [varchar](50) NULL,
	[MaHangHoa] [nvarchar](10) NOT NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_BinhLuanSanPham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_PhieuXuat]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PhieuXuat](
	[MaPX] [int] NOT NULL,
	[MaHangHoa] [nvarchar](10) NOT NULL,
	[MaSize] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_CT_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC,
	[MaSize] ASC,
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDDH]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDDH](
	[MaDonDatHang] [int] NOT NULL,
	[MaSize] [int] NOT NULL,
	[MaHangHoa] [nvarchar](10) NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[KhuyenMai] [float] NOT NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC,
	[MaSize] ASC,
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTHangHoa]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHangHoa](
	[MaHangHoa] [nvarchar](10) NOT NULL,
	[MaSize] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_CTHangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHangHoa] ASC,
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPN]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MaPN] [int] NOT NULL,
	[MaSize] [int] NOT NULL,
	[MaHangHoa] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_CTPN_1] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaSize] ASC,
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[MaDanhMuc] [nvarchar](10) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanhMucSanPham] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhSachYeuThich](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[MaHangHoa] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_DanhSachYeuThich] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDonDatHang] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [date] NOT NULL,
	[MaNV] [int] NULL,
	[TinhTrang] [bit] NOT NULL,
	[TongTienSanPham] [float] NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[DiaChiNhanHang] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHangHoa] [nvarchar](10) NOT NULL,
	[TenHangHoa] [nvarchar](200) NOT NULL,
	[DonGia] [float] NOT NULL,
	[GiamGia] [float] NULL,
	[Anh] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](4000) NULL,
	[TinhTrang] [bit] NOT NULL,
	[MaDanhMuc] [nvarchar](10) NOT NULL,
	[ThuongHieu] [nvarchar](10) NULL,
	[coSize] [bit] NOT NULL,
 CONSTRAINT [PK_HangHoa_1] PRIMARY KEY CLUSTERED 
(
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Sdt] [nvarchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](40) NOT NULL,
	[Ten] [nvarchar](40) NOT NULL,
	[NgayVaoLam] [date] NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[CMND] [nvarchar](15) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MaNV] [int] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[NgayXacNhan] [date] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MaPX] [int] IDENTITY(1,1) NOT NULL,
	[NgayXuat] [date] NOT NULL,
	[MaNV] [int] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[NgayXacNhan] [date] NULL,
 CONSTRAINT [PK_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenSize] [nvarchar](20) NOT NULL,
	[GhiChu] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Role] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 8/8/2021 9:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[id] [nvarchar](10) NOT NULL,
	[TenThuongHieu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BinhLuanSanPham] ON 

INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (10, N'<p>abcxyzz&nbsp;<img alt="smiley" src="http://localhost:8080/QuanLiBanHangTheThao/resources/ckeditor/plugins/smiley/images/regular_smile.png" style="height:23px; width:23px" title="smiley" /></p>
', N'kon0ha', N'HH006', CAST(N'2021-05-26 12:56:45.500' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (11, N'<p>abcxyz</p>
', N'kon0ha', N'HH006', CAST(N'2021-05-26 12:56:47.483' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (12, N'<p>123123</p>
', N'kon0ha', N'HH006', CAST(N'2021-05-26 12:58:03.447' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (16, N'<p>đ&acirc;y l&agrave; b&igrave;nh luận đầu ti&ecirc;n</p>
', N'konoha', N'G001', CAST(N'2021-06-15 23:54:51.973' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (17, N'<p>đ&acirc;y l&agrave; b&igrave;nh luận</p>
', N'konoha', N'HH001', CAST(N'2021-06-15 23:55:28.100' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (18, N'<p>b&igrave;nh luận n&egrave;</p>
', N'konoha', N'HH002', CAST(N'2021-06-15 23:55:48.530' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (19, N'<p>đ&acirc;y l&agrave; b&igrave;nh luận thứ hai</p>
', N'konoha', N'G001', CAST(N'2021-06-16 00:16:25.163' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (1016, N'<p>Khi n&agrave;o c&oacute; h&agrave;ng vậy</p>
', N'kon0ha', N'G007', CAST(N'2021-06-20 17:42:36.567' AS DateTime))
SET IDENTITY_INSERT [dbo].[BinhLuanSanPham] OFF
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (1, N'HH005', 1, 1)
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (1, N'HH008', 1, 1)
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (1, N'B002', 5, 22)
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (1, N'HH006', 5, 1)
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (2, N'B003', 5, 1)
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (4, N'B001', 5, 5)
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (6, N'G001', 1, 1)
INSERT [dbo].[CT_PhieuXuat] ([MaPX], [MaHangHoa], [MaSize], [SoLuong]) VALUES (7, N'B003', 5, 4)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2032, 5, N'HH006', 95000, 6, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2033, 5, N'HH006', 95000, 8, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2033, 1011, N'G001', 460000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2034, 7, N'G001', 460000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2035, 7, N'G001', 460000, 6, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2038, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2039, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (3038, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (3039, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (4038, 5, N'HH006', 95000, 20, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5038, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5039, 1, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5040, 3, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 1, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 1, N'HH002', 205000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 3, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 3, N'HH005', 845000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 5, N'B002', 75000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 5, N'B003', 859000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 7, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 1020, N'G002', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 1020, N'G006', 520000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 1021, N'G002', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (5041, 1023, N'G002', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (6041, 5, N'B003', 859000, 3, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'B001', 5, 223)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'B002', 5, 98)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'B003', 5, 11)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 1, 88)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 3, 25)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 7, 89)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 1011, 85)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G002', 1020, 19)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G002', 1021, 19)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G002', 1022, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G002', 1023, 19)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G003', 1020, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G003', 1021, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G003', 1022, 20)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G003', 1023, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G004', 1020, 20)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G004', 1021, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G004', 1022, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G004', 1023, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G005', 1020, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G005', 1021, 20)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G005', 1022, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G005', 1023, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G006', 1020, 19)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G006', 1021, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G006', 1022, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G006', 1023, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G007', 1020, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G007', 1021, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G007', 1022, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G007', 1023, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G008', 1020, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G008', 1021, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G008', 1022, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G008', 1023, 20)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH001', 1, 140)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH002', 1, 109)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1012, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1013, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1014, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1015, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1016, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1017, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1018, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH003', 1019, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH005', 1, 29)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH005', 3, 19)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH005', 4, 100)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH006', 5, 35)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH007', 1, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH007', 3, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH007', 4, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH008', 1, -1)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH008', 3, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH008', 4, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH009', 1, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH009', 3, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH009', 4, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'PK001', 3, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'PK001', 4, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'PK001', 6, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'VCL001', 5, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'VCL002', 5, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'VCL003', 5, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'VCL004', 5, 0)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (38, 5, N'HH006', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 1, N'G001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 1, N'HH001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 1, N'HH002', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 7, N'G001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (40, 1011, N'G001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1038, 5, N'HH006', 10)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1012, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1013, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1014, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1015, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1016, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1017, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1018, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1040, 1019, N'HH003', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2041, 5, N'B001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2042, 5, N'B001', 10)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1, N'HH001', 50)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1, N'HH002', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1, N'HH005', 30)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 3, N'HH005', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 4, N'HH005', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 5, N'B002', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 5, N'B003', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1020, N'G002', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1020, N'G004', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1020, N'G006', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1021, N'G002', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1021, N'G005', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1022, N'G003', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1023, N'G002', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2043, 1023, N'G008', 20)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2044, 5, N'B001', 2)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2045, 5, N'B002', 1)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (2046, 5, N'B002', 100)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'B', N'Bóng')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'GTT', N'Giày thể thao')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'PK', N'Phụ kiện')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'QA', N'Quần áo thể thao')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'VCL', N'Vợt cầu lông')
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] ON 

INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (4, N'kon0ha', N'HH002')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (5, N'kon0ha', N'HH006')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (12, N'konoha', N'HH002')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (13, N'konoha', N'G001')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (14, N'konoha', N'HH006')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (15, N'kon0ha', N'B003')
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2032, CAST(N'2021-05-29' AS Date), 13, 1, 570000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2033, CAST(N'2021-05-29' AS Date), 13, 1, 2600000, 0, N'kon0ha', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2034, CAST(N'2021-05-29' AS Date), 13, 1, 1840000, 0, N'bro', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2035, CAST(N'2021-05-30' AS Date), 13, 1, 2760000, 0, N'konoha', N'ntt, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2038, CAST(N'2021-06-01' AS Date), 13, 1, 460000, 0, N'n18dcat_092', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2039, CAST(N'2021-06-03' AS Date), 13, 1, 460000, 0, N'kon0ha', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (3038, CAST(N'2021-06-12' AS Date), 13, 1, 460000, 30000, N'kon0ha', N'ntt, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (3039, CAST(N'2021-06-12' AS Date), 24, 1, 460000, 30000, N'kon0ha', N'111, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (4038, CAST(N'2021-06-15' AS Date), 24, 1, 1900000, 30000, N'again', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (5038, CAST(N'2021-06-17' AS Date), 13, 1, 460000, 30000, N'kon0ha', N'NTT, Quận 9, Thành phố Hồ Chí Minh')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (5039, CAST(N'2021-06-19' AS Date), 13, 1, 460000, 30000, N'kon0ha', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (5040, CAST(N'2021-06-19' AS Date), 13, 1, 460000, 30000, N'kon0ha', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (5041, CAST(N'2021-06-22' AS Date), 13, 1, 5724000, 30000, N'kon0ha', N'Nguyễn Tất Thành, thị trấn Tăng Bạt Hổ, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (6041, CAST(N'2021-08-08' AS Date), 13, 1, 2577000, 30000, N'kon0ha', N'333, Huyện An Nhơn, Bình Định')
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'B001', N'BÓNG ĐÁ ĐỘNG LỰC UHV 2.07 COBRA SỐ 5 - BÓNG THI ĐẤU V-LEAGUE', 1800000, 0, N'B001.png', N'<p><strong>B&oacute;ng đ&aacute; Động Lực UHV Cobra 2.07 số 5 b&oacute;ng thi đấu V-League,&nbsp;</strong>gi&aacute; hấp dẫn&nbsp;tại <strong>PTITSport&nbsp;</strong>&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p>&diams; B&oacute;ng đ&aacute; Động Lực UHV 2.07 Cobra, ch&iacute;nh l&agrave; mẫu b&oacute;ng được nử dụng l&agrave;m b&oacute;ng thi đấu ch&iacute;nh thức cho V-League năm 2021 - 2022, b&oacute;ng đạt ti&ecirc;u chuẩn thi đấu cao nhất của FIFA - FIFA Quality PRO.</p>

<p><strong>&loz; Th&ocirc;ng tin sản phẩm&nbsp;</strong></p>

<p>+ Size b&oacute;ng: Size 5</p>

<p>+ Trọng lượng: 420-445gr</p>

<p>+ Chu vi b&oacute;ng: 685-695mm</p>

<p>+ Chất liệu: Da PU cao cấp</p>

<p>+ Chất liệu ruột: 100% cao su</p>

<p>+ Số lượng miếng gh&eacute;p: 32 miếng.</p>

<p>-&nbsp;<strong>B&oacute;ng đ&aacute;&nbsp;Động Lực&nbsp;UHV 2.07</strong>&nbsp;Cobra&nbsp;số 5, người em của UHV 2.07&nbsp;sẽ tiếp bước&nbsp;l&agrave; b&oacute;ng thi đấu ch&iacute;nh thức cho V-League, C&uacute;p Quốc Gia&nbsp;cho năm&nbsp;2021 - 2022.</p>

<p>- Được lấy cảm hứng từ t&ecirc;n một loại rắn hổ mang dũng m&atilde;nh v&agrave; th&ocirc;ng minh. Họa tiết c&aacute;c v&acirc;n tr&ecirc;n tr&aacute;i b&oacute;ng được&nbsp;lấy h&igrave;nh ảnh rắn hổ mang, nhanh nhẹn, quyết đo&aacute;n v&agrave; kh&ocirc;n kh&eacute;o với 2 họa tiết to, khỏe nằm đối xứng nhau v&agrave; &ocirc;m lấy quả b&oacute;ng.</p>

<p>- B&oacute;ng được phối m&agrave;u hiện đại, trẻ trung, bắt mắt&nbsp; v&agrave; nổi bật tr&ecirc;n mọi mặt s&acirc;n.</p>

<p>- Về th&ocirc;ng số cơ bản th&igrave; b&oacute;ng vẫn giữ nguy&ecirc;n bả của đ&agrave;n anh UHV 2.07 nhưng sẽ c&oacute; những cải tiến kỹ thuật đ&aacute;ng kể.</p>

<p>- B&oacute;ng&nbsp;UHV 2.07 Cobra được l&agrave;m từ da PU cao cấp, c&oacute; độ bền tốt, chịu nhiệt v&agrave; chịu m&agrave;i m&ograve;n tốt ở mọi mặt s&acirc;n. B&oacute;ng được giữ hơi l&acirc;u hơn bởi được ưu ti&ecirc;n sử dụng chất liệu vecxi đặc biệt.</p>

<p>- UHV 2.07 Cobra được bổ sung th&ecirc;m một lớp đ&agrave;n hồi b&ecirc;n trong n&ecirc;n b&oacute;ng mềm hơn, kh&ocirc;ng thấm nước,&nbsp;độ nảy chuẩn v&agrave; ổn định hơn để tốc độ bay nhanh hơn, c&aacute;c thủ m&ocirc;n sẽ gặp kh&oacute; khăn hơn, b&agrave;n thắng sẽ tăng l&ecirc;n cho mỗi trận đấu, nhăm tăng sự hấp dẫn cho c&aacute;c trận đấu.</p>

<p>-&nbsp;<strong>B&oacute;ng&nbsp;đ&aacute;&nbsp;Động Lực&nbsp;UHV 2.07&nbsp;</strong>Cobra c&oacute; độ tr&ograve;n rất tuyệt đối, cảm gi&aacute;c s&uacute;t b&oacute;ng đầm, quỷ đạo bay chuẩn v&agrave; kh&ocirc;ng bị biến dạng trong qu&aacute; tr&igrave;nh thi đấu.</p>

<p>&nbsp;</p>

<p><strong>- Hướng dẫn sử dụng v&agrave;o bảo quản</strong></p>

<p>+ Kh&ocirc;ng ng&acirc;m nước qu&aacute; l&acirc;u sẽ bị thấm nươc l&agrave;m thay đổi trọng lượng b&oacute;ng v&agrave; bị mục da, n&ecirc;n lau sạch, để nơi kh&ocirc; r&aacute;o, nắng nhẹ sau khi sử dụng.</p>

<p>+ Bảo quản nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh nơi ẩm ướt hoặc nơi nhiệt độ cao.</p>

<p>+ Kh&ocirc;ng b&ocirc;i bất kỳ h&oacute;a chất n&agrave;o l&ecirc;n b&oacute;ng</p>

<p>+ Kh&ocirc;ng ngồi hoặc đ&egrave; vật nặng l&ecirc;n b&oacute;ng.</p>

<p>+ Phải c&oacute; 50% hơi trong b&oacute;ng khi vận chuyển v&agrave; bảo quản.</p>

<p><iframe frameborder="0" height="400" scrolling="no" src="https://youtu.be/rMl-jGE6W0A" width="800"></iframe></p>

<p><strong>- Hướng dẫn bơm b&oacute;ng:</strong></p>

<p>+ Phải sử dụng bơm tốt, kh&ocirc;ng sử dụng kim bị rỉ, nh&aacute;m hoặc bị cong.</p>

<p>+ N&ecirc;n nh&uacute;ng kim ướt trước khi bơm.</p>

<p>+ Để kim thẳng vu&ocirc;ng g&oacute;c với mặt b&oacute;ng.</p>

<p>+ Bơm đủ hơi để b&oacute;ng đạt chuẩn nhất.</p>
', 0, N'B', N'COBRA', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'B002', N'BÓNG RỔ PROSTAR SỐ 3 CHÍNH HÃNG', 75000, 0, N'B002.png', N'<p><strong>B&oacute;ng rổ Prostar số 3 ch&iacute;nh h&atilde;ng</strong>, chất lượng, gi&aacute; rẻ cho học sinh tại&nbsp;<strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p>&diams;&nbsp;Th&ocirc;ng tin sản phẩm B&oacute;ng rổ Prostar số 3:</p>

<p>+ Size b&oacute;ng: Size 3</p>

<p>+ Chất liệu da: 100% Cao su</p>

<p>+ Cấu tr&uacute;c: Đ&uacute;c nguy&ecirc;n khối</p>

<p>+ Sản xuất tại Việt Nam</p>

<p>&nbsp;</p>

<p>-&nbsp;Quả b&oacute;ng rổ&nbsp;Prostar số 3 l&agrave; d&ograve;ng sản phẩm b&oacute;ng rổ cao su gi&aacute; rẻ b&aacute;n rất chạy tr&ecirc;n thị trường.</p>

<p>- B&oacute;ng rổ Prostar số 3 được l&agrave;m từ 100% cao su thi&ecirc;n nhi&ecirc;n,&nbsp;độ bền tốt, với rất nhiều ưu điểm: Độ đ&agrave;n hồi cao, chịu nhiệt tốt, chịu m&agrave;i m&ograve;n tốt, khả năng chống thấm nước cao.</p>

<p>- Chất liệu cao su của b&oacute;ng rổ Prostar số 3 kh&aacute; &ecirc;m, b&aacute;m chắc tay, giữ hơi cục kỳ l&acirc;u.</p>

<p>- Độ tr&ograve;n đều tuyệt đối, độ nẫy b&oacute;ng chuẩn cho những c&uacute; n&eacute;m b&oacute;ng ch&iacute;nh x&aacute;c.</p>

<p>- B&oacute;ng ph&ugrave; hợp cho lứa tuổi học sinh trung học trở xuống, sử dụng cho việc học v&agrave; tập luyện.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Hướng dẫn sử dụng v&agrave;o bảo quản&nbsp;B&oacute;ng rổ Prostar số 3</strong></p>

<p>+ B&oacute;ng sử dụng được cho mọi mặt s&acirc;n.</p>

<p>+ Kh&ocirc;ng ng&acirc;m nước qu&aacute; l&acirc;u sẽ bị thấm nước l&agrave;m thay đổi trọng lượng b&oacute;ng v&agrave; bị mục da, n&ecirc;n lau sạch, để nơi kh&ocirc; r&aacute;o, nắng nhẹ sau khi sử dụng.</p>

<p>+ Bảo quản nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh nơi ẩm ướt hoặc nơi nhiệt độ cao.</p>

<p>+ Kh&ocirc;ng b&ocirc;i bất kỳ h&oacute;a chất n&agrave;o l&ecirc;n b&oacute;ng</p>

<p>+ Kh&ocirc;ng ngồi hoặc đ&egrave; vật nặng l&ecirc;n b&oacute;ng.</p>

<p>+ Phải c&oacute; 50% hơi trong b&oacute;ng khi vận chuyển v&agrave; bảo quản.</p>

<p>&nbsp;</p>

<p>&diams;&nbsp;<strong>Hướng dẫn bơm b&oacute;ng:</strong></p>

<p>+ Phải sử dụng bơm tốt, kh&ocirc;ng sử dụng kim bị rỉ, nh&aacute;m hoặc bị cong.</p>

<p>+ N&ecirc;n nh&uacute;ng kim ướt trước khi bơm.</p>

<p>+ Để kim thẳng vu&ocirc;ng g&oacute;c với mặt b&oacute;ng.</p>

<p>+ Bơm đủ hơi để b&oacute;ng đạt chuẩn nhất.</p>
', 1, N'B', N'PROSTAR', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'B003', N'BÓNG ĐÁ MOLTEN F5U3400-K19 SỐ 5 CHÍNH HÃNG', 859000, 0, N'B003.png', N'<p><strong>B&oacute;ng đ&aacute; Molten F5U3400-K19 số 5 ch&iacute;nh h&atilde;ng, thương hiệu Nhật Bản,&nbsp;</strong>gi&aacute; hấp dẫn&nbsp;tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p>Molten l&agrave; thương hiệu&nbsp;<strong>b&oacute;ng đ&aacute;</strong>&nbsp;rất nổi tiếng đến từ Nhật Bản, được&nbsp;UEFA Europa League&nbsp;một trong những giải b&oacute;ng đ&aacute; h&agrave;ng đầu Ch&acirc;u &Acirc;u sử dụng b&oacute;ng từ năm 2019 đến nay.</p>

<p><img alt="Nhà tài trợ chính cho UEFA Europa League" src="https://file.hstatic.net/1000281067/file/facebook_uefa_europa_league_e1982172f299482b8d9783cbc17f2550_grande.jpg" /></p>

<p>&diams;&nbsp;Th&ocirc;ng tin sản phẩm:</p>

<p>+ Size b&oacute;ng: Size 5</p>

<p>+ Trọng lượng: 400-420gr</p>

<p>+ Chu vi b&oacute;ng: 680-700mm</p>

<p>+ Chất liệu da:&nbsp; Da PU cao cấp chống ma s&aacute;t v&agrave; m&aacute;i m&ograve;n bề mặt.</p>

<p>+ Chất liệu ruột b&oacute;ng: 100% cao su Butyl.</p>

<p>+ Số lượng miếng gh&eacute;p: 32 miếng.</p>

<p>+ C&ocirc;ng nghệ sản xuất Hybrid</p>

<p>-&nbsp;<a href="https://bigsport.vn/collections/qua-bong-da" title="Bóng đá">B&oacute;ng đ&aacute;</a>&nbsp;Molten F5U3400-K19 số 5 sản xuất bởi da PU rất cao cấp, ngo&agrave;i ra c&ograve;n được phủ lớp cao b&oacute;ng nhằm bảo vệ lớp da cũng như ngăn chặn hạn chế nước thấm v&agrave;o nếu khi đ&aacute; b&oacute;ng l&acirc;u trong m&ocirc;i trường mưa ướt.</p>

<p>- Ruột b&oacute;ng được sử dụng cao su Butyl, một dạng cao su rất chất lượng, th&acirc;n thiện với m&ocirc;i trường, t&iacute;nh chất đặc biệt của cao su n&agrave;y l&agrave; kh&ocirc;ng thấm kh&iacute;, kh&aacute;ng nhiệt v&agrave; chịu m&agrave;i m&ograve;n rất tốt, được sử dụng rộng rải trong c&aacute;c ng&agrave;ng c&ocirc;ng nghiệp kh&aacute;c.</p>

<p>- B&oacute;ng đ&aacute;&nbsp;Molten F5U3400-K19 số 5 đạt ti&ecirc;u chuẩn tập luyện v&agrave; thi đấu cho c&aacute;c giải b&oacute;ng đ&aacute; chuy&ecirc;n nghiệp</p>

<p>&nbsp;</p>

<p><strong>&nbsp;Hướng dẫn sử dụng v&agrave;o bảo quản B&oacute;ng đ&aacute; Molten F5U3400-K19:</strong></p>

<p>+ B&oacute;ng l&agrave;m bằng da PU, chịu m&agrave;i m&ograve;n tốt n&ecirc;n sử dụng được cho s&acirc;n cỏ tự nhi&ecirc;n v&agrave; s&acirc;n cỏ nh&acirc;n tạo.</p>

<p>+ Kh&ocirc;ng ng&acirc;m nước qu&aacute; l&acirc;u sẽ bị thấm nươc l&agrave;m thay đổi trọng lượng b&oacute;ng v&agrave; bị mục da, n&ecirc;n lau sạch, để nơi kh&ocirc; r&aacute;o, nắng nhẹ sau khi sử dụng.</p>

<p>+ Bảo quản nơi kh&ocirc; tho&aacute;ng, tr&aacute;nh nơi ẩm ướt hoặc nơi nhiệt độ cao.</p>

<p>+ Kh&ocirc;ng b&ocirc;i bất kỳ h&oacute;a chất n&agrave;o l&ecirc;n b&oacute;ng</p>

<p>+ Kh&ocirc;ng ngồi hoặc đ&egrave; vật nặng l&ecirc;n b&oacute;ng.</p>

<p>+ Phải c&oacute; 50% hơi trong b&oacute;ng khi vận chuyển v&agrave; bảo quản.</p>

<p>&nbsp;</p>

<p><strong>&nbsp;</strong>&nbsp; &nbsp;<strong>Hướng dẫn bơm b&oacute;ng:</strong></p>

<p>+ Phải sử dụng bơm tốt, kh&ocirc;ng sử dụng kim bị rỉ, nh&aacute;m hoặc bị cong.</p>

<p>+ N&ecirc;n nh&uacute;ng kim ướt trước khi bơm.</p>

<p>+ Để kim thẳng vu&ocirc;ng g&oacute;c với mặt b&oacute;ng.</p>

<p>+ Bơm đủ hơi để b&oacute;ng đạt chuẩn nhất.</p>
', 1, N'B', N'other', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G001', N'GIÀY THỂ THAO NAM BELSPORT BEL190927 SIÊU NHẸ MÀU ĐEN', 460000, 0, N'HH003.png', N'<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<a href="https://bigsport.vn/collections/giay-the-thao-1?page=3">Gi&agrave;y thể thao</a>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- L&agrave; mẫu gi&agrave;y thể thao&nbsp;cực kỳ đa dụng: c&oacute; thể kết hợp cho mọi kểu đồ thể thao, vừa mang đi chơi, chạy bộ, đi l&agrave;m...</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p>- Đế&nbsp;gi&agrave;y&nbsp;BelSport BEL190927&nbsp;với chất liệu Eva phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G002', N'GIÀY THỂ THAO NAM BELSPORT BEL190927 SIÊU NHẸ MÀU XÁM', 460000, 0, N'G002.png', N'<p><strong>Gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ, chất lượng</strong>,&nbsp;gi&aacute; hấp dẫn tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<strong>Gi&agrave;y thể thao</strong>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nam-sieu-nhe-sneaker__3__cba97f062ade416d8ef21d816ae6742c_grande.jpg" style="height:296px; width:600px" /></p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- L&agrave; mẫu gi&agrave;y thể thao&nbsp;cực kỳ đa dụng: c&oacute; thể kết hợp cho mọi kểu đồ thể thao, vừa mang đi chơi, chạy bộ, đi l&agrave;m...</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nam-sieu-nhe-sneaker__9__400eaeec1d6d408fb62616e6800561ef_grande.jpg" style="height:287px; width:600px" /></p>

<p>- Đế&nbsp;gi&agrave;y&nbsp;BelSport BEL190927&nbsp;với chất liệu Eva phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>

<p>&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G003', N'GIÀY THỂ THAO NAM BELSPORT BEL190927 SIÊU NHẸ MÀU XANH', 460000, 0, N'G003.png', N'<p><strong>Gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ, chất lượng</strong>,&nbsp;gi&aacute; hấp dẫn tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<strong>Gi&agrave;y thể thao</strong>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nam-sieu-nhe-sneaker_584db88fb78b4ad38920425a57459e9e_grande.jpg" /></p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- L&agrave; mẫu gi&agrave;y thể thao&nbsp;cực kỳ đa dụng: c&oacute; thể kết hợp cho đồ thể thao thời trang, mang đi chơi, chạy bộ, đi l&agrave;m...</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nam-sieu-nhe-sneaker__5__69d3b2fc2aa148c5b9da2283cf63e9e5_grande.jpg" style="height:285px; width:600px" /></p>

<p>- Đế&nbsp;gi&agrave;y&nbsp;BelSport BEL190927&nbsp;với chất liệu Eva phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G004', N'GIÀY THỂ THAO NỮ BELSPORT BEL190930 SIÊU NHẸ MÀU ĐEN', 520000, 0, N'G004.png', N'<p><strong>Gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ, chất lượng</strong>,&nbsp;gi&aacute; hấp dẫn tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<strong>Gi&agrave;y thể thao</strong>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/z2487188083471_8f3565040ae4302f4b888b7fa8bd1fb8_-_copy_27e2ff00ac044200bd7f6ab886041b6a_grande.jpg" style="height:307px; width:600px" /></p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/z2487188081687_c2282060f1e582636cb7480c05b081d3_-_copy_30d1d48caa6440358abba64c286a399b_grande.jpg" style="height:404px; width:600px" /></p>

<p>- Đ&eacute; gi&agrave;y&nbsp;BelSport BEL190930 với chấ liệu Eva&nbsp;phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với gi&agrave;y thể thao nữ BelSport BEL190930, c&aacute;c bạn nữ tha hồ l&ecirc;n mọi kiểu đồ, từ những bộ thể thao năng động, c&aacute; t&iacute;nh đến c&aacute;c bộ đầm xinh xắn đều v&ocirc; c&ugrave;ng cuốn h&uacute;t.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nữ BelSport BEL190930&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G005', N'GIÀY THỂ THAO NỮ BELSPORT BEL190930 SIÊU NHẸ HỒNG ROSE', 520000, 0, N'G005.png', N'<p><strong>Gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ, chất lượng</strong>,&nbsp;gi&aacute; hấp dẫn tại&nbsp;<strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<strong>Gi&agrave;y thể thao</strong>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nu-sieu-nhe-belsport__10__fb9a0e5953c34ea097d15b709ae27b5c_grande.jpg" style="height:459px; width:600px" /></p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nu-sieu-nhe-belsport__11__ae12a46926454c4297221a1ce0f15b9c_grande.jpg" style="height:386px; width:600px" /></p>

<p>&nbsp;</p>

<p>- Đế&nbsp;gi&agrave;y&nbsp;BelSport BEL190930 với chất liệu Eva cho&nbsp;phản hồi lực cực&nbsp;tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với gi&agrave;y thể thao nữ BelSport BEL190930, c&aacute;c bạn nữ tha hồ l&ecirc;n mọi kiểu đồ, từ những bộ thể thao năng động, c&aacute; t&iacute;nh đến c&aacute;c bộ đầm xinh xắn đều v&ocirc; c&ugrave;ng cuốn h&uacute;t.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nữ BelSport BEL190930&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G006', N'GIÀY THỂ THAO NỮ BELSPORT BEL190930 SIÊU NHẸ MÀU XANH', 520000, 0, N'G006.png', N'<p><strong>Gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ, chất lượng</strong>,&nbsp;gi&aacute; hấp dẫn tại&nbsp;<strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<strong>Gi&agrave;y thể thao</strong>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nu-sieu-nhe-belsport__6__-_copy_e48dff0e0c9b4027b4de26b432319c2e_grande.jpg" style="height:340px; width:600px" /></p>

<p>&nbsp;</p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nu-belsport-sieu-nhe_c96eb85067b34e76a482b99944fb5740_grande.jpg" style="height:324px; width:600px" /></p>

<p>- Đ&eacute; gi&agrave;y&nbsp;BelSport BEL190930 với chấ liệu Eva&nbsp;phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với gi&agrave;y thể thao nữ BelSport BEL190930, c&aacute;c bạn nữ tha hồ l&ecirc;n mọi kiểu đồ, từ những bộ thể thao năng động, c&aacute; t&iacute;nh đến c&aacute;c bộ đầm xinh xắn đều v&ocirc; c&ugrave;ng cuốn h&uacute;t.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nữ BelSport BEL190930&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G007', N'GIÀY THỂ THAO NỮ BELSPORT BEL190930 SIÊU NHẸ MÀU HỒNG', 520000, 0, N'G007.png', N'<p><strong>Gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ, chất lượng</strong>,&nbsp;gi&aacute; hấp dẫn tại&nbsp;<strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<strong>Gi&agrave;y thể thao</strong>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nu-sieu-nhe-belsport__5__-_copy_55a635eccd924761b22ded7ca3e2b631_grande.jpg" style="height:428px; width:600px" /></p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nu-sieu-nhe-belsport__5__503638bd046d4d4d9f124a57b29de7f0_grande.jpg" style="height:385px; width:600px" /></p>

<p>- Đế&nbsp;gi&agrave;y&nbsp;BelSport BEL190930 với chất liệu Eva phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với gi&agrave;y thể thao nữ BelSport BEL190930, c&aacute;c bạn nữ tha hồ l&ecirc;n mọi kiểu đồ, từ những bộ thể thao năng động, c&aacute; t&iacute;nh đến c&aacute;c bộ đầm xinh xắn đều v&ocirc; c&ugrave;ng cuốn h&uacute;t.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nữ BelSport BEL190930&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'G008', N'GIÀY THỂ THAO NỮ BELSPORT BEL190928 SIÊU NHẸ MÀU HỒNG ROSE', 520000, 0, N'G008.png', N'<p><strong>Gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ, chất lượng</strong>,&nbsp;gi&aacute; hấp dẫn tại&nbsp;<strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<strong>Gi&agrave;y thể thao</strong>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/5868fcb36ac89f96c6d9_4179a2f029374125ad77876ecde7f55d_grande.jpg" style="height:600px; width:600px" /></p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng.</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t&nbsp;kể cả khi&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- Phần cổ gi&agrave;y được &aacute;p dụng c&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i nhờ c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/giay-the-thao-nu-sieu-nhe_97227ae6e0b04671b05600de8500612c_grande.jpg" style="height:425px; width:600px" /></p>

<p>- Đế&nbsp;gi&agrave;y&nbsp;BelSport BEL190928 với chất liệu Eva phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với gi&agrave;y thể thao nữ BelSport BEL190928, c&aacute;c bạn nữ tha hồ l&ecirc;n mọi kiểu đồ, từ những bộ thể thao năng động, c&aacute; t&iacute;nh đến c&aacute;c bộ đầm xinh xắn đều v&ocirc; c&ugrave;ng cuốn h&uacute;t.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nữ BelSport BEL190928&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH001', N'ÁO THỂ THAO NAM POLO EGAN UV 03 XANH BÍCH', 205000, 0, N'aothethaoxanhduong.png', N'<p><strong>&loz;&nbsp;&Aacute;o thể thao nam Polo UV Egan 03</strong></p>

<p>+<strong>&nbsp;</strong>Vẫn giữ phong c&aacute;ch thiết kế đơn giản như UV Egan 2 nhưng sự sang trọng, lịch lảm kh&ocirc;ng hề thay đổi.</p>

<p>+ Kiểu dệt cổ &aacute;o&nbsp;mới cho&nbsp;<a href="https://bigsport.vn/collections/ao-the-thao-nam">&Aacute;o thể thao</a>&nbsp;Polo UV Egan 03 trở n&ecirc;n tinh tế&nbsp;v&agrave; cao cấp hơn.</p>

<p>+ Vải c&aacute; sấu với chất lượng cao cấp, bề mặt vải lu&ocirc;n mềm mịn, co gi&atilde;n tốt, gi&uacute;p cơ thể vận động v&ocirc; c&ugrave;ng thoải m&aacute;i.</p>

<p>+ Form cực chuẩn v&agrave; đa dụng,&nbsp;dễ phối đồ, c&oacute; thể mặc đi chơi, chơi thể thao đều được hoặc&nbsp;l&agrave;m trang phục cho nhiều sự kiện qian trọng kh&aacute;c m&agrave; vẫn thể hiện sự sang trọng, lịch lảm.</p>

<p>+ Sợi vải thấm h&uacute;t mồ h&ocirc;i nhanh cho cảm gi&aacute;c tho&aacute;ng m&aacute;t, dễ chịu, chống bết d&iacute;nh da khi đổ mồ h&ocirc;i.</p>

<p>+ C&ocirc;ng nghệ chống tia UV&nbsp;bảo vệ l&agrave;n da của bạn trước c&aacute;c tia cực t&iacute;m độc hại,&nbsp;thoải m&aacute;i hoạt động ngo&agrave;i trời cho cả ng&agrave;y d&agrave;i.</p>

<p>- Logo Egan&nbsp;được cắt &eacute;p cực kỳ&nbsp;sắc n&eacute;t, chắc chắn</p>

<p>- Với gi&aacute; b&aacute;n chỉ 205.000 đồng c&ugrave;ng với chất lượng cao cấp, chắc chắn sẽ l&agrave;m bạn h&agrave;i l&ograve;ng mỗi lần mặc mẫu&nbsp;&nbsp;&aacute;o thể thao n&agrave;y.</p>
', 1, N'QA', N'other', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH002', N' ÁO THỂ THAO NAM POLO EGAN UV 03 CHÍNH HÃNG XANH BIỂN', 205000, 0, N'HH002.png', N'<p><strong>&loz;&nbsp;&Aacute;o thể thao nam Polo Egan UV 03</strong></p>

<p>- Kh&aacute;m ph&aacute; mẫu &aacute;o thể thao nam&nbsp;<strong>Polo Egan UV 03</strong>&nbsp;vừa ra mắt trong th&aacute;ng 5</p>

<p>+<strong>&nbsp;</strong>Vẫn giữ phong c&aacute;ch thiết kế đơn giản như UV Egan 2 nhưng sự sang trọng, lịch lảm kh&ocirc;ng hề thay đổi.</p>

<p>+ Cổ &aacute;o với kiểu dệt&nbsp;mới tinh tế&nbsp;cho&nbsp;<a href="https://bigsport.vn/collections/ao-the-thao-nam">&Aacute;o thể thao</a>&nbsp;<strong>Polo Egan UV 03</strong>&nbsp;trở n&ecirc;n nổi bật hơn.</p>

<p>+ Vải c&aacute; sấu với chất lượng cao cấp, bề mặt vải lu&ocirc;n mềm mịn, co gi&atilde;n tốt, gi&uacute;p cơ thể vận động v&ocirc; c&ugrave;ng thoải m&aacute;i.</p>

<p>+ Form cực chuẩn v&agrave; đa dụng,&nbsp;dễ phối đồ, c&oacute; thể mặc đi chơi, chơi thể thao đều được hoặc&nbsp;l&agrave;m trang phục cho nhiều sự kiện qian trọng kh&aacute;c m&agrave; vẫn thể hiện sự sang trọng, lịch lảm.</p>

<p>&nbsp;</p>

<p>+ Sợi vải nhẹ,thấm h&uacute;t mồ h&ocirc;i nhanh, chức năng&nbsp;chống bết d&iacute;nh da khi đổ mồ h&ocirc;i&nbsp;cho cảm gi&aacute;c thoải m&aacute;i, dễ chịu,</p>

<p>+ C&ocirc;ng nghệ chống tia UV&nbsp;bảo vệ l&agrave;n da của bạn trước c&aacute;c tia cực t&iacute;m độc hại,&nbsp;thoải m&aacute;i hoạt động ngo&agrave;i trời cho cả ng&agrave;y d&agrave;i.</p>

<p>- Logo Egan&nbsp;được cắt &eacute;p cực kỳ&nbsp;sắc n&eacute;t, chỉn chu.</p>

<p>- Với gi&aacute; b&aacute;n chỉ 205.000 đồng c&ugrave;ng với chất lượng cao cấp, chắc chắn sẽ l&agrave;m bạn h&agrave;i l&ograve;ng mỗi lần mặc mẫu&nbsp;&aacute;o thể thao n&agrave;y.</p>
', 1, N'QA', N'other', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH003', N'QUẦN ÁO BÓNG ĐÁ TRẺ EM ĐỘI TUYỂN VIỆT NAM 2021-2022 ĐỎ', 90000, 16, N'Screenshot 2021-06-16 112439.png', N'<p><strong>Quần &aacute;o b&oacute;ng đ&aacute; trẻ em đội tuyển Việt Nam&nbsp;2021-2022 s&acirc;n nh&agrave;</strong>&nbsp;<strong>chất lượng, gi&aacute; hấp dẫn tại</strong>&nbsp;<strong>PTITSport</strong>&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Th&ocirc;ng tin sản phẩm:</strong></p>

<p>- Chất liệu: vải thun lạnh 100% polyester, mềm v&agrave; mịn.</p>

<p>- Vải mỏng, độ co gi&atilde;n tốt, gi&uacute;p tho&aacute;ng m&aacute;t v&agrave; thoải m&aacute;i khi vận động.</p>

<p>- In ấn chất lượng,&nbsp;c&oacute; độ thẩm mỹ cao, kh&ocirc;ng bay m&agrave;u, kh&ocirc;ng hại da.</p>

<p>- Logo dệt sắc sảo, bền đẹp kh&ocirc;ng bong tr&oacute;c.</p>

<p>- Size &aacute;o: 1-3-5-7-9-11-13-15</p>

<p>- Quy c&aacute;ch: nguy&ecirc;n bộ (&aacute;o + quần).</p>

<p>- Sản xuất tại Việt Nam.</p>

<p>&bull;&nbsp;<strong>HƯỚNG DẪN CHỌN SIZE:</strong></p>

<table border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Size</td>
			<td>Số Kg tham khảo</td>
			<td>Độ tuổi tham khảo</td>
		</tr>
		<tr>
			<td>1</td>
			<td>
			<table cellspacing="0">
				<tbody>
					<tr>
						<td>10-13 kg</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>2-3 tuổi</td>
		</tr>
		<tr>
			<td>3</td>
			<td>14-18 kg</td>
			<td>4-5 tuổi</td>
		</tr>
		<tr>
			<td>5</td>
			<td>19-23 kg</td>
			<td>6-7 tuổi</td>
		</tr>
		<tr>
			<td>7</td>
			<td>23-26 kg</td>
			<td>8-9 tuổi</td>
		</tr>
		<tr>
			<td>9</td>
			<td>26-29 kg</td>
			<td>9-10 tuổi</td>
		</tr>
		<tr>
			<td>11</td>
			<td>30-35 kg</td>
			<td>11-12 tuổi</td>
		</tr>
		<tr>
			<td>13</td>
			<td>35-40 kg</td>
			<td>13-14 tuổi</td>
		</tr>
		<tr>
			<td>15</td>
			<td>40-45 kg</td>
			<td>15 tuổi</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 1, N'QA', N'other', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH004', N'QUẦN ÁO BÓNG ĐÁ TRẺ EM ĐỘI TUYỂN ĐỨC 2021-2022 XANH LÝ', 90000, 16, N'Screenshot 2021-06-16 113349.png', N'<p><strong>Quần &aacute;o b&oacute;ng đ&aacute; trẻ em đội tuyển Việt Nam&nbsp;2021-2022 s&acirc;n nh&agrave;</strong>&nbsp;<strong>chất lượng, gi&aacute; hấp dẫn tại</strong>&nbsp;<strong>PTITSport</strong>&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams;&nbsp;Th&ocirc;ng tin sản phẩm:</strong></p>

<p>- Chất liệu: vải thun lạnh 100% polyester, mềm v&agrave; mịn.</p>

<p>- Vải mỏng, độ co gi&atilde;n tốt, gi&uacute;p tho&aacute;ng m&aacute;t v&agrave; thoải m&aacute;i khi vận động.</p>

<p>- In ấn chất lượng,&nbsp;c&oacute; độ thẩm mỹ cao, kh&ocirc;ng bay m&agrave;u, kh&ocirc;ng hại da.</p>

<p>- Logo dệt sắc sảo, bền đẹp kh&ocirc;ng bong tr&oacute;c.</p>

<p>- Size &aacute;o: 1-3-5-7-9-11-13-15</p>

<p>- Quy c&aacute;ch: nguy&ecirc;n bộ (&aacute;o + quần).</p>

<p>- Sản xuất tại Việt Nam.</p>

<p>&bull;&nbsp;<strong>HƯỚNG DẪN CHỌN SIZE:</strong></p>

<table border="1" cellpadding="1" cellspacing="1">
	<tbody>
		<tr>
			<td>Size</td>
			<td>Số Kg tham khảo</td>
			<td>Độ tuổi tham khảo</td>
		</tr>
		<tr>
			<td>1</td>
			<td>
			<table cellspacing="0">
				<tbody>
					<tr>
						<td>10-13 kg</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td>2-3 tuổi</td>
		</tr>
		<tr>
			<td>3</td>
			<td>14-18 kg</td>
			<td>4-5 tuổi</td>
		</tr>
		<tr>
			<td>5</td>
			<td>19-23 kg</td>
			<td>6-7 tuổi</td>
		</tr>
		<tr>
			<td>7</td>
			<td>23-26 kg</td>
			<td>8-9 tuổi</td>
		</tr>
		<tr>
			<td>9</td>
			<td>26-29 kg</td>
			<td>9-10 tuổi</td>
		</tr>
		<tr>
			<td>11</td>
			<td>30-35 kg</td>
			<td>11-12 tuổi</td>
		</tr>
		<tr>
			<td>13</td>
			<td>35-40 kg</td>
			<td>13-14 tuổi</td>
		</tr>
		<tr>
			<td>15</td>
			<td>40-45 kg</td>
			<td>15 tuổi</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', 1, N'QA', N'other', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH005', N'QUẦN ÁO ĐỘI TUYỂN VIỆT NAM SÂN NHÀ 2021 CHÍNH HÃNG', 845000, 0, N'Screenshot 2021-06-16 113755.png', N'<p><strong>&Aacute;o b&oacute;ng đ&aacute; đội tuyển&nbsp;Việt Nam s&acirc;n nh&agrave; 2021 ch&iacute;nh h&atilde;ng, chất lượng, gi&aacute; hấp dẫn tại</strong>&nbsp;<strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p>&diams;&nbsp;<strong>&Aacute;o b&oacute;ng đ&aacute; đội tuyển&nbsp;Việt Nam s&acirc;n nh&agrave; 2021</strong></p>

<p>+ Chất liệu&nbsp;100% Polyester cao cấp</p>

<p>+ Vải si&ecirc;u nhẹ, tho&aacute;ng kh&iacute;</p>

<p>+ Thiết kế thời trang</p>

<p>+ Size: S, M, L, XL</p>

<p>-&nbsp;&Aacute;o b&oacute;ng đ&aacute; đội tuyển&nbsp;Việt Nam được sản xuất bởi thương hiệu thể thao&nbsp;Grand Sport&nbsp;đến từ Th&aacute;i Lan, ngo&agrave;i&nbsp;<a href="https://bigsport.vn/collections/quan-ao-bong-da-1">&aacute;o b&oacute;ng đ&aacute;</a>, Grand Sport c&ograve;n sản xuất c&aacute;c mẫu&nbsp;<a href="https://bigsport.vn/collections/quan-ao-the-thao-khac">&aacute;o thể thao</a>&nbsp;v&agrave; c&aacute;c&nbsp;phụ kiện&nbsp;kh&aacute;c rất chất lượng&nbsp;d&agrave;nh cho m&ocirc;n b&oacute;ng đ&aacute;.&nbsp;</p>

<p>- &Aacute;o b&oacute;ng đ&aacute; đội tuyển&nbsp;Việt Nam s&acirc;n nh&agrave; 2021 vẫn l&agrave; m&agrave;u đỏ truyền thống, với&nbsp;thiết kế kiểu d&aacute;ng thời trang, giữa ngực l&agrave; họa tiết ng&ocirc;i sao năm c&aacute;nh&nbsp;to, nổi bật.</p>

<p><img alt="Áo bóng đá đội tuyển Việt Nam sân nhà 2021" src="https://file.hstatic.net/1000281067/file/da-doi-tuyen-viet-nam-chinh-hang-3_-_copy_19c6fc5bab3a46dbb4e62c54ecac3c74_grande.jpg" style="height:519px; width:600px" /></p>

<p>- C&ocirc;ng nghệ dệt vi sợi Yarn Micro Filament độc quyền từ sợi Polyester, cho tấm vải mỏng, rất nhẹ v&agrave; tho&aacute;ng kh&iacute;, cho cảm&nbsp;gi&aacute;c thoải m&aacute;i, nhẹ&nbsp;nh&agrave;ng khi mặc.</p>

<p>- Vải c&oacute; độ co giản tốt, thấm h&uacute;t mồ h&ocirc;i nhanh v&agrave; kh&ocirc;ng bị bết d&iacute;nh da kh&oacute; chịu&nbsp;khi đổ mồ h&ocirc;i nhiều, gi&uacute;p c&aacute;c cầu thủ vận động thoải m&aacute;i cho cả trận đấu d&agrave;i.</p>

<p><img alt="Công nghệ dệt vi sợi Yarn Micro Filament độc quyền từ sợi Polyester" src="https://file.hstatic.net/1000281067/file/da-doi-tuyen-viet-nam-chinh-hang-4_02d9839b10b94a028e82d01684ef299e_grande.jpg" style="height:334px; width:600px" /></p>

<p>- Hai b&ecirc;n sườn &aacute;o được may kết hợp vải dạng lưới gi&uacute;p &aacute;o gia tăng&nbsp;tho&aacute;ng m&aacute;t.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/da-doi-tuyen-viet-nam-chinh-hang-1_dadcc58ddaa9478483816cf4816c3a98_grande.jpg" style="height:544px; width:600px" /></p>

<p>- Logo cờ đỏ sao v&agrave;ng tr&ecirc;n ngực &aacute;o&nbsp;được th&ecirc;u c&ocirc;ng nghệ&nbsp;3D si&ecirc;u sắc n&eacute;t.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/da-doi-tuyen-viet-nam-chinh-hang-2_41e8547c91b740f1bb7489ff1265eba4_grande.jpg" /></p>

<p><strong>- Hướng dẫn chọn size &aacute;o:</strong></p>

<p><strong><img alt="" src="https://file.hstatic.net/1000281067/file/ao-vn-2021-r_-_copy_a652a2c9b9904410ae6763c910af1784_grande.jpg" /></strong></p>

<p>&nbsp;</p>

<p><strong>- Hướng dẫn bảo quản:</strong></p>

<p>- Kh&ocirc;ng được giặt &aacute;o ở nhiệt độ tr&ecirc;n 40oC</p>

<p>- Kh&ocirc;ng d&ugrave;ng b&agrave;n ủi trực tiếp l&ecirc;n c&aacute;c chi tiết in cao su</p>

<p>- Tr&aacute;nh tiếp x&uacute;c với c&aacute;c chất kh&oacute; tẩy rủa</p>

<p>&nbsp;</p>
', 1, N'QA', N'belsport', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH006', N'BÓP TAY CHỈNH LỰC - ĐẾM SỐ', 95000, 0, N'Screenshot 2021-05-15 233342.png', N'<p>B&oacute;p tay chỉnh lực - đếm số chất lượng, gi&aacute; hấp dẫn, tại BigSport &ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc. Tập dụng cụ b&oacute;p tay chỉnh lực hằng ng&agrave;y gi&uacute;p cơ tay ch&uacute;ng ta chắc khỏe, dẻo dai. Đặc biệt l&agrave; c&aacute;c vận động vi&ecirc;n chơi c&aacute;c m&ocirc;n thể thao như: cầu l&ocirc;ng, tennis, b&oacute;ng b&agrave;n...v&agrave; những người c&oacute; bệnh l&yacute; cần phục hồi cơ tay. - B&oacute;p tay chỉnh lực từ 10kg đến 60kg, ngo&agrave;i ra c&ograve;n c&oacute; bộ đếm số lần b&oacute;p gi&uacute;p ch&uacute;ng ta kiểm so&aacute;t được qu&aacute; tr&igrave;nh tập luyện hằng ng&agrave;y. - Sản xuất từ nhựa tổng hợp cao cấp, phần tay cầm được ốp lớp nhựa dẻo vừa vặn, cho l&ograve;ng b&agrave;n tay kh&ocirc;ng bị chai sạn khi sử dụng l&acirc;u. - L&ograve; xo bằng th&eacute;p kh&ocirc;ng rỉ, được xi mạ thẩm mỉ v&agrave; kh&ocirc;ng bị oxy h&oacute;a ăn m&ograve;n.</p>
', 1, N'PK', N'other', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH007', N'QUẦN SHORT THỂ THAO NAM EGAN 3 CHÍNH HÃNG MÀU XANH ĐEN', 175000, 0, N'HH007.png', N'<p><strong>Quần short thể thao nam Egan 3&nbsp;m&agrave;u xanh đen&nbsp;</strong>ch&iacute;nh h&atilde;ng,&nbsp;chất lượng, gi&aacute; hấp dẫn tạ<strong>i PTITSport</strong>&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams; Th&ocirc;ng tin sản phẩm:</strong></p>

<p>- Chất liệu: 100% Polyeste chuy&ecirc;n dụng thể thao.</p>

<p>- Vải nhẹ, mềm mịn, thấm h&uacute;t tốt,&nbsp;co giản 4 chiều&nbsp;gi&uacute;p tho&aacute;ng m&aacute;t v&agrave; thoải m&aacute;i khi vận động.</p>

<p>- Chất lượng nhuộm vải cao cấp, kh&ocirc;ng xuống m&agrave;u, kh&ocirc;ng g&acirc;y hại da.</p>

<p>- Lưng quần nhập khẩu cao cấp, mặc rất &ecirc;m, c&oacute; d&acirc;y r&uacute;t để điều chỉnh t&ugrave;y th&iacute;ch.</p>

<p>- Quần c&oacute; t&uacute;i 2 b&ecirc;n v&agrave; ph&iacute;a sau c&oacute; kh&oacute;a k&eacute;o,&nbsp;thời tr&agrave;ng v&agrave; rất tiện lợi, thoải m&aacute;i đựng v&iacute;, điện thoải</p>

<p>- Chất lượn in&nbsp;ấn sắc n&eacute;t, thẩm mỹ cao.</p>

<p>- Logo &eacute;p&nbsp;sắc sảo, bền đẹp kh&ocirc;ng bong tr&oacute;c.</p>

<p>- Form chuẩn thể thao, đẹp, hiện đại.</p>

<p>- Size: M, L, XL, XXL</p>

<p>- Sản xuất tại Việt Nam.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/quan-dui-the-thao-nam-egan-3-cao-cao_3c003515be6147839f36807fb946335a_grande.jpg" /></p>

<p>- Quần&nbsp;short thể thao nam Egan 3 c&oacute; thể mặc chơi c&aacute;c m&ocirc;n thể thao như Cầu l&ocirc;ng, Tennis, Golf hoặc mang đi chơi, c&agrave; ph&ecirc;...</p>
', 1, N'QA', N'other', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH008', N'QUẦN SHORT THỂ THAO NAM EGAN 3 CHÍNH HÃNG MÀU ĐEN', 175000, 0, N'HH008.png', N'<p><strong>Quần short thể thao nam Egan 3&nbsp;m&agrave;u đen&nbsp;ch&iacute;nh h&atilde;ng,</strong>&nbsp;<strong>chất lượng, gi&aacute; hấp dẫn tại</strong>&nbsp;<strong>PTITSport</strong>&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams; Th&ocirc;ng tin sản phẩm:</strong></p>

<p>- Chất liệu: 100% Polyeste chuy&ecirc;n dụng thể thao.</p>

<p>- Vải nhẹ, mềm mịn, thấm h&uacute;t tốt,&nbsp;co giản 4 chiều&nbsp;gi&uacute;p tho&aacute;ng m&aacute;t v&agrave; thoải m&aacute;i khi vận động.</p>

<p>- Chất lượng nhuộm vải cao cấp, kh&ocirc;ng xuống m&agrave;u, kh&ocirc;ng g&acirc;y hại da.</p>

<p>- Lưng quần nhập khẩu cao cấp, mặc rất &ecirc;m, c&oacute; d&acirc;y r&uacute;t để điều chỉnh t&ugrave;y th&iacute;ch.</p>

<p>- Quần c&oacute; t&uacute;i 2 b&ecirc;n v&agrave; ph&iacute;a sau c&oacute; kh&oacute;a k&eacute;o,&nbsp;thời tr&agrave;ng v&agrave; rất tiện lợi, thoải m&aacute;i đựng v&iacute;, điện thoải</p>

<p>- Chất lượn in&nbsp;ấn sắc n&eacute;t, thẩm mỹ cao.</p>

<p>- Logo &eacute;p&nbsp;sắc sảo, bền đẹp kh&ocirc;ng bong tr&oacute;c.</p>

<p>- Form chuẩn thể thao, đẹp, hiện đại.</p>

<p>- Size: M, L, XL, XXL</p>

<p>- Sản xuất tại Việt Nam.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/8919c10b5f2c76_large_ae2916d849f142ab88082206fb213a66_large_-_copy__2__23bbebf01c0c4297bf250715f618d9b4_grande.jpg" style="height:600px; width:600px" /></p>

<p>- Quần&nbsp;short thể thao nam Egan 3 c&oacute; thể mặc chơi c&aacute;c m&ocirc;n thể thao như Cầu l&ocirc;ng, Tennis, Golf hoặc mang đi chơi, c&agrave; ph&ecirc;...</p>
', 1, N'QA', N'other', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'HH009', N'ÁO THỦ MÔN ĐỘI TUYỂN VIỆT NAM 2021 XANH LÁ CHÍNH HÃNG', 625000, 0, N'HH009.png', N'<p><strong>&Aacute;o thủ m&ocirc;n&nbsp;đội tuyển&nbsp;Việt Nam&nbsp;2021 ch&iacute;nh h&atilde;ng, chất lượng, gi&aacute; hấp dẫn tại</strong>&nbsp;<strong>PTITSport</strong>&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p>&diams;&nbsp;<strong>&Aacute;o thủ m&ocirc;n đội tuyện Việt Nam&nbsp;2021 ch&iacute;nh h&atilde;ng:</strong></p>

<p>+ Chất liệu&nbsp;100% Polyester cao cấp</p>

<p>+ Vải si&ecirc;u nhẹ, tho&aacute;ng kh&iacute;</p>

<p>+ Thiết kế kiểu d&aacute;ng&nbsp;thời trang</p>

<p>+ Size: S, M, L, XL</p>

<p>-&nbsp;&Aacute;o thủ m&ocirc;n đội tuyện Việt Nam được sản xuất bởi thương hiệu thể thao&nbsp;Grand Sport&nbsp;đến từ Th&aacute;i Lan, ngo&agrave;i&nbsp;<a href="https://bigsport.vn/collections/quan-ao-bong-da-1">&aacute;o b&oacute;ng đ&aacute;</a>, Grand Sport c&ograve;n sản xuất c&aacute;c mẫu&nbsp;<a href="https://bigsport.vn/collections/quan-ao-the-thao-khac">&aacute;o thể thao</a>&nbsp;v&agrave; c&aacute;c&nbsp;phụ kiện&nbsp;kh&aacute;c rất chất lượng&nbsp;d&agrave;nh cho m&ocirc;n b&oacute;ng đ&aacute;.&nbsp;</p>

<p>- &Aacute;o thủ m&ocirc;n đội tuyện Việt Nam&nbsp;2021 m&agrave;u xanh l&aacute;&nbsp;thiết kế kiểu d&aacute;ng thời trang, giữa ngực l&agrave; họa tiết ng&ocirc;i sao năm c&aacute;nh&nbsp;to, nổi bật.</p>

<p>- B&ecirc;n trong sau cổ &aacute;o được in ng&ocirc;i sao v&agrave;ng 5 c&aacute;nh c&ugrave;ng với d&ograve;ng chữ &quot;Chiến&nbsp;Binh Sao V&agrave;ng&quot; &yacute; nghĩa.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/ao-thu-mon-doi-tuyen-viet-nam-2021-chinh-hang_3caab8cd16df4a80ad28c643bb7e003f_grande.jpg" style="height:600px; width:600px" /></p>

<p>- C&ocirc;ng nghệ dệt vi sợi Geo Lite Plus&nbsp;độc quyền từ sợi Polyester, cho tấm vải mỏng, rất nhẹ v&agrave; tho&aacute;ng kh&iacute;,&nbsp;cảm&nbsp;gi&aacute;c thoải m&aacute;i, nhẹ&nbsp;nh&agrave;ng khi mặc.</p>

<p>- Vải c&oacute; độ co giản tốt, thấm h&uacute;t mồ h&ocirc;i nhanh v&agrave; kh&ocirc;ng bị bết d&iacute;nh da kh&oacute; chịu&nbsp;khi đổ mồ h&ocirc;i nhiều, gi&uacute;p c&aacute;c cầu thủ vận động thoải m&aacute;i cho cả trận đấu d&agrave;i.</p>

<p>- Chất lượng in cao cấp, si&ecirc;u sắc n&eacute;t, c&ocirc;ng nghệ chống tia UV an to&agrave;n cho da dưới nắng gắt.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/ao-thu-mon-doi-tuyen-viet-nam-2021-chinh-hang-8_0ff220cc094a4784967763550188a85f_grande.jpg" style="height:600px; width:600px" /></p>

<p><strong>- Hướng dẫn chọn size &aacute;o:</strong></p>

<p><strong><img alt="" src="https://file.hstatic.net/1000281067/file/ao-vn-2021-r_-_copy_c674681a082747c9bdc645c4f287b60e_grande.jpg" style="height:356px; width:600px" /></strong></p>
', 1, N'QA', N'other', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'PK001', N'BĂNG BẢO VỆ ĐẦU GỐI AOLIKES 7720 CHÍNH HÃNG', 100000, 0, N'PK001.png', N'<p><strong>Băng bảo vệ đầu gối Aolikes 7720&nbsp;ch&iacute;nh h&atilde;ng</strong>,&nbsp;gi&aacute; hấp dẫn tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc.</p>

<p>-&nbsp;<strong>Băng bảo vệ</strong>&nbsp;đầu gối Aolikes 7720, sản phẩm băng gối hot nhất hiện tai.</p>

<p>- Sử dụng trong c&aacute; m&ocirc;n như: B&oacute;ng đ&aacute;, cầu l&ocirc;ng, tennis, xe đạp, chạy bộ...</p>

<p>- C&oacute; size: M, L, XL để ph&ugrave; hợp cho nhiều k&iacute;ch thước ch&acirc;n lớn nhỏ.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/al7720-1_e8d6ccfb50544d9eb5cc7732956cdd9e_grande.jpg" style="height:400px; width:600px" /></p>

<p>- Chất liệu: Vải Spandex, Nylon, Latex</p>

<p>- Ống gối co giản 4 chiều, b&oacute; chắc đều khớp gối, ngo&agrave;i ra c&ograve;n c&oacute; bộ đ&ocirc;i d&acirc;y đai hổ trợ chắc chắn hơn khi khớp gối cần tải nặng.</p>

<p>- Sản phẩm tho&aacute;ng kh&iacute;, si&ecirc;u co giản v&agrave; mang rất dễ chịu.</p>
', 1, N'PK', N'AOLIKES', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'PK002', N'BĂNG CỔ TAY PJ 633', 35000, 0, N'PK002.png', N'<p>&nbsp;</p>

<p><img alt="" src="https://firebasestorage.googleapis.com/v0/b/bigsport-edcc0.appspot.com/o/bang-co-tay-pj-633-hinh-2.jpg?alt=media" /></p>

<p><img alt="" src="https://firebasestorage.googleapis.com/v0/b/bigsport-edcc0.appspot.com/o/bang-co-tay-pj-633-hinh-3.jpg?alt=media" /></p>

<p>&nbsp;</p>
', 1, N'PK', N'other', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'VCL001', N'VỢT CẦU LÔNG LINING CALIBAR 001C CHÍNH HÃNG', 1100000, 0, N'VCL001.png', N'<p><strong>Vợt cầu l&ocirc;ng Lining Calibar 001C&nbsp;ch&iacute;nh h&atilde;ng</strong>&nbsp;chất lượng, uy t&iacute;n, gi&aacute; hấp dẫn&nbsp;tại <strong>PTITSport&nbsp;</strong>&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams; Th&ocirc;ng số&nbsp;Vợt cầu l&ocirc;ng Lining Calibar 001C</strong></p>

<p>+ Chất liệu: Militari Grade Carbon Fiber</p>

<p>+ Trọng lượng: 83gr</p>

<p>+ Điểm c&acirc;n bằng: 300mm</p>

<p>+ Độ&nbsp;cứng: Trung b&igrave;nh</p>

<p>+ Chu vi c&aacute;n vợt: S2</p>

<p>+ Sức căng tối đa: 11kg</p>

<p>- Vợt cầu l&ocirc;ng&nbsp;<strong>Lining Calibar 001C</strong>&nbsp;l&agrave; c&acirc;y vợt thuộc ph&acirc;n kh&uacute;c gi&aacute;&nbsp;tầm trung của thương hiệu Lining. Tuy ra mắt từ năm 2019 nhưng hiện nay mẫu vợt n&agrave;y vẫn b&aacute;n rất chạy tr&ecirc;n thị trường.</p>

<p>- Cực k&yacute; ấn tượng với vước&nbsp;sơn c&acirc;y vợt n&agrave;y, sơn m&agrave;u đen c&agrave; ph&ecirc; rất c&aacute; t&iacute;nh, khỏe khoắn, l&igrave; lợm v&agrave; sang trọng.</p>

<p>- Vợt c&oacute; trọng lượng nhẹ, nặng đầu n&ecirc;n đ&acirc;y ch&iacute;nh l&agrave; c&acirc;y vợt mang đậm phong c&aacute;ch chơi ph&ograve;ng thủ v&agrave; phản tạt cầu nhanh c&ugrave;ng với những c&uacute; tấn c&ocirc;ng nhanh chớp nho&aacute;ng. Vợt kh&aacute; nặng đầu n&ecirc;n những c&uacute; đập cuối s&acirc;n vẫn kh&ocirc;ng đến nỗi tệ.</p>

<p>- Khung vợt được v&aacute;t cạnh 3D quen thuộc của d&ograve;ng vợt Calibar, cho vợt giảm đi lực cản gi&oacute; đ&aacute;ng kể.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/z2469417984573_578def14b1d3a200e302a5e24f44a32e_b334771eb06246c0a285ced46547ab5e_grande.jpg" style="height:600px; width:600px" /></p>

<p>- Tay cầm vừa, cảm gi&aacute;c ph&ocirc;ng cầu nnhej nh&agrave;nh, thanh tho&aacute;t, dễ d&agrave;ng thay đổi trạng th&aacute;i ph&ograve;ng thủ qua phản tạt nhanh.</p>

<p>- L&agrave; c&acirc;y vợt nhẹ, th&acirc;n dẻo, c&oacute; trợ lực n&ecirc;n cự kỳ dễ chơi v&agrave; thuần thục nhanh, cổ tay yếu vẫn chơi c&acirc;y n&agrave;y ỗn.</p>

<p>-&nbsp;Vợt cầu l&ocirc;ng&nbsp;<strong>Lining Calibar 001C</strong>&nbsp;ph&ugrave; hợp cho những tay vợt th&iacute;ch lối đ&aacute;nh ph&ograve;ng thủ, điều cầu v&agrave; phản tạt nhanh.</p>

<p>- Những ai mới chơi sẽ tiệp cận rất nhanh c&acirc;y vợt n&agrave;y.</p>

<p>- Cổ tay kh&eacute;o l&eacute;o, linh hoạt&nbsp;sẽ ph&aacute;t huy hết c&ocirc;ng lực của c&acirc;y vợt n&agrave;y.</p>
', 1, N'VCL', N'LINING', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'VCL002', N'VỢT CẦU LÔNG LINING LIGHTNING 2000 CHÍNH HÃNG', 1050000, 0, N'VCL002.png', N'<p><strong>Vợt cầu l&ocirc;ng Lining Lightning 2000&nbsp;ch&iacute;nh h&atilde;ng</strong>&nbsp;chất lượng, uy t&iacute;n, gi&aacute; hấp dẫn&nbsp;tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams; Th&ocirc;ng số&nbsp;Vợt cầu l&ocirc;ng Lining Lightning 2000</strong></p>

<p>+ Chất liệu: Militari Grade Carbon Fiber</p>

<p>+ Trọng lượng: 84gr</p>

<p>+ Điểm c&acirc;n bằng: 290mm</p>

<p>+ Độ&nbsp;cứng: Trung b&igrave;nh</p>

<p>+ Chiều d&agrave;i vợt: 670mm</p>

<p>+ Chu vi c&aacute;n vợt: S2</p>

<p>+ Sức căng tối đa: 13kg</p>

<p>- Vợt cầu l&ocirc;ng Lining Lightning 2000&nbsp;l&agrave; c&acirc;y vợt thuộc ph&acirc;n kh&uacute;c gi&aacute; rẻ&nbsp;của thương hiệu Lining vừa ra mắt trong th&aacute;ng 3/2021 với nhiều t&iacute;nh năng mới.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/z2469417965980_b9cd0ff4e8d3b3634960b498fc085752_dc4d361ce1bf4928861b0bef15b4b954_grande.jpg" /></p>

<p>- Với trọng lượng vừa tay c&ugrave;ng với th&acirc;n vợt&nbsp;cứng vừa, đ&acirc;y ch&iacute;nh l&agrave; lựa chọn ho&agrave;n hảo cho những ai mới chơi cầu&nbsp;y&ecirc;u th&iacute;ch thương hiệu n&agrave;y.</p>

<p>-&nbsp; Vợt được sơn đen phối đỏ khỏe khoắn,&nbsp;mang đậm phong c&aacute;ch hoa văn của Lining.</p>

<p>- Điểm mạnh của c&acirc;y vợt n&agrave;y l&agrave; ph&ograve;ng thủ, điều cầu v&agrave; ghi điểm nhanh khu vự giữa s&acirc;n hoặc tr&ecirc;n lưới. V&igrave; vợt c&oacute; trọng lượng kh&ocirc;ng qu&aacute; nặng n&ecirc;n kh&ocirc;ng thể y&ecirc;u cầu những c&uacute; đập uy lực cuối s&acirc;n.</p>

<p>-&nbsp;Vợt cầu l&ocirc;ng Lining Lightning 2000 ph&ugrave; hợp cho những tay vợt&nbsp;th&iacute;ch lối đ&aacute;nh đa năng,&nbsp;c&ocirc;ng thủ to&agrave;n diện, tr&igrave;nh độ chơi cầu ở mức trung b&igrave;nh, trung b&igrave;nh kh&aacute;.</p>
', 1, N'VCL', N'LINING', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'VCL003', N'VỢT CẦU LÔNG LINING A900 CHÍNH HÃNG', 1000000, 0, N'VCL003.png', N'<p><strong>Vợt cầu l&ocirc;ng Lining A900 ch&iacute;nh h&atilde;ng,</strong>&nbsp;chất lượng,&nbsp;gi&aacute; hấp dẫn&nbsp;tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc.</p>

<p>&nbsp;</p>

<p><strong>&diams; Th&ocirc;ng số&nbsp;Vợt cầu l&ocirc;ng Lining A900</strong></p>

<p>+ Chất liệu: Standar&nbsp;Grade Carbon Fiber</p>

<p>+ Trọng lượng: 3U (86-88gr)</p>

<p>+ Điểm c&acirc;n bằng: 285mm</p>

<p>+ Độ&nbsp;cứng: Trung b&igrave;nh</p>

<p>+ Chu vi c&aacute;n vợt: S2</p>

<p>+ Sức căng tối đa: 12.6kg</p>

<p>- Vợt cầu l&ocirc;ng Lining A900 l&agrave; d&ograve;ng vợt thuộc ph&acirc;n kh&uacute;c gi&aacute; rẻ&nbsp;của thương hiệu Lining với nhiều t&iacute;nh năng mới.</p>

<p><img alt="" src="https://file.hstatic.net/1000281067/file/z2469417957772_8d7e1ecf61792e313a4451b29f10edab_73a481665cdc4a88bd0936868c2eeaea_grande.jpg" style="height:600px; width:600px" /></p>

<p>- Đ&acirc;y l&agrave; c&acirc;y vợt nặng vừa(3U) v&agrave; c&acirc;n bằng n&ecirc;n ph&ugrave; hợp cho những ai th&iacute;ch lối đ&aacute;nh c&ocirc;ng thủ to&agrave;n diện, lối đ&aacute;nh đa dạng trong đ&aacute;nh đ&ocirc;i m&agrave; rất nhiều người y&ecirc;u th&iacute;ch hiện nay.</p>

<p>- Đ&acirc;y cũng l&agrave; c&acirc;y vợt gi&aacute; rẻ chất lượng,&nbsp;dễ chơi, dễ thuần n&ecirc;n những kh&aacute;ch h&atilde;ng như sinh vi&ecirc;n, học sinh v&agrave; những ai đang bắt đầu học chơi cầu sẽ rất dễ tiếp cận với c&acirc;y vợt c&oacute; thương hiệu lớn n&agrave;y.</p>

<p>- Trọng lượng vợt hơi nặng, th&acirc;n vợt cứng&nbsp;trung b&igrave;nh&nbsp;n&ecirc;n vẫn cho&nbsp;những c&uacute; đập cầu uy lực v&agrave;o cuối s&acirc;n. Vợt c&acirc;n bằng n&ecirc;n thay đổi từ trạng th&aacute;i tấn c&ocirc;ng qua ph&ograve;ng thủ kh&ocirc;ng gặp nhiều vấn đề.</p>

<p>-&nbsp;Vợt cầu l&ocirc;ng Lining A900 ph&ugrave; hợp cho những&nbsp;tay vợt c&oacute; cổ tay vừa hoặc&nbsp;khỏe, th&iacute;ch lối đ&aacute;ng&nbsp;tấn c&ocirc;ng tấn c&ocirc;ng ph&ograve;ng thủ đa dạng, tr&igrave;nh độ chơi cầu trung b&igrave;nh hoặc hơn vẫn chơi c&acirc;y n&agrave;y ỗn.</p>
', 1, N'VCL', N'LINING', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu], [coSize]) VALUES (N'VCL004', N'VỢT CẦU LÔNG APACS TANTRUM 200 CHÍNH HÃNG - HUYỀN THOẠI CỦA APACS', 1159000, 0, N'VCL004.png', N'<p><strong>Vợt cầu l&ocirc;ng Apacs Tantrum 200 ch&iacute;nh h&atilde;ng</strong>,&nbsp;chất lượng, gi&aacute; hấp dẫn tại <strong>PTITSport</strong>&nbsp;&ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng COD to&agrave;n quốc..</p>

<p>&nbsp;</p>

<p><strong>Th&ocirc;ng số&nbsp;Vợt cầu l&ocirc;ng Apacs Tantrum 200</strong></p>

<p>+ Chất liệu:&nbsp; &nbsp;Carbon Nanotube</p>

<p>+ Trọng lượng:&nbsp; &nbsp;86gr</p>

<p>+ Độ cứng:&nbsp; &nbsp;Trung b&igrave;nh</p>

<p>+ Điểm c&acirc;n bằng:&nbsp; &nbsp;290mm</p>

<p>+ Chu vi c&aacute;n vợt:&nbsp; &nbsp;G2</p>

<p>+ Chiều d&agrave;i vợt:&nbsp; &nbsp;675mm</p>

<p>+ Mức căng tối đa:&nbsp; &nbsp;13kg</p>

<p>+ Xuất xứ:&nbsp; &nbsp;Malaysia</p>

<p>-&nbsp;<strong>Vợt cầu l&ocirc;ng</strong>&nbsp;Apacs Tantrum 200, cao cấp, to&agrave;n diện,&nbsp;gi&aacute; hợp l&yacute;, l&agrave; huyền thoại của thương hiệu cầu l&ocirc;ng Apacs. Đ&acirc;y cũng ch&iacute;nh l&agrave; c&acirc;y vợt b&aacute;n chạy nhất của Apacs trong tầm gi&aacute; hơn 1 triệu đồng.</p>

<p>- Vợt được sản xuất theo c&ocirc;ng nghệ Nano, chất liệu Japan Carbon - Technology&nbsp;cao cấp gi&uacute;p c&acirc;y vợt chịu lực tốt, kh&oacute; g&atilde;y khi va chạm, được kh&aacute;ch h&agrave;ng đ&aacute;nh gi&aacute; cao về chật lượng v&agrave; độ bền.</p>

<p>- M&agrave;u sơn&nbsp;đơn giản, trang nh&atilde;, nhẹ nh&agrave;ng&nbsp;v&agrave; rất dễ nhận dạng với gam m&agrave;u xanh l&aacute; v&agrave; x&aacute;m sơn mờ huyền b&iacute; độc quyền.</p>

<p>- Vợt hơi nặng đầu một ch&uacute;t,&nbsp;trọng lượng vừa&nbsp;c&ugrave;ng với th&acirc;n cứng&nbsp;trung b&igrave;nh cho&nbsp;cảm gi&aacute;c đầm chắc, tấn c&ocirc;ng cực đ&atilde;.</p>

<p>- Tay&nbsp;cầm vừa tay, cảm gi&aacute;c ph&ocirc;ng cầu kh&aacute; nhẹ nh&agrave;ng, thanh tho&aacute;t,&nbsp;dễ d&agrave;ng xoay sở giữa trạng th&aacute;i ph&ograve;ng thủ v&agrave; tấn c&ocirc;ng.</p>

<p>- Trọng lượng&nbsp;kh&ocirc;ng qu&aacute; nặng n&ecirc;n ph&ograve;ng thủ v&agrave; phản tạt&nbsp;dễ d&agrave;ng, những c&oacute; đập cuối s&acirc;n&nbsp;uy lực.</p>

<p>- Vợt cầu l&ocirc;ng&nbsp;<strong>Apacs Tantrum 200,&nbsp;</strong>c&acirc;y vợt chất lượng&nbsp;với&nbsp;gi&aacute; hợp l&yacute;, l&agrave; một trong những c&acirc;y vợt to&agrave;n diện nhất thương hiệu Apacs,&nbsp;ph&ugrave; hợp cho những ai chơi cầu tr&igrave;nh độ&nbsp;ở mức&nbsp; trung b&igrave;nh kh&aacute;, th&iacute;ch&nbsp;lối đ&aacute;nh c&ocirc;ng&nbsp;thủ to&agrave;n diện.</p>
', 1, N'VCL', N'other', 0)
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [Ho], [Ten], [NgaySinh], [GioiTinh], [Sdt], [username]) VALUES (1020, N'Pham', N'Minh Trí', CAST(N'2000-09-27' AS Date), 0, N'0342437678', N'kon0ha')
INSERT [dbo].[KhachHang] ([MaKhachHang], [Ho], [Ten], [NgaySinh], [GioiTinh], [Sdt], [username]) VALUES (3021, N'Nguyễn', N'Ngọc Quang', CAST(N'2000-07-20' AS Date), 1, N'0857209309', N'bro')
INSERT [dbo].[KhachHang] ([MaKhachHang], [Ho], [Ten], [NgaySinh], [GioiTinh], [Sdt], [username]) VALUES (4022, N'Pham', N'Tri', CAST(N'2000-09-27' AS Date), 1, N'0342437678', N'n18dcat_092')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [NgayVaoLam], [DiaChi], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SoDienThoai], [username]) VALUES (13, N'Phạm Minh', N'Trí', CAST(N'2017-01-03' AS Date), N'97 Man Thiệnn', N'215501848', CAST(N'2000-09-27' AS Date), 1, 1, N'0342437678', N'konoha                                            ')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [NgayVaoLam], [DiaChi], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SoDienThoai], [username]) VALUES (22, N'111', N'11', CAST(N'2021-05-25' AS Date), N'12121', N'1111111', CAST(N'2021-05-25' AS Date), 1, 1, N'03444444', N'n18dcat092')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [NgayVaoLam], [DiaChi], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SoDienThoai], [username]) VALUES (24, N'123', N'Pham Minh Tri', CAST(N'2021-06-02' AS Date), N'97 Man Thiện, phường Hiệp Phú, quận 9, thành phố Hồ Chí Minh', N'2112121', CAST(N'2021-06-26' AS Date), 1, 1, N'03424376781', N'again')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (38, CAST(N'2021-05-29' AS Date), 13, 1, CAST(N'2021-05-29' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (39, CAST(N'2021-05-29' AS Date), 13, 1, CAST(N'2021-05-29' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (40, CAST(N'2021-05-29' AS Date), 13, 1, CAST(N'2021-05-29' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (1038, CAST(N'2021-05-29' AS Date), 13, 1, CAST(N'2021-05-29' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (1040, CAST(N'2021-06-16' AS Date), 24, 1, CAST(N'2021-05-29' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (2041, CAST(N'2021-06-19' AS Date), 13, 1, CAST(N'2021-06-19' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (2042, CAST(N'2021-06-20' AS Date), 13, 1, CAST(N'2021-06-20' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (2043, CAST(N'2021-06-20' AS Date), 13, 1, CAST(N'2021-06-20' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (2044, CAST(N'2021-06-21' AS Date), 13, 1, CAST(N'2021-06-22' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (2045, CAST(N'2021-06-06' AS Date), 13, 1, CAST(N'2021-06-22' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (2046, CAST(N'2021-06-22' AS Date), 13, 1, CAST(N'2021-06-22' AS Date))
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[PhieuXuat] ON 

INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (1, CAST(N'2021-06-21' AS Date), 13, 1, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (2, CAST(N'2021-06-21' AS Date), 13, 1, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (4, CAST(N'2021-06-21' AS Date), 13, 0, NULL)
INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (6, CAST(N'2021-06-03' AS Date), 13, 0, NULL)
INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat], [MaNV], [TinhTrang], [NgayXacNhan]) VALUES (7, CAST(N'2021-06-20' AS Date), 13, 1, CAST(N'2021-06-21' AS Date))
SET IDENTITY_INSERT [dbo].[PhieuXuat] OFF
INSERT [dbo].[Role] ([id], [name]) VALUES (0, N'Khách hàng')
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Quản lí')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1, N'3XL', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (2, N'Khác', N'<p>size kh&aacute;c với c&aacute;c <strong>size </strong>kia</p>
')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (3, N'L', NULL)
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (4, N'M', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (5, N'none', N'<p><img alt="mail" src="http://localhost:8080/QuanLiBanHangTheThao/resources/ckeditor/plugins/smiley/images/envelope.png" style="height:23px; width:23px" title="mail" />Sử dụng khi sản phẩm kh&ocirc;ng c&oacute; k&iacute;ch thước&nbsp;<img alt="devil" src="http://localhost:8080/QuanLiBanHangTheThao/resources/ckeditor/plugins/smiley/images/devil_smile.png" style="height:23px; width:23px" title="devil" /></p>
')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (6, N'XL', NULL)
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (7, N'XXL', NULL)
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1011, N'4L', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1012, N'1', N'<p>Size &aacute;o thể thao</p>
')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1013, N'3', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1014, N'5', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1015, N'7', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1016, N'9', N'szie áo thể thao')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1017, N'11', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1018, N'13', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1019, N'15', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1020, N'39', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1021, N'40', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1022, N'41', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1023, N'42', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1024, N'test', N'')
SET IDENTITY_INSERT [dbo].[Size] OFF
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'again', N'356a192b7913b04c54574d18c28d46e6395428ab', N'minhtri.us2709@gmail.com', 2, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'bro', N'356a192b7913b04c54574d18c28d46e6395428ab', N'nguyenngocquang700@gmail.com', 0, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'kon0ha', N'356a192b7913b04c54574d18c28d46e6395428ab', N'yaboku279@gmail.com', 0, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'konoha', N'356a192b7913b04c54574d18c28d46e6395428ab', N'n18dcat092@student.ptithcm.edu.vn', 1, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'n18dcat_092', N'356a192b7913b04c54574d18c28d46e6395428ab', N'yaboku2791111@gmail.com', 0, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'n18dcat092', N'17ba0791499db908433b80f37c5fbc89b870084b', N'1111', 1, 1)
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'AOLIKES', N'AOLIKES')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'belsport', N'BelSport')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'COBRA', N'Cobra')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'DONEXPRO', N'DONEXPRO')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'LINING', N'Lining')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'other', N'Khác')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'PROSTAR', N'Prostar')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_KhachHang]    Script Date: 8/8/2021 9:12:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KhachHang] ON [dbo].[KhachHang]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_NhanVien]    Script Date: 8/8/2021 9:12:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_NhanVien] ON [dbo].[NhanVien]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BinhLuanSanPham]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanSanPham_HangHoa] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[HangHoa] ([MaHangHoa])
GO
ALTER TABLE [dbo].[BinhLuanSanPham] CHECK CONSTRAINT [FK_BinhLuanSanPham_HangHoa]
GO
ALTER TABLE [dbo].[BinhLuanSanPham]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuanSanPham_TaiKhoan] FOREIGN KEY([Username])
REFERENCES [dbo].[TaiKhoan] ([Username])
GO
ALTER TABLE [dbo].[BinhLuanSanPham] CHECK CONSTRAINT [FK_BinhLuanSanPham_TaiKhoan]
GO
ALTER TABLE [dbo].[CT_PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuXuat_CTHangHoa] FOREIGN KEY([MaHangHoa], [MaSize])
REFERENCES [dbo].[CTHangHoa] ([MaHangHoa], [MaSize])
GO
ALTER TABLE [dbo].[CT_PhieuXuat] CHECK CONSTRAINT [FK_CT_PhieuXuat_CTHangHoa]
GO
ALTER TABLE [dbo].[CT_PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuXuat_PhieuXuat] FOREIGN KEY([MaPX])
REFERENCES [dbo].[PhieuXuat] ([MaPX])
GO
ALTER TABLE [dbo].[CT_PhieuXuat] CHECK CONSTRAINT [FK_CT_PhieuXuat_PhieuXuat]
GO
ALTER TABLE [dbo].[CTDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_CTHangHoa] FOREIGN KEY([MaHangHoa], [MaSize])
REFERENCES [dbo].[CTHangHoa] ([MaHangHoa], [MaSize])
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTHD_CTHangHoa]
GO
ALTER TABLE [dbo].[CTDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HoaDon] FOREIGN KEY([MaDonDatHang])
REFERENCES [dbo].[DonDatHang] ([MaDonDatHang])
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTHD_HoaDon]
GO
ALTER TABLE [dbo].[CTHangHoa]  WITH CHECK ADD  CONSTRAINT [FK_CTHangHoa_HangHoa] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[HangHoa] ([MaHangHoa])
GO
ALTER TABLE [dbo].[CTHangHoa] CHECK CONSTRAINT [FK_CTHangHoa_HangHoa]
GO
ALTER TABLE [dbo].[CTHangHoa]  WITH CHECK ADD  CONSTRAINT [FK_CTHangHoa_Size] FOREIGN KEY([MaSize])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[CTHangHoa] CHECK CONSTRAINT [FK_CTHangHoa_Size]
GO
ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_CTHangHoa] FOREIGN KEY([MaHangHoa], [MaSize])
REFERENCES [dbo].[CTHangHoa] ([MaHangHoa], [MaSize])
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_CTHangHoa]
GO
ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachYeuThich_HangHoa] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[HangHoa] ([MaHangHoa])
GO
ALTER TABLE [dbo].[DanhSachYeuThich] CHECK CONSTRAINT [FK_DanhSachYeuThich_HangHoa]
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachYeuThich_TaiKhoan1] FOREIGN KEY([Username])
REFERENCES [dbo].[TaiKhoan] ([Username])
GO
ALTER TABLE [dbo].[DanhSachYeuThich] CHECK CONSTRAINT [FK_DanhSachYeuThich_TaiKhoan1]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DatHang_NhanVien]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TaiKhoan] FOREIGN KEY([Username])
REFERENCES [dbo].[TaiKhoan] ([Username])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_HoaDon_TaiKhoan]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_DanhMucSanPham] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucSanPham] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_DanhMucSanPham]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_ThuongHieu] FOREIGN KEY([ThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([id])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_ThuongHieu]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_TaiKhoan] FOREIGN KEY([username])
REFERENCES [dbo].[TaiKhoan] ([Username])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_TaiKhoan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([username])
REFERENCES [dbo].[TaiKhoan] ([Username])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_NhanVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_Role]
GO
USE [master]
GO
ALTER DATABASE [QuanLiTheThao] SET  READ_WRITE 
GO
