USE [master]
GO
/****** Object:  Database [QuanLiTheThao]    Script Date: 6/6/2021 6:47:30 PM ******/
CREATE DATABASE [QuanLiTheThao]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLiTheThao', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLiTheThao.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[BinhLuanSanPham]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[CTDDH]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[CTHangHoa]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[CTPN]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[HangHoa]    Script Date: 6/6/2021 6:47:30 PM ******/
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
 CONSTRAINT [PK_HangHoa_1] PRIMARY KEY CLUSTERED 
(
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/6/2021 6:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [date] NOT NULL,
	[MaNV] [int] NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/6/2021 6:47:30 PM ******/
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
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 6/6/2021 6:47:30 PM ******/
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

INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (10, N'<p>abcxyzz</p>
', N'kon0ha', N'HH006', CAST(N'2021-05-26 12:56:45.500' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (11, N'<p>abcxyz</p>
', N'kon0ha', N'HH006', CAST(N'2021-05-26 12:56:47.483' AS DateTime))
INSERT [dbo].[BinhLuanSanPham] ([id], [NoiDung], [Username], [MaHangHoa], [ThoiGian]) VALUES (12, N'<p>123123</p>
', N'kon0ha', N'HH006', CAST(N'2021-05-26 12:58:03.447' AS DateTime))
SET IDENTITY_INSERT [dbo].[BinhLuanSanPham] OFF
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1027, 1, N'G001', 460000, 2, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1027, 3, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1027, 5, N'HH006', 95000, 2, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1027, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1028, 1, N'G001', 460000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1028, 1, N'HH002', 205000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1028, 5, N'HH006', 95000, 6, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1029, 5, N'HH006', 95000, 90, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1030, 1, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1031, 1, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1032, 1, N'G001', 460000, 8, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1032, 3, N'G001', 460000, 8, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1032, 5, N'HH006', 95000, 5, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1032, 1011, N'G001', 460000, 8, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1033, 1, N'G001', 460000, 8, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1033, 1, N'HH002', 205000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1033, 5, N'HH006', 95000, 10, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1034, 1, N'G001', 460000, 11, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1034, 3, N'G001', 460000, 27, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1034, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1035, 5, N'HH006', 95000, 3, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1036, 5, N'HH006', 95000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1037, 5, N'HH006', 95000, 2, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1038, 1, N'G001', 460000, 0, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1039, 5, N'HH006', 95000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1040, 1, N'HH002', 205000, 5, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1040, 3, N'G001', 460000, 5, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1040, 5, N'HH006', 95000, 7, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1041, 1, N'G001', 460000, 10, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1041, 1, N'HH001', 205000, 10, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1041, 1, N'HH002', 205000, 10, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (1041, 5, N'HH006', 95000, 10, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2032, 5, N'HH006', 95000, 6, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2033, 5, N'HH006', 95000, 8, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2033, 1011, N'G001', 460000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2034, 7, N'G001', 460000, 4, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2035, 7, N'G001', 460000, 6, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2038, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTDDH] ([MaDonDatHang], [MaSize], [MaHangHoa], [DonGia], [SoLuong], [KhuyenMai]) VALUES (2039, 1011, N'G001', 460000, 1, 0)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 1, 90)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 3, 27)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 7, 90)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'G001', 1011, 89)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH001', 1, 90)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH002', 1, 90)
INSERT [dbo].[CTHangHoa] ([MaHangHoa], [MaSize], [SoLuong]) VALUES (N'HH006', 5, 56)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (36, 1, N'HH002', 10)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (36, 5, N'HH006', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (38, 5, N'HH006', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 1, N'G001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 1, N'HH001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 1, N'HH002', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (39, 7, N'G001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (40, 1011, N'G001', 100)
INSERT [dbo].[CTPN] ([MaPN], [MaSize], [MaHangHoa], [SoLuong]) VALUES (1038, 5, N'HH006', 10)
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'GTT', N'Giày thể thao')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'PK', N'Phụ kiện')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (N'QA', N'Quần áo thể thao')
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] ON 

INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (2, N'kon0ha', N'G001')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (4, N'kon0ha', N'HH002')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (5, N'kon0ha', N'HH006')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (12, N'konoha', N'HH002')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (13, N'konoha', N'G001')
INSERT [dbo].[DanhSachYeuThich] ([id], [Username], [MaHangHoa]) VALUES (14, N'konoha', N'HH006')
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1027, CAST(N'2021-05-29' AS Date), 13, 1, 2030000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1028, CAST(N'2021-05-29' AS Date), 13, 1, 2615000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1029, CAST(N'2021-05-29' AS Date), 13, 1, 8550000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1030, CAST(N'2021-05-29' AS Date), 13, 1, 460000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1031, CAST(N'2021-05-29' AS Date), 13, 1, 460000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1032, CAST(N'2021-05-29' AS Date), 13, 1, 11515000, 0, N'bro', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1033, CAST(N'2021-05-29' AS Date), 13, 1, 5450000, 0, N'bro', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1034, CAST(N'2021-05-29' AS Date), 13, 1, 17940000, 0, N'bro', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1035, CAST(N'2021-05-29' AS Date), 13, 1, 285000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1036, CAST(N'2021-05-29' AS Date), 13, 1, 380000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1037, CAST(N'2021-05-29' AS Date), 13, 1, 190000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1038, CAST(N'2021-05-29' AS Date), 13, 1, 0, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1039, CAST(N'2021-05-29' AS Date), 13, 1, 380000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1040, CAST(N'2021-05-29' AS Date), 13, 1, 3990000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (1041, CAST(N'2021-05-29' AS Date), 13, 1, 9650000, 0, N'bro', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2032, CAST(N'2021-05-29' AS Date), 13, 1, 570000, 0, N'kon0ha', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2033, CAST(N'2021-05-29' AS Date), 13, 1, 2600000, 0, N'kon0ha', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2034, CAST(N'2021-05-29' AS Date), 13, 1, 1840000, 0, N'bro', N'Mua tại quầy')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2035, CAST(N'2021-05-30' AS Date), 13, 1, 2760000, 0, N'konoha', N'ntt, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2038, CAST(N'2021-06-03' AS Date), 13, 1, 460000, 0, N'n18dcat_092', N'NTT, Huyện Hoài Ân, Bình Định')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [Ngay], [MaNV], [TinhTrang], [TongTienSanPham], [PhiVanChuyen], [Username], [DiaChiNhanHang]) VALUES (2039, CAST(N'2021-06-03' AS Date), 13, 1, 460000, 0, N'kon0ha', N'NTT, Huyện Hoài Ân, Bình Định')
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu]) VALUES (N'G001', N'GIÀY THỂ THAO NAM BELSPORT BEL190927 SIÊU NHẸ MÀU ĐEN', 460000, 0, N'HH003.png', N'<p><strong>&diams;&nbsp;Gi&agrave;y thể thao nam Sneaker&nbsp;BelSport BEL190927&nbsp;si&ecirc;u nhẹ.</strong></p>

<p>- BelSport cho ra những sản phẩm gi&agrave;y thể thao&nbsp;với chất lượng thiết kế mẫu m&atilde; cực kỳ đỉnh cao, lu&ocirc;n đem tới cho kh&aacute;ch h&agrave;ng sự mới mẽ, phấn kh&iacute;ch cho mỗi sản phẩm mới.</p>

<p>-&nbsp;<a href="https://bigsport.vn/collections/giay-the-thao-1?page=3">Gi&agrave;y thể thao</a>&nbsp;nam&nbsp;BelSport BEL190927&nbsp;thiết kế&nbsp;m&agrave;u xanh đen&nbsp;kh&aacute; đơn giản nhưng rất sang trọng v&agrave; khỏe khoắn, đ&ocirc;i gi&agrave;y ph&ugrave; hợp cho nhiều lứa&nbsp;tuổi, sẽ rất ngầu khi kết hợp với những bộ thể thao c&aacute; t&iacute;nh.</p>

<p>- Thực sự ấn tượng bởi trọng lượng của đ&ocirc;i gi&agrave;y (khoảng 200gr), gi&agrave;y nhẹ đến&nbsp;kinh ngạc cho cảm gi&aacute;c mang gi&agrave;y như ch&acirc;n kh&ocirc;ng, lướt nhẹ nh&agrave;ng tr&ecirc;n mặt đường.</p>

<p>- L&agrave; mẫu gi&agrave;y thể thao&nbsp;cực kỳ đa dụng: c&oacute; thể kết hợp cho mọi kểu đồ thể thao, vừa mang đi chơi, chạy bộ, đi l&agrave;m...</p>

<p>- Với c&ocirc;ng nghệ Flymesh mang lại sự&nbsp;tho&aacute;ng m&aacute;t, phần tr&ecirc;n b&agrave;n ch&acirc;n v&agrave; phần cổ được dệt&nbsp;c&aacute;c lổ hổng Flyknit si&ecirc;u nhỏ tạo sự th&ocirc;ng tho&aacute;ng,&nbsp;tho&aacute;t kh&iacute;, kh&ocirc;ng bị b&iacute; hơi khi vận động&nbsp;nhiều hoặc&nbsp;chạy li&ecirc;n tục trong thời tiết oi bức.</p>

<p>- C&ocirc;ng nghệ dệt Flykint gi&uacute;p cổ ch&acirc;n lẫn g&oacute;t ch&acirc;n được &ocirc;m được &ocirc;m trọm theo to&agrave;n bộ đ&ocirc;i gi&agrave;y. C&ocirc;ng nghệ dệt Flykint được rất nhiều h&atilde;ng gi&agrave;y lớn &aacute;p dụng cho sản phẩm gi&agrave;y chạy bộ, kh&ocirc;ng những tạo cảm gi&aacute;c chắc chắn c&ograve;n gi&uacute;p đ&ocirc;i ch&acirc;n v&ocirc; c&ugrave;ng&nbsp;thoải m&aacute;i.</p>

<p>- Đế&nbsp;gi&agrave;y&nbsp;BelSport BEL190927&nbsp;với chất liệu Eva phản hồi lực cức tốt, &ecirc;m &aacute;i v&agrave; hổ trợ rất tốt cho l&ograve;ng b&agrave;n ch&acirc;n. Khi b&agrave;n ch&acirc;n được bước đi phần xốp sẽ hấp thụ to&agrave;n bộ lực đ&oacute; v&agrave; mang lại phản hồi tuyệt vời l&ecirc;n l&ograve;ng b&agrave;n ch&acirc;n,&nbsp;như cung cấp cho b&agrave;n ch&acirc;n nguồn năng lượng v&ocirc; tận để&nbsp;vượt qua mọi cung đường.</p>

<p>- Với những trang bị về c&ocirc;ng nghệ cũng như thiết kế c&ugrave;ng với mức gi&aacute; v&ocirc; c&ugrave;ng hợp l&yacute;,&nbsp;gi&agrave;y thể thao nam&nbsp;BelSport BEL190927&nbsp;chắc chắn l&agrave; đ&ocirc;i gi&agrave;y ưu t&uacute; để bạn lựa chọn đồng h&agrave;nh.&nbsp;</p>
', 1, N'GTT', N'belsport')
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu]) VALUES (N'HH001', N'ÁO THỂ THAO NAM POLO EGAN UV 03 XANH BÍCH', 205000, 0, N'aothethaoxanhduong.png', N'<p><strong>&loz;&nbsp;&Aacute;o thể thao nam Polo UV Egan 03</strong></p>

<p>+<strong>&nbsp;</strong>Vẫn giữ phong c&aacute;ch thiết kế đơn giản như UV Egan 2 nhưng sự sang trọng, lịch lảm kh&ocirc;ng hề thay đổi.</p>

<p>+ Kiểu dệt cổ &aacute;o&nbsp;mới cho&nbsp;<a href="https://bigsport.vn/collections/ao-the-thao-nam">&Aacute;o thể thao</a>&nbsp;Polo UV Egan 03 trở n&ecirc;n tinh tế&nbsp;v&agrave; cao cấp hơn.</p>

<p>+ Vải c&aacute; sấu với chất lượng cao cấp, bề mặt vải lu&ocirc;n mềm mịn, co gi&atilde;n tốt, gi&uacute;p cơ thể vận động v&ocirc; c&ugrave;ng thoải m&aacute;i.</p>

<p>+ Form cực chuẩn v&agrave; đa dụng,&nbsp;dễ phối đồ, c&oacute; thể mặc đi chơi, chơi thể thao đều được hoặc&nbsp;l&agrave;m trang phục cho nhiều sự kiện qian trọng kh&aacute;c m&agrave; vẫn thể hiện sự sang trọng, lịch lảm.</p>

<p>+ Sợi vải thấm h&uacute;t mồ h&ocirc;i nhanh cho cảm gi&aacute;c tho&aacute;ng m&aacute;t, dễ chịu, chống bết d&iacute;nh da khi đổ mồ h&ocirc;i.</p>

<p>+ C&ocirc;ng nghệ chống tia UV&nbsp;bảo vệ l&agrave;n da của bạn trước c&aacute;c tia cực t&iacute;m độc hại,&nbsp;thoải m&aacute;i hoạt động ngo&agrave;i trời cho cả ng&agrave;y d&agrave;i.</p>

<p>- Logo Egan&nbsp;được cắt &eacute;p cực kỳ&nbsp;sắc n&eacute;t, chắc chắn</p>

<p>- Với gi&aacute; b&aacute;n chỉ 205.000 đồng c&ugrave;ng với chất lượng cao cấp, chắc chắn sẽ l&agrave;m bạn h&agrave;i l&ograve;ng mỗi lần mặc mẫu&nbsp;&nbsp;&aacute;o thể thao n&agrave;y.</p>
', 1, N'QA', N'other')
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu]) VALUES (N'HH002', N' ÁO THỂ THAO NAM POLO EGAN UV 03 CHÍNH HÃNG XANH BIỂN', 205000, 0, N'HH002.png', N'<p><strong>&loz;&nbsp;&Aacute;o thể thao nam Polo Egan UV 03</strong></p>

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
', 1, N'QA', N'other')
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [GiamGia], [Anh], [GhiChu], [TinhTrang], [MaDanhMuc], [ThuongHieu]) VALUES (N'HH006', N'BÓP TAY CHỈNH LỰC - ĐẾM SỐ', 95000, 0, N'Screenshot 2021-05-15 233342.png', N'<p>B&oacute;p tay chỉnh lực - đếm số chất lượng, gi&aacute; hấp dẫn, tại BigSport &ndash; Hệ thống cửa h&agrave;ng thể thao uy t&iacute;n h&agrave;ng đầu tại TP.HCM. Giao h&agrave;ng to&agrave;n quốc. Tập dụng cụ b&oacute;p tay chỉnh lực hằng ng&agrave;y gi&uacute;p cơ tay ch&uacute;ng ta chắc khỏe, dẻo dai. Đặc biệt l&agrave; c&aacute;c vận động vi&ecirc;n chơi c&aacute;c m&ocirc;n thể thao như: cầu l&ocirc;ng, tennis, b&oacute;ng b&agrave;n...v&agrave; những người c&oacute; bệnh l&yacute; cần phục hồi cơ tay. - B&oacute;p tay chỉnh lực từ 10kg đến 60kg, ngo&agrave;i ra c&ograve;n c&oacute; bộ đếm số lần b&oacute;p gi&uacute;p ch&uacute;ng ta kiểm so&aacute;t được qu&aacute; tr&igrave;nh tập luyện hằng ng&agrave;y. - Sản xuất từ nhựa tổng hợp cao cấp, phần tay cầm được ốp lớp nhựa dẻo vừa vặn, cho l&ograve;ng b&agrave;n tay kh&ocirc;ng bị chai sạn khi sử dụng l&acirc;u. - L&ograve; xo bằng th&eacute;p kh&ocirc;ng rỉ, được xi mạ thẩm mỉ v&agrave; kh&ocirc;ng bị oxy h&oacute;a ăn m&ograve;n.</p>
', 1, N'PK', N'other')
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [Ho], [Ten], [NgaySinh], [GioiTinh], [Sdt], [username]) VALUES (1020, N'Pham', N'Minh Trí', CAST(N'2000-09-27' AS Date), 1, N'0342437678', N'kon0ha')
INSERT [dbo].[KhachHang] ([MaKhachHang], [Ho], [Ten], [NgaySinh], [GioiTinh], [Sdt], [username]) VALUES (3021, N'Nguyễn', N'Ngọc Quang', CAST(N'2000-07-20' AS Date), 1, N'0857209309', N'bro')
INSERT [dbo].[KhachHang] ([MaKhachHang], [Ho], [Ten], [NgaySinh], [GioiTinh], [Sdt], [username]) VALUES (4022, N'Pham', N'Tri', CAST(N'2000-09-27' AS Date), 1, N'0342437678', N'n18dcat_092')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [NgayVaoLam], [DiaChi], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SoDienThoai], [username]) VALUES (13, N'Phạm Minh', N'Trí', CAST(N'2017-01-03' AS Date), N'97 Man Thiệnn', N'215501848', CAST(N'2000-09-27' AS Date), 1, 1, N'0342437678', N'konoha                                            ')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [NgayVaoLam], [DiaChi], [CMND], [NgaySinh], [TinhTrang], [GioiTinh], [SoDienThoai], [username]) VALUES (22, N'111', N'11', CAST(N'2021-05-25' AS Date), N'12121', N'1111111', CAST(N'2021-05-25' AS Date), 1, 1, N'03444444', N'n18dcat092')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPN], [Ngay], [MaNV]) VALUES (36, CAST(N'2021-05-28' AS Date), 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [Ngay], [MaNV]) VALUES (38, CAST(N'2021-05-29' AS Date), 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [Ngay], [MaNV]) VALUES (39, CAST(N'2021-05-29' AS Date), 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [Ngay], [MaNV]) VALUES (40, CAST(N'2021-05-29' AS Date), 13)
INSERT [dbo].[PhieuNhap] ([MaPN], [Ngay], [MaNV]) VALUES (1038, CAST(N'2021-05-29' AS Date), 13)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
INSERT [dbo].[Role] ([id], [name]) VALUES (0, N'Khách hàng')
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Quản lí')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1, N'3XL', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (2, N'Khác', N'<p>size kh&aacute;c với c&aacute;c <strong>size </strong>kia</p>
')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (3, N'L', NULL)
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (4, N'M1', N'')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (5, N'none', N'<p><img alt="mail" src="http://localhost:8080/QuanLiBanHangTheThao/resources/ckeditor/plugins/smiley/images/envelope.png" style="height:23px; width:23px" title="mail" />Sử dụng khi sản phẩm kh&ocirc;ng c&oacute; k&iacute;ch thước&nbsp;<img alt="devil" src="http://localhost:8080/QuanLiBanHangTheThao/resources/ckeditor/plugins/smiley/images/devil_smile.png" style="height:23px; width:23px" title="devil" /></p>
')
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (6, N'XL', NULL)
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (7, N'XXL', NULL)
INSERT [dbo].[Size] ([id], [TenSize], [GhiChu]) VALUES (1011, N'4L', N'')
SET IDENTITY_INSERT [dbo].[Size] OFF
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'bro', N'356a192b7913b04c54574d18c28d46e6395428ab', N'nguyenngocquang700@gmail.com', 0, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'kon0ha', N'356a192b7913b04c54574d18c28d46e6395428ab', N'yaboku279@gmail.com', 0, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'konoha', N'356a192b7913b04c54574d18c28d46e6395428ab', N'n18dcat092@student.ptithcm.edu.vn', 1, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'n18dcat_092', N'356a192b7913b04c54574d18c28d46e6395428ab', N'yaboku2791111@gmail.com', 0, 1)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Email], [Role], [Active]) VALUES (N'n18dcat092', N'17ba0791499db908433b80f37c5fbc89b870084b', N'1111', 2, 1)
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'belsport', N'BelSport')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'other', N'Khác')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'ptit', N'PTIT-HCM')
INSERT [dbo].[ThuongHieu] ([id], [TenThuongHieu]) VALUES (N'voz', N'voz')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_KhachHang]    Script Date: 6/6/2021 6:47:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KhachHang] ON [dbo].[KhachHang]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_NhanVien]    Script Date: 6/6/2021 6:47:30 PM ******/
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
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachYeuThich_TaiKhoan] FOREIGN KEY([Username])
REFERENCES [dbo].[TaiKhoan] ([Username])
GO
ALTER TABLE [dbo].[DanhSachYeuThich] CHECK CONSTRAINT [FK_DanhSachYeuThich_TaiKhoan]
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
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_Role]
GO
USE [master]
GO
ALTER DATABASE [QuanLiTheThao] SET  READ_WRITE 
GO
