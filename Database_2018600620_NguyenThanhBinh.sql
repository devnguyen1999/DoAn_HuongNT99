USE [FarmMarket_2]
GO
ALTER TABLE [dbo].[TinTuc] DROP CONSTRAINT [FK__TinTuc__TenTaiKh__398D8EEE]
GO
ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK__SanPham__MaTH__38996AB5]
GO
ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK__SanPham__MaDanhM__37A5467C]
GO
ALTER TABLE [dbo].[HoaDon] DROP CONSTRAINT [FK__HoaDon__MaGioHan__398D8EEE]
GO
ALTER TABLE [dbo].[GioHang] DROP CONSTRAINT [FK__GioHang__TenTaiK__36B12243]
GO
ALTER TABLE [dbo].[ChiTietGioHang] DROP CONSTRAINT [FK__ChiTietGio__MaSP__34C8D9D1]
GO
ALTER TABLE [dbo].[ChiTietGioHang] DROP CONSTRAINT [FK__ChiTietGi__MaGio__38996AB5]
GO
ALTER TABLE [dbo].[LienHe] DROP CONSTRAINT [DF__LienHe__TrangTha__31EC6D26]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[TinTuc]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[ThuongHieu]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[TaiKhoan]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[SanPham]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[PhanHoi]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[LienHe]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[HoaDon]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[GioHang]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[DanhMuc]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 01/01/22 10:42:29 PM ******/
DROP TABLE [dbo].[ChiTietGioHang]
GO
USE [master]
GO
/****** Object:  Database [FarmMarket_2]    Script Date: 01/01/22 10:42:29 PM ******/
DROP DATABASE [FarmMarket_2]
GO
/****** Object:  Database [FarmMarket_2]    Script Date: 01/01/22 10:42:29 PM ******/
CREATE DATABASE [FarmMarket_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmMarket_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FarmMarket_2.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FarmMarket_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FarmMarket_2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FarmMarket_2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmMarket_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmMarket_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmMarket_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmMarket_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmMarket_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmMarket_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmMarket_2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FarmMarket_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmMarket_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmMarket_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmMarket_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmMarket_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmMarket_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmMarket_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmMarket_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmMarket_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FarmMarket_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmMarket_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmMarket_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmMarket_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmMarket_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmMarket_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmMarket_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmMarket_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmMarket_2] SET  MULTI_USER 
GO
ALTER DATABASE [FarmMarket_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmMarket_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmMarket_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmMarket_2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FarmMarket_2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FarmMarket_2]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[MaSP] [int] NOT NULL,
	[MaGioHang] [int] NOT NULL,
	[Gia] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NOT NULL,
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL CONSTRAINT [DF__GioHang__NgayTao__239E4DCF]  DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL CONSTRAINT [DF__GioHang__NgayCap__24927208]  DEFAULT (getdate()),
	[TenTaiKhoan] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__GioHang__F5001DA3B5472CDF] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [nvarchar](100) NULL,
	[PhiShip] [decimal](18, 0) NULL,
	[ChuY] [ntext] NULL,
	[DiaChi] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
	[MaGioHang] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLienHe] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [ntext] NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLienHe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[SoDT] [nchar](12) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[NoiDung] [ntext] NULL,
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](200) NOT NULL,
	[TrongLuong] [nvarchar](100) NULL,
	[MoTa] [ntext] NULL,
	[Gia] [decimal](18, 0) NULL,
	[HinhAnh] [varchar](100) NULL,
	[SoLuong] [int] NULL,
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
	[MaDanhMuc] [int] NOT NULL,
	[MaTH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [nvarchar](100) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nchar](12) NULL,
	[Email] [nvarchar](100) NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Quyen] [int] NULL,
	[TrangThai] [bit] NULL DEFAULT ((1)),
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](150) NOT NULL,
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 01/01/22 10:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](255) NULL,
	[MoTaNgan] [nvarchar](300) NULL,
	[MoTaChiTiet] [ntext] NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[NgayTao] [datetime] NULL DEFAULT (getdate()),
	[NgayCapNhat] [datetime] NULL DEFAULT (getdate()),
	[TenTaiKhoan] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (1, 1, CAST(79000 AS Decimal(18, 0)), 5, CAST(N'2021-11-22 15:56:59.950' AS DateTime), CAST(N'2021-11-22 15:56:59.953' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (1, 12, CAST(79000 AS Decimal(18, 0)), 1, CAST(N'2021-12-06 15:22:02.270' AS DateTime), CAST(N'2021-12-06 15:22:02.273' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (1, 15, CAST(79000 AS Decimal(18, 0)), 1, CAST(N'2021-12-10 09:43:48.877' AS DateTime), CAST(N'2021-12-10 09:43:48.880' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (2, 1, CAST(124500 AS Decimal(18, 0)), 3, CAST(N'2021-11-22 15:57:20.733' AS DateTime), CAST(N'2021-11-22 15:57:20.733' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (2, 14, CAST(124500 AS Decimal(18, 0)), 450, CAST(N'2021-12-09 14:13:55.730' AS DateTime), CAST(N'2021-12-09 14:13:55.733' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (3, 17, CAST(159600 AS Decimal(18, 0)), 4, CAST(N'2021-12-13 17:53:30.610' AS DateTime), CAST(N'2021-12-13 17:53:30.613' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (3, 18, CAST(159600 AS Decimal(18, 0)), 2, CAST(N'2021-12-15 22:08:34.837' AS DateTime), CAST(N'2021-12-15 22:08:34.837' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (3, 19, CAST(159600 AS Decimal(18, 0)), 2, CAST(N'2021-12-15 22:09:25.520' AS DateTime), CAST(N'2021-12-15 22:09:25.527' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (4, 12, CAST(132750 AS Decimal(18, 0)), 1, CAST(N'2021-12-06 15:22:02.220' AS DateTime), CAST(N'2021-12-06 15:22:02.223' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (6, 11, CAST(129250 AS Decimal(18, 0)), 1, CAST(N'2021-12-04 11:57:19.753' AS DateTime), CAST(N'2021-12-04 11:57:19.753' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (6, 15, CAST(129250 AS Decimal(18, 0)), 1, CAST(N'2021-12-10 09:43:48.917' AS DateTime), CAST(N'2021-12-10 09:43:48.917' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (7, 11, CAST(43200 AS Decimal(18, 0)), 2, CAST(N'2021-12-04 11:57:19.713' AS DateTime), CAST(N'2021-12-04 11:57:19.717' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (8, 32, CAST(64000 AS Decimal(18, 0)), 2, CAST(N'2021-12-19 18:21:40.327' AS DateTime), CAST(N'2021-12-19 18:21:40.327' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 7, CAST(25000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 8, CAST(25000 AS Decimal(18, 0)), 2, NULL, NULL)
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 9, CAST(25000 AS Decimal(18, 0)), 1, NULL, NULL)
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 10, CAST(25000 AS Decimal(18, 0)), 1, CAST(N'2021-12-04 10:40:07.873' AS DateTime), CAST(N'2021-12-04 10:40:07.877' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 13, CAST(25000 AS Decimal(18, 0)), 3, CAST(N'2021-12-09 13:42:26.260' AS DateTime), CAST(N'2021-12-09 13:42:26.263' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 15, CAST(25000 AS Decimal(18, 0)), 1, CAST(N'2021-12-10 09:43:48.830' AS DateTime), CAST(N'2021-12-10 09:43:48.830' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 16, CAST(25000 AS Decimal(18, 0)), 3, CAST(N'2021-12-10 11:12:38.850' AS DateTime), CAST(N'2021-12-10 11:12:38.850' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 29, CAST(25000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:23:20.650' AS DateTime), CAST(N'2021-12-17 01:23:20.650' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (9, 32, CAST(25000 AS Decimal(18, 0)), 1, CAST(N'2021-12-19 18:21:40.283' AS DateTime), CAST(N'2021-12-19 18:21:40.287' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (10, 20, CAST(63000 AS Decimal(18, 0)), 2, CAST(N'2021-12-15 22:10:33.533' AS DateTime), CAST(N'2021-12-15 22:10:33.537' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (10, 26, CAST(63000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:12:26.087' AS DateTime), CAST(N'2021-12-17 01:12:26.090' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (11, 15, CAST(63000 AS Decimal(18, 0)), 1, CAST(N'2021-12-10 09:43:48.897' AS DateTime), CAST(N'2021-12-10 09:43:48.900' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (11, 16, CAST(63000 AS Decimal(18, 0)), 1, CAST(N'2021-12-10 11:12:38.890' AS DateTime), CAST(N'2021-12-10 11:12:38.890' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (12, 23, CAST(119000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:01:47.197' AS DateTime), CAST(N'2021-12-17 01:01:47.197' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (12, 32, CAST(119000 AS Decimal(18, 0)), 2, CAST(N'2021-12-19 18:21:40.333' AS DateTime), CAST(N'2021-12-19 18:21:40.333' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (13, 23, CAST(49000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:01:47.203' AS DateTime), CAST(N'2021-12-17 01:01:47.203' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (13, 29, CAST(49000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:23:20.643' AS DateTime), CAST(N'2021-12-17 01:23:20.643' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (14, 24, CAST(178000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:08:13.457' AS DateTime), CAST(N'2021-12-17 01:08:13.463' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (14, 29, CAST(178000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:23:20.627' AS DateTime), CAST(N'2021-12-17 01:23:20.627' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (14, 30, CAST(178000 AS Decimal(18, 0)), 1, CAST(N'2021-12-18 00:34:31.097' AS DateTime), CAST(N'2021-12-18 00:34:31.100' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (14, 31, CAST(178000 AS Decimal(18, 0)), 2, CAST(N'2021-12-18 00:36:52.883' AS DateTime), CAST(N'2021-12-18 00:36:52.887' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (15, 27, CAST(109500 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:17:35.550' AS DateTime), CAST(N'2021-12-17 01:17:35.550' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (15, 28, CAST(109500 AS Decimal(18, 0)), 2, CAST(N'2021-12-17 01:21:04.600' AS DateTime), CAST(N'2021-12-17 01:21:04.603' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (15, 30, CAST(109500 AS Decimal(18, 0)), 1, CAST(N'2021-12-18 00:34:31.050' AS DateTime), CAST(N'2021-12-18 00:34:31.053' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (16, 21, CAST(379000 AS Decimal(18, 0)), 1, CAST(N'2021-12-16 23:23:42.510' AS DateTime), CAST(N'2021-12-16 23:23:42.513' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (16, 23, CAST(379000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:01:47.177' AS DateTime), CAST(N'2021-12-17 01:01:47.177' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (16, 32, CAST(379000 AS Decimal(18, 0)), 1, CAST(N'2021-12-19 18:21:40.323' AS DateTime), CAST(N'2021-12-19 18:21:40.323' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (17, 22, CAST(129000 AS Decimal(18, 0)), 2, CAST(N'2021-12-16 23:29:28.567' AS DateTime), CAST(N'2021-12-16 23:29:28.567' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (17, 25, CAST(129000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:10:33.940' AS DateTime), CAST(N'2021-12-17 01:10:33.943' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (17, 33, CAST(129000 AS Decimal(18, 0)), 1, CAST(N'2021-12-24 19:10:12.950' AS DateTime), CAST(N'2021-12-24 19:10:12.953' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (18, 25, CAST(36000 AS Decimal(18, 0)), 1, CAST(N'2021-12-17 01:10:33.997' AS DateTime), CAST(N'2021-12-17 01:10:33.997' AS DateTime))
INSERT [dbo].[ChiTietGioHang] ([MaSP], [MaGioHang], [Gia], [SoLuong], [NgayTao], [NgayCapNhat]) VALUES (18, 32, CAST(36000 AS Decimal(18, 0)), 1, CAST(N'2021-12-19 18:21:40.320' AS DateTime), CAST(N'2021-12-19 18:21:40.320' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [NgayTao], [NgayCapNhat]) VALUES (1, N'Trái Cây', CAST(N'2021-11-16 00:00:00.000' AS DateTime), CAST(N'2021-12-06 01:13:23.443' AS DateTime))
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [NgayTao], [NgayCapNhat]) VALUES (3, N'Chế biến sẵn', CAST(N'2021-11-16 00:00:00.000' AS DateTime), CAST(N'2021-12-06 01:13:29.217' AS DateTime))
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [NgayTao], [NgayCapNhat]) VALUES (4, N'Tươi sống', CAST(N'2021-11-17 15:50:49.227' AS DateTime), CAST(N'2021-11-17 15:50:49.230' AS DateTime))
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [NgayTao], [NgayCapNhat]) VALUES (5, N'Đông lạnh', CAST(N'2021-11-26 00:00:00.000' AS DateTime), CAST(N'2021-12-06 01:14:16.490' AS DateTime))
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [NgayTao], [NgayCapNhat]) VALUES (6, N'Bánh Kẹo', CAST(N'2021-12-15 23:21:24.000' AS DateTime), CAST(N'2021-12-16 15:09:50.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (1, CAST(N'2021-11-22 15:55:58.270' AS DateTime), CAST(N'2021-11-22 15:55:58.270' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (2, CAST(N'2021-11-22 15:56:11.873' AS DateTime), CAST(N'2021-11-22 15:56:11.873' AS DateTime), N'binhnt')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (3, CAST(N'2021-11-26 14:16:19.823' AS DateTime), CAST(N'2021-11-26 14:16:19.827' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (4, CAST(N'2021-11-26 14:17:16.157' AS DateTime), CAST(N'2021-11-26 14:17:16.160' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (5, CAST(N'2021-11-28 01:20:14.140' AS DateTime), CAST(N'2021-11-28 01:20:14.140' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (6, CAST(N'2021-11-28 14:03:12.867' AS DateTime), CAST(N'2021-11-28 14:03:12.870' AS DateTime), N'binhnt')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (7, NULL, NULL, N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (8, NULL, NULL, N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (9, NULL, NULL, N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (10, CAST(N'2021-12-04 10:40:07.757' AS DateTime), CAST(N'2021-12-04 10:40:07.760' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (11, CAST(N'2021-12-04 11:57:19.590' AS DateTime), CAST(N'2021-12-04 11:57:19.597' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (12, CAST(N'2021-12-06 15:22:02.110' AS DateTime), CAST(N'2021-12-06 15:22:02.110' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (13, CAST(N'2021-12-09 13:40:38.027' AS DateTime), CAST(N'2021-12-09 13:40:38.030' AS DateTime), N'doanhnd')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (14, CAST(N'2021-12-09 14:13:55.663' AS DateTime), CAST(N'2021-12-09 14:13:55.667' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (15, CAST(N'2021-12-10 09:43:48.723' AS DateTime), CAST(N'2021-12-10 09:43:48.723' AS DateTime), N'hanght')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (16, CAST(N'2021-12-10 11:12:38.770' AS DateTime), CAST(N'2021-12-10 11:12:38.773' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (17, CAST(N'2021-12-13 17:53:30.520' AS DateTime), CAST(N'2021-12-13 17:53:30.527' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (18, CAST(N'2021-12-15 22:08:34.757' AS DateTime), CAST(N'2021-12-15 22:08:34.763' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (19, CAST(N'2021-12-15 22:09:25.510' AS DateTime), CAST(N'2021-12-15 22:09:25.513' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (20, CAST(N'2021-12-15 22:10:33.450' AS DateTime), CAST(N'2021-12-15 22:10:33.450' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (21, CAST(N'2021-12-16 23:23:42.377' AS DateTime), CAST(N'2021-12-16 23:23:42.387' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (22, CAST(N'2021-12-16 23:29:28.553' AS DateTime), CAST(N'2021-12-16 23:29:28.557' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (23, CAST(N'2021-12-17 01:01:47.130' AS DateTime), CAST(N'2021-12-17 01:01:47.130' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (24, CAST(N'2021-12-17 01:08:13.387' AS DateTime), CAST(N'2021-12-17 01:08:13.390' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (25, CAST(N'2021-12-17 01:10:33.850' AS DateTime), CAST(N'2021-12-17 01:10:33.853' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (26, CAST(N'2021-12-17 01:12:26.070' AS DateTime), CAST(N'2021-12-17 01:12:26.073' AS DateTime), N'binhnt66')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (27, CAST(N'2021-12-17 01:17:35.523' AS DateTime), CAST(N'2021-12-17 01:17:35.530' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (28, CAST(N'2021-12-17 01:21:04.533' AS DateTime), CAST(N'2021-12-17 01:21:04.537' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (29, CAST(N'2021-12-17 01:23:20.610' AS DateTime), CAST(N'2021-12-17 01:23:20.613' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (30, CAST(N'2021-12-18 00:34:30.913' AS DateTime), CAST(N'2021-12-18 00:34:30.913' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (31, CAST(N'2021-12-18 00:36:52.750' AS DateTime), CAST(N'2021-12-18 00:36:52.770' AS DateTime), N'binhthanh')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (32, CAST(N'2021-12-19 18:21:40.210' AS DateTime), CAST(N'2021-12-19 18:21:40.210' AS DateTime), N'phuongnm')
INSERT [dbo].[GioHang] ([MaGioHang], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (33, CAST(N'2021-12-24 19:10:12.827' AS DateTime), CAST(N'2021-12-24 19:10:12.830' AS DateTime), N'binhthanh')
SET IDENTITY_INSERT [dbo].[GioHang] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [TrangThai], [PhiShip], [ChuY], [DiaChi], [NgayTao], [NgayCapNhat], [MaGioHang]) VALUES (10, N'Đã giao', CAST(15000 AS Decimal(18, 0)), N'Giao hàng vào buổi trưa', N'Bắc Ninh', CAST(N'2021-12-09 13:43:48.970' AS DateTime), CAST(N'2021-12-09 13:43:48.970' AS DateTime), 13)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TrangThai], [PhiShip], [ChuY], [DiaChi], [NgayTao], [NgayCapNhat], [MaGioHang]) VALUES (23, N'Đã giao', CAST(15000 AS Decimal(18, 0)), N'Giao hàng trong giờ hành chính', N'số 58, ngõ 105, Doãn Kế Thiện', CAST(N'2021-12-17 01:21:04.000' AS DateTime), CAST(N'2021-12-17 01:21:53.440' AS DateTime), 28)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TrangThai], [PhiShip], [ChuY], [DiaChi], [NgayTao], [NgayCapNhat], [MaGioHang]) VALUES (24, N'Đã giao', CAST(15000 AS Decimal(18, 0)), NULL, N'Bắc Ninh', CAST(N'2021-12-17 01:23:20.000' AS DateTime), CAST(N'2021-12-17 01:23:59.040' AS DateTime), 29)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TrangThai], [PhiShip], [ChuY], [DiaChi], [NgayTao], [NgayCapNhat], [MaGioHang]) VALUES (25, N'Chờ xác nhận', CAST(15000 AS Decimal(18, 0)), N'Giao hàng trong 2h', N'số 301, Châm Khê, Bắc Ninh', CAST(N'2021-12-18 00:34:31.000' AS DateTime), CAST(N'2021-12-24 21:52:01.323' AS DateTime), 30)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TrangThai], [PhiShip], [ChuY], [DiaChi], [NgayTao], [NgayCapNhat], [MaGioHang]) VALUES (26, N'Đã giao', CAST(15000 AS Decimal(18, 0)), N'Không có', N'số 301, khu Châm Khê, Phong Khê, Bắc Ninh', CAST(N'2021-12-18 00:36:52.000' AS DateTime), CAST(N'2021-12-31 23:26:31.167' AS DateTime), 31)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TrangThai], [PhiShip], [ChuY], [DiaChi], [NgayTao], [NgayCapNhat], [MaGioHang]) VALUES (27, N'Đã giao', CAST(15000 AS Decimal(18, 0)), N'giao hàng trong 2 giờ ', N'số 301, khu Châm Khê, phường Phong Khê', CAST(N'2021-12-19 18:21:40.000' AS DateTime), CAST(N'2021-12-19 18:22:08.183' AS DateTime), 32)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TrangThai], [PhiShip], [ChuY], [DiaChi], [NgayTao], [NgayCapNhat], [MaGioHang]) VALUES (28, N'Chờ xác nhận', CAST(15000 AS Decimal(18, 0)), N'', N'số 301, khu Châm Khê, Phong Khê', CAST(N'2021-12-24 19:10:13.020' AS DateTime), CAST(N'2021-12-24 19:10:13.023' AS DateTime), 33)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([MaPhanHoi], [Ten], [SoDT], [Email], [DiaChi], [NoiDung], [NgayTao]) VALUES (6, N'Phạm Hồng Mạnh', N'033244178   ', N'manhpham@gmail.com', N'Hải Dương', N'Trang web tiện lợi cung cấp cái bài viết hay', CAST(N'2021-12-11 00:53:37.063' AS DateTime))
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [Ten], [SoDT], [Email], [DiaChi], [NoiDung], [NgayTao]) VALUES (7, N'Nguyễn Thị Mai Phương', N'0971702528  ', N'phuong@gmail.com', N'số 58, ngõ 105 Doãn Kế Thiện', N'Thực phẩm sạch, chất lượng', CAST(N'2021-12-17 23:38:57.567' AS DateTime))
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (1, N'Cam vàng Navel', N'1KG/Túi', N'<p><strong>Xuất xứ</strong>: &Uacute;c</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng</strong>: Nhập Khẩu</p>

<p><strong>Đặc điểm sản phẩm:</strong>&nbsp;T&eacute;p mọng nước m&agrave;u v&agrave;ng tươi, vị ngọt thanh, thơm m&aacute;t. Cam Navel c&oacute; chứa nhiều Vitamin, ph&ugrave; hợp với mọi lứa tuổi.</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<ul>
	<li>Nhẹ nh&agrave;ng rửa cam với nước sạch, sau đ&oacute; d&ugrave;ng dao cắt th&agrave;nh những miếng vừa ăn.</li>
	<li>Cam c&oacute; thể được bảo quản ở nhiệt độ thường hoặc trong tủ lạnh. Nếu bảo quản trong tủ lạnh, nhiệt độ th&iacute;ch hợp nhất từ 7 - 10 độ C.</li>
	<li>N&ecirc;n bảo quản cam tự nhi&ecirc;n, kh&ocirc;ng bỏ v&agrave;o t&uacute;i nhựa v&igrave; cam sẽ mau hư, dễ xuất hiện nấm mốc.</li>
	<li>Kh&ocirc;ng rửa&nbsp;trước khi cho v&agrave;o tủ lạnh.</li>
</ul>
', CAST(79000 AS Decimal(18, 0)), N'cam-vang-navel.jpg', 513, CAST(N'2021-11-17 00:00:00.000' AS DateTime), CAST(N'2021-12-10 09:43:48.890' AS DateTime), 1, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (2, N'Nho xanh Autumn', N'0.5Kg', N'<p>Th&ocirc;ng tin sản ph&acirc;̉m đang được c&acirc;̣p nh&acirc;̣t</p>
', CAST(124500 AS Decimal(18, 0)), N'nho-xanh-autumn.jpg', 500, CAST(N'2021-11-17 18:26:49.000' AS DateTime), CAST(N'2021-12-10 10:05:35.950' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (3, N'Mận đỏ Family', N'0.5Kg', N'<p><strong>Xuất xứ</strong>: Mỹ</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng</strong>: Nhập khẩu</p>

<p><strong>Đặc điểm nổi bật</strong>:</p>

<ul>
	<li>
	<p>Mận đỏ Family Tree Farm được y&ecirc;u th&iacute;ch bởi chiếc size nổi bật gấp 2 - 3 lần c&aacute;c chủng loại kh&aacute;c.&nbsp;</p>
	</li>
	<li>
	<p>L&agrave; loại tr&aacute;i c&acirc;y được ưu chuộng khắp nước Mỹ.&nbsp;</p>
	</li>
	<li>
	<p>Thịt d&agrave;y mềm ngọt, mọng nước, m&agrave;u v&agrave;ng mật v&agrave; thơm ngon ấn tượng.&nbsp;</p>
	</li>
	<li>
	<p>Vỏ căng mỏng chua nhẹ c&oacute; m&agrave;u đỏ sẫm v&agrave; lớp phấn phủ d&agrave;y ở ngo&agrave;i lớp vỏ gi&uacute;p bảo vệ mận được l&acirc;u hơn v&agrave; vi khuẩn x&acirc;m nhập.&nbsp;</p>
	</li>
	<li>
	<p>Thưởng thức mận ngon hơn khi để lạnh hoặc l&agrave;m m&oacute;n mận lắc muối cực ngon bạn nh&eacute;!</p>
	</li>
</ul>

<p><strong>Th&ocirc;ng tin sản phẩm:</strong></p>

<ul>
	<li>Trong&nbsp;mận đỏ&nbsp;chứa nhiều chất chống oxy h&oacute;a Phenols, l&agrave;m trung h&ograve;a c&aacute;c gốc oxy h&oacute;a bị ph&aacute; hủy gi&uacute;p ph&ograve;ng tr&aacute;nh bệnh tật v&agrave; l&atilde;o h&oacute;a. Ngăn chặn qu&aacute; tr&igrave;nh ph&aacute; hủy chất b&eacute;o trong m&aacute;u v&agrave; m&agrave;ng tế b&agrave;o.</li>
	<li>Vitamin C chiếm 26% trong một quả mận gi&uacute;p tăng cường hệ miễn dịch, hỗ trợ hấp thụ chất sắt cho cơ thể.</li>
	<li>Loại quả n&agrave;y c&ograve;n chứa rất nhiều chất xơ v&agrave; axit malic gi&uacute;p tăng cường chức năng của hệ ti&ecirc;u h&oacute;a, chống t&aacute;o b&oacute;n. Khử tr&ugrave;ng v&agrave; ngăn chặn c&aacute;c t&aacute;c dụng xấu của thực phẩm khi v&agrave;o ruột.</li>
	<li>Ngo&agrave;i ra trong một quả mận chin chuẩn chứa đến 13 % kali, 11% vitamin A v&agrave; c&aacute;c loại vitamin nh&oacute;m B v&agrave; magie.</li>
</ul>

<ul>
	<li>Nếu bạn đang gặp vấn đề về t&oacute;c g&atilde;y rụng, h&atilde;y sử dụng mặt nạ bằng mận từ 1 &ndash; 2 lần/tuần. Đ&acirc;y l&agrave; b&agrave;i thuốc chữa t&oacute;c rụng tuyệt vời.</li>
</ul>

<p><strong>Bảo quản v&agrave; sử dụng:</strong></p>

<ul>
	<li><u><strong>C&aacute;ch chọn mận</strong></u>: &nbsp;Chọn quả c&oacute; vỏ m&agrave;u đỏ thẫm, da trơn v&agrave; chắc. Những quả lớn, kh&ocirc;ng qu&aacute; cứng hoặc mềm tay l&agrave; vừa ch&iacute;n tới.</li>
	<li>Mận đỏ mỹ&nbsp;n&ecirc;n được bảo quản trong tủ lạnh với nhiệt độ khoảng 4 độ C, ở nhiệt độ n&agrave;y mận sẽ giữ được độ tươi, gi&ograve;n l&acirc;u hơn.</li>
	<li>Khi vận chuyển mận , c&aacute;c bạn n&ecirc;n nhẹ tay để kh&ocirc;ng l&agrave;m mất đi lớp phấn phủ trắng, tr&aacute;nh bị dập dẫn đến mềm quả v&agrave; bị th&acirc;m b&ecirc;n trong.&nbsp;</li>
</ul>
', CAST(159600 AS Decimal(18, 0)), N'man-do-family.jpg', 126, CAST(N'2021-11-23 23:28:21.840' AS DateTime), CAST(N'2021-12-13 17:53:30.653' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (4, N'Thịt bò Bittet Úc Pacow', N'Vỉ 0.25KG', N'<h2><strong>Đặc Điểm:</strong></h2>

<ul>
	<li>Thịt b&ograve; &Uacute;c Pacow đạt chuẩn ESCAS từ trang trại tới b&agrave;n ăn.</li>
	<li>L&agrave; loại thịt mềm nhất, ngọt v&agrave; c&oacute; độ thơm tự nhi&ecirc;n của b&ograve;.</li>
	<li>C&oacute; lớp mỡ bao phủ v&agrave; v&acirc;n mỡ xen kẽ đều đặn, b&eacute;o ngậy hấp dẫn.</li>
	<li>Th&iacute;ch hợp để làm bít t&ecirc;́t, nướng, l&acirc;̉u, xào, đút lò, &hellip;</li>
</ul>

<p><strong>Thịt B&ograve; B&iacute;t Tết Pacow (250g)&nbsp;</strong>l&agrave; loại thịt mềm nhất, ngọt v&agrave; c&oacute; độ thơm tự nhi&ecirc;n của b&ograve;. Phần thịt n&agrave;y&nbsp;với lớp mỡ bao phủ v&agrave; v&acirc;n mỡ xen kẽ đều đặn tạo n&ecirc;n vị ngọt, vị b&eacute;o ngậy hấp dẫn.&nbsp;Loại&nbsp;thịt&nbsp;n&agrave;y th&iacute;ch hợp nhất l&agrave; d&ugrave;ng để&nbsp;làm bít t&ecirc;́t, nướng, l&acirc;̉u, xào, đút lò,&hellip;</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li>Thịt b&ograve; b&iacute;t tết&nbsp;l&agrave; loại thịt mềm nhất, ngọt v&agrave; c&oacute; độ thơm tự nhi&ecirc;n của b&ograve;.</li>
	<li>C&oacute;&nbsp;lớp mỡ bao phủ v&agrave; v&acirc;n mỡ xen kẽ đều đặn, b&eacute;o ngậy hấp dẫn.</li>
	<li>Trong thịt b&ograve; c&oacute; tới 28 protein c&ugrave;ng nhiều vitamin B6, B12, magie, kẽm, sắt, rất c&oacute; lợi cho sức khỏe con người.</li>
	<li>Sản phẩm được sản xuất từ thịt b&ograve; &Uacute;c đạt chuẩn ESCAS, cam kết kh&ocirc;ng bơm nước, kh&ocirc;ng tẩm h&oacute;a chất, kh&ocirc;ng chạm đất, đảm bảo vệ sinh an to&agrave;n thực phẩm đến với người ti&ecirc;u d&ugrave;ng.</li>
	<li>Loại&nbsp;thịt&nbsp;n&agrave;y th&iacute;ch hợp nhất l&agrave; d&ugrave;ng để làm bít t&ecirc;́t, nướng, l&acirc;̉u, xào, đút lò,&hellip;</li>
</ul>

<p><strong>Ti&ecirc;u chuẩn chất lượng:</strong></p>

<ul>
	<li>Thịt b&ograve; &Uacute;c Pacow đạt chuẩn ESCAS từ trang trại tới b&agrave;n ăn.</li>
	<li>Sản xuất v&agrave; bảo quản theo c&ocirc;ng nghệ &Uacute;c.</li>
	<li>Chất lượng 3 kh&ocirc;ng: Kh&ocirc;ng bơm nước, kh&ocirc;ng tẩm h&oacute;a chất, kh&ocirc;ng chạm đất.</li>
	<li>Giữ nguy&ecirc;n chất dinh dưỡng v&agrave; hương vị tươi ngon nhất!</li>
	<li>Chứng nhận đảm bảo Vệ sinh an to&agrave;n thực phẩm.</li>
</ul>

<p><strong>Ti&ecirc;u chuẩn ESCAS</strong>&nbsp;(hệ thống đảm bảo chất lượng chuỗi cung ứng xuất khẩu) l&agrave; thước đo ngặt ngh&egrave;o m&agrave; c&aacute;c doanh nghiệp phải đảm bảo tuyệt đối nếu muốn nhập khẩu b&ograve; từ &Uacute;c. Thịt b&ograve; từ trang trại của PACOW&nbsp;đều tu&acirc;n thủ v&agrave; đảm bảo nghi&ecirc;m ngặt c&aacute;c quy định về quy tr&igrave;nh sản xuất, giết mổ v&agrave; bảo quản sản phẩm đảm bảo nguồn dinh dưỡng nguy&ecirc;n chất cho đến khi sản phẩm đến tay người ti&ecirc;u d&ugrave;ng Việt!&nbsp;</p>

<p>Với chất lượng thịt b&ograve; vượt trội &amp; bao b&igrave; tiện lợi, thịt b&ograve; Pacow hiện được b&aacute;n tại nhiều si&ecirc;u thị thực phẩm sạch uy t&iacute;n.&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/tmp/0d/7b/e0/8e74b0f4a11df37a1d2103ecf891af0b.jpg" style="height:500px; width:750px" /></p>
', CAST(132750 AS Decimal(18, 0)), N'thit-bo-pacow.jpg', 499, CAST(N'2021-11-23 23:34:15.457' AS DateTime), CAST(N'2021-12-06 15:22:02.267' AS DateTime), 4, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (5, N'Bò viên tươi đặc biệt PaCow', N'Túi 0.2Kg', N'<p><strong>Th&ocirc;ng tin dinh dưỡng</strong></p>

<ul>
	<li><strong>Vitamin B12:</strong>&nbsp;C&aacute;c thực phẩm c&oacute; nguồn gốc từ động vật như thịt l&agrave; nguồn dồi d&agrave;o vitamin B12. Đ&acirc;y một chất dinh dưỡng cần thiết cho n&atilde;o v&agrave; hệ thần kinh cũng như rất quan trọng cho sự h&igrave;nh th&agrave;nh m&aacute;u.</li>
	<li><strong>Kẽm:</strong>&nbsp;Thịt b&ograve; rất gi&agrave;u kẽm, một kho&aacute;ng chất rất quan trọng cho sự duy tr&igrave; v&agrave; tăng trưởng cơ thể.</li>
	<li><strong>Selen:</strong>&nbsp;C&aacute;c loại thịt n&oacute;i chung đều l&agrave; một nguồn gi&agrave;u selen, một nguy&ecirc;n tố vi lượng thiết yếu đảm nhiệm nhiều chức năng kh&aacute;c nhau trong cơ thể.</li>
	<li><strong>Sắt:</strong>&nbsp;Lượng sắt trong thịt b&ograve; dồi d&agrave;o v&agrave; cũng dễ hấp thụ.</li>
	<li><strong>Niacin:</strong>&nbsp;Niacin c&ograve;n được gọi l&agrave; vitamin B3 c&oacute; nhiều chức năng quan trọng đối với cơ thể. T&igrave;nh trạng thiếu niacin c&oacute; thể l&agrave;m tăng nguy cơ mắc bệnh tim.</li>
	<li><strong>Vitamin B6:</strong>&nbsp;Vitamin B6 rất quan trọng trong việc hỗ trợ tạo m&aacute;u v&agrave; chuyển h&oacute;a năng lượng.</li>
	<li><strong>Photpho:</strong>&nbsp;Photpho rất cần thiết cho duy tr&igrave; v&agrave; tăng trưởng của cơ thể.</li>
	<li><strong>Creatine:</strong>&nbsp;Creatin dồi d&agrave;o trong thịt đ&oacute;ng vai tr&ograve; l&agrave; một nguồn năng lượng cho cơ bắp.</li>
	<li><strong>Taurine:</strong>&nbsp;Taurine l&agrave; một axit amin c&oacute; chức năng chống oxy h&oacute;a c&oacute; trong c&aacute; v&agrave; thịt.</li>
	<li><strong>Glutathione:</strong>&nbsp;Đ&acirc;y l&agrave; chất chống oxy h&oacute;a c&oacute; &iacute;ch cho cơ thể.</li>
	<li><strong>Axit linoleic li&ecirc;n hợp (Conjugated linoleic acid &ndash; CLA):</strong>&nbsp;CLA l&agrave; chất b&eacute;o chuyển h&oacute;a tự nhi&ecirc;n c&oacute; trong thịt c&aacute;c loại động vật nhai lại. Kh&ocirc;ng giống c&aacute;c loại chất b&eacute;o chuyển h&oacute;a nh&acirc;n tạo mang đến nhiều t&aacute;c hại cho sức khỏe, axit linoleic c&oacute; thể c&oacute; nhiều lợi &iacute;ch kh&aacute;c nhau nếu bạn ti&ecirc;u thụ chất n&agrave;y vừa phải.</li>
	<li><strong>Cholesterol:</strong>&nbsp;Cholesterol c&oacute; một số chức năng quan trọng với cơ thể n&ecirc;n việc bổ sung đủ chất n&agrave;y mỗi ng&agrave;y l&agrave; cần thiết.</li>
</ul>

<p><strong>Hướng dẫn sử dụng</strong></p>

<ul>
	<li>Chi&ecirc;n: 2-3 ph&uacute;t nhiệt độ khoảng 125-150 độ C.</li>
	<li>L&ograve; vi s&oacute;ng: 2 ph&uacute;t 600-800 Wth.&nbsp;</li>
	<li>Hoặc chế biến với c&aacute;c m&oacute;n ăn kh&aacute;c.</li>
</ul>

<p><strong>Hướng dẫn bảo quản:</strong>&nbsp;Bảo quản trong ngăn đ&aacute; tủ lạnh, trước khi sử dụng bạn n&ecirc;n đặt xuống ngăn m&aacute;t để r&atilde; đ&ocirc;ng từ từ, đảm bảo giữ dinh dưỡng v&agrave; hương vị của thịt.</p>
', CAST(59000 AS Decimal(18, 0)), N'Bo-vien-tuoi.jpg', 345, CAST(N'2021-11-23 23:33:39.993' AS DateTime), CAST(N'2021-11-23 23:33:39.980' AS DateTime), 4, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (6, N'Dẻ sườn bò Úc Pacow', N'Vỉ 0.5KG', N'<p><strong>Đặc Điểm:</strong></p>

<ul>
	<li>Thịt b&ograve; &Uacute;c Pacow đạt chuẩn ESCAS từ trang trại tới b&agrave;n ăn.</li>
	<li>L&agrave; phần được pha lọc từ xương sườn của con B&ograve;.</li>
	<li>Phần nạc v&agrave; phần mỡ đan xen nhau n&ecirc;n khi nướng sẽ rất thơm, mềm, ngọt m&agrave; kh&ocirc;ng dai.</li>
	<li>Thịt thăn rất mềm, ph&ugrave; hợp để nướng, &aacute;p chảo, hầm, sốt vang hoặc b&ograve; kho.</li>
</ul>

<p><strong>Dẻ Sườn B&ograve; &Uacute;c Pacow (250g)</strong>&nbsp;l&agrave; phần được pha lọc từ xương sườn của con B&ograve;. Thịt dẻ sườn rất đậm đ&agrave;, ngọt, gi&ograve;n v&agrave; mỡ ph&acirc;n bố theo dải dọc. Đặc t&iacute;nh thịt chắc, thớ thịt vặn xoắn v&agrave;o nhau l&agrave;m cho miếng thịt giữ được độ đậm đ&agrave; khi nấu th&iacute;ch hợp với c&aacute;c m&oacute;n nướng, &aacute;p chảo, hầm, sốt vang hoặc b&ograve; kho.</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li>Với phần nạc v&agrave; phần mỡ đan xen nhau n&ecirc;n khi nướng sẽ rất thơm, mềm, thịt nướng ngọt m&agrave; kh&ocirc;ng dai.</li>
	<li>Dẻ sườn b&ograve; nổi tiếng l&agrave; c&oacute; vị ngọt đậm đ&agrave;, hương thơm b&eacute;o ngậy với c&aacute;c dải mỡ d&agrave;y ph&acirc;n bổ dọc theo miếng thịt.</li>
	<li>Sản phẩm được sản xuất từ thịt b&ograve; &Uacute;c đạt chuẩn ESCAS, cam kết kh&ocirc;ng bơm nước, kh&ocirc;ng tẩm h&oacute;a chất, kh&ocirc;ng chạm đất, đảm bảo vệ sinh an to&agrave;n thực phẩm đến với người ti&ecirc;u d&ugrave;ng.</li>
	<li>Loại&nbsp;thịt&nbsp;n&agrave;y th&iacute;ch hợp nhất l&agrave; d&ugrave;ng để chế biến c&aacute;c m&oacute;n như nướng, &aacute;p chảo, hầm, sốt vang hoặc b&ograve; kho.</li>
</ul>

<p><strong>Ti&ecirc;u chuẩn chất lượng:</strong></p>

<ul>
	<li>Thịt b&ograve; &Uacute;c Pacow đạt chuẩn ESCAS từ trang trại tới b&agrave;n ăn.</li>
	<li>Sản xuất v&agrave; bảo quản theo c&ocirc;ng nghệ &Uacute;c.</li>
	<li>Chất lượng 3 kh&ocirc;ng: Kh&ocirc;ng bơm nước, kh&ocirc;ng tẩm h&oacute;a chất, kh&ocirc;ng chạm đất.</li>
	<li>Giữ nguy&ecirc;n chất dinh dưỡng v&agrave; hương vị tươi ngon nhất!</li>
	<li>Chứng nhận đảm bảo Vệ sinh an to&agrave;n thực phẩm.</li>
</ul>

<p><strong>Ti&ecirc;u chuẩn ESCAS</strong>&nbsp;(hệ thống đảm bảo chất lượng chuỗi cung ứng xuất khẩu) l&agrave; thước đo ngặt ngh&egrave;o m&agrave; c&aacute;c doanh nghiệp phải đảm bảo tuyệt đối nếu muốn nhập khẩu b&ograve; từ &Uacute;c. Thịt b&ograve; từ trang trại của PACOW&nbsp;đều tu&acirc;n thủ v&agrave; đảm bảo nghi&ecirc;m ngặt c&aacute;c quy định về quy tr&igrave;nh sản xuất, giết mổ v&agrave; bảo quản sản phẩm đảm bảo nguồn dinh dưỡng nguy&ecirc;n chất cho đến khi sản phẩm đến tay người ti&ecirc;u d&ugrave;ng Việt!&nbsp;</p>

<p>Với chất lượng thịt b&ograve; vượt trội &amp; bao b&igrave; tiện lợi, thịt b&ograve; Pacow hiện được b&aacute;n tại nhiều si&ecirc;u thị thực phẩm sạch uy t&iacute;n.&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/tmp/0d/7b/e0/8e74b0f4a11df37a1d2103ecf891af0b.jpg" style="height:500px; width:750px" /></p>
', CAST(129250 AS Decimal(18, 0)), N'de-suon-bo.jpg', 498, CAST(N'2021-11-23 23:36:22.383' AS DateTime), CAST(N'2021-12-10 09:43:48.940' AS DateTime), 4, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (7, N'Bánh mì mè đen tươi đông lạnh', N'Túi 350Gr', N'<p><strong>Th&ocirc;ng tin sản phẩm</strong></p>

<ul>
	<li>B&aacute;nh m&igrave; tươi được bổ sung M&egrave; đen, l&agrave; sự kết hợp ho&agrave;n hảo giữa b&aacute;nh m&igrave; truyền thống Việt Nam với th&agrave;nh phần nguy&ecirc;n liệu gi&agrave;u chất dinh dưỡng.</li>
	<li>Những chiếc b&aacute;nh m&igrave; M&egrave; đen gi&agrave;u CHẤT XƠ, PROTEIN, VITAMIN B thật SẠCH v&agrave; thơm ngon với hương vị M&egrave; đen, vỏ gi&ograve;n, ruột mềm hợp khẩu vị với người d&ugrave;ng c&aacute;c lứa tuổi.</li>
	<li>B&aacute;nh m&igrave; M&egrave; đen gi&uacute;p giảm Cholesteron, hỗ trợ hạ đường huyết, th&iacute;ch hợp cho c&aacute;c bữa ăn h&agrave;ng ng&agrave;y đầy đủ dinh dưỡng cho bạn v&agrave; gia đ&igrave;nh, đem lại một bữa ăn ngon tuyệt v&agrave; tiện lợi.</li>
</ul>

<p>&nbsp;</p>

<p><strong>Th&agrave;nh phần:</strong>&nbsp;Bột m&igrave;,&nbsp;M&egrave; đen,&nbsp;Men tự nhi&ecirc;n, Sữa, Muối, Nước</p>

<p><strong>C&aacute;ch sử dụng:&nbsp;</strong></p>

<ul>
	<li>R&atilde; đ&ocirc;ng trong 5-10 ph&uacute;t.</li>
	<li>Chuẩn bị l&ograve; nướng v&agrave; điều chỉnh nhiệt độ l&ograve; nướng từ 210-230 độ C.</li>
	<li>Cho b&aacute;nh v&agrave;o l&ograve; nướng từ 4-6 ph&uacute;t.</li>
	<li>Khi b&aacute;nh c&oacute; m&agrave;u v&agrave;ng n&acirc;u, lấy b&aacute;nh ra v&agrave; thưởng thức.</li>
</ul>
', CAST(43200 AS Decimal(18, 0)), N'banh-mi-me-den.jpg', 498, CAST(N'2021-11-23 23:38:16.520' AS DateTime), CAST(N'2021-11-23 23:38:16.520' AS DateTime), 5, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (8, N'Mandu Bibigo nhân hải sản ', N'Túi 0.35Kg', N'<h3><strong>Th&ocirc;ng tin sản phẩm</strong></h3>

<h3>- MANDU l&agrave; m&oacute;n b&aacute;nh xếp truyền thống H&agrave;n Quốc. Với h&igrave;nh dạng vỏ b&aacute;nh gợn s&oacute;ng đặc biệt chứa trọn nh&acirc;n đầy tươi ngon, B&Aacute;NH XẾP MANDU bibigo ngon gi&ograve;n đậm đ&agrave; từ nh&acirc;n đến vỏ b&aacute;nh khi chi&ecirc;n gi&ograve;n.&nbsp;<br />
- B&aacute;nh xếp H&agrave;n Quốc Bibigo nh&acirc;n hải sản&nbsp;c&oacute; hương vị rất đặc trưng, lớp vỏ b&aacute;nh được l&agrave;m bằng bột m&igrave;, c&oacute; độ dai thơm, mềm dẻo. Lớp nh&acirc;n b&ecirc;n trong được h&ograve;a quyện bởi nhiều loại nguy&ecirc;n liệu đặc biệt thơm ngon.</h3>

<h3><strong>Hướng dẫn chế biến:</strong></h3>

<h3>Chi&ecirc;n gi&ograve;n: Cho một lượng dầu vừa đủ v&agrave;o chảo , đặt chảo b&aacute;nh Mandu v&agrave;o kh&ocirc;ng cần gi&atilde; đ&ocirc;ng. Chi&ecirc;n b&aacute;nh ngập trong dầu s&ocirc;i ở nhiệt độ 160-170 độ C trong khoảng 5 ph&uacute;t cho đến khi gi&ograve;ng v&agrave; đều</h3>

<h3><img src="https://f28-zpg.zdn.vn/7908772936258317504/6e55405ab99242cc1b83.jpg" style="height:578px; width:772px" /></h3>

<h3>Hấp: Cho vừa đủ nước v&agrave;o nồi hấp v&agrave; đun s&ocirc;i. Khi nước s&ocirc;i cho b&aacute;nh kh&ocirc;ng cần gi&atilde; đ&ocirc;ng v&agrave;o nồi v&agrave; hấp trong v&ograve;ng 8 ph&uacute;t đến khi b&aacute;nh ch&iacute;n</h3>

<h3>Nấu S&uacute;p: D&ugrave;ng thịt hoặc hải sản nấu nước d&ugrave;ng. Cắt nhỏ rau củ quả cho trực tiếp hỗn hợp rau củ quản v&agrave; b&aacute;nh kh&ocirc;ng cần gi&atilde; đ&ocirc;ng v&agrave; nước đang đun s&ocirc;i. Nấu trong khoảng 6 ph&uacute;t l&agrave; ho&agrave;n tất.</h3>

<h3>Ngo&agrave;i ra c&oacute; thể d&ugrave;ng b&aacute;nh Mandu để l&agrave;m thả lẩu như những sản phẩm kh&aacute;c&nbsp; v&agrave; cho th&ecirc;m một số nguy&ecirc;n liệu t&ugrave;y th&iacute;ch.</h3>

<h3><strong>Hướng dẫn bảo quản:</strong></h3>

<h3>Bảo quản trong tủ đ&ocirc;ng nhiệt độ từ 0- 18 độ C</h3>

<h3><strong>Thời hạn sử dụng:</strong></h3>

<h3>Trong v&ograve;ng 12 th&aacute;ng kể từ ng&agrave;y sản xuất</h3>

<p>&nbsp;</p>
', CAST(64000 AS Decimal(18, 0)), N'mandu_bibigo_nhan_hai_san.jpg', 494, CAST(N'2021-11-26 14:17:16.147' AS DateTime), CAST(N'2021-12-19 18:21:40.333' AS DateTime), 5, 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (9, N'Cơm chiên kim chi đông lạnh', N'Hộp 150gr', N'<p><strong>Cơm chi&ecirc;n kimchi Cầu Tre 150g</strong>&nbsp;mang đến cho bạn hương vị truyền thống của m&oacute;n ăn đặc sắc từ H&agrave;n Quốc. Sản phẩm l&agrave; sự kết hợp của cơm chi&ecirc;n c&ugrave;ng c&aacute;c loại rau củ với vị chua mặn ngọt h&agrave;i h&ograve;a từ kimchi l&agrave;m cho bữa ăn th&ecirc;m ngon miệng.</p>

<p>Với sản phẩm đ&oacute;ng hộp tiện lợi, bạn c&oacute; thể dễ d&agrave;ng mang theo trong c&aacute;c buổi đi chơi, d&atilde; ngoại hay l&agrave;m bữa cơm trưa văn ph&ograve;ng chỉ với ba ph&uacute;t quay trong l&ograve; vi s&oacute;ng.</p>

<p>Kh&ocirc;ng chỉ tiết kiệm thời gian chế biến trong những l&uacute;c bận rộn m&agrave; sản phẩm c&ograve;n kết hợp với c&aacute;c nguy&ecirc;n liệu dinh dưỡng&nbsp;cho một bữa ăn trọn vẹn.</p>

<p><strong>Th&agrave;nh phần:</strong>&nbsp;Gạo 30.3%, nước, kimchi 18.6%, c&agrave; rốt, dầu cọ, đường, tỏi, giấm, h&agrave;nh paro, muối, hạt n&ecirc;m nấm hương, ớt bột, hương vị nướng tổng hợp, chiết xuất nấm men</p>

<p><strong>Khối lượng tịnh:</strong>&nbsp;150g/hộp</p>

<p><strong>Bảo quản:</strong>&nbsp;Ngăn đ&ocirc;ng tủ lạnh</p>

<p><strong>Hướng dẫn sử dụng:&nbsp;</strong></p>

<ul>
	<li><em>C&aacute;ch 1:</em>&nbsp;X&eacute; 1 lỗ nhỏ tr&ecirc;n nắp hộp, cho v&agrave;o l&ograve; vi s&oacute;ng khoảng 3 ph&uacute;t chế độ 800W, sau đ&oacute; đảo đều v&agrave; thưởng thức</li>
	<li><em>C&aacute;ch 2:</em>&nbsp;R&atilde; đ&ocirc;ng ho&agrave;n to&agrave;n, l&agrave;m n&oacute;ng 1 &iacute;t dầu tr&ecirc;n chảo, cho cơm v&agrave;o chi&ecirc;n đến khi cơm n&oacute;ng đều, lấy ra v&agrave; thưởng thức</li>
</ul>

<p><strong>Hạn sử dụng:</strong>&nbsp;12 th&aacute;ng kể từ ng&agrave;y sản xuất</p>
', CAST(25000 AS Decimal(18, 0)), N'com-chien-kim-chi.jpg', 484, CAST(N'2021-11-28 14:03:12.847' AS DateTime), CAST(N'2021-12-19 18:21:40.317' AS DateTime), 3, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (10, N'Chả giò thịt đặc biệt', N'Gói 0.4KG', N'<p><strong>Đặc Điểm:</strong></p>

<ul>
	<li>L&agrave;m từ thịt heo sạch 3F Plus.</li>
	<li>Kết hợp với khoai m&ocirc;n, củ sắn, nấm m&egrave;o,...</li>
	<li>Lớp vỏ b&aacute;nh da xốp v&agrave;ng &oacute;ng gi&ograve;n rụm.</li>
	<li>Chả gi&ograve; chứa nhiều chất dinh dưỡng.</li>
</ul>

<p><strong>Th&ocirc;ng Tin Sản Phẩm:</strong></p>

<p><strong>Chả Gi&ograve; Thịt Đặc Biệt G-Kitchen 400G</strong>&nbsp;sử dụng c&aacute;c nguy&ecirc;n liệu truyền thống như khoai m&ocirc;n, củ sắn, nấm m&egrave;o kết hợp với thịt heo sạch 3F Plus được n&ecirc;m nếm vừa miệng cho hương vị đặc trưng thơm ngon. Vỏ b&aacute;nh da xốp &iacute;t thấm dầu, gi&ograve;n rụm kho&aacute; trọn nh&acirc;n thịt mềm tạo cấu tr&uacute;c tr&ograve;n đều đẹp mắt, hấp dẫn khi ăn. Sản phẩm c&oacute; thể l&agrave;m m&oacute;n ăn vặt hoặc d&ugrave;ng k&egrave;m b&uacute;n, b&aacute;nh tr&aacute;ng, chế biến th&agrave;nh m&oacute;n y&ecirc;u th&iacute;ch kh&aacute;c.</p>

<p><strong>M&ocirc; tả sản phẩm:</strong></p>

<ul>
	<li>C&aacute;c nguy&ecirc;n liệu trong chả gi&ograve; được chọn lọc kỹ lưỡng, nguồn gốc r&otilde; r&agrave;ng v&agrave; chỉ d&ugrave;ng thực phẩm sạch để chế biến.</li>
	<li>Phần thịt tr&agrave;n đầy, c&ugrave;ng với đ&oacute; l&agrave; b&iacute; quyết tẩm ướp gia vị truyền thống, ngon như nh&agrave; l&agrave;m sẽ khiến bạn cảm nhận được trọn vẹn vị ngọt thơm của thịt heo sạch.</li>
	<li>C&ocirc;ng thức tỷ lệ v&agrave;ng cho vị ngon tr&ograve;n trịa với nh&acirc;n thịt ngọt mềm kết hợp c&ugrave;ng khoai m&ocirc;n b&eacute;o b&ugrave;i v&agrave; củ sắn, nấm m&egrave;o, c&agrave; rốt gi&ograve;n sần sật.&nbsp;</li>
	<li>Phần lớp vỏ b&aacute;nh da xốp v&agrave;ng &oacute;ng gi&ograve;n rụm, &iacute;t thấm dầu khiến bạn kh&ocirc;ng bị ngấy khi ăn v&agrave; tốt cho sức khoẻ.</li>
	<li>Đặc biệt, chả gi&ograve; chứa nhiều chất dinh dưỡng của thịt heo sạch.</li>
</ul>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<ul>
	<li>Kh&ocirc;ng r&atilde; đ&ocirc;ng, t&aacute;ch ri&ecirc;ng từng cuốn chả gi&ograve;.</li>
	<li>Chi&ecirc;n d&ugrave;ng dầu: Đun dầu với lửa nhỏ cho đến khi n&oacute;ng 100 - 130 độ C, cho chả gi&ograve; v&agrave;o chảo. Chi&ecirc;n ngập trong dầu từ 5-7 ph&uacute;t, đảo đều tay cho đến khi c&aacute;c cuốn v&agrave;ng đều. Vớt ra v&agrave; rải đều c&aacute;c cuốn cho r&aacute;o dầu.</li>
	<li>Chi&ecirc;n kh&ocirc;ng dầu: Sử dụng nồi chi&ecirc;n kh&ocirc;ng dầu. D&ugrave;ng cọ phết lớp dầu mỏng l&ecirc;n mỗi cuốn. Đặt từng cuốn trong nồi chi&ecirc;n kh&ocirc;ng dầu, chi&ecirc;n ở nhiệt độ 200 độ C trong 15 ph&uacute;t.</li>
	<li>Thưởng thức ngay trong sốt chấm hoặc ăn k&egrave;m c&ugrave;ng b&uacute;n, rau sống, nước mắm chua ngọt.</li>
</ul>
', CAST(63000 AS Decimal(18, 0)), N'cha-gio-thit.jpg', 512, CAST(N'2021-11-18 00:00:00.000' AS DateTime), CAST(N'2021-12-17 01:12:26.103' AS DateTime), 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (11, N'Bánh tiểu long nhân súp, thịt', N'Túi 0.3Kg', N'<p><strong>Th&ocirc;ng tin sản phẩm</strong><br />
Thơm ngon, dinh dưỡng lại v&ocirc; c&ugrave;ng đậm đ&agrave; gia vị.&nbsp;B&aacute;nh tiểu long nh&acirc;n s&uacute;p, thịt Cầu Tre (T&uacute;i 0.3Kg)&nbsp;được l&agrave;m từ những nguy&ecirc;n liệu&nbsp;chế biến sẵn&nbsp;tươi ngon.&nbsp;Cầu Tre&nbsp;lu&ocirc;n mang đến những sản phẩm chất lượng, an to&agrave;n, tạo cho người d&ugrave;ng cảm gi&aacute;c ngon miệng, k&iacute;ch th&iacute;ch vị gi&aacute;c</p>

<ul>
	<li>Khối lượng: 300g</li>
	<li>Th&agrave;nh phần: Nước hầm xương g&agrave;, thịt heo 23.6%, bột m&igrave;, gelatin, đường, chất ổn định, dầu h&agrave;o, gừng, h&agrave;nh l&aacute;, tinh bột bắp, hạt n&ecirc;m, tỏi, ti&ecirc;u, dầu cọ, muối, dầu m&egrave;, chiết xuất nấm men, chất điều vị.</li>
	<li>C&aacute;ch d&ugrave;ng: Hấp c&aacute;ch thủy - Kh&ocirc;ng cần r&atilde; đ&ocirc;ng, cho vừa đủ nước v&agrave;o nồi hấp v&agrave; đun s&ocirc;i, Khi nước s&ocirc;i, cho b&aacute;nh v&agrave;o hấp c&aacute;ch thuỷ trong khoảng 10 ph&uacute;t hoặc khoảng 7 ph&uacute;t l&agrave; d&ugrave;ng được. Sử dụng l&ograve; vi s&oacute;ng - Kh&ocirc;ng cần r&atilde; đ&ocirc;ng, cắt 1 g&oacute;c bao b&igrave; sau đ&oacute; đặt trực tiếp nguy&ecirc;n g&oacute;i b&aacute;nh v&agrave;o l&ograve; vi s&oacute;ng (c&ocirc;ng suất 1000W) trong khoảng 3 ph&uacute;t l&agrave; d&ugrave;ng được.</li>
	<li>Bảo quản: Bảo quản ở -18 độ C hoặc trong ngăn đ&aacute; tủ lạnh</li>
	<li>Thương hiệu: Cầu tre (Việt Nam)</li>
	<li>Nơi sản xuất: Việt Nam</li>
</ul>
', CAST(63000 AS Decimal(18, 0)), N'banh-tieu-long.jpg', 395, CAST(N'2021-11-26 14:16:19.790' AS DateTime), CAST(N'2021-12-10 11:12:38.910' AS DateTime), 3, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (12, N'Táo Fuji mini Nam Phi', N'Túi 3KG', N'<p><strong>Xuất xứ:&nbsp;</strong>New Zealand</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:&nbsp;</strong>Nhập khẩu</p>

<p><strong>Đặc điểm:</strong>&nbsp;</p>

<ul>
	<li>Quả t&aacute;o nhỏ, cầm chắc tay.</li>
	<li>Vỏ t&aacute;o sọc cam đỏ, thịt t&aacute;o kh&aacute; gi&ograve;n v&agrave; ngọt (&iacute;t chua).</li>
</ul>

<p><strong>Hướng dẫn sử dụng</strong>: Ăn trực tiếp, l&agrave;m nước &eacute;p hoặc l&agrave;m b&aacute;nh đều ngon</p>

<p><strong>Hướng dẫn bảo quản</strong>: Bảo quản trong ngăn m&aacute;t tủ lạnh</p>
', CAST(119000 AS Decimal(18, 0)), N'tao_ambrosia_3kg_ebc27528099e4a0b94c136c0097a9254_1024x1024.jpg', 497, CAST(N'2021-12-15 22:15:31.810' AS DateTime), CAST(N'2021-12-19 18:21:40.340' AS DateTime), 1, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (13, N'Việt quất Peru', N'Hộp 125GR', N'<p><strong>Xuất xứ:&nbsp;</strong>Peru</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:</strong>&nbsp;Nhập Khẩu</p>

<p><strong>Đặc điểm:</strong></p>

<ul>
	<li>Việt Quất Peru l&agrave; loại quả mọng rất được ưa chuộng do quả c&oacute; vị ngọt thanh đậm đ&agrave;, tr&aacute;i to tr&ograve;n, hương thơm dịu v&agrave; nhiều chất dinh dưỡng.</li>
	<li>B&ecirc;n ngo&agrave;i quả c&oacute; lớp phấn phủ tự nhi&ecirc;n để bảo vệ quả khỏi vi khuẩn, n&ecirc;n để nguy&ecirc;n hộp kh&ocirc;ng rửa trong tủ lạnh để tr&aacute;nh quả bị mốc v&agrave; chỉ rửa trước khi ăn.</li>
	<li>Bạn c&oacute; thể kết hợp ch&uacute;ng với những thực phẩm kh&aacute;c để chế biến những m&oacute;n ăn bổ dưỡng v&agrave; đẹp mắt nh&eacute;.</li>
</ul>

<p><strong>Việt Quất Peru&nbsp;</strong>l&agrave; loại tr&aacute;i c&acirc;y lu&ocirc;n được ưa chuộng trong những m&ugrave;a h&egrave; n&oacute;ng bức do c&oacute; vị ngọt, mọng nước, nhiều chất dinh dưỡng. Kh&ocirc;ng những thế, bạn c&ograve;n c&oacute; thể kết hợp ch&uacute;ng với những thực phẩm kh&aacute;c để chế biến những m&oacute;n ăn bổ dưỡng.</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li>Quả việt quất gi&agrave;u c&aacute;c chất chống oxy h&oacute;a kh&aacute;c nhau, c&ugrave;ng với c&aacute;c vitamin như vitamin C, B2, B6, E v&agrave; K, chất xơ, đồng, mangan, lutein, gallic acide,</li>
	<li>Tăng cường chức năng của n&atilde;o: Sự hiện diện của c&aacute;c hợp chất anthocyanin trong quả việt quất rất hữu &iacute;ch trong việc tăng cường chức năng hoạt động của n&atilde;o, bộ nhớ v&agrave; chức năng vận động của cơ.</li>
	<li>Giảm c&acirc;n: Nhờ lượng calo thấp, quả việt quất l&agrave; một m&oacute;n ăn ngon nếu bạn đang mong muốn giảm c&acirc;n. Chất xơ trong đ&oacute; c&oacute; thể l&agrave;m tăng cảm gi&aacute;c no, khiến bạn cảm thấy no hơn v&agrave; ăn &iacute;t hơn, đồng thời cho bạn năng lượng để thực hiện c&aacute;c hoạt động thể chất nhằm giảm c&acirc;n dễ d&agrave;ng.</li>
	<li>Ph&ograve;ng ngừa c&aacute;c bệnh: Việt quất c&oacute; nhiều chất chống oxy ho&aacute; v&agrave; chất dinh dưỡng gi&uacute;p ngăn ngừa đục thủy tinh thể, tăng nh&atilde;n &aacute;p, ung thư, lo&eacute;t, tiểu đường, vi&ecirc;m khớp.</li>
	<li>Đối với da: Nếu bạn muốn duy tr&igrave; l&agrave;n da khỏe mạnh, h&atilde;y ăn quả việt quất thường xuy&ecirc;n. Ngo&agrave;i ra, ch&uacute;ng rất tốt trong việc kiểm so&aacute;t l&atilde;o h&oacute;a da.</li>
	<li>Tăng cường ti&ecirc;u h&oacute;a: H&agrave;m lượng chất xơ cao trong quả việt quất l&agrave;m cho ch&uacute;ng trở th&agrave;nh một lựa chọn tuyệt vời để hỗ trợ ti&ecirc;u h&oacute;a khỏe mạnh.</li>
</ul>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<ul>
	<li>Rửa nhẹ nh&agrave;ngviệt quất với nước sạch để loại bỏ phần phấn trắng tr&ecirc;n vỏ.</li>
	<li>Giữ lạnh việt quất gi&uacute;p bảo quản l&acirc;u hơn.</li>
	<li>Bạn n&ecirc;n giữ việt quấttrong hộp đựng ban đầu v&agrave; l&agrave;m lạnh c&agrave;ng sớm c&agrave;ng tốt.</li>
	<li>Kh&ocirc;ng rửa trước khi cho v&agrave;o tủ lạnh.</li>
</ul>

<p>&nbsp;</p>
', CAST(49000 AS Decimal(18, 0)), N'yen___9__8db8a64954f84eeb84fcd512421dc1d9_1024x1024.jpg', 498, CAST(N'2021-12-15 22:17:07.650' AS DateTime), CAST(N'2021-12-17 01:23:20.650' AS DateTime), 1, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (14, N'Hồng giòn Hàn Quốc', N'Combo 2Kg', N'<p><strong>Xuất xứ:&nbsp;</strong>H&agrave;n Quốc</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:&nbsp;</strong>Nhập khẩu</p>

<p><strong>Đặc điểm nổi bật:&nbsp;</strong></p>

<ul>
	<li>Hồng H&agrave;n Quốc về size M, tr&aacute;i to, trung b&igrave;nh khoảng 180 - 200g/tr&aacute;i.&nbsp;</li>
	<li>Vỏ m&agrave;u cam rất mỏng,quả chắc tay, ruột gi&ograve;n vị ngọt thanh,kh&ocirc;ng ch&aacute;t, c&oacute; hạt&nbsp;</li>
	<li>Hồng c&oacute; gi&aacute; trị dinh dưỡng cao, l&agrave; tr&aacute;i c&acirc;y ưa th&iacute;ch của người d&acirc;n xứ sở kim chi<br />
	&nbsp;</li>
</ul>

<p><strong>Th&ocirc;ng tin sản phẩm:&nbsp;</strong></p>

<ul>
	<li>Quả hồng chứa nhiều calo, protein, chất xơ, kali, mangan, c&aacute;c vitamin A, C, E, K, B6, v&agrave; nhiều dưỡng chất kh&aacute;c rất tốt cho sức khoẻ.</li>
	<li>Quả hồng gi&ograve;n chứa c&aacute;c hợp chất thực vật c&oacute; lợi c&oacute; chất chống oxy h&oacute;a</li>
	<li>Quả hồng cũng chứa carotenoids, flavonoid v&agrave; vitamin E gi&uacute;p chống oxy h&oacute;a mạnh, chống vi&ecirc;m.</li>
	<li>C&aacute;c dưỡng chất trong hồng gi&uacute;p tăng cường hệ ti&ecirc;u h&oacute;a v&agrave; hỗ trợ n&acirc;ng cao sức khỏe.</li>
	<li>Quả hồng cung cấp nhiều vitamin A v&agrave; chất chống oxy h&oacute;a rất quan trọng cho sức khỏe của mắt.</li>
</ul>

<p><strong>Hướng dẫn bảo quản/sử dụng:&nbsp;</strong></p>

<ul>
	<li>Bảo quản ở ngăn m&aacute;t tủ lạnh</li>
</ul>
', CAST(178000 AS Decimal(18, 0)), N'le_vip_han_quoc.jpg', 495, CAST(N'2021-12-15 22:19:02.030' AS DateTime), CAST(N'2021-12-18 00:36:52.930' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (15, N'Nho đen Pandol', N'0.5 Kg', N'<p><strong>Xuất xứ: Mỹ</strong></p>

<p><strong>Ti&ecirc;u chuẩn chất lượng: Nhập khẩu</strong></p>

<p><strong>Đặc điểm nổi bật:&nbsp;</strong>Nho tr&aacute;i to căng mọng, vị ngọt đậm đ&agrave;, thịt d&agrave;y mọng nước. Tr&aacute;i to cắn v&agrave;o tr&agrave;n nước c&ugrave;ng vị ngọt si&ecirc;u cực m&aacute;t lạnh.</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li>Nho đen gi&agrave;u vitamin A, vitamin C, vitamin K c&ugrave;ng với flavonoid gi&uacute;p tăng cường hệ miễn dịch.</li>
	<li>Trong nho đen c&oacute; resveratrol, một loại phenol tự nhi&ecirc;n c&oacute; trong nho đen chịu tr&aacute;ch nhiệm l&agrave;m tăng b&agrave;i tiết insulin v&agrave; sự nhạy cảm với insulin, qua đ&oacute; kiểm so&aacute;t v&agrave; duy tr&igrave; lượng đường trong m&aacute;u.</li>
	<li>Nho đen c&oacute; chứa lutein v&agrave; zeaxanthin, cả hai đều l&agrave; carotenoid được biết đến để gi&uacute;p duy tr&igrave; một thị lực tốt. Nho đen sẽ bảo vệ mắt bằng c&aacute;ch bảo vệ chống lại sự oxy h&oacute;a của v&otilde;ng mạc v&agrave; cũng ngăn ngừa chứng m&ugrave; lo&agrave;.</li>
	<li>Thường xuy&ecirc;n ăn nho đen gi&uacute;p cải thiện tr&iacute; nhớ cũng như hỗ trợ chữa đau nửa đầu, chứng suy giảm tr&iacute; nhớ v&agrave; ngăn ngừa bệnh Alzheimer. C&aacute;c chất trong nho đen hoạt động như một chất bảo vệ n&atilde;o.</li>
	<li>C&aacute;c loại nho đen c&oacute; đặc t&iacute;nh chống đột biến v&agrave; chống oxy ho&aacute; rất hiệu quả trong việc điều trị tất cả c&aacute;c loại ung thư, đặc biệt l&agrave; ung thư v&uacute;. Resveratrol, một hợp chất t&igrave;m thấy trong nho đen, c&oacute; khả năng ph&aacute; huỷ c&aacute;c tế b&agrave;o ung thư từ đ&oacute; ngăn ngừa được ung thư.</li>
</ul>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<ul>
	<li>Rửa nhẹ nh&agrave;ng tr&aacute;i nho để loại bỏ lớp phấn trắng tr&ecirc;n vỏ.</li>
	<li>Kh&ocirc;ng n&ecirc;n rửa nho trước khi bảo quản trong ngăn m&aacute;t tủ lạnh v&igrave; nếu rửa trước nho sẽ dễ bị hư, thối.</li>
	<li>Chỉ n&ecirc;n rửa một lượng vừa đủ ăn.</li>
	<li>Nho đen c&oacute; thể ăn trực tiếp, l&agrave;m nước &eacute;p, sinh tố, l&agrave;m b&aacute;nh.</li>
</ul>
', CAST(109500 AS Decimal(18, 0)), N'yen___9__8db8a64954f84eeb84fcd512421dc1d9_1024x1024.jpg', 496, CAST(N'2021-12-15 22:20:31.913' AS DateTime), CAST(N'2021-12-18 00:34:31.093' AS DateTime), 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (16, N'Nho mẫu đơn', N'Hộp 0.45 Kg', N'<p><strong>Xuất xứ:</strong>&nbsp;H&agrave;n Quốc</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:</strong>&nbsp;Nhập Khẩu</p>

<p><strong>Đặc điểm:</strong></p>

<ul>
	<li>Nho mẫu đơn được trồng theo phương ph&aacute;p hữu cơ, thu hoạch trực tiếp trong nh&agrave; k&iacute;nh.</li>
</ul>

<ul>
	<li>Đặc biệt kh&ocirc;ng d&ugrave;ng bất kỳ phương ph&aacute;p kh&ocirc;ng an to&agrave;n&nbsp;n&agrave;o trong qu&aacute; tr&igrave;nh chăm s&oacute;c, thu hoạch v&agrave; bảo quản nho.</li>
</ul>

<ul>
	<li>Một nh&aacute;nh chỉ để 1 ch&ugrave;m để hấp thụ tối đa c&aacute;c chất dinh dưỡng.</li>
	<li>Tr&aacute;i căng tr&ograve;n, ch&iacute;n mọng, ngọt thơm đậm đ&agrave; vị sữa đặc trưng.</li>
</ul>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li>Nho mẫu đơn chứa nhiều vitamin C, K, B6 v&agrave; c&aacute;c kho&aacute;ng chất kh&aacute;c</li>
	<li>Thịt nho chứa nhiều kho&aacute;ng chất sắt rất tốt cho phụ nữ, trẻ em&nbsp;</li>
	<li>Ngo&agrave;i ra, h&agrave;m lượng polyphenol c&oacute; trong nho mẫu đơn cũng gi&uacute;p ngăn ngừa c&aacute;c bệnh về tim mạch.</li>
</ul>

<p><strong>Hướng dẫn bảo quản:</strong></p>

<ul>
	<li>Bảo quản ở ngăn m&aacute;t tủ lạnh</li>
	<li>Kh&ocirc;ng rửa nho khi chưa sử dụng</li>
</ul>
', CAST(379000 AS Decimal(18, 0)), N'nho_mau_don.jpg', 497, CAST(N'2021-12-15 22:22:13.550' AS DateTime), CAST(N'2021-12-19 18:21:40.327' AS DateTime), 1, 12)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (17, N'Lựu đỏ Peru size M', N'1 Kg', N'<p><strong>Xuất xứ:&nbsp;</strong>Peru</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:</strong>&nbsp;Nhập Khẩu</p>

<p><strong>Đặc điểm:&nbsp;</strong></p>

<ul>
	<li>Lựu chứa rất nhiều chất dinh dưỡng như Vitamin, Protein, chất xơ&hellip;</li>
	<li>Size tr&aacute;i to, hạt nhiều, gi&ograve;n v&agrave; mọng nước.</li>
	<li>Hương vị chua ngọt h&agrave;i h&ograve;a.</li>
</ul>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li>Lựu chứa nhiều polyphenol &ndash; chất h&oacute;a học gi&uacute;p l&agrave;m giảm qu&aacute; tr&igrave;nh sưng ph&ugrave; ở bệnh tim. Ngo&agrave;i ra, lựu c&ograve;n c&oacute; thể l&agrave;m giảm độ d&agrave;y th&agrave;nh động mạch, giảm việc h&igrave;nh th&agrave;nh mảng b&aacute;n v&agrave; giảm cholesterol xấu trong cơ thể.</li>
	<li>Nhờ chất polyphenol v&agrave; c&aacute;c chất chống oxy h&oacute;a trong quả lựu n&ecirc;n c&oacute; thể l&agrave;m cản trở sự h&igrave;nh th&agrave;nh c&aacute;c gốc tự do, từ đ&oacute; ngăn ngừa sự ph&aacute;t triển của tế b&agrave;o ung thư.</li>
	<li>B&ecirc;n cạnh đ&oacute;, lựu l&agrave; loại quả gi&agrave;u vitamin C n&ecirc;n c&oacute; thể gi&uacute;p tăng cường hệ miễn dịch v&agrave; gi&uacute;p c&aacute;c tế b&agrave;o của cơ thể chống lại c&aacute;c t&aacute;c nh&acirc;n g&acirc;y ung thư.</li>
	<li>Ăn lựu cho cảm gi&aacute;c no cũng như c&oacute; khả năng ức chế sự th&egrave;m ăn v&agrave; gi&uacute;p chống b&eacute;o ph&igrave; hiệu quả. Nếu uống nước &eacute;p lựu mỗi ng&agrave;y sẽ c&oacute; t&aacute;c dụng duy tr&igrave; c&acirc;n nặng ổn định.</li>
	<li>Lựu gi&agrave;u chất chống vi&ecirc;m khớp n&ecirc;n c&oacute; t&aacute;c dụng giảm vi&ecirc;m v&agrave; cải thiện c&aacute;c triệu chứng của bệnh.&nbsp;</li>
	<li>Lựu c&oacute; thể gi&uacute;p tạo ra hồng cầu trong cơ thể v&agrave; l&agrave;m tăng lượng haemoglobin trong m&aacute;u. Ăn lựu c&ograve;n gi&uacute;p đ&aacute;p ứng tốt nhu cầu chất xơ, vitamin, kali h&agrave;ng ng&agrave;y cho trẻ.</li>
</ul>

<p><strong>Hướng dẫn sử dụng</strong></p>

<ul>
	<li>Rửa nhẹ nh&agrave;ng&nbsp;vỏ ngo&agrave;i của lựu.&nbsp;</li>
	<li>C&aacute;ch t&aacute;ch hạt lựu ra khỏi lớp vỏ quả nhanh nhất l&agrave; t&aacute;ch quả lựu th&agrave;nh từng kh&iacute;a mỏng, sau đ&oacute; d&ugrave;ng muỗng đập nhẹ l&ecirc;n lớp v&otilde;, những hạt lựu sẽ từ từ rơi ra hết.</li>
	<li>Giữ lạnh&nbsp;lựu&nbsp;gi&uacute;p bảo quản l&acirc;u hơn.</li>
</ul>

<p><em><strong>*Khối lượng sản phẩm sẽ ch&ecirc;nh lệch&nbsp;theo từng m&ugrave;a vụ.</strong></em></p>
', CAST(129000 AS Decimal(18, 0)), N'lua-do.jpg', 496, CAST(N'2021-12-15 22:23:56.683' AS DateTime), CAST(N'2021-12-24 19:10:12.993' AS DateTime), 1, 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (18, N'Chuối Xiêm Đà Lạt', N'1KG', N'<p><strong>Đặc Điểm:</strong></p>

<ul>
	<li>Vị ngọt v&agrave; hương thơm đặc biệt hơn chuối thường</li>
	<li>Quả ngắn, th&acirc;n tr&ograve;n</li>
</ul>

<p><strong>Chuối xi&ecirc;m (Kg)</strong>&nbsp;thuộc giống chuối phổ biến tr&ecirc;n to&agrave;n thế giới. Chuối c&oacute; quả ngắn, th&acirc;n tr&ograve;n v&agrave; c&oacute; vị ngọt kh&aacute;c hẳn những loại chuối th&ocirc;ng thường. Chuối xi&ecirc;m được đ&aacute;nh gi&aacute; chứa nhiều chất dinh dưỡng v&agrave; dễ ti&ecirc;u h&oacute;a hơn hẳn so với khoai t&acirc;y v&agrave; thịt.</p>
', CAST(36000 AS Decimal(18, 0)), N'chuoi_xiem_da_lat.jpg', 498, CAST(N'2021-12-15 22:24:55.710' AS DateTime), CAST(N'2021-12-19 18:21:40.323' AS DateTime), 1, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (20, N'Vú sữa tím bắc thảo', N'1Kg', N'<p><strong>Xuất xứ:&nbsp;</strong>Việt Nam</p>

<p><strong>Đặc điểm</strong></p>

<ul>
	<li>Tr&aacute;i dạng tr&ograve;n, hơi dẹp hai đầu, khi ch&iacute;n th&igrave; tr&aacute;i chuyển từ xanh sang n&acirc;u t&iacute;m bắt đầu từ đỉnh tr&aacute;i đến giữa tr&aacute;i v&agrave; đến cuống tr&aacute;i, vỏ tr&aacute;i d&agrave;y từ 1,0 &ndash; 1,1 cm, c&oacute; từ 6 &ndash; 8 hạt/tr&aacute;i</li>
	<li>Thịt tr&aacute;i m&agrave;u trắng, c&oacute; vệt t&iacute;m gần vỏ quả, thịt tr&aacute;i hơi mềm, vị ngọt thanh, độ brix từ 14 &ndash; 15% v&agrave; b&eacute;o &iacute;t; tỷ lệ phần thịt ăn được kh&aacute; cao.</li>
</ul>

<p><strong>Th&ocirc;ng tin dinh dưỡng</strong></p>

<ul>
	<li><strong>Cung cấp canxi, sắt</strong>: Lượng canxi, phốt pho, sắt v&agrave; magi&ecirc; dồi d&agrave;o c&oacute; trong v&uacute; sữa l&agrave; th&agrave;nh phần quan trọng gi&uacute;p thai phụ v&agrave; thai nhi ph&aacute;t&nbsp;triển. Ngo&agrave;i ăn uống, bổ sung vi chất tr&ecirc;n khi mang thai, c&aacute;c b&agrave; mẹ n&ecirc;n ăn khoảng 100 - 200g v&uacute; sữa hằng ng&agrave;y để bổ sung&nbsp;những vi chất cần thiết n&agrave;y gi&uacute;p ph&ograve;ng tr&aacute;nh hiện tượng thiếu m&aacute;u, c&ograve;i xương cho trẻ nhỏ.</li>
	<li><strong>Cung cấp lượng gluxit cho cơ thể</strong>: Nhu cầu năng lượng từ gluxit chiếm 60% tổng năng lượng. Nếu thiếu th&agrave;nh phần n&agrave;y, sẽ g&acirc;y trở ngại đến hoạt động của tế b&agrave;o thần kinh. V&igrave; vậy, bổ sung gluxit từ thực phẩm, hoa quả l&agrave; cần thiết để tốt cho cơ thể v&agrave; sự co b&oacute;p, hoạt động của ruột</li>
	<li><strong>Gi&uacute;p khoẻ xương, loại mỡ thừa</strong>: Đ&oacute; l&agrave; mong muốn của nhiều người, đặc biệt l&agrave; người lớn tuổi. Lượng&nbsp;calcium&nbsp;c&oacute; trong v&uacute; sữa c&oacute; thể đ&aacute;p ứng 10% nhu cầu canxi trung b&igrave;nh một ng&agrave;y của một người b&igrave;nh thường. N&oacute; kh&ocirc;ng chỉ gi&uacute;p cho xương chắc khoẻ m&agrave; c&ograve;n ngăn ngừa lượng mỡ thừa trong cơ thể</li>
	<li><strong>Cung cấp nước, chất xơ</strong>: Với những người thừa c&acirc;n th&igrave; đ&acirc;y l&agrave; thực phẩm tuyệt vời. Mọi người thường nghĩ vị ngọt của v&uacute; sữa sẽ khiến người mập hơn, nhưng kh&ocirc;ng phải vậy. V&uacute; sữa c&oacute; chứa nhiều nước v&agrave; h&agrave;m lượng chất xơ cũng kh&aacute; cao sẽ gi&uacute;p cho người sử dụng cảm gi&aacute;c no bụng, th&iacute;ch hợp với người kh&ocirc;ng muốn tăng c&acirc;n nhiều v&agrave; nhanh.</li>
</ul>

<p><strong>Hướng dẫn sử dụng</strong></p>

<ul>
	<li>Rửa sơ bằng nước sạch. Lăn nhẹ v&uacute; sữa l&ecirc;n mặt phẳng đến khi mềm đều, sau đ&oacute; lấy dao cắt đ&ocirc;i.&nbsp;</li>
	<li>V&uacute; sữa c&oacute; thể ăn trực tiếp hoặc nấu ch&egrave;, l&agrave;m sinh tố.</li>
</ul>
', CAST(89000 AS Decimal(18, 0)), N'vu_sua_tim_bac_thao__1kg__04e1cf090b7a4074879db4f97b9f8b13_1024x1024.jpg', 500, CAST(N'2021-12-30 17:36:53.447' AS DateTime), CAST(N'2021-12-30 17:36:53.453' AS DateTime), 1, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (21, N'Bắp cải thảo Vietgap Đồng Xanh', N'Bắp 0.8Kg', N'<p><strong>Xuất xứ: Đ&agrave; Lạt</strong></p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:&nbsp;</strong>Đạt chuẩn An To&agrave;n Thực Phẩm VietGap</p>

<p><strong>Đặc Điểm:&nbsp;</strong></p>

<ul>
	<li>C&oacute; lượng kẽm nhiều hơn cả thịt c&aacute;.&nbsp;</li>
	<li>Được d&ugrave;ng để để nấu canh, x&agrave;o, luộc, l&agrave;m kim chi,...&nbsp;</li>
	<li>Cải thảo c&oacute; t&iacute;nh m&aacute;t, ngọt gi&ograve;n tự nhi&ecirc;n, thường xuy&ecirc;n xuất hiện trong c&aacute;c m&oacute;n rau của gia đ&igrave;nh.&nbsp;</li>
</ul>

<p><strong>Ti&ecirc;u chuẩn &amp; chứng nhận chất lượng:</strong></p>

<p>Đạt chuẩn An To&agrave;n Thực Phẩm VietGap</p>

<p><img src="https://salt.tikicdn.com/ts/tmp/7e/10/c3/0e24c598d3634d9213f543a6bcd1dd3c.png" style="height:161px; width:160px" /></p>

<p>&nbsp;</p>
', CAST(38400 AS Decimal(18, 0)), N'website_-_thuong__14__16636a3c388345f3bf5072804fbd50e9_grande.jpg', 500, CAST(N'2021-12-30 17:39:20.000' AS DateTime), CAST(N'2021-12-30 17:48:42.747' AS DateTime), 4, 15)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (22, N'Chanh Vietgap', N'0.5Kg', N'<p><strong>Xuất xứ:&nbsp;</strong>Việt Nam</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:&nbsp;</strong>Đạt chuẩn An To&agrave;n Thực Phẩm VietGap</p>

<p><strong>Đặc Điểm:&nbsp;</strong></p>

<ul>
	<li>Quả mọng nước, vị chua thanh&nbsp;</li>
	<li>Chứa vitamin v&agrave; kho&aacute;ng chất gi&uacute;p giải độc cơ thể, lợi tiểu, giảm c&acirc;n,...&nbsp;</li>
	<li>Chanh Vietgap l&agrave; một loại quả quen thuộc với người Việt.&nbsp;</li>
	<li>Quả chanh được sử dụng nhiều trong việc n&ecirc;m nếm gia vị, l&agrave;m nước giải kh&aacute;t v&agrave; cả trong c&aacute;c b&agrave;i thuốc giải cảm, phục hồi sức khỏe. Ng&agrave;y nay, chanh c&ograve;n được sử dụng trong qu&aacute; tr&igrave;nh l&agrave;m đẹp: dưỡng da, giảm c&acirc;n,...&nbsp;</li>
</ul>

<p><strong>Th&ocirc;ng tin dinh dưỡng:&nbsp;</strong></p>

<ul>
	<li>Nguồn chất chống oxy h&oacute;a: Chất chống oxy h&oacute;a l&agrave; c&aacute;c hợp chất quan trọng trong việc bảo vệ c&aacute;c tế b&agrave;o chống lại c&aacute;c ph&acirc;n tử gốc tự do.&nbsp;</li>
	<li>Tăng cường hệ miễn dịch: Chanh c&oacute; nhiều vitamin C, một chất dinh dưỡng c&oacute; thể gi&uacute;p tăng cường hệ thống miễn dịch của bạn. Trong c&aacute;c nghi&ecirc;n cứu ống nghiệm, vitamin C đ&atilde; cho thấy khả năng tăng cường sản xuất c&aacute;c tế b&agrave;o bạch cầu, gi&uacute;p bảo vệ cơ thể chống lại nhiễm tr&ugrave;ng v&agrave; bệnh tật.&nbsp;</li>
	<li>Cải thiện sức khỏe l&agrave;n da: Loại quả n&agrave;y c&oacute; h&agrave;m lượng vitamin C cao, loại vitamin cần thiết để t&aacute;i tạo collagen trong cơ thể. Collagen l&agrave; một loại protein giữ cho l&agrave;n da săn chắc v&agrave; khỏe mạnh. Một quả chanh cỡ trung b&igrave;nh nặng khoảng 67 grams cung cấp hơn 20% RDI cho chất dinh dưỡng n&agrave;y.&nbsp;</li>
	<li>Giảm tỷ lệ mắc bệnh tim: Bệnh tim l&agrave; nguy&ecirc;n nh&acirc;n h&agrave;ng đầu g&acirc;y tử vong tr&ecirc;n to&agrave;n thế giới. Nghi&ecirc;n cứu cho thấy chanh c&oacute; thể l&agrave;m giảm một số yếu tố nguy cơ bệnh tim. Chanh c&oacute; nhiều vitamin C, c&oacute; thể gi&uacute;p hạ huyết &aacute;p, một yếu tố nguy cơ ch&iacute;nh của bệnh tim.&nbsp;</li>
	<li>Ngăn ngừa sỏi thận: Những loại tr&aacute;i c&acirc;y c&oacute; m&uacute;i như chanh c&oacute; nhiều axit citric, c&oacute; thể ngăn ngừa sỏi thận bằng c&aacute;ch tăng mức độ citrate v&agrave; loại bỏ c&aacute;c kho&aacute;ng chất tạo đ&aacute; trong nước tiểu. Một nghi&ecirc;n cứu cho thấy những người ăn nhiều tr&aacute;i c&acirc;y thuộc họ cam chanh c&oacute; nguy cơ bị sỏi thận thấp hơn đ&aacute;ng kể&nbsp;</li>
	<li>Tăng cường hấp thụ sắt: Những người ăn chay hoặc thuần chay c&oacute; nguy cơ thiếu sắt cao hơn, v&igrave; c&aacute;c sản phẩm từ thực vật c&oacute; chứa một dạng sắt được hấp thụ k&eacute;m hơn so với nguồn sắt từ c&aacute;c sản phẩm động vật. Thực phẩm gi&agrave;u vitamin C như chanh, c&oacute; thể gi&uacute;p ngăn ngừa thiếu m&aacute;u do suy giảm sắt bằng c&aacute;ch cải thiện sự hấp thu sắt từ thực phẩm c&oacute; nguồn gốc thực vật.&nbsp;</li>
</ul>

<p><strong>Ti&ecirc;u chuẩn &amp; chứng nhận chất lượng:</strong></p>

<p>Đạt chuẩn An To&agrave;n Thực Phẩm VietGap</p>

<p><img src="https://salt.tikicdn.com/ts/tmp/7e/10/c3/0e24c598d3634d9213f543a6bcd1dd3c.png" style="height:161px; width:160px" /></p>

<p>VietGAP l&agrave; những nguy&ecirc;n tắc, tr&igrave;nh tự, thủ tục hướng dẫn tổ chức, c&aacute; nh&acirc;n sản xuất, thu hoạch, xử l&yacute; sau thu hoạch nhằm đảm bảo an to&agrave;n, n&acirc;ng cao chất lượng sản phẩm, đảm bảo ph&uacute;c lợi x&atilde; hội, sức khỏe người sản xuất v&agrave; người ti&ecirc;u d&ugrave;ng; đồng thời bảo vệ m&ocirc;i trường v&agrave; truy nguy&ecirc;n nguồn gốc sản xuất.</p>

<p>Thực phẩm đạt ti&ecirc;u chuẩn Vietgap cam kết 6 kh&ocirc;ng:&nbsp;</p>

<ul>
	<li>Kh&ocirc;ng sử dụng thuốc trừ s&acirc;u, diệt cỏ&nbsp;</li>
	<li>Kh&ocirc;ng trồng tr&ecirc;n đất v&agrave; nước &ocirc; nhiễm h&oacute;a chất n&ocirc;ng nghiệp&nbsp;</li>
	<li>Kh&ocirc;ng sử dụng thuốc k&iacute;ch th&iacute;ch tăng trưởng&nbsp;</li>
	<li>Kh&ocirc;ng sử dụng ph&acirc;n b&oacute;n h&oacute;a học&nbsp;</li>
	<li>Kh&ocirc;ng sử dụng giống biến đổi gen&nbsp;</li>
	<li>Kh&ocirc;ng sử dụng chất bảo quản&nbsp;</li>
</ul>

<p><strong>Hướng dẫn sử dụng:&nbsp;</strong></p>

<ul>
	<li>Rửa sạch dưa leo, cắt hai đầu v&agrave; ch&agrave; x&aacute;t cho đến khi ra nhựa trắng rồi cắt bỏ phần nhựa đi để dưa kh&ocirc;ng bị ch&aacute;t.&nbsp;</li>
	<li>Gọt vỏ hoặc để vỏ ăn sống, nấu canh, l&agrave;m nước &eacute;p.</li>
</ul>

<p>&nbsp;</p>
', CAST(24500 AS Decimal(18, 0)), N'chanh.jpg', 559, CAST(N'2021-12-30 17:43:42.000' AS DateTime), CAST(N'2021-12-30 17:48:19.940' AS DateTime), 4, 16)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (23, N'Cà chua Đà Lạt', N'0.5Kg', N'<p><strong>Xuất xứ:&nbsp;</strong>Đ&agrave; Lạt</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:&nbsp;</strong>Rau sạch.</p>

<p><strong>Đặc điểm:</strong></p>

<p><strong>C&agrave; chua&nbsp;</strong>m&agrave;u&nbsp;đỏ thẫm bắt mắt. Đ&acirc;y l&agrave; dạng c&agrave; chua&nbsp;thường d&ugrave;ng để ăn sống hoặc chế biến salad, l&agrave;m nước &eacute;p.&nbsp;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<ul>
	<li>Khi mua c&agrave; chua về, bạn rửa sạch, ng&acirc;m qua với nước muối trong v&ograve;ng 2 - 5 ph&uacute;t.</li>
	<li>Nếu l&agrave;m salad, bạn c&oacute; thể th&aacute;i m&uacute;i cau. Ngo&agrave;i ra, c&agrave; chua mini c&oacute; thể ăn trực tiếp hoặc xay sinh tố.</li>
</ul>
', CAST(30000 AS Decimal(18, 0)), N'cachua.jpg', 450, CAST(N'2021-12-30 17:45:14.000' AS DateTime), CAST(N'2021-12-30 17:48:06.790' AS DateTime), 4, 16)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (24, N'Cua nâu Nauy ', N'1Kg/Con', N'<p><strong>Đặc điểm:</strong></p>

<p><strong>Cua n&acirc;u Nauy (</strong>thịt m&aacute;t rượi, tươi ngọt sắc n&eacute;t từ v&ugrave;ng biển lạnh v&agrave; trong l&agrave;nh của Bắc &Acirc;u. Chất thịt dai d&agrave;y dặn, chắc nịch từng thớ l&agrave; kết quả của tự nhi&ecirc;n dữ dội của v&ugrave;ng biển n&agrave;y.&nbsp;Cua ngon nhất l&agrave; hấp hoặc nướng mọi để cảm nhận vị tươi ngọt xuất sắc. Bạn chỉ cần order, Farmers Seafood thay bạn chế biến!</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng</strong></p>

<ul>
	<li>Từng thớ thịt săn chắc của cua đều rất gi&agrave;u h&agrave;m lượng protein. Hơn nữa h&agrave;m lượng chất b&eacute;o của ch&uacute;ng lu&ocirc;n b&atilde;o h&ograve;a ở mức thấp. Do đ&oacute;, loại hải sản n&agrave;y rất tốt cho chế độ ăn ki&ecirc;ng của người b&eacute;o, tiểu đường&hellip;</li>
	<li>Cua n&acirc;u xuất xứ từ Nauy c&oacute; nhiều vitamin v&agrave; kho&aacute;ng chất tốt. Đặc biệt, trong thịt cua c&ograve;n sở hữu lượng lớn axit b&eacute;o kh&ocirc;ng b&atilde;o h&ograve;a Omega -3. Đ&acirc;y l&agrave; dưỡng chất hữu &iacute;ch cho mắt, n&atilde;o bộ v&agrave; hệ tim mạch.&nbsp;</li>
	<li>H&agrave;m lượng selen trong cua cao gấp nhiều lần so với c&aacute;c loại c&aacute; v&agrave; thịt th&ocirc;ng thường. Khi đi v&agrave;o cơ thể hoạt chất n&agrave;y sẽ gi&uacute;p loại bỏ c&aacute;c kim loại nặng một c&aacute;ch nhanh ch&oacute;ng. Từ đ&oacute; c&oacute; thể bảo vệ sức khỏe con người to&agrave;n diện nhất.&nbsp;</li>
</ul>

<p><strong>Hướng dẫn bảo quản:</strong></p>

<ul>
	<li>Cua n&ecirc;n được bảo quản ngăn đ&aacute; tủ lạnh hoặc bỏ ch&uacute;ng trong tủ đ&ocirc;ng để cua đảm bảo được nhiệt độ thấp.</li>
	<li>Khi đ&ocirc;ng đ&aacute; thịt cua sẽ kh&ocirc;ng bị c&aacute;c loại vi khuẩn tấn c&ocirc;ng g&acirc;y biến chất, tuy nhi&ecirc;n đối với thịt cua tươi kh&ocirc;ng n&ecirc;n bảo quản qu&aacute; l&acirc;u (dưới 30 ng&agrave;y) v&igrave; để l&acirc;u sẽ l&agrave;m mất đi gi&aacute; trị dinh dưỡng c&oacute; b&ecirc;n trong thịt cua</li>
	<li>Khi chuẩn bị chế biến th&igrave; cho xuống ngăn m&aacute;t trước 4 tiếng để r&atilde; đ&ocirc;ng.</li>
</ul>
', CAST(750000 AS Decimal(18, 0)), N'cuanau.jpg', 500, CAST(N'2021-12-30 17:47:54.747' AS DateTime), CAST(N'2021-12-30 17:47:54.750' AS DateTime), 4, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (25, N'Nghêu tím', N'25-30con/kg', N'<p><strong>Xuất xứ:</strong>&nbsp;S&ocirc;ng Cầu, Ph&uacute; Y&ecirc;n</p>

<p><strong>Ti&ecirc;u chuẩn chất lượng:</strong>&nbsp;hải sản sạch</p>

<p><strong>Đặc điểm:</strong></p>

<ul>
	<li>Ngh&ecirc;u Bộp T&iacute;m l&agrave; một trong những đặc sản nổi tiếng của S&ocirc;ng Cầu &ndash; Ph&uacute; Y&ecirc;n. Đến với S&ocirc;ng Cầu, kh&ocirc;ng ai kh&ocirc;ng biết đến con Ngh&ecirc;u Bộp T&iacute;m n&agrave;y.&nbsp;</li>
	<li>Ch&uacute;ng thường được chế biến th&agrave;nh m&oacute;n canh Ngh&ecirc;u Bộp T&iacute;m l&aacute; giang hoặc d&ugrave;ng nướng mỡ h&agrave;nh đ&ecirc;u ngon đậm vị hấp dẫn.&nbsp;</li>
	<li>Về chất thịt, ngh&ecirc;u bộp c&oacute; vị ngọt tự nhi&ecirc;n từ biển, ch&uacute;t vị dai dai từ thịt v&agrave; đặc biệt nhất ch&iacute;nh l&agrave; hương vị n&oacute; mang lại kh&aacute;c hẳn với loại ngh&ecirc;u trắng th&ocirc;ng thường m&agrave; bạn đ&atilde; từng thưởng thức.&nbsp;</li>
	<li>Nếu tr&oacute;t lỡ y&ecirc;u c&aacute;i hương vị đậm đ&agrave; từ chất thịt của con Ngh&ecirc;u bộp đất Ph&uacute; n&agrave;y, bạn c&oacute; thể dễ d&agrave;ng thưởng thức ch&uacute;ng bằng c&aacute;ch đặt h&agrave;ng nguy&ecirc;n liệu tươi sống ngay b&acirc;y giờ tại Farmers nh&eacute;!</li>
</ul>
', CAST(119000 AS Decimal(18, 0)), N'ngheutim.jpg', 650, CAST(N'2021-12-30 17:50:14.153' AS DateTime), CAST(N'2021-12-30 17:50:14.160' AS DateTime), 4, 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (26, N'Cá Hồi phi lê ', N'Túi 250G', N'<p><strong>Xuất xứ:</strong>&nbsp;Na Uy</p>

<p><strong>Ti&ecirc;u chuẩn:</strong></p>

<ul>
	<li>Đ&oacute;ng g&oacute;i &eacute;p ch&acirc;n kh&ocirc;ng.</li>
	<li>Chuẩn c&aacute; hồi tươi chất lượng được nhập khẩu.</li>
	<li>Đ&acirc;y l&agrave; loại c&aacute; hồi chuy&ecirc;n chế biến nấu ăn, kh&ocirc;ng th&iacute;ch hợp để ăn sống hoặc l&agrave;m Sashimi.</li>
</ul>

<p><strong>Đặc điểm :</strong></p>

<ul>
	<li>Được l&agrave;m từ c&aacute; hồi tươi để nguy&ecirc;n da</li>
	<li>Trải qua qu&aacute; tr&igrave;nh sản xuất, đ&oacute;ng g&oacute;i đạt ti&ecirc;u chuẩn</li>
	<li>Thơm ngon, dễ hấp thụ, kh&ocirc;ng g&acirc;y tăng c&acirc;n</li>
	<li>Gi&agrave;u omega3 v&agrave; c&aacute;c kho&aacute;ng chất</li>
</ul>

<p><strong>C&aacute; Hồi Tươi Nguy&ecirc;n Da Na-Uy (250G)&nbsp;</strong>được biết đến như l&agrave; một trong những loại c&aacute; gi&agrave;u omega3 v&agrave; c&aacute;c chất dinh dưỡng nhất. Thịt c&aacute; hồi c&oacute; hương vị đặc trưng, b&eacute;o ngậy, thơm ngon tự nhi&ecirc;n m&agrave; bất cứ loại c&aacute; n&agrave;o cũng kh&ocirc;ng c&oacute; được. Sản phẩm được lấy từ thịt của những con c&aacute; hồi tươi ngon, khỏe mạnh nhất, trải qua c&ocirc;ng đoạn chế biến hiện đại, giữ nguy&ecirc;n lớp da, đạt c&aacute;c chỉ ti&ecirc;u an to&agrave;n thực phẩm. Phần thịt c&aacute; d&agrave;y, kh&ocirc;ng xương, dễ d&agrave;ng chế biến th&agrave;nh c&aacute;c m&oacute;n kh&aacute;c nhau. C&aacute; được&nbsp;cấp đ&ocirc;ng v&agrave; đ&oacute;ng g&oacute;i trong bao b&igrave; cẩn thận để thịt kh&ocirc;ng bị c&aacute;c vi khuẩn từ b&ecirc;n ngo&agrave;i x&acirc;m nhập.</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li>Theo c&aacute;c nh&agrave; khoa học Mỹ, c&aacute; hồi sẽ gi&uacute;p cải thiện rất hiệu quả đến lượng cholesterol trong m&aacute;u v&igrave; lượng axit b&eacute;o omega-3 dồi d&agrave;o.</li>
	<li>Trong c&aacute; hồi c&oacute; chứa nhiều vitamin A, D, phốt pho, magi&ecirc;, kẽm v&agrave; i-ốt, tốt cho hệ ti&ecirc;u h&oacute;a, tim mạch, ph&ograve;ng chống lo&atilde;ng xương.</li>
	<li>Protein trong c&aacute; hồi v&agrave; amino acid rất dễ hấp thụ, kh&ocirc;ng g&acirc;y b&eacute;o ph&igrave; hay thừa c&acirc;n.</li>
	<li>V&igrave; c&aacute; hồi gi&agrave;u protein, c&ugrave;ng c&aacute;c ax&iacute;t b&eacute;o omega-3, vitamin D gi&uacute;p tăng cường dưỡng chất cho da v&agrave; t&oacute;c hiệu quả.</li>
	<li>DHA c&oacute; trong axit b&eacute;o kh&ocirc;ng no của c&aacute; hồi đối với con người c&oacute; vai tr&ograve; quan trọng, gi&uacute;p ph&aacute;t triển tế b&agrave;o n&atilde;o v&agrave; hệ thần kinh, cải thiện tr&iacute; nhớ. C&aacute; hồi cũng thường xuy&ecirc;n được d&ugrave;ng cho trẻ nhỏ v&agrave; phụ nữ mang thai để gi&uacute;p ph&aacute;t triển n&atilde;o bộ ở trẻ.</li>
	<li>Một khẩu phần c&aacute; hồi nướng 85g cung cấp khoảng 50% lượng selen, hỗ trợ triệu chứng suy giảm tinh thần, ph&ograve;ng bệnh tim, ung thư,...</li>
</ul>

<p><strong>Hướng dẫn sử dụng:</strong>&nbsp;Ph&ugrave; hợp cho c&aacute;c m&oacute;n như lẩu, canh, kho, chi&ecirc;n,...</p>

<p><strong>Hướng dẫn bảo quản:&nbsp;</strong>Bạn n&ecirc;n bảo quản trong ngăn lạnh hoặc ngăn đ&ocirc;ng mềm của tủ lạnh.</p>
', CAST(172500 AS Decimal(18, 0)), N'cahoi.png', 670, CAST(N'2021-12-30 17:51:53.997' AS DateTime), CAST(N'2021-12-30 17:51:54.000' AS DateTime), 4, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (27, N'Cá chim trắng tươi sống', N'1Kg', N'<p><strong>Đặc điểm:</strong></p>

<ul>
	<li>C&aacute; tươi 100%</li>
	<li>Đ&aacute;nh bắt trong ng&agrave;y tại khu nu&ocirc;i trồng tươi sống</li>
	<li>Đảm bảo an to&agrave;n thực phẩm, kh&ocirc;ng h&oacute;a chất bảo quản</li>
</ul>

<p>C&aacute; chim trắng l&agrave; một lo&agrave;i c&aacute; sinh sống ở ngo&agrave;i khơi Trung Đ&ocirc;ng, Nam &Aacute;, Đ&ocirc;ng Nam &Aacute;. C&aacute; của họ n&agrave;y đặc trưng bởi cơ thể bằng phẳng, v&acirc;y đu&ocirc;i chẻ v&agrave; v&acirc;y ngực d&agrave;i. C&aacute; chim trắng c&oacute; m&agrave;u bạc hoặc trắng với một &iacute;t vảy. Loại c&aacute; n&agrave;y được đ&aacute;nh gi&aacute; cao trong khu vực Ấn Độ Dương-Th&aacute;i B&igrave;nh Dương cho hương vị của n&oacute;.</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<ul>
	<li><strong>C&aacute; Chim Trắng Tươi Sống&nbsp;</strong>l&agrave;&nbsp;loại thực phẩm ngon v&agrave; nhiều chất dinh dưỡng, gi&agrave;u omega &ndash; 3, nhiều protein c&oacute; lợi cho sức khỏe. C&aacute; chim thường được b&aacute;n tr&ecirc;n thị trường dưới c&aacute;c dạng đ&ocirc;ng lạnh nguy&ecirc;n con, phi l&ecirc; đ&ocirc;ng lạnh tươi, cắt kh&uacute;c đ&ocirc;ng lạnh tươi.</li>
	<li>
	<p>Thịt c&aacute; chim trắng ngon v&agrave; gi&agrave;u chất bổ dưỡng. Trong 100g thực phẩm ăn được c&oacute; 75,2g nước, 19,4g protein, 5,4g lipit, 1,1g tro, 15mg canxi, 185mg photpho, 0,6mg sắt, 145mg natri, 263mg kali, 27mg vitamin A, 2mg vitamin PP, 1mg vitamin C, c&aacute;c vitamin B1, B2&hellip; cung cấp được 126kcal.</p>
	</li>
</ul>

<p><strong>Hướng dẫn bảo quản:</strong>&nbsp;Bảo quản c&aacute; chim trắng&nbsp;tốt nhất vẫn l&agrave; mua về sử dụng liền. Nếu chưa kịp sử dụng th&igrave; n&ecirc;n cho v&agrave;o ngăn đ&ocirc;ng của tủ lạnh.</p>

<p>&nbsp;</p>

<p><em><strong>*Gi&aacute; c&oacute; thể ch&ecirc;nh lệch dựa theo khối lượng thực tế.</strong></em></p>
', CAST(305000 AS Decimal(18, 0)), N'cachimtrang.jpg', 500, CAST(N'2021-12-30 17:53:30.000' AS DateTime), CAST(N'2021-12-30 17:55:35.193' AS DateTime), 4, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (28, N'Cá mú size 1 - 1.2kg/con', N'1Kg', N'<p><strong>Đặc điểm:&nbsp;</strong></p>

<ul>
	<li>C&aacute; m&uacute; ( 1 - 1.5kg/con) c&oacute; thịt dai, da d&agrave;y, ăn b&eacute;o v&agrave; rất thơm ngon.&nbsp;</li>
	<li>Hương vị v&agrave; chất lượng c&aacute; m&uacute; biển đ&atilde; l&agrave;m h&agrave;i l&ograve;ng nhiều kh&aacute;ch h&agrave;ng s&agrave;nh ăn.&nbsp;</li>
	<li>C&aacute; M&uacute; c&ograve;n gi&uacute;p bổ sung th&ecirc;m c&aacute;c axit amin m&agrave; cơ thể kh&ocirc;ng tự tổng hợp được n&ecirc;n c&oacute; t&aacute;c dụng rất tốt trong việc n&acirc;ng cao sức khỏe.</li>
	<li>C&aacute; m&uacute; lu&ocirc;n l&agrave; loại c&aacute; được ưa chuộng h&agrave;ng đầu trong c&aacute;c lo&agrave;i c&aacute; biển v&igrave; thịt trắng, ngọt, dai v&agrave; gi&agrave;u dinh dưỡng.&nbsp;</li>
	<li>M&ugrave;i vị, hương thơm của c&aacute; khi được nấu ch&iacute;n rất đặc trưng, kh&ocirc;ng thể n&agrave;o qu&ecirc;n.&nbsp;</li>
</ul>

<p><strong>Th&ocirc;ng tin dinh dưỡng:&nbsp;</strong></p>

<ul>
	<li>Thịt c&aacute; m&uacute; gi&agrave;u protein, vitamin B2, D, E, PP v&agrave; kho&aacute;ng chất Ca, P, Fe, S, Fe, P, Ca...; d&ugrave;ng rất tốt cho trẻ em c&ograve;i, người lớn gầy, thai nhi chậm ph&aacute;t triển, g&acirc;n xương yếu, ph&ugrave; thũng, suy nhược d&ugrave;ng đều tốt.&nbsp;</li>
	<li>Chữa ph&ugrave; do suy dinh dưỡng</li>
	<li>Chữa g&acirc;n, xương yếu&nbsp;</li>
	<li>Chữa mệt mỏi, ch&oacute;ng mặt&nbsp;</li>
	<li>Chữa chứng t&acirc;m tỳ hư ăn ngủ k&eacute;m&nbsp;</li>
	<li>Chữa thai nhi chậm ph&aacute;t triển&nbsp;</li>
	<li>Chữa phụ sản sau sinh ăn k&eacute;m, &iacute;t sữa&nbsp;</li>
	<li>Chữa b&iacute; tiểu, ph&ugrave; thũng&nbsp;</li>
</ul>

<p><strong>Hướng dẫn bảo quản:&nbsp;</strong></p>

<ul>
	<li>Bảo quản c&aacute; chim m&uacute; tốt nhất vẫn l&agrave; mua về sử dụng liền.&nbsp;</li>
	<li>Nếu chưa kịp sử dụng th&igrave; n&ecirc;n cho v&agrave;o ngăn đ&ocirc;ng của tủ lạnh.</li>
</ul>

<p><em><strong>*Gi&aacute; c&oacute; thể ch&ecirc;nh lệch dựa theo khối lượng thực tế.</strong></em></p>
', CAST(350000 AS Decimal(18, 0)), N'camu.png', 560, CAST(N'2021-12-30 17:55:20.040' AS DateTime), CAST(N'2021-12-30 17:55:20.043' AS DateTime), 4, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (29, N'Cá tầm tươi sống', N'1Kg', N'<p><strong>Đặc điểm:</strong></p>

<p><strong>C&aacute; Tầm Tươi Sống&nbsp;</strong>c&oacute; thịt trắng, dai, vị b&eacute;o ngậy c&oacute; th&agrave;nh phần dinh dưỡng cao, dễ hấp thu v&agrave; dễ ti&ecirc;u ho&aacute;. Điểm đặc biệt nhất l&agrave;&nbsp;<strong><em>xương c&aacute; tầm ho&agrave;n to&agrave;n c&oacute; thể ăn được</em></strong>&nbsp;v&igrave; được cấu tạo từ sụn, v&igrave; thế d&ugrave;ng c&aacute; tầm l&agrave;m nguy&ecirc;n liệu chế biến m&oacute;n ăn th&igrave; gần như kh&ocirc;ng bỏ đi một phận n&agrave;o của c&aacute;. Đầu xương, đu&ocirc;i l&agrave;m m&oacute;n hấp x&igrave; dầu. Thịt c&aacute; vừa ngọt m&agrave; dai được th&aacute;i mỏng chế biến m&oacute;n gỏi, hoặc l&agrave;m m&oacute;n nướng muối ớt, nướng mọi, nấu ch&aacute;o hay nấu s&uacute;p&hellip;.C&aacute; tầm sau khi chế biến, người ăn sẽ cảm nhận được vị thơm dai của m&oacute;n gỏi, vị b&ugrave;i, ngậy b&eacute;o của m&oacute;n nướng, vị đậm đ&agrave; gi&ograve;n tan khi c&aacute; hấp x&igrave; dầu.</p>

<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>

<p>Thịt c&aacute; chứa nhiều&nbsp;<strong>vitamin A, phốt-pho, selen&nbsp;</strong>v&agrave;<strong>&nbsp;vitamin B6, B12&nbsp;</strong>đặc biệt l&agrave;<strong>&nbsp;omega 3&nbsp;</strong>v&agrave;<strong>&nbsp;omega 6.&nbsp;</strong>H&agrave;m lượng<strong>&nbsp;DHA</strong>&nbsp;trong 100gr thịt c&aacute; l&agrave; khoảng 0,54gr, c&aacute; tầm l&agrave; nguồn cung cấp DHA cho b&agrave; mẹ mang thai v&agrave; trẻ em.&nbsp;Ngo&agrave;i ra c&aacute; tầm c&ograve;n cung cấp h&agrave;m lượng đ&aacute;ng kể&nbsp;<strong>Protein, Niacin v&agrave; Vitamin 12</strong>, những dưỡng chất c&oacute; lợi cho hoạt động của cơ thể v&agrave; bộ n&atilde;o của con người. C&oacute; thể n&oacute;i c&aacute; tầm l&agrave; nguồn cung cấp dinh dưỡng cho tất cả mọi lứa tuổi trong gia đ&igrave;nh. H&agrave;m lượng Vitamin A, omega 3 v&agrave; omega 6 trong c&aacute; tầm &nbsp;rất tốt cho l&agrave;n da v&agrave; m&aacute;i t&oacute;c của chị em phụ nữ. Ngo&agrave;i ra, sụn c&aacute; tầm c&ograve;n được sử dụng để b&agrave;o chế ra c&aacute;c loại thuốc c&oacute; lợi cho xương khớp, gi&uacute;p ph&aacute;t triển chiều cao của trẻ em v&agrave; phục hồi c&aacute;c khớp xương của người gi&agrave;.</p>

<p><strong>Hướng dẫn bảo quản:</strong>&nbsp;Bảo quản c&aacute; chim tầm&nbsp;tốt nhất vẫn l&agrave; mua về sử dụng liền. Nếu chưa kịp sử dụng th&igrave; n&ecirc;n cho v&agrave;o ngăn đ&ocirc;ng của tủ lạnh.</p>

<p><em><strong>*Gi&aacute; c&oacute; thể ch&ecirc;nh lệch dựa theo khối lượng thực tế.</strong></em></p>
', CAST(359000 AS Decimal(18, 0)), N'catam.png', 560, CAST(N'2021-12-30 17:57:33.190' AS DateTime), CAST(N'2021-12-30 17:57:33.193' AS DateTime), 4, 17)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (30, N'Nấm mối đen Rica', N'Khay 0.15KG', N'<p><strong>Nấm mối đen Rica&nbsp;</strong></p>

<p><strong>Xuất xứ:&nbsp;</strong>Việt Nam</p>

<p><strong>Đặc điểm:</strong></p>

<ul>
	<li>Thực phẩm bổ dưỡng, tốt cho sức khỏe</li>
	<li>Nấm tươi, gi&ograve;n, ngọt, th&iacute;ch hợp chế biến nhiều m&oacute;n ăn</li>
</ul>

<p><strong>Nấm Mối Đen</strong>&nbsp;l&agrave; một loại nấm ăn rất ngon, vị ngọt thanh một c&aacute;ch tự nhi&ecirc;n,&nbsp;gi&uacute;p n&acirc;ng cao sức khỏe với gi&aacute; trị dinh dưỡng cao,&nbsp;hỗ trợ ngăn ngừa v&agrave; điều trị bệnh hiệu quả, tốt cho m&aacute;u cũng như hệ tim mạch, huyết &aacute;p,&hellip; th&iacute;ch hợp ăn ki&ecirc;ng giảm c&acirc;n. Đặc trưng của loại nấm n&agrave; khi ăn sẽ cảm nhận được vị ngọt thanh nhẹ, nhai sẽ hơi gi&ograve;n dai như thịt g&agrave; nạc, nếu chế biến th&igrave; sẽ l&agrave;m ra được v&ocirc; số m&oacute;n ăn tuyệt vời.</p>

<p><strong>Gi&aacute; trị dinh dưỡng:</strong></p>

<ul>
	<li>Ngăn ngừa ung thư v&uacute;,&nbsp;điều h&ograve;a kinh nguyệt, s&aacute;ng da ở phụ nữ nhờ Acid Linoleic.</li>
	<li>Ngừa ung thư tuyến tiền liệt ở nam giới nhờ Beta Glucan.</li>
	<li>Hỗ trợ v&agrave; ức chế tế b&agrave;o ung thư, u &aacute;c t&iacute;nh nhờ Oudenone.</li>
	<li>Nhiều vitamin B, kho&aacute;ng chất hữu &iacute;ch, chất xơ v&agrave; protein cần thiết cho cơ thể.</li>
	<li>Bổ sung nhiều chất chống oxy h&oacute;a, chống vi&ecirc;m cho cơ thể v&agrave; c&aacute;c Enzym tự nhi&ecirc;n.</li>
	<li>L&agrave; một loại thực phẩm gi&agrave;u gi&aacute; trị dinh dưỡng, chất cao hơn thịt, c&aacute;, trứng v&agrave; sữa.</li>
	<li>Dễ d&agrave;ng kết hợp với bất kỳ m&oacute;n ăn n&agrave;o, thực đơn chay hay mặn đều d&ugrave;ng được.</li>
</ul>

<p><strong>Hướng dẫn sử dụng:</strong>&nbsp;c&oacute; thể d&ugrave;ng để chế biến những m&oacute;n ăn như nấu canh, ch&aacute;o, s&uacute;p,...</p>

<p><strong>Hướng dẫn bảo quản:&nbsp;</strong>N&ecirc;n bảo quản&nbsp;trong ngăn m&aacute;t tủ lạnh.</p>
', CAST(80000 AS Decimal(18, 0)), N'nammoiden.png', 760, CAST(N'2021-12-30 18:00:01.537' AS DateTime), CAST(N'2021-12-30 18:00:01.540' AS DateTime), 4, 18)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (31, N'Chân giò heo sạch G-Kitchen', N'Khay 0.5KG', N'<p><strong>Đặc Điểm:</strong></p>

<ul>
	<li>Heo Giống Mỹ, thịt heo sạch đạt chuẩn 3F Plus</li>
	<li>Giống heo GF24 hợp t&aacute;c với PIC (c&ocirc;ng ty con giống h&agrave;ng đầu thế giới)</li>
	<li>Đ&atilde; được l&agrave;m sạch sẵn v&agrave; h&uacute;t ch&acirc;n kh&ocirc;ng để đảm bảo độ tươi v&agrave; ngon của sản phẩm.</li>
</ul>

<p><strong>Hướng dẫn bảo quản:&nbsp;</strong>Bảo quản ở ngăn m&aacute;t tủ lạnh.</p>

<p><strong>THỊT SẠCH CHUẨN - 3F PLUS</strong><br />
+ FEED &ndash; Thức ăn nu&ocirc;i sạch:<br />
- C&aacute;m sạch tự nhi&ecirc;n.<br />
- Kh&ocirc;ng chất tăng trọng.<br />
+ FARM &ndash; Trang trại sạch con giống chuẩn:<br />
- Con giống GF24 cho ra thương phẩm chất lượng cao, đ&uacute;ng khẩu vị Việt.<br />
- GF sở hữu 100% trang trại theo quy tr&igrave;nh PIC to&agrave;n cầu, an to&agrave;n kh&ocirc;ng dịch bệnh.<br />
- Kiểm so&aacute;t dư lượng kh&aacute;ng sinh.<br />
+ FOOD &ndash; Thịt m&aacute;t &amp; đ&ocirc;ng lạnh chuẩn &Acirc;u:<br />
- Quy tr&igrave;nh thịt m&aacute;t &amp; đ&ocirc;ng lạnh hiện đại c&ocirc;ng nghệ Ch&acirc;u &Acirc;u<br />
- Bảo quản, ph&acirc;n phối đến tay người ti&ecirc;u d&ugrave;ng theo chuẩn thịt m&aacute;t (0-4 độ C).<br />
&nbsp;</p>

<p><strong>NỘI DUNG TRUY XUẤT 3F (G)</strong><br />
1. Nguồn gốc giống heo<br />
- T&ecirc;n giống: GF24<br />
- Nguồn gốc: PIC Mỹ (Cty giống số 1 to&agrave;n cầu)<br />
2. Qu&aacute; tr&igrave;nh chăn nu&ocirc;i<br />
- Thức ăn: Sản xuất tại nh&agrave; m&aacute;y c&aacute;m GreenFeed đạt chuẩn Global Gap.<br />
- Kh&aacute;ng sinh: Kh&ocirc;ng tồn dư trước l&uacute;c giết mổ.</p>
', CAST(85000 AS Decimal(18, 0)), N'changioheosach.jpg', 345, CAST(N'2021-12-30 18:01:52.657' AS DateTime), CAST(N'2021-12-30 18:01:52.663' AS DateTime), 4, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (32, N'Chả cá basa viên đông lạnh', N'Túi 0.5Kg', N'<p><strong>Th&ocirc;ng tin sản phẩm</strong></p>

<ul>
	<li>Cấp cấp protein dồi d&agrave;o : Protein đ&oacute;ng vai tr&ograve; quan trọng đối với cơ thể, một khẩu phần basa 126 gram cung cấp 22,5 gram protein ho&agrave;n chỉnh, chất lượng cao &ndash; c&oacute; nghĩa l&agrave; n&oacute; chứa tất cả ch&iacute;n axit amin thiết yếu m&agrave; bạn cần từ chế độ ăn uống.</li>
	<li>Trẻ h&oacute;a v&agrave; l&agrave;m đẹp da : Hiện nay ở một số nước ti&ecirc;n tiến, da của c&aacute; basa được sử dụng để chiết xuất collagen trong ng&agrave;nh c&ocirc;ng nghiệp thẩm mỹ, đ&acirc;y l&agrave; nh&acirc;n tố h&agrave;ng đầu được chọn để chăm s&oacute;c da v&agrave; hỗ trợ trong qu&aacute; tr&igrave;nh phẫu thuật thẩm mỹ, t&aacute;i tạo c&aacute;c tế b&agrave;o da.</li>
	<li>Giảm nguy cơ mắc bệnh tim, n&acirc;ng cao tuổi thọ : Một số nghi&ecirc;n cứu cho biết, những người ăn nhiều c&aacute; sẽ c&oacute; nguy cơ mắc bệnh tim thấp hơn những người kh&ocirc;ng ăn v&agrave; những người ăn nhiều c&aacute; thường sống l&acirc;u hơn những người kh&ocirc;ng ăn. Tr&ecirc;n thực tế, trong một nghi&ecirc;n cứu, những người ăn nhiều c&aacute; nhất &ndash; được đo bằng c&aacute;ch kiểm tra mức độ chất b&eacute;o omega-3 trong m&aacute;u &ndash; sống l&acirc;u hơn hai năm so với những người ăn &iacute;t nhất.&nbsp;</li>
	<li>Chứa &iacute;t calo : Tr&ecirc;n thực tế, một khẩu phần 126 gram chỉ c&oacute; 160 calo. Ngo&agrave;i ra, một số nghi&ecirc;n cứu cho thấy protein c&aacute; c&oacute; thể gi&uacute;p bạn cảm thấy no l&acirc;u hơn c&aacute;c nguồn protein động vật kh&aacute;c như so với thịt g&agrave; v&agrave; thịt b&ograve;.</li>
	<li>&Iacute;t natri : Fillet c&aacute; basa c&oacute; mức natri tương đối thấp, với 50mg tr&ecirc;n mỗi miếng fillet. Mức hấp thu được khuyến nghị h&agrave;ng ng&agrave;y l&agrave; 2.300mg, v&igrave; thế một miếng fillet c&aacute; basa nặng 100g chỉ chứa khoảng 2% của mức n&agrave;y.&nbsp;</li>
</ul>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<ul>
	<li>Cắt bịch chả, lấy một phần chả c&aacute;.</li>
	<li>Chả&nbsp;thường d&ugrave;ng để chi&ecirc;n hoặc hấp ăn k&egrave;m với b&uacute;n, cơm hoặc cho v&agrave;o lẩu.</li>
</ul>

<p><strong>Hướng dẫn bảo quản:</strong>&nbsp;Bảo quản ở nhiệt độ -18&deg;C hoặc bảo quản trong ngăn đ&ocirc;ng của tủ lạnh.</p>
', CAST(43000 AS Decimal(18, 0)), N'cabasa.jpg', 560, CAST(N'2021-12-30 18:03:47.530' AS DateTime), CAST(N'2021-12-30 18:03:47.540' AS DateTime), 3, 19)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (33, N'Chả cá Lý Sơn đông lạnh', N'Túi 500Gr', N'<p>Th&ocirc;ng tin sản ph&acirc;̉m đang được c&acirc;̣p nh&acirc;̣t</p>
', CAST(149000 AS Decimal(18, 0)), N'chacalyson.jpg', 535, CAST(N'2021-12-30 18:06:00.237' AS DateTime), CAST(N'2021-12-30 18:06:00.240' AS DateTime), 5, 20)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (34, N'Đậu hũ ky đông lạnh ', N'Hộp 200Gr', N'<p><strong>Th&ocirc;ng tin sản phẩm</strong></p>

<ul>
	<li>Sản phẩm được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ Nhật Bản, kh&ocirc;ng sử dụng thạch cao, kh&ocirc;ng c&oacute; chất bảo quản, an to&agrave;n với sức khỏe người d&ugrave;ng.&nbsp;</li>
	<li>Đậu hũ Ky c&oacute; t&iacute;nh m&aacute;t, chứa nhiều th&agrave;nh phần c&oacute; lợi cho cơ thể như sắt, canxi, magi&ecirc;.&nbsp;</li>
	<li>Ngo&agrave;i ra, đậu hũ ky c&ograve;n l&agrave; loại thực phẩm gi&uacute;p bổ sung Protein, Lecithin, &iacute;t calories gi&uacute;p l&agrave;m giảm Cholesterol rất tốt cho những người bị bệnh tim mạch v&agrave; bổ sung đủ chất nhất l&agrave; đối với những người muốn ăn chay.</li>
	<li>Điểm kh&aacute;c biệt l&agrave; đậu hũ ky Tojy được sử dụng muối biển s&acirc;u (Nigari) của Nhật để tạo đ&ocirc;ng nhằm đảo bảo an to&agrave;n v&agrave; sức khỏe cho người ti&ecirc;u d&ugrave;ng, (c&aacute;c loại đậu hũ tr&ecirc;n thị trường sử dụng thạch cao Calcium Sulphate).&nbsp;</li>
</ul>

<p><strong>Th&agrave;nh phần:</strong>&nbsp;Đậu n&agrave;nh Canada 100% kh&ocirc;ng biến đổi gen (non-GMO).&nbsp;</p>

<p><strong>Hướng dẫn sử dụng:</strong>&nbsp;Đậu hũ Ky được d&ugrave;ng chế biến c&aacute;c m&oacute;n ăn như chi&ecirc;n với bột chi&ecirc;n gi&ograve;n, nấu canh nấm, chi&ecirc;n gi&ograve;n cay sốt me, c&aacute;c m&oacute;n chay, mặn... ph&ugrave; hợp với tất cả c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh.&nbsp;</p>

<p><strong>Hướng dẫn bảo quản:&nbsp;</strong>Bảo quản tr&ecirc;n ngăn đ&aacute; tủ lạnh, sử dụng trong 4 th&aacute;ng.</p>
', CAST(22000 AS Decimal(18, 0)), N'dauhudonglanh.png', 467, CAST(N'2021-12-30 18:09:14.170' AS DateTime), CAST(N'2021-12-30 18:09:14.170' AS DateTime), 5, 21)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (35, N'Pizza Manna hải sản vị Ý', N'Hộp 120Gr', N'<p><strong>Th&ocirc;ng tin sản phẩm</strong></p>

<ul>
	<li>Pizza Manna hải sản vị &yacute; 120gr sản phẩm đến từ thương hiệu HT Food, được sản xuất tại Việt Nam, đảm bảo an to&agrave;n cho người d&ugrave;ng.&nbsp;</li>
	<li>Pizza đ&atilde; được chế biến sẵn mang đến cho bạn v&agrave; gia đ&igrave;nh m&oacute;n ăn thơm ngon hấp dẫn m&agrave; kh&ocirc;ng l&agrave;m mất nhiều thời gian.&nbsp;</li>
	<li>Sản phẩm được chế biến từ những nguy&ecirc;n liệu tự nhi&ecirc;n ho&agrave;n to&agrave;n kh&ocirc;ng chứa phụ gia v&agrave; chất bảo quản độc hại.&nbsp;</li>
</ul>

<p><strong>Th&agrave;nh phần:&nbsp;</strong>Đế pizza (bột m&igrave;, nước, dầu cọ, trứng g&agrave;, đường, bơ thực vật, muối i-ốt, men kh&ocirc;), hạt n&ecirc;m, muối iod, gia vị &Yacute;, l&aacute; oregano, thanh cua, dầu thực vật, c&agrave; chua , c&agrave; rốt, đường, ph&ocirc; mai Mozzarella, ớt chu&ocirc;ng xanh, ớt chu&ocirc;ng đỏ, ớt chu&ocirc;ng v&agrave;ng, h&agrave;nh t&acirc;y, t&ocirc;m, c&aacute; basa, ti&ecirc;u đen.&nbsp;</p>

<p><strong>Hướng dẫn sử dụng:&nbsp;</strong></p>

<ul>
	<li>R&atilde; đ&ocirc;ng tự nhi&ecirc;n 30 ph&uacute;t, &aacute;p chảo từ 8-12 ph&uacute;t, đậy nắp v&agrave; kh&ocirc;ng sử dụng dầu ăn, khi thấy lớp vỏ v&agrave;ng v&agrave; ph&ocirc; mai tan chảy l&agrave; d&ugrave;ng được.&nbsp;</li>
	<li>Bỏ l&ograve; 5-8 ph&uacute;t chỉnh nhiệt độ 250 độ C, lưu &yacute; n&ecirc;n l&agrave;m n&oacute;ng l&ograve; khoảng 10 ph&uacute;t trước khi nướng.&nbsp;</li>
</ul>

<p><strong>Hướng dẫn bảo quản:&nbsp;</strong>Bảo quản trong ngăn đ&ocirc;ng của tủ lạnh hoặc để ở nhiệt độ -18&deg;C.</p>
', CAST(40000 AS Decimal(18, 0)), N'pizza.jpg', 345, CAST(N'2021-12-30 18:12:54.907' AS DateTime), CAST(N'2021-12-30 18:12:54.910' AS DateTime), 5, 22)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [TrongLuong], [MoTa], [Gia], [HinhAnh], [SoLuong], [NgayTao], [NgayCapNhat], [MaDanhMuc], [MaTH]) VALUES (36, N'Cá điêu hồng', N'1Kg', N'<p><strong>Th&ocirc;ng tin dinh dưỡng</strong></p>

<ul>
	<li><strong>Gi&uacute;p cơ thể tăng trưởng v&agrave; ph&aacute;t triển</strong>: C&aacute; di&ecirc;u hồng duy tr&igrave; mức độ thấp về chất b&eacute;o v&agrave; calo. Tuy nhi&ecirc;n, vẫn đảm bảo lượng protein cần thiết để nu&ocirc;i dưỡng tế b&agrave;o v&agrave; m&ocirc; cơ thể ph&aacute;t triển khỏe mạnh. N&oacute; gi&uacute;p giảm mức cholesterol v&agrave; mức chất b&eacute;o trung t&iacute;nh v&igrave; loại c&aacute; n&agrave;y kh&ocirc;ng phải l&agrave; nguồn axit b&eacute;o omega-3 đ&aacute;ng tin cậy. Đ&oacute; l&agrave; chất b&eacute;o được t&igrave;m thấy trong hầu hết c&aacute;c lo&agrave;i c&aacute; (c&aacute; hồi, v.v.), v&agrave; do đ&oacute; n&oacute; kiểm so&aacute;t mức cholesterol trong cơ thể con người.</li>
	<li><strong>Củng cố sức khỏe xương</strong>: C&aacute; đi&ecirc;u hồng cũng rất gi&agrave;u kho&aacute;ng chất, protein v&agrave; vitamin D gi&uacute;p củng cố sức khỏe xương của ch&uacute;ng ta. Đồng thời, l&agrave;m giảm th&ecirc;m nguy cơ lo&atilde;ng xương. B&ecirc;n cạnh đ&oacute;, c&aacute;c kho&aacute;ng chất như phốt pho, kali c&oacute; trong thịt c&aacute; sẽ gi&uacute;p l&agrave;m tăng tốc độ tăng trưởng cơ bắp trong cơ thể. Ngo&agrave;i ra, cũng gi&uacute;p sửa chữa tế b&agrave;o v&agrave; duy tr&igrave; hoạt động trao đổi chất th&iacute;ch hợp.</li>
</ul>

<p><strong>Hướng dẫn bảo quản:</strong>&nbsp;Bảo quản trong ngăn đ&aacute; tủ lạnh, trước khi sử dụng bạn n&ecirc;n đặt xuống ngăn m&aacute;t để r&atilde; đ&ocirc;ng từ từ, đảm bảo giữ dinh dưỡng v&agrave; hương vị của c&aacute;.</p>
', CAST(110000 AS Decimal(18, 0)), N'cadieuhong.jpg', 345, CAST(N'2021-12-30 18:14:41.030' AS DateTime), CAST(N'2021-12-30 18:14:41.033' AS DateTime), 5, 19)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'@ưqe324', N'123456', N'0973608625  ', N'm@gmail.com', N'binh', N'Phú Thọ', 0, 1, CAST(N'2021-12-23 22:31:01.647' AS DateTime), CAST(N'2021-12-23 22:42:33.713' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'anhvk', N'123456', N'0388479900  ', N'anhvk@gmail.com', N'Vũ Kim Anh', N'Hải Dương', 0, 1, CAST(N'2021-12-11 01:42:17.177' AS DateTime), CAST(N'2021-12-16 17:45:23.593' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'binhnt', N'123456', N'0978967076  ', N'binhthanh@gmail.com', N'Nguyễn Thanh Bình', N'Bắc Ninh', 1, 1, CAST(N'2021-11-16 17:13:29.413' AS DateTime), CAST(N'2021-12-18 00:32:13.267' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'binhnt66', N'123456', N'0378951234  ', N'quantrivien@gmail.com', N'Người quản trị', N'Hà Nội', 2, 1, CAST(N'2021-11-26 00:00:00.000' AS DateTime), CAST(N'2021-12-31 23:14:50.010' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'binhthanh', N'12345', N'0332441448  ', N'binhthanh0205@gmail.com', N'Nguyễn Thanh Bình', N'Bắc Ninh', 0, 1, NULL, CAST(N'2021-12-18 00:32:25.297' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'cuonghm', N'123456', N'0388479900  ', N'cuonghm@gmail.com', N'Hà Mạnh Cường', N'Quảng Ninh', 1, 1, CAST(N'2021-11-26 00:00:00.000' AS DateTime), CAST(N'2021-12-24 21:57:52.500' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'doanhnd', N'1234567', N'0866212022  ', N'doanhnd@gmail.com', N'Nguyễn Đình Doanh', N'Hà Nội', 0, 1, CAST(N'2021-11-26 11:57:43.520' AS DateTime), CAST(N'2021-11-26 12:04:34.707' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'hanght', N'123456', N'0388479900  ', N'hanght@gmail.com', N'Hoàng Thu Hằng', N'Bắc Giang', 0, 1, CAST(N'2021-12-10 09:42:54.970' AS DateTime), CAST(N'2021-12-10 09:42:54.973' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'linhpt', N'123456', N'0973608652  ', N'linhpt@gmail.com', N'Phạm Thùy Linh', N'Thái Bình', 0, 0, CAST(N'2021-12-11 01:41:09.303' AS DateTime), CAST(N'2021-12-11 01:41:09.310' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'manhph', N'123456', N'0987645123  ', N'manhph@gmail.com', N'Phạm Mạnh Hồng Mạnh', N'Hải Dương', 0, 1, CAST(N'2021-12-14 16:38:49.377' AS DateTime), CAST(N'2021-12-14 16:38:49.403' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'phuong', N'123456', N'0332441448  ', N'phuongnm@gamil.com', N'Nguyễn Thị Mai Phương', N'Hà Nội', 0, 0, NULL, CAST(N'2021-12-31 23:25:11.713' AS DateTime))
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [SoDienThoai], [Email], [HoTen], [DiaChi], [Quyen], [TrangThai], [NgayTao], [NgayCapNhat]) VALUES (N'phuongnm', N'12345', N'0971702528  ', N'phuong@gmail.com', N'Nguyễn Thị Mai Phương', N'Bắc Ninh', 0, 1, NULL, CAST(N'2021-12-31 23:54:50.460' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (1, N'Na Uy', CAST(N'2021-11-17 16:46:10.150' AS DateTime), CAST(N'2021-11-17 16:46:10.157' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (2, N'Farmer Market', CAST(N'2021-11-17 16:46:36.963' AS DateTime), CAST(N'2021-11-17 16:46:36.967' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (4, N'Úc', CAST(N'2021-11-17 18:05:26.840' AS DateTime), CAST(N'2021-11-17 18:05:26.843' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (5, N'Pacow, Việt Nam', CAST(N'2021-11-23 23:30:10.040' AS DateTime), CAST(N'2021-11-23 23:30:10.057' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (6, N'Việt Nam', CAST(N'2021-11-23 23:37:20.827' AS DateTime), CAST(N'2021-11-23 23:37:20.833' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (7, N'Bibigo', CAST(N'2021-11-23 23:39:50.590' AS DateTime), CAST(N'2021-11-23 23:39:50.593' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (8, N'Cầu Tre', CAST(N'2021-11-23 23:45:25.700' AS DateTime), CAST(N'2021-11-23 23:45:25.703' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (9, N'G-Kitchen', CAST(N'2021-11-23 23:47:25.847' AS DateTime), CAST(N'2021-11-23 23:47:25.850' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (10, N'New Zealand', NULL, CAST(N'2021-12-16 15:41:39.483' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (11, N'Peru', NULL, CAST(N'2021-12-16 15:41:45.867' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (12, N'Hàn Quốc', NULL, CAST(N'2021-12-16 15:42:24.763' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (13, N'Đà Lạt', NULL, CAST(N'2021-12-16 15:42:29.350' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (15, N'Đồng Xanh, VN', CAST(N'2021-12-30 17:37:56.317' AS DateTime), CAST(N'2021-12-30 17:37:56.317' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (16, N'Khác', CAST(N'2021-12-30 17:40:45.057' AS DateTime), CAST(N'2021-12-30 17:40:45.060' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (17, N'Farmers Seafood', CAST(N'2021-12-30 17:46:28.683' AS DateTime), CAST(N'2021-12-30 17:46:28.687' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (18, N'Rica', CAST(N'2021-12-30 17:58:23.853' AS DateTime), CAST(N'2021-12-30 17:58:23.857' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (19, N'Nhất Tâm', CAST(N'2021-12-30 18:02:53.177' AS DateTime), CAST(N'2021-12-30 18:02:53.183' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (20, N'Dori', CAST(N'2021-12-30 18:04:11.090' AS DateTime), CAST(N'2021-12-30 18:04:11.090' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (21, N'Tojy', CAST(N'2021-12-30 18:07:26.313' AS DateTime), CAST(N'2021-12-30 18:07:26.317' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (22, N'Manna', CAST(N'2021-12-30 18:10:00.000' AS DateTime), CAST(N'2021-12-30 18:10:17.790' AS DateTime))
INSERT [dbo].[ThuongHieu] ([MaTH], [TenThuongHieu], [NgayTao], [NgayCapNhat]) VALUES (23, N'CP, Việt Nam', CAST(N'2021-12-30 21:38:42.243' AS DateTime), CAST(N'2021-12-30 21:38:42.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [MoTaNgan], [MoTaChiTiet], [HinhAnh], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (4, N'MÓN QUÀ TINH TẾ - THAY LỜI TRI ÂN THẦY CÔ', N'MÓN QUÀ TINH TẾ - THAY LỜI TRI ÂN MỪNG NGÀY NHÀ GIÁO VIỆT NAM 20/11', N'<p style="text-align:center"><span style="font-size:20px"><span style="font-family:times new roman,times,serif"><strong>M&Oacute;N QU&Agrave; TINH TẾ - THAY LỜI TRI &Acirc;N<br />
MỪNG NG&Agrave;Y NH&Agrave; GI&Aacute;O VIỆT NAM 20/11</strong></span></span></p>

<p><span style="font-family:times new roman,times,serif"><strong><img class="img-center" src="https://lh4.googleusercontent.com/hQyGKmb-VhCLTWa7ubnOfv5EA6wIUuo99xX60r58p8UmN2kAkaQHh5tiQV2lvl5T-x1wZCLuETSURgY0cgt54OARMVwhcpkP_ZH9hic9-9Cy2TUdgf-ZmO478eV0_7CjLE5Hf04d" style="height:330px; width:496px" /></strong></span></p>

<p style="text-align:center"><span style="font-family:times new roman,times,serif"><strong>(<a href="https://bit.ly/bst-qua-tang-20-11">BST QU&Agrave; TẶNG 20-11</a>)</strong></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="font-family:times new roman,times,serif"><strong>&ldquo;Ơn dạy dỗ cao hơn n&uacute;i, nghĩa thầy c&ocirc; hơn nước biển khơi&rdquo;</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="font-family:times new roman,times,serif"><strong>Cảm ơn thầy c&ocirc; v&igrave; những b&agrave;i học ở trường lớp, những c&acirc;u chuyện ở trường đời.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="font-family:times new roman,times,serif"><strong>Cảm ơn những người thầy tr&ecirc;n bục giảng cả những người thầy trong cuộc sống.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">C&aacute;ch mỗi người sinh ra v&agrave; trưởng th&agrave;nh l&agrave; kh&aacute;c nhau. Tuy nhi&ecirc;n, tr&ecirc;n bước đường trưởng th&agrave;nh đ&oacute; lu&ocirc;n c&oacute; sự đồng h&agrave;nh của những người thầy thầm lặng đ&atilde; chỉ bảo v&agrave; d&igrave;u dắt ch&uacute;ng ta từ những b&agrave;i học đầu ti&ecirc;n.</span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">D&ugrave; l&agrave; người thầy tr&ecirc;n bục giảng hay những &ldquo;người thầy&rdquo; trong c&ocirc;ng việc, cuộc sống cũng xứng đ&aacute;ng được t&ocirc;n vinh v&agrave; tr&acirc;n trọng.</span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">Nh&acirc;n ng&agrave;y nh&agrave; gi&aacute;o Việt Nam 20/11, h&atilde;y gửi đến những &ldquo;người dẫn lỗi&rdquo; bạn lời cảm ơn ch&acirc;n th&agrave;nh c&ugrave;ng những m&oacute;n qu&agrave; &yacute; nghĩa thay cho sự tri &acirc;n kh&oacute; n&oacute;i hết th&agrave;nh lời.</span></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="font-family:times new roman,times,serif"><strong>THANK YOU &ndash; LỜI CẢM ƠN CH&Acirc;N TH&Agrave;NH (<a href="https://bit.ly/bst-qua-thank-you">BST THANK YOU</a>)</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">BST Thank You &ndash; c&aacute;i t&ecirc;n n&oacute;i l&ecirc;n tất cả. Thank you &ndash; mang &yacute; nghĩa lời cảm ơn ch&acirc;n th&agrave;nh gửi đến những &ldquo;người l&aacute;i đ&ograve;&rdquo; thầm lặng. Với những set qu&agrave; tinh tế, chất lượng gồm tr&aacute;i c&acirc;y nhập khẩu, nước &eacute;p hoa quả như một c&acirc;u ch&uacute;c &ldquo;dồi d&agrave;o sức khỏe&rdquo; gửi đến những người đ&atilde; g&oacute;p phần kh&ocirc;ng nhỏ để c&oacute; ch&uacute;ng ta như h&ocirc;m nay.</span></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/thank_you_299k_04_5785e3640d5a4177bd4a85318b5ed0c8_grande.png" /><img class="img-center" src="https://file.hstatic.net/1000141988/file/thank_you_399k_09__2__5b5dc7aea2ee4b1da0f4835b86dea61d_grande.png" /></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/thank_you_399k_05_7ba8b90e8817423fb9d72679ab7daaf9_grande.png" /><img class="img-center" src="https://file.hstatic.net/1000141988/file/thank_you_399k_06_5e94d1918cce460ea86b3ad3cac3ae54_grande.png" /><img class="img-center" src="https://file.hstatic.net/1000141988/file/thank_you_599k_11_9faf8dbaa4f441f581377ef6536e72c1_grande.png" /><img class="img-center" src="https://file.hstatic.net/1000141988/file/thank_you_599k_14_c2d04c7c236a471cb8ba4f05c2edac09_grande.png" /></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong>(<a href="https://bit.ly/bst-qua-thank-you">https://bit.ly/bst-qua-thank-you</a>)</strong></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="font-family:times new roman,times,serif"><strong>GRATEFUL - NGHĨA THẦY M&Atilde;I KH&Ocirc;NG QU&Ecirc;N (<a href="https://bit.ly/bst-qua-grateful">BST GRATEFUL</a>)</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Bộ sưu tập qu&agrave; tặng Grateful l&agrave; sự kết hợp của những loại tr&aacute;i c&acirc;y tươi ngon, hảo hạng v&agrave; c&aacute;c sản phẩm chất lượng như rượu vang, mật ong,...được chọn lọc từ c&aacute;c thương hiệu uy t&iacute;n, g&oacute;p phần t&ocirc;n l&ecirc;n sự sang trọng khi cầm m&oacute;n qu&agrave; tr&ecirc;n tay. Hơn thế, Grateful mang &yacute; nghĩa như 1 &ldquo;lời tri &acirc;n s&acirc;u sắc&rdquo; thay bạn b&agrave;y tỏ l&ograve;ng biết ơn đến những người thầy đ&atilde; hết l&ograve;ng dạy dỗ hay những người tin tưởng, chia sẻ, hướng dẫn, chỉ bảo ta trong cuộc sống, gi&uacute;p ta ho&agrave;n thiện hơn, sống c&oacute; &iacute;ch v&agrave; &yacute; nghĩa hơn.</span></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/grateful_799k_02_8c822b490b954766953512a7acd155ff_grande.png" /><img class="img-center" src="https://file.hstatic.net/1000141988/file/256252299_4613164235418753_5814350357973677165_n_388aa450d96e49cb872d3d32dcb11b56_grande.jpg" /></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/grateful_799_06_241a0f67a2cc4151aea2874488a55858_grande.png" /><img class="img-center" src="https://file.hstatic.net/1000141988/file/grateful_999k_03_a957d65ff00f404ba2eebf45c16ca1e9_grande.png" /></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/grateful_999k_04_6c50cb47d1bc46bfb1c5ce6709336086_grande.png" /><img class="img-center" src="https://file.hstatic.net/1000141988/file/grateful_1199k_06_e32c23f7707844e8957dcf4df25e8e9a_grande.png" /></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>(<a href="https://bit.ly/bst-qua-grateful">https://bit.ly/bst-qua-grateful</a>)</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">Dịch vụ giao nhanh trong 2 giờ tại Farmers Market sẽ thay bạn gửi trao những m&oacute;n qu&agrave; y&ecirc;u thương đến c&aacute;c thầy c&ocirc; của m&igrave;nh nh&acirc;n dịp tri &acirc;n đặc biệt. Cam kết cung cấp sản phẩm chất lượng tươi ngon v&agrave; an to&agrave;n sức khỏe. Tham khảo ngay nh&eacute;!</span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>Link:&nbsp;<a href="https://bit.ly/bst-qua-tang-20-11">https://bit.ly/bst-qua-tang-20-11</a>&nbsp;</strong></span></span></p>
', N'tri_an_nguoi_dan_loi_64a17a9d56c241808aec802582af692d.jpg', NULL, CAST(N'2021-12-30 18:30:29.607' AS DateTime), N'binhnt')
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [MoTaNgan], [MoTaChiTiet], [HinhAnh], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (5, N'BỘ SƯU TẬP QUÀ TẶNG ĐẶC BIỆT NHÂN NGÀY PHỤ NỮ VIỆT NAM 20/10', N'Tháng 10 là tháng của sự yêu thương, là một dịp đặc biệt để tôn vinh những “giá trị” của người phụ nữ Việt - “giỏi việc công, đảm việc nhà”. ', N'<p><strong>Bộ sưu tập Qu&agrave; tặng 20/10</strong>&nbsp;c&oacute; 3 d&ograve;ng sản phẩm để lựa chọn: Adorable, Graceful, Majestic, tượng trưng cho mỗi t&iacute;nh c&aacute;ch người phụ nữ Việt hiện đại. B&ecirc;n cạnh đ&oacute;, c&aacute;c hộp hộp qu&agrave; được tinh chọn kỹ lưỡng hội tụ những hương vị độc đ&aacute;o khắp thế giới từ Mỹ, &Uacute;c, H&agrave;n Quốc, Nhật,...&nbsp;</p>

<h3><strong>ADORABLE - Hộp qu&agrave; tr&aacute;i c&acirc;y xinh xắn</strong></h3>

<p>D&ograve;ng Adorable trong bộ sưu tập&nbsp;<strong>qu&agrave; tặng đặc biệt ng&agrave;y 20/10</strong>&nbsp;l&agrave; những hộp qu&agrave; xinh xắn được thiết kế với h&igrave;nh d&aacute;ng nhỏ gọn, m&agrave;u sắc trẻ trung m&agrave; chi ph&iacute; lại v&ocirc; c&ugrave;ng phải chăng rất ph&ugrave; hợp để tặng cho em g&aacute;i trong nh&agrave;, đồng nghiệp. Chẳng cần suy nghĩ nhiều, c&aacute;c ch&agrave;ng c&oacute; thể chọn lựa ng&agrave;y được một m&oacute;n qu&agrave; &yacute; nghĩa cho dịp thể hiện y&ecirc;u thương n&agrave;y.</p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" src="https://file.hstatic.net/1000141988/file/adorable_1_8e9f9f6c33f14387a22c7f2fe2efad31_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/adorable_2_42f932406e1f4aa98eee78d5c0736244_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/adorable_3_0fff11fbc83445aa98e0e1d562e0cd8a_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/adorable_4_1c9f3301a0994f88a8b5115b66c8bf0f_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/adorable_5_8320e7d7f5d94a17ab7bacd986651d98_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/adorable_6_9b943974d2454f728a464308aaf2ef2a_grande.jpg" /></p>

<h3><strong>GRACEFUL - Hộp qu&agrave; tr&aacute;i c&acirc;y tinh tế</strong></h3>

<p>Nếu bạn đang kiếm t&igrave;m&nbsp;<strong>m&oacute;n qu&agrave; tặng bạn g&aacute;i</strong>, vợ hoặc chị g&aacute;i trong gia đ&igrave;nh, c&aacute;c hộp qu&agrave; tặng trong d&ograve;ng sản phẩm Graceful sẽ l&agrave; lựa chọn ho&agrave;n hảo hội đủ ti&ecirc;u ch&iacute; tinh tế từ thiết kế, m&agrave;u sắc trang nh&atilde;, sản phẩm chất lượng. D&ograve;ng Graceful đại diện cho t&iacute;nh c&aacute;ch người phụ nữ Việt lu&ocirc;n y&ecirc;u thương, thấu hiểu v&agrave; vung v&eacute;n v&igrave; gia đ&igrave;nh.&nbsp;</p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/graceful_1_10c0dce5c16449c5b085a193fdbda53d_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/graceful_2_5227e9fca1c045268b613d0ab01d2244_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/graceful_3_8a9f2e15a3ab445180a33048ad57e50b_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/graceful_4_926458944126477cb50bdf0d2f8506a1_grande.jpg" /></p>

<h3><br />
<strong>MAJESTIC - Hộp qu&agrave; tặng sang trọng tặng phụ nữ</strong></h3>

<p>Đặc biệt nhất trong Bộ sưu tập Qu&agrave; tặng 20/10 l&agrave; d&ograve;ng sản phẩm Majestic được Farmers Market thiết kế sang trọng, b&agrave;y tr&iacute; thu h&uacute;t ngay từ &aacute;nh nh&igrave;n đầu ti&ecirc;n. C&aacute;c sản phẩm trong hộp qu&agrave; tặng được tinh chọn kỹ lưỡng từ c&aacute;c thương hiệu nổi tiếng tr&ecirc;n thế giới với chất lượng sản phẩm lu&ocirc;n phải đạt ti&ecirc;u chuẩn cao. D&ograve;ng qu&agrave; tặng Majestic l&agrave; lựa chọn ho&agrave;n hảo để d&agrave;nh biếu tặng b&agrave;, mẹ hay những đối t&aacute;c cấp cao.</p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/majestic_1_cd36c68ab12e42a08325de617853b6ff_grande.jpg" /></p>

<p><img alt="Quà Tặng Phụ Nữ Việt Ngày 20/10" class="img-center" src="https://file.hstatic.net/1000141988/file/majestic_2_ad600ff0e4fe473186b544c3220b3348_grande.jpg" /></p>

<p>Đến ngay Farmers Market, tự tay lựa chọn những&nbsp;<strong>m&oacute;n&nbsp;qu&agrave; &yacute; nghĩa 20/10</strong>&nbsp;d&agrave;nh tặng người phụ nữ tuyệt vời với bộ sưu tập qu&agrave; độc đ&aacute;o, ngập tr&agrave;n tr&aacute;i c&acirc;y tươi ngon v&agrave; thực phẩm gi&agrave;u dinh dưỡng tốt cho sức khỏe nh&eacute;!</p>

<p>Tham khảo th&ecirc;m Bộ sưu tập Qu&agrave; Tặng 20/10:&nbsp;<a href="https://farmersmarket.vn/collections/qua-tang">https://farmersmarket.vn/collections/qua-tang&nbsp;</a></p>
', N'qua-tang-phu-nu-viet-nam-2021_b112665eb86f4d3189007a7a295c612e.png', CAST(N'2021-12-05 22:54:09.000' AS DateTime), CAST(N'2021-12-06 01:40:42.520' AS DateTime), N'binhnt')
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [MoTaNgan], [MoTaChiTiet], [HinhAnh], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (6, N'LỄ HỘI TRÁI CÂY HÀN - NHẬN NGÀN ƯU ĐÃI “KHỦNG”', N'CHƯƠNG TRÌNH SAMPLING HỒNG GIÒN VÀ LÊ HÀN QUỐC TẠI FARMERS MARKETTháng 11 là tháng rộn ràng nhất năm với những ngày lễ săn sale “khủng”', N'<h3 style="text-align:justify"><span style="font-size:20px"><span style="font-family:times new roman,times,serif">CHƯƠNG TR&Igrave;NH SAMPLING HỒNG GI&Ograve;N V&Agrave; L&Ecirc; H&Agrave;N QUỐC TẠI FARMERS MARKET</span></span></h3>

<p style="text-align:justify"><span style="font-size:18px"><span style="font-family:times new roman,times,serif"><strong>Th&aacute;ng 11 l&agrave; th&aacute;ng rộn r&agrave;ng nhất năm với những ng&agrave;y lễ săn sale &ldquo;khủng&rdquo;. L&agrave; khoảng thời người người, nh&agrave; nh&agrave; c&ugrave;ng ch&agrave;o đ&oacute;n những deal hot&nbsp; ở tất cả ng&agrave;nh h&agrave;ng.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">Với Farmers Market - nơi cung cấp thực phẩm sạch v&agrave; tr&aacute;i c&acirc;y nhập khẩu uy t&iacute;nh&agrave;ng đầu tại Hồ Ch&iacute; Minh, th&igrave; ngo&agrave;i những chương tr&igrave;nh ưu đ&atilde;i v&agrave;ng cho th&aacute;ng 11, th&igrave; đ&acirc;y cũng ch&iacute;nh l&agrave; thời điểm tr&aacute;i c&acirc;y H&agrave;n v&agrave;o m&ugrave;a với những loại quả ngon, ngọt được nhiều người ưa th&iacute;ch, đại diện ch&iacute;nh l&agrave; l&ecirc; v&agrave; hồng gi&ograve;n.</span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">Để mọi người c&oacute; cơ hội nếm thử vị ngon đặc biệt của tr&aacute;i c&acirc;y H&agrave;n v&agrave;o ng&agrave;y 12/11 - 14/11/2021, tại hệ thống c&aacute;c cửa h&agrave;ng Farmers Market c&oacute; diễn ra chương tr&igrave;nh &ldquo;VUI HỘI TR&Aacute;I C&Acirc;Y H&Agrave;N - NHẬN NG&Agrave;N ƯU Đ&Atilde;I&rdquo;</span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">V&agrave;o khoảng thời gian n&agrave;y, kh&aacute;ch h&agrave;ng gh&eacute; Farmers Market đều c&oacute; cơ hội d&ugrave;ng thử miễn ph&iacute; l&ecirc; v&agrave; hồng gi&ograve;n H&agrave;n Quốc. Đ&acirc;y được xem l&agrave; hai loại quả &ldquo;quốc bảo&rdquo; của xứ sở Kim Chi v&igrave; hương vị tươi ngon, quả to, mọng nước v&agrave; c&oacute; vị ngọt thanh m&aacute;t đặc trưng m&agrave; hiếm c&oacute; v&ugrave;ng đất n&agrave;o c&oacute; thể trồng được loại quả như vậy.</span></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/255650318_4608742505860926_1096657392203558975_n_0dc89017a7754839b20ec4cabb3164d5_grande.jpg" /></span></p>

<p style="text-align:justify"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">B&ecirc;n cạnh chương tr&igrave;nh nếm thử vị ngon của tr&aacute;i c&acirc;y H&agrave;n, Farmers Market c&ograve;n c&oacute; th&ecirc;m chương tr&igrave;nh &ldquo;SI&Ecirc;U DEAL CUỐI TUẦN&rdquo; với c&aacute;c loại tr&aacute;i c&acirc;y nhập hot nhất với gi&aacute; b&aacute;n si&ecirc;u ưu đ&atilde;i giảm đến 50% những loại quả chất lượng cao như việt quất, nho Mỹ, kiwi, t&aacute;o&hellip;</span></span></p>

<p style="text-align:justify">&nbsp;</p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/254647214_4608730105862166_3955143932708012157_n_9e9fa454b6bc468b8b50a09381891b8a_grande.jpg" /></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">Cuối tuần, đến với Farmers Market, Qu&yacute; kh&aacute;ch h&agrave;ng vừa được trải nghiệm dịch vụ chuy&ecirc;n nghiệp, chương tr&igrave;nh ăn thử quả ngon v&agrave; nhận h&agrave;ng ng&agrave;n ưu đ&atilde;i khủng.</span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif">H&atilde;y theo d&otilde;i Fanpage:&nbsp;<a href="https://www.facebook.com/farmersmarket.vn">https://www.facebook.com/farmersmarket.vn</a>&nbsp;để nhận th&ocirc;ng tin ưu đ&atilde;i mỗi ng&agrave;y nhanh nhất. V&agrave; cũng đừng qu&ecirc;n gh&eacute; c&aacute;c cửa h&agrave;ng Farmers để mua thực phẩm mỗi ng&agrave;y với gi&aacute; si&ecirc;u hời cả nh&agrave; nh&eacute;!</span></span></p>
', N'le-hoi-trai-cay.jpg', CAST(N'2021-12-06 01:44:07.000' AS DateTime), CAST(N'2021-12-30 18:23:13.117' AS DateTime), N'cuonghm')
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [MoTaNgan], [MoTaChiTiet], [HinhAnh], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (7, N'BST QUÀ TẾT 2022 - “STAY STRONG” TẾT THÊM SỨC MẠNH - NĂM MỚI THÀNH CÔNG', N'Tết là thời điểm quan trọng của một năm, là niềm hân hoan chào đón những sự kiện mới, thành công mới. Farmers Market luôn đầu tư kỹ lưỡng', N'<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong>Tết l&agrave; thời điểm quan trọng của một năm, l&agrave; niềm h&acirc;n hoan ch&agrave;o đ&oacute;n những sự kiện mới, th&agrave;nh c&ocirc;ng mới. Farmers Market lu&ocirc;n đầu tư kỹ lưỡng trong việc l&ecirc;n &yacute; tưởng thiết kế để cho ra mắt bộ sưu tập qu&agrave; Tết đặc sắc ch&agrave;o đ&oacute;n năm mới với nhiều th&ocirc;ng điệp &yacute; nghĩa. C&ugrave;ng Farmers kh&aacute;m ph&aacute; kiệt t&aacute;c qu&agrave; tặng năm nay c&oacute; g&igrave; đặc biệt nh&eacute;!</strong></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Bộ Qu&agrave; Tết Cao Cấp 2022 - &ldquo;STAY STRONG&rdquo; - sự kết hợp ho&agrave;n hảo từ tinh hoa văn h&oacute;a Việt Nam - tranh Đ&ocirc;ng Hồ c&ugrave;ng lối thiết kế hiện đại, phối m&agrave;u tinh tế đ&atilde; tạo n&ecirc;n n&eacute;t độc đ&aacute;o cho&nbsp;<strong>bộ qu&agrave; Tết</strong>&nbsp;năm nay th&ecirc;m phần đặc sắc v&agrave; sang trọng.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/qua-tet-2022-cao-cap_17d8e7ce6857494da579e1c1bae8eb5b_grande.jpg" /></span></p>

<p style="text-align: center;"><span style="font-family:times new roman,times,serif"><em><strong><a href="https://quatet.farmersmarket.vn/collections/bo-suu-tap-qua-tet">Bộ sưu tập qu&agrave; Tết cao cấp năm 2022</a></strong></em></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Lấy cảm hứng từ h&igrave;nh tượng &quot;&ocirc;ng Hổ&quot; biểu trưng cho năm Nh&acirc;m Dần mạnh mẽ, t&iacute;ch cực c&ugrave;ng bản phối chủ đạo m&agrave;u sắc cam - đỏ - xanh dương. Những họa tiết m&ugrave;a xu&acirc;n được c&aacute;ch điệu h&ograve;a hợp như c&aacute;nh &eacute;n chao nghi&ecirc;ng điểm xuyến c&ugrave;ng hoa mai rực rỡ đ&atilde; tạo n&ecirc;n n&eacute;t ri&ecirc;ng biệt. Sự s&aacute;ng tạo trong BST l&agrave;m n&ecirc;n n&eacute;t đột ph&aacute; trong thị trường qu&agrave; hiện nay, thể hiện kh&iacute; thế vững v&agrave;ng cho năm mới gặt h&aacute;i nhiều th&agrave;nh c&ocirc;ng.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Bộ sưu tập thể hiện sự tinh tế trong từng chi tiết khi thiết kế b&ecirc;n h&ocirc;ng hộp qu&agrave; c&oacute; chữ &ldquo;Tết&rdquo; in nổi sử dụng k&yacute; tự cho người khiếm thị như một lời b&aacute;o hiệu v&agrave; san sẻ niềm vui c&ugrave;ng họ trong dịp Tết đến xu&acirc;n về.</span></p>

<h3 style="text-align:justify"><span style="font-size:20px"><span style="font-family:times new roman,times,serif"><strong>3 GIẢI PH&Aacute;P QU&Agrave; TẾT BIẾU TẶNG NGƯỜI TR&Acirc;N QU&Yacute;</strong></span></span></h3>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Farmers ch&iacute;nh thức ra mắt 3 d&ograve;ng qu&agrave;. Mỗi c&aacute;i t&ecirc;n như một lời động vi&ecirc;n, cổ vũ tinh thần m&agrave; Farmers mong muốn tiếp th&ecirc;m năng lượng cho năm mới nhiều sức khỏe, b&igrave;nh an v&agrave; th&agrave;nh c&ocirc;ng.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">️𝐒𝐓𝐑𝐄𝐍𝐆𝐓𝐇𝐄𝐍 -&nbsp;<strong>hộp qu&agrave; cao cấp</strong>&nbsp;lấy cảm hứng từ sự tương phản của c&aacute;c gam m&agrave;u v&agrave; h&igrave;nh tượng &ldquo;&ocirc;ng Hổ&rdquo; ngậm hộp qu&agrave; như một th&ocirc;ng điệp &ldquo;Tiếp Th&ecirc;m Sức Mạnh&rdquo; gửi đến người th&acirc;n v&agrave; bạn b&egrave; hoặc nh&acirc;n vi&ecirc;n trong năm Nh&acirc;m Dần 2022.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/qua-tet-strengthen-2022_7900fa62007541e4b75271b5b74bdcfb_grande.jpg" /></span></p>

<p style="text-align: center;"><span style="font-family:times new roman,times,serif"><em><strong><a href="https://quatet.farmersmarket.vn/collections/gift-boxes-hop-qua">Hộp qu&agrave; cao cấp, độc đ&aacute;o - Strengthen</a></strong></em></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">️𝐁𝐋𝐎𝐎𝐌𝐈𝐍𝐆 -&nbsp;<strong>giỏ qu&agrave;</strong>&nbsp;&quot;mở&quot; đầy ắp vật phẩm sang trọng &amp; tinh tế như h&igrave;nh tượng m&ugrave;a xu&acirc;n trăm hoa đua nở c&ugrave;ng những th&ocirc;ng điệp &yacute; nghĩa m&agrave; Farmers muốn gửi gắm đến người nhận thay lời ch&uacute;c đầu năm &ldquo;Khai Xu&acirc;n Như &Yacute; - Ph&uacute; Qu&yacute; To&agrave;n Ni&ecirc;n&rdquo;. Rất th&iacute;ch hợp biếu tặng cho gia đ&igrave;nh, th&ocirc;ng gia hoặc cấp tr&ecirc;n m&agrave; bạn tr&acirc;n qu&yacute;.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/qua-tet-blooming-2022_45a6788ab611403483ee718bb790b920_grande.jpg" /></span></p>

<p style="text-align: center;"><span style="font-family:times new roman,times,serif"><em><strong><a href="https://quatet.farmersmarket.vn/collections/gift-baskets-gio-qua">Giỏ qu&agrave; tinh tế, sang trọng - Blooming</a></strong></em></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">𝐁𝐋𝐈𝐒𝐒𝐅𝐔𝐋 - đẳng cấp qu&agrave; Tết 2022 l&agrave; những<strong>&nbsp;th&aacute;p qu&agrave;</strong>&nbsp;xếp chồng thể hiện sự thịnh vượng v&agrave; gi&agrave;u c&oacute; rất th&iacute;ch hợp l&agrave;m qu&agrave; biếu tặng đối t&aacute;c chiến lược v&agrave; kh&aacute;ch h&agrave;ng th&acirc;n thiết như một lời tri &acirc;n v&agrave; lời ch&uacute;c năm mới &quot;An Khang Thịnh Vượng&quot;.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/qua-tet-blissfull-2022_dd29466c54a74035bfd73d8594bbf7e1_grande.jpg" /></span></p>

<p style="text-align: center;"><span style="font-family:times new roman,times,serif"><em><a href="https://quatet.farmersmarket.vn/collections/gift-towers-thap-qua"><strong>Th&aacute;p qu&agrave; đẳng cấp thịnh vượng - Blissful</strong></a></em></span></p>

<h3 style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong>DỊCH VỤ QU&Agrave; TẾT TẠO N&Ecirc;N KH&Aacute;C BIỆT</strong></span></h3>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Farmers Market - nơi cung ứng<strong>&nbsp;qu&agrave; Tết&nbsp;</strong>chất lượng, uy t&iacute;n cho nhiều doanh nghiệp hơn 3 năm qua. Với dịch vụ chuy&ecirc;n nghiệp, những m&oacute;n qu&agrave; cam kết chất lượng. Farmers cung cấp cho kh&aacute;ch h&agrave;ng dịch vụ qu&agrave; tết kh&aacute;c biệt, tối ưu ho&aacute; theo từng nhu cầu hoặc đối tượng.&nbsp;</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong>Chất lượng cao cấp</strong></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Farmers l&agrave;&nbsp;<strong>đơn vị cung cấp Qu&agrave; Tết</strong>&nbsp;chuy&ecirc;n nghiệp, lu&ocirc;n đặt kh&aacute;ch h&agrave;ng l&agrave;m trọng t&acirc;m, cam kết chất lượng nhập khẩu v&agrave; h&agrave;ng Việt cao cấp. Farmers tuyển chọn kỹ lưỡng sản phẩm từ h&igrave;nh thức đến chất lượng. C&aacute;c nh&agrave; cung cấp lu&ocirc;n phải đảm bảo sản phẩm c&oacute; truy xuất r&otilde; r&agrave;ng về xuất xứ, nguồn gốc, lu&ocirc;n đảm bảo vệ sinh an to&agrave;n thực phẩm. Tất cả đều c&oacute; giấy tờ kiểm duyệt đầy đủ.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/ldp-555x182-06_9736612146e340179a2b000c5825c35c_grande.jpg" /></span></p>

<p style="text-align: center;"><span style="font-family:times new roman,times,serif"><em><strong><a href="https://quatet.farmersmarket.vn/collections/bo-suu-tap-qua-tet">Sản phẩm tinh chọn kỹ lưỡng</a></strong></em></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Hơn 3000 sản phẩm như b&aacute;nh kẹo, mứt sấy, tr&aacute;i c&acirc;y sấy, đa dạng hạt cho ng&agrave;y Tết, nước &eacute;p, rượu,... lu&ocirc;n đảm bảo h&agrave;ng ch&iacute;nh ngạch. Bạn c&oacute; thể an t&acirc;m v&agrave; thoải m&aacute;i lựa chọn cho những giỏ qu&agrave; v&agrave; hộp qu&agrave; ng&agrave;y Tết d&agrave;nh tặng cho gia đ&igrave;nh.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong>Mẫu m&atilde; đẹp &amp; sang trọng</strong></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Chọn qu&agrave; ng&agrave;y Tết kh&ocirc;ng chỉ chất lượng vật phẩm m&agrave; c&ograve;n phải ch&uacute; trọng h&igrave;nh thức b&ecirc;n ngo&agrave;i phải đẹp mắt v&agrave; sang trọng th&igrave; mới g&acirc;y sự ch&uacute; &yacute; của người nhận. Farmers Market tự h&agrave;o l&agrave; đơn vị cung cấp qu&agrave; Tết được y&ecirc;u th&iacute;ch bởi sự đầu tư mẫu m&atilde; độc lạ cho c&aacute;c doanh nghiệp lớn như FWD, Tiki, Grab, VIB, AIA, Eximbank, Mobifone,...</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/thiet-ke-qua-tet-2022_aef3a3f61e504f06b474a61181ffb136_grande.png" /></span></p>

<p style="text-align: center;"><span style="font-family:times new roman,times,serif"><em><strong><a href="https://quatet.farmersmarket.vn/collections/bao-bi-qua-tet">Thiết kế ri&ecirc;ng biệt, mẫu m&atilde; sang trọng</a></strong></em></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Dịch vụ thiết kế ri&ecirc;ng lu&ocirc;n s&ocirc;i nổi với nhiều s&aacute;ng tạo độc đ&aacute;o. Đến với Farmers m&oacute;n qu&agrave; của bạn sẽ trở n&ecirc;n ấn tượng từ c&aacute;i nh&igrave;n đầu ti&ecirc;n. V&igrave; mỗi mẫu m&atilde; ch&uacute;ng t&ocirc;i lu&ocirc;n c&oacute; phong c&aacute;ch ri&ecirc;ng thể hiện n&eacute;t đặc trưng thương hiệu hoặc sở th&iacute;ch c&aacute; nh&acirc;n, cam kết kh&ocirc;ng tr&ugrave;ng lặp mẫu tr&ecirc;n thị trường. Đặc biệt, mẫu m&atilde; lu&ocirc;n đ&aacute;p ứng t&ocirc;n chỉ sang trọng &amp; độc đ&aacute;o nhất.&nbsp;</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong>Đa dạng mức gi&aacute; hợp l&yacute;</strong></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Farmers lu&ocirc;n tối ưu ng&acirc;n s&aacute;ch cho từng đối tượng n&ecirc;n ch&uacute;ng t&ocirc;i set nhiều mức gi&aacute; để kh&aacute;ch h&agrave;ng c&oacute; thể linh hoạt lựa chọn chỉ từ 390.000đ/hộp qu&agrave;. Cam kết gi&aacute; cả qu&agrave; Tết lu&ocirc;n hợp l&yacute; chất lượng đi đ&ocirc;i với mẫu m&atilde; sang trọng.</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/qua-tet-2022-stay-strong_1650e66aa2124aa69d408f0759ee52dd_grande.jpg" /></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong><em><a href="https://quatet.farmersmarket.vn/">Đa dạng mức gi&aacute;, dễ d&agrave;ng lựa chọn</a></em></strong></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Đặc biệt, Farmers Market thấu hiểu t&acirc;m &yacute; n&ecirc;n cho ra dịch vụ g&oacute;i qu&agrave; Tết theo y&ecirc;u cầu. Bạn c&oacute; thể c&acirc;n nhắc v&agrave; đưa ra mức quy định chi ph&iacute;, ch&uacute;ng t&ocirc;i sẽ tư vấn cụ thể.&nbsp;</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><strong>Giao h&agrave;ng to&agrave;n quốc*</strong></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Farmers lu&ocirc;n c&oacute; dịch vụ giao qu&agrave; tận nơi cho kh&aacute;ch h&agrave;ng doanh nghiệp. Ch&uacute;ng t&ocirc;i lu&ocirc;n c&oacute; quy tr&igrave;nh cụ thể đảm bảo h&agrave;ng h&oacute;a đến tay đ&uacute;ng chất lượng v&agrave; số lượng cũng như thời gian thỏa thuận đ&ocirc;i b&ecirc;n. Sau khi chốt đơn h&agrave;ng, thời gian &amp; ph&iacute; giao h&agrave;ng sẽ được th&ocirc;ng b&aacute;o cụ thể k&egrave;m với số lượng qu&agrave; đặt.&nbsp;</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/giao-qua-tet-2022_475e0af97db5465fa8bec196ce799ce5_grande.png" /></span></p>

<p style="text-align: center;"><span style="font-family:times new roman,times,serif"><em><strong><a href="https://quatet.farmersmarket.vn/">Qu&agrave; Tết trao tay - nhận ngay trong ng&agrave;y</a></strong></em></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Farmers tự tin l&agrave; đơn vị cung ứng qu&agrave; Tết chuy&ecirc;n nghiệp c&ugrave;ng bạn ghi dấu ấn trong l&ograve;ng người nhận trong dịp lễ Tết!</span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif">Li&ecirc;n hệ với ch&uacute;ng t&ocirc;i ngay để nhận ưu đ&atilde;i l&ecirc;n đến 20%&nbsp;<strong><a href="https://quatet.farmersmarket.vn/pages/lien-he">tại đ&acirc;y!</a></strong></span></p>

<p style="text-align:justify"><span style="font-family:times new roman,times,serif"><em>*&Aacute;p dụng với kh&aacute;ch h&agrave;ng doanh nghiệp.</em></span></p>
', N'qua-tet-2022-cao-cap_1e082babe8574620b8ee1052452eeb82.jpg', CAST(N'2021-12-06 01:49:35.000' AS DateTime), CAST(N'2021-12-06 02:02:43.880' AS DateTime), N'cuonghm')
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [MoTaNgan], [MoTaChiTiet], [HinhAnh], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (8, N'QUÀ TẶNG TRUNG THU - GỬI TRAO YÊU THƯƠNG', N'Trung thu là dịp để mọi người sum vầy, là ngày họp mặt để chia sẻ những câu chuyện dưới ánh trăng, thêm chút trà bánh, những món quà được gửi đi kèm những câu chúc an lành', N'<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/frame_trung_thu_3x2-03_copy_ab355deca24a4aa5aaf53dd54d10c1c4_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong><em>Trung thu l&agrave; dịp để mọi người sum vầy, l&agrave; ng&agrave;y họp mặt để chia sẻ những c&acirc;u chuyện dưới &aacute;nh trăng, th&ecirc;m ch&uacute;t tr&agrave; b&aacute;nh, những m&oacute;n qu&agrave; được gửi đi k&egrave;m những c&acirc;u ch&uacute;c an l&agrave;nh. Vậy năm nay Trung Thu ch&uacute;ng ta sẽ l&agrave;m g&igrave;?</em></strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Kh&aacute;c với mọi năm, Trung Thu năm nay bị ảnh hưởng bởi lệnh gi&atilde;n c&aacute;ch khiến những cuộc gặp trở n&ecirc;n kh&oacute; khăn. Đừng buồn, mỗi năm mỗi đặc biệt, y&ecirc;u thương đ&acirc;u chỉ bằng lời n&oacute;i, gi&atilde;n c&aacute;ch những kh&ocirc;ng xa c&aacute;ch với những m&oacute;n qu&agrave; đầy &yacute; nghĩa.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Vậy Trung Thu n&agrave;y n&ecirc;n tặng g&igrave; cho người th&acirc;n, bạn b&egrave; v&agrave; đồng nghiệp? H&atilde;y tham khảo những hộp qu&agrave; &yacute; nghĩa từ Bộ qu&agrave; tặng &ldquo;<strong>Mid Autumn - a time to gather</strong>&rdquo; thay lời muốn n&oacute;i đến người bạn quan t&acirc;m.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong><em>E-</em></strong><strong><em>CATALOGUE:</em></strong>&nbsp;http://data.farmersmarket.vn/Catalogue-Trung-Thu-2021.pdf</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>HỘP QU&Agrave; SỨC KHỎE</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Những hộp qu&agrave; sang trọng, tinh tế nhưng rất th&acirc;n thuộc, gần gũi đến mọi người. Bao gồm tr&aacute;i c&acirc;y nhập khẩu cao cấp như nho, cherry, kiwi, việt quất&hellip;kết hợp c&ugrave;ng những chiếc b&aacute;nh trung thu thượng hạng Leong Yin Pastry từ Malaysia.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Bộ sưu tập bao gồm 10 hộp qu&agrave; tự chọn, gi&aacute; th&agrave;nh ph&ugrave; hợp với nhu cầu của kh&aacute;ch h&agrave;ng.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>Lựa chọn 1: Silver Moon</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/silver_moon_1_81de60888bbf4866a5d40495d6922cb8_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/silver_moon_2_-_option_2_87f29f889dce486192bbb8d3ede4a976_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>Lựa chọn 2: Golden Moon</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/golden_moon_1_ac590d69af53470e99d05b5688e57d72_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/golden_moon_2_7543088e44e447229134f6385fb69fac_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/golden_moon_3_30c44634f2464e0197857d090761a5c9_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/golden_moon_4_0a776ab2d5fa4029a20bdfa38e98346c_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/golden_moon_5_1f83acf243a246c799546319d239d034_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/golden_moon_6_e9680c46eb314b92b3da38f78c4c72bc_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/cb-campagin_trung_thu_9ab3d872628a46ae96110a2a54b3d52d_grande.jpg" /></span></span></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>Lựa chọn 3: Premium - Mid Autumn</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/premium_mid-autumn_1__3__8e25272e805b4844836e070ef331bc6d_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/premium_mid-autumn_2_8f9b298de530478f8350e026d3d8e650_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/premium_mid-autumn_3_41d36c01663546879b3db816b3f50f84_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/premium_mid-autumn_4_b906c8d465794e8397d8d25325d7c878_grande.jpg" /></span></span></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>B&Aacute;NH TRUNG THU LAVA CUSTARD EMPEROR Đ&Agrave;I LOAN</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/ban_sao_lava_649_37d4ff55189c492b8f11942f618e29b3_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Từng chiếc b&aacute;nh được chọn lọc nguy&ecirc;n liệu khắt khe, c&ugrave;ng b&agrave;n tay nh&agrave;o nặn từ những người thợ l&agrave;nh nghề mang hương vị &ldquo;nguy&ecirc;n vẹn&rdquo; đến tay người thưởng thức.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Họa tiết b&aacute;nh sắc sảo, tinh tế, khắc họa r&otilde; n&eacute;t văn h&oacute;a truyền thống trong ng&agrave;y đo&agrave;n vi&ecirc;n. Lớp vỏ b&aacute;nh thơm mềm sữa dừa, một ch&uacute;t ngọt nhẹ nh&agrave;ng của đậu xanh. Nh&acirc;n trứng muối v&agrave; m&egrave; đen tan chảy độc đ&aacute;o mịn m&agrave;ng, thơm lừng v&agrave; độ ngọt vừa phải nổi bật giữa c&aacute;c loại b&aacute;nh.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Hộp b&aacute;nh thiết kế sang trọng, ph&ugrave; hợp l&agrave;m qu&agrave; tặng người th&acirc;n, bạn b&egrave; v&agrave; đồng nghiệp.</span></span></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/premium_mid-autumn_1_4aa81b941fb84cff8eca1de26ff8567e_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/premium_mid-autumn_1__2__6bb2284cda96475cad50d05cfc70da52_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>B&Aacute;NH TRUNG THƯỢNG HẠNG LEONG YIN PASTRY MALAYSIA</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banner_tong_banh_leong_yin_5eb58b32e4b54459ba21667953d3bc4f_grande.png" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Vỏ b&aacute;nh được l&agrave;m từ 100% hạt sen bổ dưỡng, gi&uacute;p b&aacute;nh mềm mịn, thơm ngon kh&ocirc;ng bị kh&ocirc;. B&aacute;nh trung thu nhập khẩu Malaysia Leong Yin sở hữu tới 13 hương vị kh&aacute;c nhau, c&oacute; thể tự do chọn lựa 13 hương vị đặc biệt cho hộp qu&agrave; tặng của m&igrave;nh.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Bạn c&oacute; thể chọn c&aacute;c set qu&agrave; kh&aacute;c nhau để l&agrave;m qu&agrave; trung thu v&agrave; dễ d&agrave;ng thưởng thức những chiếc b&aacute;nh lẻ v&ocirc; cũng ngon miệng</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>Minh Đăng Như Nguyệt</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Lấy cảm hứng từ những chiếc l&ocirc;ng đ&egrave;n với t&ocirc;ng m&agrave;u đỏ - v&agrave;ng, t&ocirc;n l&ecirc;n vẻ sang trọng v&agrave; gửi gắm sự ấm &aacute;p, ch&uacute;c cho m&ugrave;a Trung Thu n&agrave;y lu&ocirc;n b&igrave;nh an.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/set_qua_tang_minh_dang_nhu_nguyet__4_banh_hop___tra__eb9e4e0f23734d93912d966c5a245373_grande.jpg" /></span></span></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>Thu Giang Minh Nguyệt</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Ch&uacute;t chấm ph&aacute; hiện đại trong n&eacute;t truyền thống tạo n&ecirc;n sự độc đ&aacute;o, cũng như d&ograve;ng chảy của thời gian, lưu giữ những k&yacute; ức tốt đẹp v&agrave; một tương lai tương s&aacute;ng, rực rỡ</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/set_qua_tang_thu_giang_minh_nguyet__2_banh_hop__af03a26d0b4d44f89ef257fcd99c96bb_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>Ngọc Thố</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Lấy cảm hứng từ những chiếc đ&egrave;n lồng ng&agrave;y trăng rằm, mẫu hộp được thiết kế độc đ&aacute;o với h&igrave;nh ch&uacute; Thỏ Ngọc c&aacute;ch điệu mang &acirc;m hưởng hiện đại v&agrave; truyền thống đan xen. Ngọc Thố - set qu&agrave; biểu trưng may mắn v&agrave; an l&agrave;nh như t&acirc;m &yacute; gửi trao đến người th&acirc;n.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/set_qua_tang_trung_thu_ngoc_tho__2_banh_hop__5f9c11277f29414a8b924c7c18d5ed3f_grande.jpg" /></span></span></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><strong>B&aacute;nh trung thu Leong Yin Pastry</strong></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Nh&acirc;n b&aacute;nh đặc biệt được l&agrave;m từ c&aacute;c nguy&ecirc;n liệu kh&aacute;c nhau, cho ra hương vị thơm ngon v&agrave; ph&ugrave; hợp với nhiều đối tượng.</span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_dau_do_hoang_kim_180gr_6610b4c94b93485683a0f2c817320969_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_hat_sen_hoang_kim_180gr_67134045251a49d59d1380404cb782f1_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_sau_rieng_hoang_gia_180gr_5c529115fd2f4ce6b155c29b02a7e251_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_me_den_kim_sa_180gr_19ba0aff2908477aa97c69c9b1b01d08_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_ngu_coc_ga_quay_180gr_a3c7ddef1bb64507833d8281039049db_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_ngu_nhan_ga_quay_180gr_481f8ce185f14a33a68bf4ceb4a21068_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_ngu_sac_hoang_kim_180gr_090948f3f3b54f55aa7dd6662ab05ff6_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_phi_thuy_hoang_kim_180gr_39d4f9e71bf045adbc4d0159adf5211d_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_thap_cam_bach_lien_ngu_vi_180gr_b71ed4bc6bb64ea4adafc1ce983e898d_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_sua_dua_luc_bao_180gr_724598c0fb4647419d0304874a8b1363_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_tra_sua_va_cafe_mocha_180gr_9c42b376279e40ae8b8214594dc7a144_grande.jpg" /></span></span></p>

<p style="text-align: center;"><span style="font-size:14px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/200000026910/file/banh_trung_thu_tra_xanh_180gr_e292d3ea122f44e698f97cebd5875bee_grande.jpg" /></span></span><span style="font-size:14px"><span style="font-family:times new roman,times,serif">Qu&agrave; tặng trung thu kh&ocirc;ng kh&oacute; khi bạn thật sự quan t&acirc;m đến một ai đ&oacute;. M&ugrave;a Trung Thu n&agrave;y kh&ocirc;ng c&ograve;n khoảng c&aacute;ch khi ch&uacute;ng ta lu&ocirc;n d&agrave;nh ch&acirc;n t&igrave;nh đến họ. H&atilde;y c&ugrave;ng nhau thưởng thức b&aacute;nh ngon dưới trăng tr&ograve;n v&agrave; tr&aacute;i tim lu&ocirc;n ở b&ecirc;n nhau bạn nh&eacute;.</span></span></p>
', N'frame_trung_thu_3x2-03_copy_95fd1a7ceee74980b8621532e7b75ce6.jpg', CAST(N'2021-12-06 02:15:04.760' AS DateTime), CAST(N'2021-12-06 02:15:04.763' AS DateTime), N'binhnt')
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [MoTaNgan], [MoTaChiTiet], [HinhAnh], [NgayTao], [NgayCapNhat], [TenTaiKhoan]) VALUES (9, N' NHỮNG LỢI ÍCH TỪ KHOAI LANG BẠN CẦN BIẾT ', N'Khoai lang là loại thức ăn dân dã đã có từ lâu đời tại các nước châu Á. Tuy giá thành của loại thực phẩm này không đắt nhưng nó lại mang đến những giá trị dinh dưỡng tuyệt vời.', N'<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>Khoai lang l&agrave; loại thức ăn d&acirc;n d&atilde; đ&atilde; c&oacute; từ l&acirc;u đời tại c&aacute;c nước ch&acirc;u &Aacute;. Tuy gi&aacute; th&agrave;nh của loại thực phẩm n&agrave;y kh&ocirc;ng đắt nhưng n&oacute; lại mang đến những gi&aacute; trị dinh dưỡng tuyệt vời. H&atilde;y c&ugrave;ng Farmers Market t&igrave;m hiểu xem v&igrave; sao khoai lang lại &ldquo;thần kỳ&rdquo; đến thế nh&eacute;!</strong></span></span></p>

<h2 style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>1.&ldquo;Bạn đồng h&agrave;nh&rdquo; c&ugrave;ng người bị tiểu đường.</strong></span></span></h2>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>Đường Glucose c&oacute; nhiều trong c&aacute;c thực phẩm dạng tinh bột (khoai t&acirc;y, khoai m&ocirc;n, khoai sọ, gạo,...) khiến chỉ số Glycemic (chỉ số phản &aacute;nh tốc độ đường huyết tăng sau khi ăn) tăng cao g&acirc;y nguy hiểm cho những người mắc bệnh tiểu đường. Tuy nhi&ecirc;n, khoai lang l&agrave; loại thức ăn cung cấp nguồn tinh bột tuyệt vời cho cơ thể m&agrave; lượng đường Glucose lại rất thấp, gi&uacute;p người mắc bệnh tiểu đường c&oacute; thể an t&acirc;m d&ugrave;ng hằng ng&agrave;y m&agrave; kh&ocirc;ng bị ảnh hưởng đến sức khỏe.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/6_89c987650ab74d72ad4c4f2d9dc012c8_grande.jpg" /></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>2. Kh&aacute;ng vi&ecirc;m v&agrave; nhanh l&agrave;nh vết thương.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>Hoạt chất Anthocyanin v&agrave; Fibrinogen dồi d&agrave;o chứa nhiều trong khoai lang gi&uacute;p cơ thể chống vi&ecirc;m mạnh mẽ, n&oacute; gi&uacute;p bảo vệ c&aacute;c tế b&agrave;o của cơ thể khỏi những t&aacute;c động xấu từ m&ocirc;i trường, đồng thời gi&uacute;p đẩy mạnh qu&aacute; tr&igrave;nh đ&ocirc;ng m&aacute;u, nhanh ch&oacute;ng l&agrave;m l&agrave;nh vết thương.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/3_74442605fcc8457b8c536868f0e45847_grande.jpg" /></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<h2 style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>3. Tăng khả năng hấp thụ của cơ quan ti&ecirc;u h&oacute;a v&agrave; nhuận tr&agrave;ng.</strong></span></span></h2>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>Lượng chất xơ trong khoai lang kh&aacute; cao, chiếm từ 0.7-4.5%, gi&uacute;p k&iacute;ch th&iacute;ch nhu động ruột, tạo điều kiện tốt để c&aacute;c vi khuẩn c&oacute; lợi tăng trưởng, từ đ&oacute; th&uacute;c đẩy chức năng hoạt động của cơ quan ti&ecirc;u h&oacute;a v&agrave; b&agrave;i tiết, gi&uacute;p cơ thể hấp thụ thức ăn tốt hơn v&agrave; việc đại tiện được trơn tru.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/5_cd2563a78ef040689269f0d20b5e089f_grande.jpg" /></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<h2 style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>4. Chống l&atilde;o h&oacute;a</strong></span></span></h2>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>H&agrave;m lượng carotenoid v&agrave; beta-carotene cao trong khoai lang th&uacute;c đẩy cơ thể sản sinh nhiều vitamin A. C&aacute;c chất n&agrave;y hoạt động như chất chống oxy h&oacute;a mạnh, l&agrave;m giảm sự xuất hiện của c&aacute;c gốc tự do, gi&uacute;p tăng cường hệ miễn dịch, tăng độ đ&agrave;n hồi của da v&agrave; ngăn chặn c&aacute;c dấu hiệu l&atilde;o h&oacute;a.&nbsp;</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/1_2e37115deaef4383bd9dae1c4da39ff5_grande.jpg" /></span></span></p>

<p style="text-align:justify">&nbsp;</p>

<h2 style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>5. Tăng chức năng hoạt động của hệ miễn dịch.</strong></span></span></h2>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>Khoai lang chứa nhiều Vitamin C v&agrave; chất Sắt, ch&uacute;ng gi&uacute;p k&iacute;ch th&iacute;ch sản xuất nhiều tế b&agrave;o bạch cầu (hay c&ograve;n gọi l&agrave; tế b&agrave;o miễn dịch), hỗ trợ cơ thể chống lại c&aacute;c vật thể lạ trong m&aacute;u cũng như c&aacute;c bệnh truyền nhiễm.</strong></span></span></p>

<h2 style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>6. Gi&uacute;p xương chắc khỏe.</strong></span></span></h2>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><strong>Lượng Vitamin D dồi d&agrave;o trong khoai lang hỗ trợ cơ thể tổng hợp canxi hiệu quả từ thức ăn được hấp thụ hằng ng&agrave;y, gi&uacute;p xương v&agrave; răng chắc khỏe, ngăn ngừa t&igrave;nh trạng lo&atilde;ng xương sớm, nhất l&agrave; đối với phụ nữ.</strong></span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="font-family:times new roman,times,serif"><img class="img-center" src="https://file.hstatic.net/1000141988/file/7_2318fe09481c444bafefdab82bb4f05d_grande.jpg" /><strong>Qua những th&ocirc;ng tin tr&ecirc;n, chị em h&atilde;y nhanh ch&oacute;ng kết hợp khoai lang v&agrave;o chế độ ăn uống h&agrave;ng ng&agrave;y để bổ sung c&aacute;c chất dinh dưỡng cần thiết v&agrave; bảo vệ cơ thể khỏi c&aacute;c t&aacute;c nh&acirc;n c&oacute; hại từ m&ocirc;i trường nh&eacute;.</strong></span></span></p>
', N'4_3737f33423ac4e08a8823f1fee52b256.jpg', CAST(N'2021-12-06 02:19:22.000' AS DateTime), CAST(N'2021-12-16 18:29:30.313' AS DateTime), N'binhnt')
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
ALTER TABLE [dbo].[LienHe] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietGi__MaGio__38996AB5] FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK__ChiTietGi__MaGio__38996AB5]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK__GioHang__TenTaiK__36B12243] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK__GioHang__TenTaiK__36B12243]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaGioHan__398D8EEE] FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaGioHan__398D8EEE]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
USE [master]
GO
ALTER DATABASE [FarmMarket_2] SET  READ_WRITE 
GO
