USE [master]
GO
/****** Object:  Database [QLPT1]    Script Date: 3/29/2017 8:05:55 PM ******/
CREATE DATABASE [QLPT1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLPT1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLPT1.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLPT1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLPT1_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLPT1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLPT1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLPT1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLPT1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLPT1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLPT1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLPT1] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLPT1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLPT1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLPT1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLPT1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLPT1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLPT1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLPT1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLPT1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLPT1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLPT1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLPT1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLPT1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLPT1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLPT1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLPT1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLPT1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLPT1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLPT1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLPT1] SET RECOVERY FULL 
GO
ALTER DATABASE [QLPT1] SET  MULTI_USER 
GO
ALTER DATABASE [QLPT1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLPT1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLPT1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLPT1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLPT1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[level] [smallint] NULL,
	[categoryId] [smallint] NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](40) NULL,
	[password] [nvarchar](32) NULL,
	[phone] [nvarchar](11) NULL,
	[status] [tinyint] NULL,
	[avatar] [nvarchar](500) NULL,
 CONSTRAINT [pk_Account] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [pk_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[districtId] [smallint] IDENTITY(1,1) NOT NULL,
	[provinceId] [smallint] NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [pk_District] PRIMARY KEY CLUSTERED 
(
	[districtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[imageId] [int] IDENTITY(1,1) NOT NULL,
	[threadId] [int] NULL,
	[src] [nvarchar](200) NULL,
	[content] [nvarchar](200) NULL,
	[image360] [bit] NULL,
 CONSTRAINT [pk_Image] PRIMARY KEY CLUSTERED 
(
	[imageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notificationId] [int] IDENTITY(1,1) NOT NULL,
	[threadId] [int] NULL,
	[rateId] [int] NULL,
	[accountId] [int] NULL,
	[accountIdPush] [int] NULL,
	[content] [nvarchar](500) NULL,
	[created] [datetime] NULL,
	[status] [bit] NULL,
 CONSTRAINT [pk_Notification] PRIMARY KEY CLUSTERED 
(
	[notificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[provinceId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [pk_Province] PRIMARY KEY CLUSTERED 
(
	[provinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rate]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[rateId] [int] IDENTITY(1,1) NOT NULL,
	[threadId] [int] NULL,
	[accountId] [int] NULL,
	[content] [nvarchar](200) NULL,
	[score] [tinyint] NULL,
	[created] [datetime] NULL,
 CONSTRAINT [pk_Rate] PRIMARY KEY CLUSTERED 
(
	[rateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Thread]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thread](
	[threadId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [smallint] NULL,
	[accountId] [int] NULL,
	[name] [nvarchar](500) NULL,
	[address] [nvarchar](500) NULL,
	[latitude] [decimal](10, 8) NULL,
	[longitude] [decimal](11, 8) NULL,
	[content] [nvarchar](4000) NULL,
	[price] [money] NULL,
	[electricFee] [money] NULL,
	[waterFee] [money] NULL,
	[otherFee] [money] NULL,
	[area] [int] NULL,
	[wifi] [bit] NULL,
	[waterHeater] [bit] NULL,
	[conditioner] [bit] NULL,
	[fridge] [bit] NULL,
	[attic] [bit] NULL,
	[camera] [bit] NULL,
	[waterSource] [tinyint] NULL,
	[direction] [nvarchar](100) NULL,
	[numOfToilets] [smallint] NULL,
	[numOfPeople] [smallint] NULL,
	[object] [tinyint] NULL,
	[villageId] [int] NULL,
	[created] [date] NULL,
	[viewed] [int] NULL,
	[status] [tinyint] NULL,
	[kindOf] [bit] NULL,
	[imageThumb] [nvarchar](200) NULL,
	[note] [nvarchar](200) NULL,
	[available] [bit] NULL,
 CONSTRAINT [pk_Thread] PRIMARY KEY CLUSTERED 
(
	[threadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Village]    Script Date: 3/29/2017 8:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Village](
	[villageId] [int] IDENTITY(1,1) NOT NULL,
	[districtId] [smallint] NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [pk_Village] PRIMARY KEY CLUSTERED 
(
	[villageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (1, 1, NULL, N'Admin 1', N'admin1@gmail.com', N'123', N'phone 1', 1, N'image/avatar1.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (2, 1, NULL, N'Admin 2', N'admin2@gmail.com', N'123', N'phone 2', 1, N'image/avatar2.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (3, 2, 1, N'Mod 1', N'mod1@gmail.com', N'123', N'phone 3', 1, N'image/avatar3.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (4, 2, 2, N'Mod 2', N'mod2@gmail.com', N'123', N'phone 4', 1, N'image/avatar4.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (5, 2, 3, N'Mod 3', N'mod3@gmail.com', N'123', N'phone 5', 1, N'image/avatar5.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (6, 2, 4, N'Mod 4', N'mod4@gmail.com', N'123', N'phone 5', 1, N'image/avatar6.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (7, 3, NULL, N'User 1', N'user1@gmail.com', N'123', N'phone 7', 1, N'image/avatar7.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (8, 3, NULL, N'User 2', N'user2@gmail.com', N'123', N'phone 8', 1, N'image/avatar1.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (9, 3, NULL, N'User 3', N'user3@gmail.com', N'123', N'phone 9', 1, N'image/avatar1.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (10, 3, NULL, N'User 4', N'user4@gmail.com', N'123', N'phone 10', 1, N'image/avatar2.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (11, 3, NULL, N'User 5', N'user5@gmail.com', N'123', N'phone 11', 1, N'image/avatar3.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (12, 3, NULL, N'User 6', N'user6@gmail.com', N'123', N'phone 12', 1, N'image/avatar4.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (13, 3, NULL, N'User 7', N'user7@gmail.com', N'123', N'phone 13', 1, N'image/avatar5.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (14, 3, NULL, N'User 8', N'user8@gmail.com', N'123', N'phone 14', 1, N'image/avatar6.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (15, 3, NULL, N'User 9', N'user9@gmail.com', N'123', N'phone 15', 1, N'image/avatar7.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (16, 3, NULL, N'User 10', N'user10@gmail.com', N'123', N'phone 16', 1, N'image/avatar1.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (17, 3, NULL, N'User 11', N'user11@gmail.com', N'123', N'phone 17', 1, N'image/avatar2.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (18, 3, NULL, N'User 12', N'user12@gmail.com', N'123', N'phone 18', 1, N'image/avatar3.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (19, 3, NULL, N'User 13', N'user13@gmail.com', N'123', N'phone 19', 1, N'image/avatar4.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (20, 3, NULL, N'User 14', N'user14@gmail.com', N'123', N'phone 20', 1, N'image/avatar5.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (21, 3, NULL, N'User 15', N'user15@gmail.com', N'123', N'phone 21', 1, N'image/avatar6.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (22, 3, NULL, N'User 16', N'user16@gmail.com', N'123', N'phone 22', 1, N'image/avatar7.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (23, 3, NULL, N'User 17', N'user17@gmail.com', N'123', N'phone 23', 1, N'image/avatar1.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (24, 3, NULL, N'User 18', N'user18@gmail.com', N'123', N'phone 24', 1, N'image/avatar2.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (25, 3, NULL, N'User 19', N'user19@gmail.com', N'123', N'phone 25', 1, N'image/avatar3.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (26, 3, NULL, N'User 20', N'user20@gmail.com', N'123', N'phone 26', 1, N'image/avatar4.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (27, 3, NULL, N'User 21', N'user21@gmail.com', N'123', N'phone 27', 1, N'image/avatar5.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (28, 3, NULL, N'User 22', N'user22@gmail.com', N'123', N'phone 28', 1, N'image/avatar6.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (29, 3, NULL, N'User 23', N'user23@gmail.com', N'123', N'phone 29', 1, N'image/avatar7.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (30, 3, NULL, N'User 24', N'user24@gmail.com', N'123', N'phone 30', 1, N'image/avatar1.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (31, 3, NULL, N'User 25', N'user25@gmail.com', N'123', N'phone 31', 1, N'image/avatar2.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (32, 3, NULL, N'User 26', N'user26@gmail.com', N'123', N'phone 32', 1, N'image/avatar3.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (33, 3, NULL, N'User 27', N'user27@gmail.com', N'123', N'phone 33', 1, N'image/avatar4.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (34, 3, NULL, N'User 28', N'user28@gmail.com', N'123', N'phone 34', 1, N'image/avatar5.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (35, 3, 0, N'User 29', N'user29@gmail.com', N'123', N'2342424dfds', 1, N'image/avatar6.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (36, 3, 0, N'User 30', N'user30@gmail.com', N'123', N'phone 36', 1, N'image/avatar7.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (41, 3, 0, N'Hà Quang Bão', N'quangbao1994@gmail.com', N'quangbao', NULL, 1, N'image/avatar.jpg')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryId], [name]) VALUES (1, N'Cho thuê phòng trọ')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (2, N'Nhà cho thuê')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (3, N'Cho thuê căn hộ')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (4, N'Cho thuê mặt bằng')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (5, N'Tìm người ở ghép')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([districtId], [provinceId], [name]) VALUES (1, 1, N'Sơn Tịnh')
INSERT [dbo].[District] ([districtId], [provinceId], [name]) VALUES (2, 1, N'Trà Bồng')
INSERT [dbo].[District] ([districtId], [provinceId], [name]) VALUES (3, 2, N'Ngũ Hành Sơn')
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (5, 1, N'image/1.jpg', N' Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (6, 1, N'image/1.jpg', N' Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (7, 1, N'image/1.jpg', N' Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (8, 1, N'image/1.jpg', N' Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (9, 1, N'image/1.jpg', N' Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (10, 2, N'image/2.jpg', N' Phòng Mới Xây Hot Nhất Hàng Xanh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (11, 2, N'image/2.jpg', N' Phòng Mới Xây Hot Nhất Hàng Xanh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (12, 2, N'image/2.jpg', N' Phòng Mới Xây Hot Nhất Hàng Xanh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (30, 6, N'image/6.jpg', N' cho thuê phòng cao cấp đầy đủ tiện nghi mặt tiỿn đưỿng cộng hòa, cách etown 100m, giá cho thuê từ 2,5 triệu/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (31, 6, N'image/6.jpg', N' cho thuê phòng cao cấp đầy đủ tiện nghi mặt tiỿn đưỿng cộng hòa, cách etown 100m, giá cho thuê từ 2,5 triệu/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (32, 6, N'image/6.jpg', N' cho thuê phòng cao cấp đầy đủ tiện nghi mặt tiỿn đưỿng cộng hòa, cách etown 100m, giá cho thuê từ 2,5 triệu/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (33, 6, N'image/6.jpg', N' cho thuê phòng cao cấp đầy đủ tiện nghi mặt tiỿn đưỿng cộng hòa, cách etown 100m, giá cho thuê từ 2,5 triệu/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (92, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (93, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (94, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (95, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (96, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (97, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (98, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (99, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (100, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (101, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (102, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (103, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (104, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (105, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (106, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (107, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (108, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (109, 13, N'image/13.jpg', N' CHÿNH CHỦ CHO NGƯỜI NƯỚC NGOÀI THUÊ CHUNG CƯ CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (123, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (124, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (125, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (126, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (127, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (128, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (129, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (130, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (131, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (132, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (133, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (134, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (135, 15, N'image/15.jpg', N' CHO NGƯỜI NƯỚC NGOÀI THUÊ CĂN HỘ CHUNG CƯ MINI CAO CẤP ĿẦY ĿỦ ĿỒ DT 50M2 TÒA NHÀ D2 PHỿ CẦU GIẤY ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (150, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (151, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (152, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (153, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (154, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (155, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (156, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (157, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (158, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (159, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (160, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (161, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (162, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (163, 17, N'image/17.jpg', N' CHO THUÊ CHUNG CƯ MINI DT38M2 CÓ ĿIỀU HÒA, GIƯỜNG TỦ MẶT PHỿ DOÃN KẾ THIỆN – GIÿ 4,5TR/THÿNG. ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (173, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (174, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (175, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (176, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (177, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (178, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (179, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (180, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (181, 19, N'image/19.jpg', N' CHÿNH CHỦ CHO THUÊ CHUNG CƯ MINI ĿẦY ĿỦ TIỆN NGHI. DT38-45M2, Sỿ 96 LA THANH- Ô CHỢ DỪA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (182, 20, N'image/20.jpg', N' PHÒNG MỚI XÂY, MẶT TIỀN 180 LÊ VĂN LƯƠNG, GẦN CẦU KÊNH TẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (183, 20, N'image/20.jpg', N' PHÒNG MỚI XÂY, MẶT TIỀN 180 LÊ VĂN LƯƠNG, GẦN CẦU KÊNH TẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (184, 20, N'image/20.jpg', N' PHÒNG MỚI XÂY, MẶT TIỀN 180 LÊ VĂN LƯƠNG, GẦN CẦU KÊNH TẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (185, 20, N'image/20.jpg', N' PHÒNG MỚI XÂY, MẶT TIỀN 180 LÊ VĂN LƯƠNG, GẦN CẦU KÊNH TẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (186, 20, N'image/20.jpg', N' PHÒNG MỚI XÂY, MẶT TIỀN 180 LÊ VĂN LƯƠNG, GẦN CẦU KÊNH TẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (192, 22, N'image/22.jpg', N' Phòng trỿ mới xây sạch sẽ, thoáng mát ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (193, 22, N'image/22.jpg', N' Phòng trỿ mới xây sạch sẽ, thoáng mát ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (194, 22, N'image/22.jpg', N' Phòng trỿ mới xây sạch sẽ, thoáng mát ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (195, 22, N'image/22.jpg', N' Phòng trỿ mới xây sạch sẽ, thoáng mát ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (196, 22, N'image/22.jpg', N' Phòng trỿ mới xây sạch sẽ, thoáng mát ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (202, 24, N'image/24.jpg', N' PHÒNG CHỈ CHO NỮ NHÂN VIÊN VĂN PHÒNG, SINH VIÊN THUÊ NGAY TRUNG TÂM QUẬN 3 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (203, 24, N'image/24.jpg', N' PHÒNG CHỈ CHO NỮ NHÂN VIÊN VĂN PHÒNG, SINH VIÊN THUÊ NGAY TRUNG TÂM QUẬN 3 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (204, 24, N'image/24.jpg', N' PHÒNG CHỈ CHO NỮ NHÂN VIÊN VĂN PHÒNG, SINH VIÊN THUÊ NGAY TRUNG TÂM QUẬN 3 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (205, 24, N'image/24.jpg', N' PHÒNG CHỈ CHO NỮ NHÂN VIÊN VĂN PHÒNG, SINH VIÊN THUÊ NGAY TRUNG TÂM QUẬN 3 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (210, 26, N'image/26.jpg', N' Phòng cho thuê cao cấp, tiện nghi mặt tiỿn đưỿng Ŀiện Biên Phủ, Q.10 (hình thật) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (211, 26, N'image/26.jpg', N' Phòng cho thuê cao cấp, tiện nghi mặt tiỿn đưỿng Ŀiện Biên Phủ, Q.10 (hình thật) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (212, 26, N'image/26.jpg', N' Phòng cho thuê cao cấp, tiện nghi mặt tiỿn đưỿng Ŀiện Biên Phủ, Q.10 (hình thật) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (213, 26, N'image/26.jpg', N' Phòng cho thuê cao cấp, tiện nghi mặt tiỿn đưỿng Ŀiện Biên Phủ, Q.10 (hình thật) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (218, 28, N'image/28.jpg', N' Phòng 60m2 tiện nghi cao cấp, tiêu chuẩn khách sạn 4 sao ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (219, 28, N'image/28.jpg', N' Phòng 60m2 tiện nghi cao cấp, tiêu chuẩn khách sạn 4 sao ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (220, 28, N'image/28.jpg', N' Phòng 60m2 tiện nghi cao cấp, tiêu chuẩn khách sạn 4 sao ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (221, 28, N'image/28.jpg', N' Phòng 60m2 tiện nghi cao cấp, tiêu chuẩn khách sạn 4 sao ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (226, 30, N'image/0.jpg', N' 20 phòng trỿ mới xây đưỿng Lý Thưỿng Kiệt, quận 11, gần Ŀại hỿc Bách Khoa, Cư Xá Lữ Gia ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (227, 30, N'image/0.jpg', N' 20 phòng trỿ mới xây đưỿng Lý Thưỿng Kiệt, quận 11, gần Ŀại hỿc Bách Khoa, Cư Xá Lữ Gia ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (228, 30, N'image/0.jpg', N' 20 phòng trỿ mới xây đưỿng Lý Thưỿng Kiệt, quận 11, gần Ŀại hỿc Bách Khoa, Cư Xá Lữ Gia ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (229, 30, N'image/0.jpg', N' 20 phòng trỿ mới xây đưỿng Lý Thưỿng Kiệt, quận 11, gần Ŀại hỿc Bách Khoa, Cư Xá Lữ Gia ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (230, 30, N'image/0.jpg', N' 20 phòng trỿ mới xây đưỿng Lý Thưỿng Kiệt, quận 11, gần Ŀại hỿc Bách Khoa, Cư Xá Lữ Gia ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (236, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (237, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (238, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (239, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (240, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (241, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
GO
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (242, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (243, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (244, 32, N'image/2.jpg', N' CHO THUÊ PHÒNG TRỌ CHÿNH CHỦ, BAN CÔNG, THANG MÿY, GIÿ RẺ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (294, 40, N'image/10.jpg', N' CHo thuê phòng có Máy Lạnh, Kệ Bếp, Ban công cửa sổ, BV 24/24, Khu Trung Sơn, Bình chánh-4,500,000tr/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (295, 40, N'image/10.jpg', N' CHo thuê phòng có Máy Lạnh, Kệ Bếp, Ban công cửa sổ, BV 24/24, Khu Trung Sơn, Bình chánh-4,500,000tr/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (296, 40, N'image/10.jpg', N' CHo thuê phòng có Máy Lạnh, Kệ Bếp, Ban công cửa sổ, BV 24/24, Khu Trung Sơn, Bình chánh-4,500,000tr/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (300, 42, N'image/12.jpg', N' PHÒNG TRỌ ĿƯỜNG 3/2. WC RIÊNG, CÓ MÿY LẠNH, CỬA SỔ, BAN CÔNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (301, 42, N'image/12.jpg', N' PHÒNG TRỌ ĿƯỜNG 3/2. WC RIÊNG, CÓ MÿY LẠNH, CỬA SỔ, BAN CÔNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (302, 42, N'image/12.jpg', N' PHÒNG TRỌ ĿƯỜNG 3/2. WC RIÊNG, CÓ MÿY LẠNH, CỬA SỔ, BAN CÔNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (303, 42, N'image/12.jpg', N' PHÒNG TRỌ ĿƯỜNG 3/2. WC RIÊNG, CÓ MÿY LẠNH, CỬA SỔ, BAN CÔNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (313, 45, N'image/15.jpg', N' PHÒNG CHO THUÊ, NHÀ MỚI XÂY, CÓ BẾP NẤU ĂN, BV 24/24, GIÿ TỪ 2tr5 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (314, 45, N'image/15.jpg', N' PHÒNG CHO THUÊ, NHÀ MỚI XÂY, CÓ BẾP NẤU ĂN, BV 24/24, GIÿ TỪ 2tr5 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (315, 45, N'image/15.jpg', N' PHÒNG CHO THUÊ, NHÀ MỚI XÂY, CÓ BẾP NẤU ĂN, BV 24/24, GIÿ TỪ 2tr5 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (316, 45, N'image/15.jpg', N' PHÒNG CHO THUÊ, NHÀ MỚI XÂY, CÓ BẾP NẤU ĂN, BV 24/24, GIÿ TỪ 2tr5 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (317, 45, N'image/15.jpg', N' PHÒNG CHO THUÊ, NHÀ MỚI XÂY, CÓ BẾP NẤU ĂN, BV 24/24, GIÿ TỪ 2tr5 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (318, 46, N'image/16.jpg', N' PHÒNG TRỌ CỰC ĿẸP GIÿ RẺ KHU VỰC TÂN BÌNH, HOÀNG HOA THÿM GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (319, 46, N'image/16.jpg', N' PHÒNG TRỌ CỰC ĿẸP GIÿ RẺ KHU VỰC TÂN BÌNH, HOÀNG HOA THÿM GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (320, 46, N'image/16.jpg', N' PHÒNG TRỌ CỰC ĿẸP GIÿ RẺ KHU VỰC TÂN BÌNH, HOÀNG HOA THÿM GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (321, 46, N'image/16.jpg', N' PHÒNG TRỌ CỰC ĿẸP GIÿ RẺ KHU VỰC TÂN BÌNH, HOÀNG HOA THÿM GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (322, 46, N'image/16.jpg', N' PHÒNG TRỌ CỰC ĿẸP GIÿ RẺ KHU VỰC TÂN BÌNH, HOÀNG HOA THÿM GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (323, 46, N'image/16.jpg', N' PHÒNG TRỌ CỰC ĿẸP GIÿ RẺ KHU VỰC TÂN BÌNH, HOÀNG HOA THÿM GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (330, 48, N'image/18.jpg', N' CHO THUÊ PHÒNG RỘNG,SẠCH SẼ KHU VỰC AN NINH QUẬN TÂN BÌNH CÓ BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (331, 48, N'image/18.jpg', N' CHO THUÊ PHÒNG RỘNG,SẠCH SẼ KHU VỰC AN NINH QUẬN TÂN BÌNH CÓ BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (332, 48, N'image/18.jpg', N' CHO THUÊ PHÒNG RỘNG,SẠCH SẼ KHU VỰC AN NINH QUẬN TÂN BÌNH CÓ BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (333, 48, N'image/18.jpg', N' CHO THUÊ PHÒNG RỘNG,SẠCH SẼ KHU VỰC AN NINH QUẬN TÂN BÌNH CÓ BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (334, 48, N'image/18.jpg', N' CHO THUÊ PHÒNG RỘNG,SẠCH SẼ KHU VỰC AN NINH QUẬN TÂN BÌNH CÓ BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (335, 48, N'image/18.jpg', N' CHO THUÊ PHÒNG RỘNG,SẠCH SẼ KHU VỰC AN NINH QUẬN TÂN BÌNH CÓ BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (336, 48, N'image/18.jpg', N' CHO THUÊ PHÒNG RỘNG,SẠCH SẼ KHU VỰC AN NINH QUẬN TÂN BÌNH CÓ BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (344, 50, N'image/20.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO NGAY KHÚC GIAO CỘNG HÒA HOÀNG HOA THÿM ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (345, 50, N'image/20.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO NGAY KHÚC GIAO CỘNG HÒA HOÀNG HOA THÿM ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (346, 50, N'image/20.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO NGAY KHÚC GIAO CỘNG HÒA HOÀNG HOA THÿM ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (347, 50, N'image/20.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO NGAY KHÚC GIAO CỘNG HÒA HOÀNG HOA THÿM ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (348, 50, N'image/20.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO NGAY KHÚC GIAO CỘNG HÒA HOÀNG HOA THÿM ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (349, 50, N'image/20.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO NGAY KHÚC GIAO CỘNG HÒA HOÀNG HOA THÿM ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (356, 52, N'image/22.jpg', N' PHÒNG TRỌ CHO THUÊ KHU VỰC TÂN BÌNH, PHÒNG MỚI XÂY AN NINH, SẠCH SẼ THOẢI MÿI BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (357, 52, N'image/22.jpg', N' PHÒNG TRỌ CHO THUÊ KHU VỰC TÂN BÌNH, PHÒNG MỚI XÂY AN NINH, SẠCH SẼ THOẢI MÿI BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (358, 52, N'image/22.jpg', N' PHÒNG TRỌ CHO THUÊ KHU VỰC TÂN BÌNH, PHÒNG MỚI XÂY AN NINH, SẠCH SẼ THOẢI MÿI BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (359, 52, N'image/22.jpg', N' PHÒNG TRỌ CHO THUÊ KHU VỰC TÂN BÌNH, PHÒNG MỚI XÂY AN NINH, SẠCH SẼ THOẢI MÿI BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (360, 52, N'image/22.jpg', N' PHÒNG TRỌ CHO THUÊ KHU VỰC TÂN BÌNH, PHÒNG MỚI XÂY AN NINH, SẠCH SẼ THOẢI MÿI BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (366, 54, N'image/24.jpg', N' CHO THUÊ PHÒNG TRỌ CỰC ĿẸP, GIÿ RẺ KHU VỰC QUẬN TÂN BÌNH-KHU VỰC AN NINH, GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (367, 54, N'image/24.jpg', N' CHO THUÊ PHÒNG TRỌ CỰC ĿẸP, GIÿ RẺ KHU VỰC QUẬN TÂN BÌNH-KHU VỰC AN NINH, GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (368, 54, N'image/24.jpg', N' CHO THUÊ PHÒNG TRỌ CỰC ĿẸP, GIÿ RẺ KHU VỰC QUẬN TÂN BÌNH-KHU VỰC AN NINH, GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (369, 54, N'image/24.jpg', N' CHO THUÊ PHÒNG TRỌ CỰC ĿẸP, GIÿ RẺ KHU VỰC QUẬN TÂN BÌNH-KHU VỰC AN NINH, GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (370, 54, N'image/24.jpg', N' CHO THUÊ PHÒNG TRỌ CỰC ĿẸP, GIÿ RẺ KHU VỰC QUẬN TÂN BÌNH-KHU VỰC AN NINH, GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (371, 54, N'image/24.jpg', N' CHO THUÊ PHÒNG TRỌ CỰC ĿẸP, GIÿ RẺ KHU VỰC QUẬN TÂN BÌNH-KHU VỰC AN NINH, GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (396, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (397, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (398, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (399, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (400, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (401, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (402, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (403, 60, N'image/0.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP QUẬN TÂN BÌNH, GẦN CÔNG VIÊN GIA ĿỊNH, THOÿNG MÿT, ĿẦY ĿỦ TIỆN NGHI ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (418, 63, N'image/3.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (419, 63, N'image/3.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (420, 63, N'image/3.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (421, 63, N'image/3.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (422, 63, N'image/3.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (423, 63, N'image/3.jpg', N' NHÀ CAO CẤP GIÿ BÌNH DÂN KHU VỰC AN NINH GIỜ GIẤC TỰ DO ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (430, 65, N'image/5.jpg', N' phòng trỿ tiện nghi trên đưỿng Bà Lê Chân sát chợ Tân Ŀịnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (431, 65, N'image/5.jpg', N' phòng trỿ tiện nghi trên đưỿng Bà Lê Chân sát chợ Tân Ŀịnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (432, 65, N'image/5.jpg', N' phòng trỿ tiện nghi trên đưỿng Bà Lê Chân sát chợ Tân Ŀịnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (433, 65, N'image/5.jpg', N' phòng trỿ tiện nghi trên đưỿng Bà Lê Chân sát chợ Tân Ŀịnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (434, 65, N'image/5.jpg', N' phòng trỿ tiện nghi trên đưỿng Bà Lê Chân sát chợ Tân Ŀịnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (435, 65, N'image/5.jpg', N' phòng trỿ tiện nghi trên đưỿng Bà Lê Chân sát chợ Tân Ŀịnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (436, 66, N'image/6.jpg', N' Căn hộ thoáng mát, view đẹp 30m2 sàn gỗ gần công viên, chợ đêm Hạnh Thông Tây, siêu thị mặt tiỿn Lê Văn Thỿ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (437, 66, N'image/6.jpg', N' Căn hộ thoáng mát, view đẹp 30m2 sàn gỗ gần công viên, chợ đêm Hạnh Thông Tây, siêu thị mặt tiỿn Lê Văn Thỿ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (438, 66, N'image/6.jpg', N' Căn hộ thoáng mát, view đẹp 30m2 sàn gỗ gần công viên, chợ đêm Hạnh Thông Tây, siêu thị mặt tiỿn Lê Văn Thỿ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (439, 66, N'image/6.jpg', N' Căn hộ thoáng mát, view đẹp 30m2 sàn gỗ gần công viên, chợ đêm Hạnh Thông Tây, siêu thị mặt tiỿn Lê Văn Thỿ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (440, 66, N'image/6.jpg', N' Căn hộ thoáng mát, view đẹp 30m2 sàn gỗ gần công viên, chợ đêm Hạnh Thông Tây, siêu thị mặt tiỿn Lê Văn Thỿ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (441, 66, N'image/6.jpg', N' Căn hộ thoáng mát, view đẹp 30m2 sàn gỗ gần công viên, chợ đêm Hạnh Thông Tây, siêu thị mặt tiỿn Lê Văn Thỿ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (448, 68, N'image/8.jpg', N' Hot!!! cho thuê phòng mới xây, thoáng mát giá 3,7tr ở 6C- Trung Sơn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (471, 73, N'image/13.jpg', N' CHO THUÊ CĂN HỘ MINI ĿẸP, ĿẦY ĿỦ NỘI THẤT, KHU DÂN CƯ TRUNG SƠN, QUẬN 7, GIÿ 5.5 TR – 8 TR/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (472, 73, N'image/13.jpg', N' CHO THUÊ CĂN HỘ MINI ĿẸP, ĿẦY ĿỦ NỘI THẤT, KHU DÂN CƯ TRUNG SƠN, QUẬN 7, GIÿ 5.5 TR – 8 TR/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (473, 73, N'image/13.jpg', N' CHO THUÊ CĂN HỘ MINI ĿẸP, ĿẦY ĿỦ NỘI THẤT, KHU DÂN CƯ TRUNG SƠN, QUẬN 7, GIÿ 5.5 TR – 8 TR/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (474, 73, N'image/13.jpg', N' CHO THUÊ CĂN HỘ MINI ĿẸP, ĿẦY ĿỦ NỘI THẤT, KHU DÂN CƯ TRUNG SƠN, QUẬN 7, GIÿ 5.5 TR – 8 TR/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (475, 73, N'image/13.jpg', N' CHO THUÊ CĂN HỘ MINI ĿẸP, ĿẦY ĿỦ NỘI THẤT, KHU DÂN CƯ TRUNG SƠN, QUẬN 7, GIÿ 5.5 TR – 8 TR/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (476, 73, N'image/13.jpg', N' CHO THUÊ CĂN HỘ MINI ĿẸP, ĿẦY ĿỦ NỘI THẤT, KHU DÂN CƯ TRUNG SƠN, QUẬN 7, GIÿ 5.5 TR – 8 TR/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (477, 73, N'image/13.jpg', N' CHO THUÊ CĂN HỘ MINI ĿẸP, ĿẦY ĿỦ NỘI THẤT, KHU DÂN CƯ TRUNG SƠN, QUẬN 7, GIÿ 5.5 TR – 8 TR/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (485, 75, N'image/15.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% GẦN CẦU BÌNH TRIỆU ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (486, 75, N'image/15.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% GẦN CẦU BÌNH TRIỆU ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (487, 75, N'image/15.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% GẦN CẦU BÌNH TRIỆU ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (488, 75, N'image/15.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% GẦN CẦU BÌNH TRIỆU ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (489, 75, N'image/15.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% GẦN CẦU BÌNH TRIỆU ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (490, 75, N'image/15.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% GẦN CẦU BÌNH TRIỆU ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (491, 75, N'image/15.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% GẦN CẦU BÌNH TRIỆU ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (498, 77, N'image/17.jpg', N' PHÒNG CHO THUÊ VIP TIÊU CHUẨN KS 3 SAO, ĿỦ TIỆN NGHI, KDC SANG TRỌNG – LIỀN KỀ PHÚ MỸ HƯNG, GÓC PHẠM HÙNG – NGUYỄN VĂN LINH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (499, 77, N'image/17.jpg', N' PHÒNG CHO THUÊ VIP TIÊU CHUẨN KS 3 SAO, ĿỦ TIỆN NGHI, KDC SANG TRỌNG – LIỀN KỀ PHÚ MỸ HƯNG, GÓC PHẠM HÙNG – NGUYỄN VĂN LINH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (500, 77, N'image/17.jpg', N' PHÒNG CHO THUÊ VIP TIÊU CHUẨN KS 3 SAO, ĿỦ TIỆN NGHI, KDC SANG TRỌNG – LIỀN KỀ PHÚ MỸ HƯNG, GÓC PHẠM HÙNG – NGUYỄN VĂN LINH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (501, 77, N'image/17.jpg', N' PHÒNG CHO THUÊ VIP TIÊU CHUẨN KS 3 SAO, ĿỦ TIỆN NGHI, KDC SANG TRỌNG – LIỀN KỀ PHÚ MỸ HƯNG, GÓC PHẠM HÙNG – NGUYỄN VĂN LINH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (502, 77, N'image/17.jpg', N' PHÒNG CHO THUÊ VIP TIÊU CHUẨN KS 3 SAO, ĿỦ TIỆN NGHI, KDC SANG TRỌNG – LIỀN KỀ PHÚ MỸ HƯNG, GÓC PHẠM HÙNG – NGUYỄN VĂN LINH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (503, 77, N'image/17.jpg', N' PHÒNG CHO THUÊ VIP TIÊU CHUẨN KS 3 SAO, ĿỦ TIỆN NGHI, KDC SANG TRỌNG – LIỀN KỀ PHÚ MỸ HƯNG, GÓC PHẠM HÙNG – NGUYỄN VĂN LINH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (511, 79, N'image/19.jpg', N' CĂN HỘ MINI MỚI XÂY BẢO VỆ 24/24 GIỜ GIẤC TỰ DO AN NINH TUYỆT ĿỿI PHÒNG NÀO CŨNG CÓ BAN CÔNG THOÿNG MÿT ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (512, 79, N'image/19.jpg', N' CĂN HỘ MINI MỚI XÂY BẢO VỆ 24/24 GIỜ GIẤC TỰ DO AN NINH TUYỆT ĿỿI PHÒNG NÀO CŨNG CÓ BAN CÔNG THOÿNG MÿT ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (513, 79, N'image/19.jpg', N' CĂN HỘ MINI MỚI XÂY BẢO VỆ 24/24 GIỜ GIẤC TỰ DO AN NINH TUYỆT ĿỿI PHÒNG NÀO CŨNG CÓ BAN CÔNG THOÿNG MÿT ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (514, 79, N'image/19.jpg', N' CĂN HỘ MINI MỚI XÂY BẢO VỆ 24/24 GIỜ GIẤC TỰ DO AN NINH TUYỆT ĿỿI PHÒNG NÀO CŨNG CÓ BAN CÔNG THOÿNG MÿT ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (515, 79, N'image/19.jpg', N' CĂN HỘ MINI MỚI XÂY BẢO VỆ 24/24 GIỜ GIẤC TỰ DO AN NINH TUYỆT ĿỿI PHÒNG NÀO CŨNG CÓ BAN CÔNG THOÿNG MÿT ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (516, 79, N'image/19.jpg', N' CĂN HỘ MINI MỚI XÂY BẢO VỆ 24/24 GIỜ GIẤC TỰ DO AN NINH TUYỆT ĿỿI PHÒNG NÀO CŨNG CÓ BAN CÔNG THOÿNG MÿT ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (517, 79, N'image/19.jpg', N' CĂN HỘ MINI MỚI XÂY BẢO VỆ 24/24 GIỜ GIẤC TỰ DO AN NINH TUYỆT ĿỿI PHÒNG NÀO CŨNG CÓ BAN CÔNG THOÿNG MÿT ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (526, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
GO
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (527, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (528, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (529, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (530, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (531, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (532, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (533, 81, N'image/21.jpg', N' Ngay Lotte Q.7, cho thuê căn hộ mini 3tr/tháng – Tòa nhà 8 tầng mới đẹp – Bảo vệ và thang máy 24/7 – Alo 0988.373.731 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (542, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (543, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (544, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (545, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (546, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (547, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (548, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (549, 83, N'image/23.jpg', N' PHÒNG CHO THUÊ MỚI 100%, LỿI ĿI RIÊNG, CÓ BẢO VỆ, GIỜ TỰ DO, 870 TRƯỜNG CHINH, NGAY CỔNG KCN TÂN BÌNH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (555, 85, N'image/25.jpg', N' CHO THUÊ PHÒNG CAO CẤP VIP NGAY TRUNG TÂM CITYLAND 02 NGUYỄN OANH, GÒ VẤP ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (556, 85, N'image/25.jpg', N' CHO THUÊ PHÒNG CAO CẤP VIP NGAY TRUNG TÂM CITYLAND 02 NGUYỄN OANH, GÒ VẤP ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (557, 85, N'image/25.jpg', N' CHO THUÊ PHÒNG CAO CẤP VIP NGAY TRUNG TÂM CITYLAND 02 NGUYỄN OANH, GÒ VẤP ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (558, 85, N'image/25.jpg', N' CHO THUÊ PHÒNG CAO CẤP VIP NGAY TRUNG TÂM CITYLAND 02 NGUYỄN OANH, GÒ VẤP ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (559, 85, N'image/25.jpg', N' CHO THUÊ PHÒNG CAO CẤP VIP NGAY TRUNG TÂM CITYLAND 02 NGUYỄN OANH, GÒ VẤP ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (563, 87, N'image/27.jpg', N' Cho thuê nhà Nguyên Căn, Quận Bình Thạnh giáp Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (564, 87, N'image/27.jpg', N' Cho thuê nhà Nguyên Căn, Quận Bình Thạnh giáp Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (565, 87, N'image/27.jpg', N' Cho thuê nhà Nguyên Căn, Quận Bình Thạnh giáp Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (577, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (578, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (579, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (580, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (581, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (582, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (583, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (584, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (585, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (586, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (587, 89, N'image/29.jpg', N' Phòng Máy Lạnh, cầu Tân Thuận 1, Gần ĿH Maketting, ĿH Nguyễn Tất Thành, ĿH Luật, Huỳnh Tấn Phát, Q.7, giá 2,8Tr/Tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (588, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (589, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (590, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (591, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (592, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (593, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (594, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (595, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (596, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (597, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (598, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (599, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (600, 90, N'image/0.jpg', N' Chính chủ Cho thuê chung cư mini DT 40M2 phòng khách phòng ngủ đầy đủ tiện nghi số 213 phố Xã Ŀàn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (633, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (634, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (635, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (636, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (637, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (638, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (639, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (640, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (641, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (642, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (643, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (644, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (645, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (646, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (647, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (648, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (649, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (650, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (651, 93, N'image/3.jpg', N' CHO THUÊ CĂN HỘ CAO CẤP ĿẸP NHẤT HÀ NỘI 2 PHÒNG NGỦ + 1 P.KHÿCH MẶT PHỿ 23 ĿÔNG CÿC DT60-70M2 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (656, 95, N'image/5.jpg', N' Phòng trỿ quận 10 cao cấp gần ĿH Bách Khoa, Big C, cư xá Bắc Hải ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (657, 95, N'image/5.jpg', N' Phòng trỿ quận 10 cao cấp gần ĿH Bách Khoa, Big C, cư xá Bắc Hải ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (658, 95, N'image/5.jpg', N' Phòng trỿ quận 10 cao cấp gần ĿH Bách Khoa, Big C, cư xá Bắc Hải ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (659, 95, N'image/5.jpg', N' Phòng trỿ quận 10 cao cấp gần ĿH Bách Khoa, Big C, cư xá Bắc Hải ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (667, 97, N'image/7.jpg', N' CHO THUÊ PHÒNG KHU VỰC BÌNH TÂN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (668, 97, N'image/7.jpg', N' CHO THUÊ PHÒNG KHU VỰC BÌNH TÂN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (669, 97, N'image/7.jpg', N' CHO THUÊ PHÒNG KHU VỰC BÌNH TÂN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (670, 97, N'image/7.jpg', N' CHO THUÊ PHÒNG KHU VỰC BÌNH TÂN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (671, 97, N'image/7.jpg', N' CHO THUÊ PHÒNG KHU VỰC BÌNH TÂN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (672, 97, N'image/7.jpg', N' CHO THUÊ PHÒNG KHU VỰC BÌNH TÂN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (673, 97, N'image/7.jpg', N' CHO THUÊ PHÒNG KHU VỰC BÌNH TÂN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (697, 103, N'image/13.jpg', N' CĂN HỘ CHO THUÊ ĿƯỜNG NGUYỄN THỊ MINH KHAI, Q.3, SÿT QUẬN 1 CHỈ VỚI 6.5 TRIỆU/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (698, 103, N'image/13.jpg', N' CĂN HỘ CHO THUÊ ĿƯỜNG NGUYỄN THỊ MINH KHAI, Q.3, SÿT QUẬN 1 CHỈ VỚI 6.5 TRIỆU/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (699, 103, N'image/13.jpg', N' CĂN HỘ CHO THUÊ ĿƯỜNG NGUYỄN THỊ MINH KHAI, Q.3, SÿT QUẬN 1 CHỈ VỚI 6.5 TRIỆU/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (700, 103, N'image/13.jpg', N' CĂN HỘ CHO THUÊ ĿƯỜNG NGUYỄN THỊ MINH KHAI, Q.3, SÿT QUẬN 1 CHỈ VỚI 6.5 TRIỆU/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (701, 103, N'image/13.jpg', N' CĂN HỘ CHO THUÊ ĿƯỜNG NGUYỄN THỊ MINH KHAI, Q.3, SÿT QUẬN 1 CHỈ VỚI 6.5 TRIỆU/THÿNG ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (708, 105, N'image/15.jpg', N' Phòng trỿ cao cấp giá rẻ, đẹp như KS Q.8 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (709, 105, N'image/15.jpg', N' Phòng trỿ cao cấp giá rẻ, đẹp như KS Q.8 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (710, 105, N'image/15.jpg', N' Phòng trỿ cao cấp giá rẻ, đẹp như KS Q.8 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (711, 105, N'image/15.jpg', N' Phòng trỿ cao cấp giá rẻ, đẹp như KS Q.8 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (712, 105, N'image/15.jpg', N' Phòng trỿ cao cấp giá rẻ, đẹp như KS Q.8 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (713, 105, N'image/15.jpg', N' Phòng trỿ cao cấp giá rẻ, đẹp như KS Q.8 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (726, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (727, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (728, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (729, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (730, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (731, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (732, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (733, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (734, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (735, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (736, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (737, 107, N'image/17.jpg', N' KTX NAM NỮ TỰ DO GIỜ GIẤC chỉ 900K Free điện nước wifi có điỿu hòa, máy giặt, tủ lạnh, nước nóng kế Hutech ', 0)
GO
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (750, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (751, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (752, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (753, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (754, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (755, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (756, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (757, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (758, 110, N'image/20.jpg', N' Cho thuê căn hộ mini, căn hộ dịch vụ đầy đủ nội thất tại Nguyễn Trãi + Trần Bình Trỿng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (773, 115, N'image/25.jpg', N' CĂN HỘ DỊCH VỤ CAO CẤP 35M2, 2A/6 NGUYỄN THỊ MINH KHAI, QUẬN 1, LH 0915882307 MR. KHA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (774, 115, N'image/25.jpg', N' CĂN HỘ DỊCH VỤ CAO CẤP 35M2, 2A/6 NGUYỄN THỊ MINH KHAI, QUẬN 1, LH 0915882307 MR. KHA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (775, 115, N'image/25.jpg', N' CĂN HỘ DỊCH VỤ CAO CẤP 35M2, 2A/6 NGUYỄN THỊ MINH KHAI, QUẬN 1, LH 0915882307 MR. KHA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (776, 115, N'image/25.jpg', N' CĂN HỘ DỊCH VỤ CAO CẤP 35M2, 2A/6 NGUYỄN THỊ MINH KHAI, QUẬN 1, LH 0915882307 MR. KHA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (777, 115, N'image/25.jpg', N' CĂN HỘ DỊCH VỤ CAO CẤP 35M2, 2A/6 NGUYỄN THỊ MINH KHAI, QUẬN 1, LH 0915882307 MR. KHA ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (787, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (788, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (789, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (790, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (791, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (792, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (793, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (794, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (795, 117, N'image/27.jpg', N' CĂN HỘ VILLA ĿƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP, GẦN CHỢ SÂN BAY. LH: 0988007199 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (816, 123, N'image/3.jpg', N' KHÔNG GIAN SỿNG ĿẸP, THOÿNG MÿT,NGAY BÀ QUẸO,chỉ 2,5tr/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (817, 123, N'image/3.jpg', N' KHÔNG GIAN SỿNG ĿẸP, THOÿNG MÿT,NGAY BÀ QUẸO,chỉ 2,5tr/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (818, 123, N'image/3.jpg', N' KHÔNG GIAN SỿNG ĿẸP, THOÿNG MÿT,NGAY BÀ QUẸO,chỉ 2,5tr/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (819, 123, N'image/3.jpg', N' KHÔNG GIAN SỿNG ĿẸP, THOÿNG MÿT,NGAY BÀ QUẸO,chỉ 2,5tr/tháng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (828, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (829, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (830, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (831, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (832, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (833, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (834, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (835, 125, N'image/5.jpg', N' Tìm nữ ở ghép gỿn gàng, ngăn nắp tại Phưỿng 25, Quận Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (839, 127, N'image/7.jpg', N' Cho thuê phòng đẹp, nguyên lầu 2, có ban công gần Ŀầm Sen ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (840, 127, N'image/7.jpg', N' Cho thuê phòng đẹp, nguyên lầu 2, có ban công gần Ŀầm Sen ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (841, 127, N'image/7.jpg', N' Cho thuê phòng đẹp, nguyên lầu 2, có ban công gần Ŀầm Sen ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (887, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (888, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (889, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (890, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (891, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (892, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (893, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (894, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (895, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (896, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (897, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (898, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (899, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (900, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (901, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (902, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (903, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (904, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (905, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (906, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (907, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (908, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (909, 133, N'image/13.jpg', N' PHÒNG TRỌ SIÊU MINI, SANG CHẢNH, TIỆN NGHI TẠI ĿỀ THÿM Q1. 0982461659 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (915, 135, N'image/15.jpg', N' Cho thuê phòng cao cấp, đầy đủ tiện nghi, như căn hộ, ngay trung tâm Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (916, 135, N'image/15.jpg', N' Cho thuê phòng cao cấp, đầy đủ tiện nghi, như căn hộ, ngay trung tâm Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (917, 135, N'image/15.jpg', N' Cho thuê phòng cao cấp, đầy đủ tiện nghi, như căn hộ, ngay trung tâm Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (918, 135, N'image/15.jpg', N' Cho thuê phòng cao cấp, đầy đủ tiện nghi, như căn hộ, ngay trung tâm Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (919, 135, N'image/15.jpg', N' Cho thuê phòng cao cấp, đầy đủ tiện nghi, như căn hộ, ngay trung tâm Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (925, 137, N'image/17.jpg', N' Cho thuê phòng trỿ đầy đủ nội thất, đưỿng 3/2, khu Kỳ Hòa, Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (926, 137, N'image/17.jpg', N' Cho thuê phòng trỿ đầy đủ nội thất, đưỿng 3/2, khu Kỳ Hòa, Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (927, 137, N'image/17.jpg', N' Cho thuê phòng trỿ đầy đủ nội thất, đưỿng 3/2, khu Kỳ Hòa, Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (928, 137, N'image/17.jpg', N' Cho thuê phòng trỿ đầy đủ nội thất, đưỿng 3/2, khu Kỳ Hòa, Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (929, 137, N'image/17.jpg', N' Cho thuê phòng trỿ đầy đủ nội thất, đưỿng 3/2, khu Kỳ Hòa, Quận 10 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (948, 141, N'image/21.jpg', N' PHÒNG TRỌ CƯC ĿẸP KHU VỰC TÂN BÌNH HOÀNG HOA THÿM, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (949, 141, N'image/21.jpg', N' PHÒNG TRỌ CƯC ĿẸP KHU VỰC TÂN BÌNH HOÀNG HOA THÿM, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (950, 141, N'image/21.jpg', N' PHÒNG TRỌ CƯC ĿẸP KHU VỰC TÂN BÌNH HOÀNG HOA THÿM, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (951, 141, N'image/21.jpg', N' PHÒNG TRỌ CƯC ĿẸP KHU VỰC TÂN BÌNH HOÀNG HOA THÿM, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (952, 141, N'image/21.jpg', N' PHÒNG TRỌ CƯC ĿẸP KHU VỰC TÂN BÌNH HOÀNG HOA THÿM, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (953, 141, N'image/21.jpg', N' PHÒNG TRỌ CƯC ĿẸP KHU VỰC TÂN BÌNH HOÀNG HOA THÿM, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (962, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (963, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (964, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (965, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (966, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (967, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (968, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (969, 143, N'image/23.jpg', N' PHÒNG TRỌ MỚI XÂY – BẠN LÀ NGƯỜI ĿẦU TIÊN DỌN ĿẾN ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (976, 145, N'image/25.jpg', N' Cho thuê phòng trỿ đầy đủ tiện nghi, ngay trung tâm, 115/44 Trần Ŀình Xu, Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (977, 145, N'image/25.jpg', N' Cho thuê phòng trỿ đầy đủ tiện nghi, ngay trung tâm, 115/44 Trần Ŀình Xu, Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (978, 145, N'image/25.jpg', N' Cho thuê phòng trỿ đầy đủ tiện nghi, ngay trung tâm, 115/44 Trần Ŀình Xu, Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (979, 145, N'image/25.jpg', N' Cho thuê phòng trỿ đầy đủ tiện nghi, ngay trung tâm, 115/44 Trần Ŀình Xu, Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (980, 145, N'image/25.jpg', N' Cho thuê phòng trỿ đầy đủ tiện nghi, ngay trung tâm, 115/44 Trần Ŀình Xu, Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (981, 145, N'image/25.jpg', N' Cho thuê phòng trỿ đầy đủ tiện nghi, ngay trung tâm, 115/44 Trần Ŀình Xu, Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (987, 147, N'image/27.jpg', N' Cho thuê căn hộ mini tại 54 Ŀặng Dung, Phưỿng Tân Ŀịnh, Quận 1, Hồ Chí Minh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (988, 147, N'image/27.jpg', N' Cho thuê căn hộ mini tại 54 Ŀặng Dung, Phưỿng Tân Ŀịnh, Quận 1, Hồ Chí Minh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (989, 147, N'image/27.jpg', N' Cho thuê căn hộ mini tại 54 Ŀặng Dung, Phưỿng Tân Ŀịnh, Quận 1, Hồ Chí Minh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (990, 147, N'image/27.jpg', N' Cho thuê căn hộ mini tại 54 Ŀặng Dung, Phưỿng Tân Ŀịnh, Quận 1, Hồ Chí Minh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (991, 147, N'image/27.jpg', N' Cho thuê căn hộ mini tại 54 Ŀặng Dung, Phưỿng Tân Ŀịnh, Quận 1, Hồ Chí Minh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1010, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1011, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1012, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1013, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
GO
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1014, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1015, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1016, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1017, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1018, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1019, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1020, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1021, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1022, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1023, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1024, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1025, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1026, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1027, 149, N'image/29.jpg', N' Chính chủ cho ngưỿi nước ngoài, Việt Nam thuê căn hộ dịch vụ cao cấp tại Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1028, 150, N'image/0.jpg', N' Phòng nhà biệt thự, tự do giỿ giấc 58/96/3 Phan Chu Trinh p.24 Q.Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1029, 150, N'image/0.jpg', N' Phòng nhà biệt thự, tự do giỿ giấc 58/96/3 Phan Chu Trinh p.24 Q.Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1030, 150, N'image/0.jpg', N' Phòng nhà biệt thự, tự do giỿ giấc 58/96/3 Phan Chu Trinh p.24 Q.Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1031, 150, N'image/0.jpg', N' Phòng nhà biệt thự, tự do giỿ giấc 58/96/3 Phan Chu Trinh p.24 Q.Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1032, 150, N'image/0.jpg', N' Phòng nhà biệt thự, tự do giỿ giấc 58/96/3 Phan Chu Trinh p.24 Q.Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1038, 152, N'image/2.jpg', N' Căn hộ mini đầy đủ nội thất mặt tiỿn Võ Văn kiệt ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1039, 152, N'image/2.jpg', N' Căn hộ mini đầy đủ nội thất mặt tiỿn Võ Văn kiệt ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1040, 152, N'image/2.jpg', N' Căn hộ mini đầy đủ nội thất mặt tiỿn Võ Văn kiệt ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1041, 152, N'image/2.jpg', N' Căn hộ mini đầy đủ nội thất mặt tiỿn Võ Văn kiệt ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1046, 154, N'image/4.jpg', N' Căn hộ đầy đủ nội thất ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1047, 154, N'image/4.jpg', N' Căn hộ đầy đủ nội thất ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1048, 154, N'image/4.jpg', N' Căn hộ đầy đủ nội thất ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1049, 154, N'image/4.jpg', N' Căn hộ đầy đủ nội thất ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1060, 158, N'image/8.jpg', N' Nhà trỿ chung cư mini giỿ tự do, 22m2 – 35m2, giỿ giấc tự do, an ninh tốt ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1061, 158, N'image/8.jpg', N' Nhà trỿ chung cư mini giỿ tự do, 22m2 – 35m2, giỿ giấc tự do, an ninh tốt ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1083, 164, N'image/14.jpg', N' Phòng trỿ mới sạch thoáng, an ninh, giá chỉ 2.5 triệu, Quận 5, ngay đại hỿc Kinh tế, dự bị, sư phạm ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1092, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1093, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1094, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1095, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1096, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1097, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1098, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1099, 166, N'image/16.jpg', N' CHO THUÊ PHÒNG CAO CẤP QUẬN 1, ĿẦY ĿỦ NỘI THẤT, TỰ DO, AN NINH, LH: 0994968682 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1106, 168, N'image/18.jpg', N' Căn hộ mini đẹp, thoáng mát, full nội thất, mặt tiỿn Trưỿng Sa. Sát Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1107, 168, N'image/18.jpg', N' Căn hộ mini đẹp, thoáng mát, full nội thất, mặt tiỿn Trưỿng Sa. Sát Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1108, 168, N'image/18.jpg', N' Căn hộ mini đẹp, thoáng mát, full nội thất, mặt tiỿn Trưỿng Sa. Sát Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1109, 168, N'image/18.jpg', N' Căn hộ mini đẹp, thoáng mát, full nội thất, mặt tiỿn Trưỿng Sa. Sát Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1110, 168, N'image/18.jpg', N' Căn hộ mini đẹp, thoáng mát, full nội thất, mặt tiỿn Trưỿng Sa. Sát Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1111, 168, N'image/18.jpg', N' Căn hộ mini đẹp, thoáng mát, full nội thất, mặt tiỿn Trưỿng Sa. Sát Quận 1 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1116, 170, N'image/20.jpg', N' Phòng mini, cao cấp, sạch sẽ, thoáng mát. Gần VINCOM Gò Vấp ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1117, 170, N'image/20.jpg', N' Phòng mini, cao cấp, sạch sẽ, thoáng mát. Gần VINCOM Gò Vấp ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1118, 170, N'image/20.jpg', N' Phòng mini, cao cấp, sạch sẽ, thoáng mát. Gần VINCOM Gò Vấp ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1119, 170, N'image/20.jpg', N' Phòng mini, cao cấp, sạch sẽ, thoáng mát. Gần VINCOM Gò Vấp ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1124, 172, N'image/22.jpg', N' Phòng mini giá rẻ, có máy lạnh, thoáng mát, an ninh. Trung tâm Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1125, 172, N'image/22.jpg', N' Phòng mini giá rẻ, có máy lạnh, thoáng mát, an ninh. Trung tâm Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1126, 172, N'image/22.jpg', N' Phòng mini giá rẻ, có máy lạnh, thoáng mát, an ninh. Trung tâm Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1127, 172, N'image/22.jpg', N' Phòng mini giá rẻ, có máy lạnh, thoáng mát, an ninh. Trung tâm Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1133, 176, N'image/26.jpg', N' Cho thuê phòng dạng ký túc xá cho sinh viên và ngưỿi mới đi làm có thu nhập thấp, chỉ với 1tr/ngưỿi ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1134, 176, N'image/26.jpg', N' Cho thuê phòng dạng ký túc xá cho sinh viên và ngưỿi mới đi làm có thu nhập thấp, chỉ với 1tr/ngưỿi ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1135, 176, N'image/26.jpg', N' Cho thuê phòng dạng ký túc xá cho sinh viên và ngưỿi mới đi làm có thu nhập thấp, chỉ với 1tr/ngưỿi ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1136, 176, N'image/26.jpg', N' Cho thuê phòng dạng ký túc xá cho sinh viên và ngưỿi mới đi làm có thu nhập thấp, chỉ với 1tr/ngưỿi ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1137, 176, N'image/26.jpg', N' Cho thuê phòng dạng ký túc xá cho sinh viên và ngưỿi mới đi làm có thu nhập thấp, chỉ với 1tr/ngưỿi ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1142, 178, N'image/28.jpg', N' PHÒNG CHO THUÊ NHÀ MỚI XÂY, CÓ KỆ BẾP NẤU ĂN ĿẦY ĿỦ TIỆN NGHI, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1143, 178, N'image/28.jpg', N' PHÒNG CHO THUÊ NHÀ MỚI XÂY, CÓ KỆ BẾP NẤU ĂN ĿẦY ĿỦ TIỆN NGHI, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1144, 178, N'image/28.jpg', N' PHÒNG CHO THUÊ NHÀ MỚI XÂY, CÓ KỆ BẾP NẤU ĂN ĿẦY ĿỦ TIỆN NGHI, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1145, 178, N'image/28.jpg', N' PHÒNG CHO THUÊ NHÀ MỚI XÂY, CÓ KỆ BẾP NẤU ĂN ĿẦY ĿỦ TIỆN NGHI, BẢO VỆ 24/24 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1150, 180, N'image/0.jpg', N' ÔI, PHÒNG SANG TRỌNG CÓ BẾP TRONG PHÒNG GIÿ RẺ NGAY ÚT TỊCH CHO THUÊ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1151, 180, N'image/0.jpg', N' ÔI, PHÒNG SANG TRỌNG CÓ BẾP TRONG PHÒNG GIÿ RẺ NGAY ÚT TỊCH CHO THUÊ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1152, 180, N'image/0.jpg', N' ÔI, PHÒNG SANG TRỌNG CÓ BẾP TRONG PHÒNG GIÿ RẺ NGAY ÚT TỊCH CHO THUÊ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1153, 180, N'image/0.jpg', N' ÔI, PHÒNG SANG TRỌNG CÓ BẾP TRONG PHÒNG GIÿ RẺ NGAY ÚT TỊCH CHO THUÊ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1163, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1164, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1165, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1166, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1167, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1168, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1169, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1170, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1171, 182, N'image/2.jpg', N' PHÒNG ĿẦY ĿỦ NỘI THẤT NHƯ CHUNG CƯ CAO CẤP CHO THUÊ GIÿ BÌNH DÂN, RỘNG RÃI, MỚI 100% ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1192, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1193, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1194, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1195, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1196, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1197, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1198, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1199, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1200, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1201, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1202, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1203, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1204, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1205, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1206, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1207, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1208, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1209, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1210, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1211, 184, N'image/4.jpg', N' Nhà trỿ cao cấp giá bình dân GHPLUS ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1220, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1221, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1222, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1223, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1224, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1225, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
GO
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1226, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1227, 186, N'image/6.jpg', N' Căn hộ dịch vụ ngay Coopmart Phan Văn Trị ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1230, 188, N'image/8.jpg', N' NHÀ NGUYÊN CĂN (54 m2) – SẠCH SẼ, CÓ SÂN MÿT, KHU VỰC TRỒNG RAU, ĿƯỜNG GÒ CÿT, Q.9 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1231, 188, N'image/8.jpg', N' NHÀ NGUYÊN CĂN (54 m2) – SẠCH SẼ, CÓ SÂN MÿT, KHU VỰC TRỒNG RAU, ĿƯỜNG GÒ CÿT, Q.9 ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1236, 190, N'image/10.jpg', N' Phòng Cho Thuê Lầu Ŀút Có Gác ở Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1237, 190, N'image/10.jpg', N' Phòng Cho Thuê Lầu Ŀút Có Gác ở Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1238, 190, N'image/10.jpg', N' Phòng Cho Thuê Lầu Ŀút Có Gác ở Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1239, 190, N'image/10.jpg', N' Phòng Cho Thuê Lầu Ŀút Có Gác ở Bình Thạnh ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1251, 196, N'image/16.jpg', N' Phòng cho thuê đầy đủ tiện nghi, có hầm giữ xe, bv 24/24, bếp nấu ăn trong phòng giá từ 4tr (ngay cầu Nguyễn Văn Cừ) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1252, 196, N'image/16.jpg', N' Phòng cho thuê đầy đủ tiện nghi, có hầm giữ xe, bv 24/24, bếp nấu ăn trong phòng giá từ 4tr (ngay cầu Nguyễn Văn Cừ) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1253, 196, N'image/16.jpg', N' Phòng cho thuê đầy đủ tiện nghi, có hầm giữ xe, bv 24/24, bếp nấu ăn trong phòng giá từ 4tr (ngay cầu Nguyễn Văn Cừ) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1254, 196, N'image/16.jpg', N' Phòng cho thuê đầy đủ tiện nghi, có hầm giữ xe, bv 24/24, bếp nấu ăn trong phòng giá từ 4tr (ngay cầu Nguyễn Văn Cừ) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1255, 196, N'image/16.jpg', N' Phòng cho thuê đầy đủ tiện nghi, có hầm giữ xe, bv 24/24, bếp nấu ăn trong phòng giá từ 4tr (ngay cầu Nguyễn Văn Cừ) ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1262, 198, N'image/18.jpg', N' cho thuê phòng rộng thoáng ngay mặt tiỿn viêu đẹp thang máy, sàn gỗ gần công viên có bếp toile giêng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1263, 198, N'image/18.jpg', N' cho thuê phòng rộng thoáng ngay mặt tiỿn viêu đẹp thang máy, sàn gỗ gần công viên có bếp toile giêng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1264, 198, N'image/18.jpg', N' cho thuê phòng rộng thoáng ngay mặt tiỿn viêu đẹp thang máy, sàn gỗ gần công viên có bếp toile giêng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1265, 198, N'image/18.jpg', N' cho thuê phòng rộng thoáng ngay mặt tiỿn viêu đẹp thang máy, sàn gỗ gần công viên có bếp toile giêng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1266, 198, N'image/18.jpg', N' cho thuê phòng rộng thoáng ngay mặt tiỿn viêu đẹp thang máy, sàn gỗ gần công viên có bếp toile giêng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1267, 198, N'image/18.jpg', N' cho thuê phòng rộng thoáng ngay mặt tiỿn viêu đẹp thang máy, sàn gỗ gần công viên có bếp toile giêng ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1313, 4, N'image/4.jpg', N' Phòng 3,5tr ở được 5 ngưỿi tại Quận Tân Bình ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1314, 4, N'image/5.jpg', N' Phòng 3,5tr ở được 5 ngưỿi tại Quận Tân Bình ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1315, 4, N'image/10.jpg', N' Phòng 3,5tr ở được 5 ngưỿi tại Quận Tân Bình ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1323, 199, N'', N' 1113Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1331, 202, N'', N'', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1340, 38, N'image/8.jpg', N' PHÒNG ĿẸP NGAY KDC TRUNG SƠN GẦN LOTTE MART Q.7 & CÿC TRƯỜNG ĿH LỚN: RMIT, TÔN ĿỨC THẮNG, MAKETING. GIÿ-3,7T ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1341, 38, N'image/8.jpg', N' PHÒNG ĿẸP NGAY KDC TRUNG SƠN GẦN LOTTE MART Q.7 & CÿC TRƯỜNG ĿH LỚN: RMIT, TÔN ĿỨC THẮNG, MAKETING. GIÿ-3,7T ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1342, 38, N'image/8.jpg', N' PHÒNG ĿẸP NGAY KDC TRUNG SƠN GẦN LOTTE MART Q.7 & CÿC TRƯỜNG ĿH LỚN: RMIT, TÔN ĿỨC THẮNG, MAKETING. GIÿ-3,7T ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1343, 38, N'image/8.jpg', N' PHÒNG ĿẸP NGAY KDC TRUNG SƠN GẦN LOTTE MART Q.7 & CÿC TRƯỜNG ĿH LỚN: RMIT, TÔN ĿỨC THẮNG, MAKETING. GIÿ-3,7T ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1344, 38, N'image/8.jpg', N' PHÒNG ĿẸP NGAY KDC TRUNG SƠN GẦN LOTTE MART Q.7 & CÿC TRƯỜNG ĿH LỚN: RMIT, TÔN ĿỨC THẮNG, MAKETING. GIÿ-3,7T ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (1345, 38, N'image/8.jpg', N' PHÒNG ĿẸP NGAY KDC TRUNG SƠN GẦN LOTTE MART Q.7 & CÿC TRƯỜNG ĿH LỚN: RMIT, TÔN ĿỨC THẮNG, MAKETING. GIÿ-3,7T ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (2345, 203, N'', N'kindOf kindOf kindOf kindOf', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (2349, 201, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (2350, 200, N'image/4.jpg', N'asasdads asdasd asdadas a ádasdadad', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (2351, 200, N'image/5.jpg', N'asasdads asdasd asdadas a ádasdadad', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (2352, 200, N'image/10.jpg', N'asasdads asdasd asdadas a ádasdadad', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3347, 207, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3348, 208, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3349, 209, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3350, 210, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3351, 211, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3353, 213, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3354, 214, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3355, 215, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3356, 216, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3357, 217, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3359, 212, N'', N'[TÌM] Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3363, 218, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3364, 219, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3365, 220, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3366, 221, N'', N'Baif vieets thws as asdjknas anasd asnasdk a', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3368, 222, N'', N'TÌm phòng ở đà nẵng ngũ hành sơn sửa', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3369, 223, N'image/7.jpg', N'CĂN HỘ MINI MỚI XÂY, SẠCH SẼ, AN NINH', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3370, 223, N'image/8.jpg', N'CĂN HỘ MINI MỚI XÂY, SẠCH SẼ, AN NINH', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3371, 223, N'image/9.jpg', N'CĂN HỘ MINI MỚI XÂY, SẠCH SẼ, AN NINH', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3372, 224, N'image/10.jpg', N'CHO THUÊ CĂN HỘ CAO CẤP QUẬN NGŨ HÀNH SƠN THOÁNG MÁT, ĐẦY ĐỦ TIỆN NGHI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3373, 224, N'image/11.jpg', N'CHO THUÊ CĂN HỘ CAO CẤP QUẬN NGŨ HÀNH SƠN THOÁNG MÁT, ĐẦY ĐỦ TIỆN NGHI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3374, 224, N'image/12.jpg', N'CHO THUÊ CĂN HỘ CAO CẤP QUẬN NGŨ HÀNH SƠN THOÁNG MÁT, ĐẦY ĐỦ TIỆN NGHI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3375, 225, N'image/10.jpg', N'CHO THUÊ CĂN HỘ CAO CẤP QUẬN NGŨ HÀNH SƠN THOÁNG MÁT, ĐẦY ĐỦ TIỆN NGHI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3376, 225, N'image/11.jpg', N'CHO THUÊ CĂN HỘ CAO CẤP QUẬN NGŨ HÀNH SƠN THOÁNG MÁT, ĐẦY ĐỦ TIỆN NGHI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3377, 225, N'image/12.jpg', N'CHO THUÊ CĂN HỘ CAO CẤP QUẬN NGŨ HÀNH SƠN THOÁNG MÁT, ĐẦY ĐỦ TIỆN NGHI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3381, 227, N'image/18.jpg', N'CĂN HỘ ĐẦY ĐỦ TIỆN NGHI NGAY CHỢ NON NƯỚC', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3382, 227, N'image/19.jpg', N'CĂN HỘ ĐẦY ĐỦ TIỆN NGHI NGAY CHỢ NON NƯỚC', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3383, 227, N'image/20.jpg', N'CĂN HỘ ĐẦY ĐỦ TIỆN NGHI NGAY CHỢ NON NƯỚC', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3392, 232, N'image/9.jpg', N'Tìm nữ ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3393, 232, N' image/10.jpg', N'Tìm nữ ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3394, 232, N' image/11.jpg', N'Tìm nữ ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3398, 235, N'image/21.jpg', N'CĂN HỘ DOANH NHÂN SANG SẠCH ĐẸP, YÊN TĨNH, SÁT CÔNG VIÊN', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3399, 235, N'image/22.jpg', N'CĂN HỘ DOANH NHÂN SANG SẠCH ĐẸP, YÊN TĨNH, SÁT CÔNG VIÊN', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3400, 235, N'image/23.jpg', N'CĂN HỘ DOANH NHÂN SANG SẠCH ĐẸP, YÊN TĨNH, SÁT CÔNG VIÊN', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3401, 234, N'image/12.jpg', N'Tìm nữ ở ghép chung cư', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3402, 234, N' image/13.jpg', N'Tìm nữ ở ghép chung cư', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3403, 234, N' image/14.jpg', N'Tìm nữ ở ghép chung cư', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3404, 236, N'image/25.jpg', N'CĂN HỘ ĐẸP , NỘI THẤT 5 SAO, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24, GẦN COOP MART', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3405, 236, N'image/26.jpg', N'CĂN HỘ ĐẸP , NỘI THẤT 5 SAO, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24, GẦN COOP MART', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3406, 236, N'image/27.jpg', N'CĂN HỘ ĐẸP , NỘI THẤT 5 SAO, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24, GẦN COOP MART', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3407, 237, N'image/29.jpg', N'CĂN HỘ CAO CẤP CHO THUÊ, CÓ BẾP, MÁY GIẶT, RỘNG RÃI, GIỜ GIẤC TỰ DO. LH: 009.670.9877', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3408, 237, N'image/30.jpg', N'CĂN HỘ CAO CẤP CHO THUÊ, CÓ BẾP, MÁY GIẶT, RỘNG RÃI, GIỜ GIẤC TỰ DO. LH: 009.670.9877', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3409, 237, N'image/31.jpg', N'CĂN HỘ CAO CẤP CHO THUÊ, CÓ BẾP, MÁY GIẶT, RỘNG RÃI, GIỜ GIẤC TỰ DO. LH: 009.670.9877', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3410, 228, N'image/2.jpg', N'Tìm nam ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3411, 230, N'image/6.jpg', N'Tìm người ở ghép ở Sơn Tịnh', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3412, 230, N' image/7.jpg', N'Tìm người ở ghép ở Sơn Tịnh', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3413, 230, N' image/8.jpg', N'Tìm người ở ghép ở Sơn Tịnh', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3414, 238, N'image/33.jpg', N'CHÍNH CHỦ CHO THUÊ CĂN HỘ MINI NGAY BỜ KÈ, GẦN CHỢ NON NƯỚC, VỊ TRÍ CỰC TỐT, CÓ BẾP, TỰ DO', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3415, 238, N'image/34.jpg', N'CHÍNH CHỦ CHO THUÊ CĂN HỘ MINI NGAY BỜ KÈ, GẦN CHỢ NON NƯỚC, VỊ TRÍ CỰC TỐT, CÓ BẾP, TỰ DO', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3416, 238, N'image/35.jpg', N'CHÍNH CHỦ CHO THUÊ CĂN HỘ MINI NGAY BỜ KÈ, GẦN CHỢ NON NƯỚC, VỊ TRÍ CỰC TỐT, CÓ BẾP, TỰ DO', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3418, 240, N'image/37.jpg', N'CHO THUÊ CĂN HỘ MINI DÀNH CHO HỘ GIA ĐÌNH, NHÂN VIÊN VĂN PHÒNG, SINH VIÊN', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3419, 240, N'image/38.jpg', N'CHO THUÊ CĂN HỘ MINI DÀNH CHO HỘ GIA ĐÌNH, NHÂN VIÊN VĂN PHÒNG, SINH VIÊN', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3420, 240, N'image/39.jpg', N'CHO THUÊ CĂN HỘ MINI DÀNH CHO HỘ GIA ĐÌNH, NHÂN VIÊN VĂN PHÒNG, SINH VIÊN', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3422, 242, N'image/41.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU, ĐƯỜNG GÒ CÁT', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3423, 242, N'image/42.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU, ĐƯỜNG GÒ CÁT', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3424, 242, N'image/43.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU, ĐƯỜNG GÒ CÁT', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3429, 244, N'image/45.jpg', N'NHÀ NGUYÊN CĂN CHO THUÊ GẦN NGÃ TƯ HÀNG XANH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3430, 244, N'image/46.jpg', N'NHÀ NGUYÊN CĂN CHO THUÊ GẦN NGÃ TƯ HÀNG XANH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3431, 244, N'image/47.jpg', N'NHÀ NGUYÊN CĂN CHO THUÊ GẦN NGÃ TƯ HÀNG XANH ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3433, 246, N'image/19.jpg', N'Tìm 1 nữ ở ghép ưu tiên sinh viên', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3434, 246, N' image/20.jpg', N'Tìm 1 nữ ở ghép ưu tiên sinh viên', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3435, 246, N' image/21.jpg', N'Tìm 1 nữ ở ghép ưu tiên sinh viên', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3436, 247, N'image/45.jpg', N'CHO THUÊ NHÀ NGUYÊN CĂN MỚI, THOÁNG MÁT,SẠCH ĐẸP, AN NINH', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3437, 247, N'image/46.jpg', N'CHO THUÊ NHÀ NGUYÊN CĂN MỚI, THOÁNG MÁT,SẠCH ĐẸP, AN NINH', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3438, 247, N'image/47.jpg', N'CHO THUÊ NHÀ NGUYÊN CĂN MỚI, THOÁNG MÁT,SẠCH ĐẸP, AN NINH', 0)
GO
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3439, 248, N'image/48.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN, LÊ VĂN LƯƠNG, NGUYỄN BÌNH, NHÀ BÈ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3440, 248, N'image/49.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN, LÊ VĂN LƯƠNG, NGUYỄN BÌNH, NHÀ BÈ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3441, 248, N'image/50.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN, LÊ VĂN LƯƠNG, NGUYỄN BÌNH, NHÀ BÈ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3445, 239, N'', N'Cần phòng ở ghép cho nam', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3446, 241, N'image/11.jpg', N'Tìm phòng ở ghép 2 nữ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3447, 241, N' image/25.jpg', N'Tìm phòng ở ghép 2 nữ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3448, 241, N' image/26.jpg', N'Tìm phòng ở ghép 2 nữ ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3449, 243, N'image/14.jpg', N'Tìm 1 Nam ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3450, 243, N'image/15.jpg', N'Tìm 1 Nam ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3451, 243, N' image/16.jpg', N'Tìm 1 Nam ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3452, 245, N'image/26.jpg', N'Tìm 1 bạn nữ ở ghép ưu tiên nhân viên văn phòng, sinh viên', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3453, 245, N' image/27.jpg', N'Tìm 1 bạn nữ ở ghép ưu tiên nhân viên văn phòng, sinh viên', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3454, 245, N' image/28.jpg', N'Tìm 1 bạn nữ ở ghép ưu tiên nhân viên văn phòng, sinh viên', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3455, 249, N'image/23.jpg', N'Tìm 2 nam ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3456, 249, N' image/24.jpg', N'Tìm 2 nam ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3457, 249, N' image/25.jpg', N'Tìm 2 nam ở ghép', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3459, 251, N'image/53.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN RẤT ĐẸP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3460, 251, N'image/54.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN RẤT ĐẸP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3461, 251, N'', N'NHÀ CHO THUÊ NGUYÊN CĂN RẤT ĐẸP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3462, 251, N'image/55.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN RẤT ĐẸP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3463, 251, N'image/56.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN RẤT ĐẸP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3467, 252, N'image/28.jpg', N'Cho thuê mặt bằng ở Đà Nẵng', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3468, 252, N' image/29.jpg', N'Cho thuê mặt bằng ở Đà Nẵng', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3469, 252, N' image/30.jpg', N'Cho thuê mặt bằng ở Đà Nẵng', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3470, 253, N'', N'User 29 đi tìm, cần gửi đến 30', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3471, 226, N'image/14.jpg', N'CĂN HỘ VILLA ĐƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3472, 226, N'image/15.jpg', N'CĂN HỘ VILLA ĐƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3473, 226, N'image/16.jpg', N'CĂN HỘ VILLA ĐƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3474, 254, N'image/30.jpg', N'Cho thuê mặt bằng rộng dễ buôn bán', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3475, 254, N' image/31.jpg', N'Cho thuê mặt bằng rộng dễ buôn bán', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3476, 254, N' image/32.jpg', N'Cho thuê mặt bằng rộng dễ buôn bán', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3477, 229, N'image/18.jpg', N'CĂN HỘ 55M2, LẦU 10 CHUNG CƯ KHANG GIA, TÂN HƯƠNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3478, 229, N'image/19.jpg', N'CĂN HỘ 55M2, LẦU 10 CHUNG CƯ KHANG GIA, TÂN HƯƠNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3479, 229, N'image/20.jpg', N'CĂN HỘ 55M2, LẦU 10 CHUNG CƯ KHANG GIA, TÂN HƯƠNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3481, 250, N'', N'User 29 cho thuê phòng trọ, khác 29 mới được gợi ý', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3482, 255, N'', N'User 29 cho thuê, không hiện bài của 29 mới đúng', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3486, 256, N'image/35.jpg', N'Cho thuê mặt bằng trung tâm thành phố', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3487, 256, N' image/36.jpg', N'Cho thuê mặt bằng trung tâm thành phố', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3488, 256, N' image/37.jpg', N'Cho thuê mặt bằng trung tâm thành phố', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3490, 258, N'image/40.jpg', N'Cần tìm mặt bằng rộng để buôn bán', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3491, 258, N' image/41.jpg', N'Cần tìm mặt bằng rộng để buôn bán', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3492, 258, N' image/42.jpg', N'Cần tìm mặt bằng rộng để buôn bán', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3493, 259, N'image/43.jpg', N'Cho thuê mặt bằng mở quán cafe', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3494, 259, N' image/44.jpg', N'Cho thuê mặt bằng mở quán cafe', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3495, 259, N' image/45.jpg', N'Cho thuê mặt bằng mở quán cafe', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3496, 257, N'', N'User 29 cho thuê, cần gửi đến khác 29', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3497, 260, N'', N'Tôi  là user 29, đang cho thuê', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3498, 261, N'image/46.jpg ', N'Cho thuê mặt bằng rộng phong thủy tốt', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3499, 261, N' image/47.jpg', N'Cho thuê mặt bằng rộng phong thủy tốt', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3500, 261, N' image/48.jpg', N'Cho thuê mặt bằng rộng phong thủy tốt', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3501, 262, N'image/50.jpg', N'Cho thuê mặt bằng ở ngã tư', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3502, 262, N' image/51.jpg', N'Cho thuê mặt bằng ở ngã tư', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3503, 262, N' image/52.jpg', N'Cho thuê mặt bằng ở ngã tư', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3504, 263, N'image/53.jpg', N'Mặt bằng thuận lợi kinh doanh', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3505, 263, N'image/54.jpg ', N'Mặt bằng thuận lợi kinh doanh', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3506, 263, N' image/55.jpg', N'Mặt bằng thuận lợi kinh doanh', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3507, 264, N'image/57.jpg', N'Cho thuê mặt bằng mở shop', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3508, 264, N' image/58.jpg', N'Cho thuê mặt bằng mở shop', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3509, 264, N' image/59.jpg', N'Cho thuê mặt bằng mở shop', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3510, 265, N'image/10.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN GIÁ RẺ 5TR/THÁNG,NGŨ HÀNH SƠN, HÒA HẢI, TP. ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3511, 265, N'image/11.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN GIÁ RẺ 5TR/THÁNG,NGŨ HÀNH SƠN, HÒA HẢI, TP. ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3512, 265, N' image/12.jpg', N'NHÀ CHO THUÊ NGUYÊN CĂN GIÁ RẺ 5TR/THÁNG,NGŨ HÀNH SƠN, HÒA HẢI, TP. ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3513, 269, N'', N'sssssssssssssssssssssssssssssssss', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3514, 267, N'image/4.jpg', N'CHO THUÊ NHÀ NGUYÊN CĂN 1 TRỆT, 2 LẦU, 1 SÂN THƯỢNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3515, 267, N'image/5.jpg', N'CHO THUÊ NHÀ NGUYÊN CĂN 1 TRỆT, 2 LẦU, 1 SÂN THƯỢNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3516, 267, N'image/6.jpg', N'CHO THUÊ NHÀ NGUYÊN CĂN 1 TRỆT, 2 LẦU, 1 SÂN THƯỢNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3517, 267, N'image/7.jpg', N'CHO THUÊ NHÀ NGUYÊN CĂN 1 TRỆT, 2 LẦU, 1 SÂN THƯỢNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3518, 277, N'', N'User 30 test không gợi ý cùng tài khoản nè', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3522, 58, N'image/21.jpg', N'NHÀ CHO THUÊ GIỜ GIẤC TỰ DO, BẾP NẤU ĂN TRONG PHÒNG, CÓ CHỖ ĐẬU XE THOẢI MÁI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3523, 58, N'image/22.jpg', N'NHÀ CHO THUÊ GIỜ GIẤC TỰ DO, BẾP NẤU ĂN TRONG PHÒNG, CÓ CHỖ ĐẬU XE THOẢI MÁI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3524, 58, N'image/23.jpg', N'NHÀ CHO THUÊ GIỜ GIẤC TỰ DO, BẾP NẤU ĂN TRONG PHÒNG, CÓ CHỖ ĐẬU XE THOẢI MÁI', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3525, 278, N'', N'User 30 đi tìm, cần gửi đến khác 30', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3526, 279, N'', N'User 30 đi tìm, cần gửi đến khác 30', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3527, 280, N'', N'uSER 30 TEST PUSHS TỚI 29', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3528, 281, N'', N'30 di push 29 30 di push 29', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3529, 282, N'image/10.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU KHU VỰC NGŨ HÀNH SƠN, TP ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3530, 282, N'image/11.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU KHU VỰC NGŨ HÀNH SƠN, TP ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3531, 282, N' image/12.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU KHU VỰC NGŨ HÀNH SƠN, TP ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3532, 282, N'image/15.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU KHU VỰC NGŨ HÀNH SƠN, TP ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3533, 282, N'image/16.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU KHU VỰC NGŨ HÀNH SƠN, TP ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3534, 282, N' image/22.jpg', N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU KHU VỰC NGŨ HÀNH SƠN, TP ĐÀ NẴNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3535, 283, N'', N'CẦN TÌM NHÀ NGUYÊN CĂN, GIÁ RẺ TỪ 2 TRIỆU-3 TRIỆU', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3536, 284, N'', N'CẦN TÌM PHÒNG TRỌ SINH VIÊN , GIÁ RẺ TỪ 500 NGHÌN - 1 TRIỆU', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3537, 285, N'image/4.jpg', N'PHÒNG TRỌ CAO CẤP, SẠCH RẺ, AN NINH GIÁ CHỈ TỪ 2TR500 ĐẾN 3TR', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3538, 285, N' image/17.jpg', N'PHÒNG TRỌ CAO CẤP, SẠCH RẺ, AN NINH GIÁ CHỈ TỪ 2TR500 ĐẾN 3TR', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3539, 285, N' image/11.jpg', N'PHÒNG TRỌ CAO CẤP, SẠCH RẺ, AN NINH GIÁ CHỈ TỪ 2TR500 ĐẾN 3TR', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3540, 285, N' image/10.jpg', N'PHÒNG TRỌ CAO CẤP, SẠCH RẺ, AN NINH GIÁ CHỈ TỪ 2TR500 ĐẾN 3TR', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3541, 285, N' image/12.jpg', N'PHÒNG TRỌ CAO CẤP, SẠCH RẺ, AN NINH GIÁ CHỈ TỪ 2TR500 ĐẾN 3TR', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3542, 285, N' image/13.jpg', N'PHÒNG TRỌ CAO CẤP, SẠCH RẺ, AN NINH GIÁ CHỈ TỪ 2TR500 ĐẾN 3TR', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3543, 286, N'image/4.jpg', N'PHÒNG TRỌ AN NINH, TIỆN NGHI, SẠCH SẼ GẦN FPT CITY', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3544, 286, N' image/17.jpg', N'PHÒNG TRỌ AN NINH, TIỆN NGHI, SẠCH SẼ GẦN FPT CITY', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3545, 286, N' image/11.jpg', N'PHÒNG TRỌ AN NINH, TIỆN NGHI, SẠCH SẼ GẦN FPT CITY', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3546, 286, N' image/10.jpg', N'PHÒNG TRỌ AN NINH, TIỆN NGHI, SẠCH SẼ GẦN FPT CITY', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3547, 286, N' image/12.jpg', N'PHÒNG TRỌ AN NINH, TIỆN NGHI, SẠCH SẼ GẦN FPT CITY', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3548, 286, N' image/13.jpg', N'PHÒNG TRỌ AN NINH, TIỆN NGHI, SẠCH SẼ GẦN FPT CITY', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3549, 287, N'image/4.jpg', N'PHÒNG TRỌ ĐẦY ĐỦ TIỆN NGHI GẦN CAO ĐẲNG CNTT', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3550, 287, N' image/7.jpg', N'PHÒNG TRỌ ĐẦY ĐỦ TIỆN NGHI GẦN CAO ĐẲNG CNTT', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3551, 287, N' image/11.jpg', N'PHÒNG TRỌ ĐẦY ĐỦ TIỆN NGHI GẦN CAO ĐẲNG CNTT', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3552, 288, N'image/4.jpg', N'PHÒNG TRỌ DÀNH CHO SINH VIÊN, NHÂN VIÊN VĂN PHÒNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3553, 288, N' image/7.jpg', N'PHÒNG TRỌ DÀNH CHO SINH VIÊN, NHÂN VIÊN VĂN PHÒNG', 0)
GO
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3554, 288, N' image/11.jpg', N'PHÒNG TRỌ DÀNH CHO SINH VIÊN, NHÂN VIÊN VĂN PHÒNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3555, 289, N'', N'CẦN TÌM PHÒNG TRỌ DÀNH CHO SINH VIÊN, HỌC SINH GẦN KTX CAO ĐẲNG VIỆT HÀN', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3556, 290, N'image/16.jpg', N'CHO THUÊ PHÒNG TRỌ ĐẸP,CÓ BẾP,BAN CÔNG RỘNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3557, 290, N' image/17.jpg', N'CHO THUÊ PHÒNG TRỌ ĐẸP,CÓ BẾP,BAN CÔNG RỘNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3558, 290, N' image/28.jpg', N'CHO THUÊ PHÒNG TRỌ ĐẸP,CÓ BẾP,BAN CÔNG RỘNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3559, 290, N' image/38.jpg', N'CHO THUÊ PHÒNG TRỌ ĐẸP,CÓ BẾP,BAN CÔNG RỘNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3560, 290, N'  image/48.jpg', N'CHO THUÊ PHÒNG TRỌ ĐẸP,CÓ BẾP,BAN CÔNG RỘNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3561, 290, N'  image/58.jpg', N'CHO THUÊ PHÒNG TRỌ ĐẸP,CÓ BẾP,BAN CÔNG RỘNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3562, 291, N'image/23.jpg', N'CHO THUÊ PHÒNG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU DÂN CƯ, GIÁ 2TR – 3TR/THÁNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3563, 291, N'image/34.jpg', N'CHO THUÊ PHÒNG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU DÂN CƯ, GIÁ 2TR – 3TR/THÁNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3564, 291, N'image/46.jpg', N'CHO THUÊ PHÒNG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU DÂN CƯ, GIÁ 2TR – 3TR/THÁNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3565, 291, N'image/21.jpg', N'CHO THUÊ PHÒNG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU DÂN CƯ, GIÁ 2TR – 3TR/THÁNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3566, 291, N'image/39.jpg', N'CHO THUÊ PHÒNG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU DÂN CƯ, GIÁ 2TR – 3TR/THÁNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3567, 291, N'image/40.jpg', N'CHO THUÊ PHÒNG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU DÂN CƯ, GIÁ 2TR – 3TR/THÁNG', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3568, 292, N'image/2.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3569, 292, N'image/3.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3570, 292, N'image/4.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3571, 292, N'image/15.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3572, 292, N'image/63.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3573, 292, N'image/24.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3574, 292, N'image/27.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3575, 292, N'image/31.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (3576, 292, N'image/42.jpg', N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4570, 293, N'', N'30 tim mmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4571, 294, N'', N' 111Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4572, 295, N'', N'User 30 đi tìm, cần gửi đến khác 30', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4574, 297, N'', N'dadasd dd asd as asdasd  asdasdasda  adasd', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4575, 298, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4576, 299, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4577, 300, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4578, 301, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4579, 302, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4580, 303, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4581, 304, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4582, 305, N'', N'asd asdasd as asd a adasda aasd a ad ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4583, 306, N'', N'price price price price price', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4584, 307, N'', N'<= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4585, 308, N'', N'5000000 5000000 5000000 50000005000000 5000000 5000000 5000000', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4586, 309, N'', N'on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.scor ', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4587, 310, N'', N'on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.scor', 0)
INSERT [dbo].[Image] ([imageId], [threadId], [src], [content], [image360]) VALUES (4588, 311, N'', N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', 0)
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (36, 264, 4107, 10, 7, N'<b>User 1</b> đã đánh giá về bài viết của bạn', CAST(0x0000A745010F96C1 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (37, 259, 4108, 9, 7, N'<b>User 1</b> đã đánh giá về bài viết của bạn', CAST(0x0000A745010FE2F9 AS DateTime), 1)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (38, 259, 4109, 9, 7, N'<b>User 1</b> đã đánh giá về bài viết của bạn', CAST(0x0000A745010FF315 AS DateTime), 1)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (39, 256, 4112, 9, 13, N'<b>User 7</b> đã đánh giá về bài viết của bạn', CAST(0x0000A745011C2495 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (40, 296, NULL, 35, 36, N'<b>User 30</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A745013AD221 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (41, 297, NULL, 35, 36, N'<b>User 30</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A745013B1037 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (42, 308, NULL, 35, 36, N'<b>User 30</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A7450147C4D6 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (43, 309, NULL, 35, 33, N'<b>User 27</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A74501495A9B AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (44, 310, NULL, 35, 34, N'<b>User 28</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A7450149D588 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (45, 311, NULL, 33, 34, N'<b>User 28</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A745014AB250 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (46, 311, NULL, 35, 34, N'<b>User 28</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A745014AB255 AS DateTime), NULL)
INSERT [dbo].[Notification] ([notificationId], [threadId], [rateId], [accountId], [accountIdPush], [content], [created], [status]) VALUES (47, 311, NULL, 36, 34, N'<b>User 28</b> đã đánh đăng bài phù hợp với bài viết của bạn', CAST(0x0000A745014AB25A AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Notification] OFF
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([provinceId], [name]) VALUES (1, N'Quảng Ngãi')
INSERT [dbo].[Province] ([provinceId], [name]) VALUES (2, N'Ðà Nẵng')
SET IDENTITY_INSERT [dbo].[Province] OFF
SET IDENTITY_INSERT [dbo].[Rate] ON 

INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3078, 6, 2, N'chất lương phòng rất tốt, đúng như mô tả', 1, CAST(0x0000A73C009D4E50 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3079, 30, 2, N'dasdad asdasd ádasdasdasdasd', 1, CAST(0x0000A73C00A8BC7C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3080, 30, 2, N'aadsasd asdasdas âsdasdasdasđ ádasd', 4, CAST(0x0000A73C00A8D9C8 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3081, 30, 2, N'sdsđ asdasd sadasd asasda asd ád', 1, CAST(0x0000A73C00A90074 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3082, 30, 1, N'fsdff sdsdfsd  sdfsdf sfsfsdfs sdf', 4, CAST(0x0000A73C00A9FD94 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3083, 30, 2, N'12312 123 123121 12 12312 12', 5, CAST(0x0000A73C00AA175C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3084, 125, 2, N'sdfdfsdfb fkh sd  dfksdfk  kjf sdkjf s fsdf', 5, CAST(0x0000A73C00ACEA68 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3085, 125, 1, N'dasdasd  ajh a akjas adkjask  akj ák', 5, CAST(0x0000A73C00AD2F8C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3086, 6, 1, N'ok tôi, tôi rất hài lòng', 5, CAST(0x0000A73C00BBDA3C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3087, 6, 1, N'Chất lượng tương đối tót, đường xá đi lại hơi khó khăn', 3, CAST(0x0000A73C00BBF080 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3088, 6, 2, N'Tuyệt vời, phòng trọ rất tốt', 5, CAST(0x0000A73C00BC0A48 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3089, 6, 1, N'fsds fsfsdfsdfsdfdfsfsdfsdfsdfsdf', 4, CAST(0x0000A73D008825E8 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3090, 19, 1, N'bskusbdfi asdasd   a ad   asdkas dasdasd', 3, CAST(0x0000A73D008A2280 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3091, 19, 1, N'flfksdfbk  adkjas aklnasdkj adkladkakj akadkj ', 5, CAST(0x0000A73D008A2D0C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3092, 19, 2, N'lộc óc chó....', 5, CAST(0x0000A73D008A45A8 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3093, 19, 2, N'hay alwms, abcderfgkjsdjh adasd', 5, CAST(0x0000A73D008A528C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3094, 19, 1, N'hay lắm thèn ở dưới :))', 5, CAST(0x0000A73D008A6678 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3095, 32, 1, N'rertgyt  eyery e', 3, CAST(0x0000A73E010B2A24 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3096, 32, 1, N'eyeryeyewtuwut', 4, CAST(0x0000A73E010B3384 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3097, 198, 1, N'zzzzzzzzzzzzzzzzzzzzz', 1, CAST(0x0000A74000AF6B6C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3098, 198, 1, N'goodm,mmmmmmmmmmm', 5, CAST(0x0000A74000AFCCB0 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3099, 149, 1, N'jghjgjjhkjhklhjkhkhjkjhl', 2, CAST(0x0000A74000B0FFB8 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (3100, 149, 1, N'lkjljljljljk', 1, CAST(0x0000A74000B1321C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4097, 186, 7, N'jnbkgh,kkjhjklhllh', 4, CAST(0x0000A74000F33CC0 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4098, 192, 1, N'sdffdsfsdf', 2, CAST(0x0000A74000F57774 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4099, 46, 2, N'Hay lắm, tôi rất thích, đã sửa', 5, CAST(0x0000A743008F073C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4100, 149, 7, N'Tôi muốn thuê, liên hệ lại 055 3113 sửa', 3, CAST(0x0000A74500AF8D68 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4102, 149, 8, N'Tôi vừa bình luận vô', 5, CAST(0x0000A74500B00748 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4103, 252, 7, N'rất tuyệt đó user3', 5, CAST(0x0000A745010DF754 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4104, 258, 7, N'hình ảnh không rõ ràng bạn nhé', 3, CAST(0x0000A745010E3570 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4105, 258, 7, N'có thể giá cao hơn một chút bạn nhé', 4, CAST(0x0000A745010E75E4 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4106, 263, 7, NULL, 4, CAST(0x0000A745010EB9DC AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4107, 264, 7, NULL, 4, CAST(0x0000A745010F962C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4108, 259, 7, N'nhanh  bgbghbdsndsndbd :)', 3, CAST(0x0000A745010FE258 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4109, 259, 7, NULL, 3, CAST(0x0000A745010FF2C0 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4110, 256, 9, N'tot lm  ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', 5, CAST(0x0000A7450116325C AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4111, 254, 9, N'tghtrhfghffffffffffffffffffffffffffffffffffffffffffffffffffffffffffhhhhhhhhhhhhh', 5, CAST(0x0000A7450116A660 AS DateTime))
INSERT [dbo].[Rate] ([rateId], [threadId], [accountId], [content], [score], [created]) VALUES (4112, 256, 13, N'raats dep dok trang khung', 4, CAST(0x0000A745011C2374 AS DateTime))
SET IDENTITY_INSERT [dbo].[Rate] OFF
SET IDENTITY_INSERT [dbo].[Thread] ON 

INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (223, 3, 11, N'CĂN HỘ MINI MỚI XÂY, SẠCH SẼ, AN NINH', N'Tịnh Bình, Quảng Ngãi, Việt Nam', CAST(15.19323100 AS Decimal(10, 8)), CAST(108.71851840 AS Decimal(11, 8)), N'<p>T&ograve;a nh&agrave; nằm ngay g&oacute;c 3 mặt tiền n&ecirc;n tận dụng độ tho&aacute;ng cực kỳ hiệu quả, v&igrave; vậy lu&ocirc;n tho&aacute;ng đ&atilde;ng. Căn hộ c&oacute; ban c&ocirc;ng, nhiều cửa sổ, view đẹp ngắm to&agrave;n th&agrave;nh phố.</p>
<p>Camera quan s&aacute;t 24/24, hẻm cụt an ninh, xe hơi v&agrave;o tận nh&agrave;, khu d&acirc;n cư cao cấp, tri thức.</p>
<p>Tiện &iacute;ch xung quanh đầy đủ: si&ecirc;u thị co.op mart, nh&agrave; s&aacute;ch, chợ B&agrave; Chiểu, bệnh viện Gia Định... v&agrave; nhiều trường học: đh văn lang, đh hutech, đh ngoại thương...</p>
<p>Chỗ để xe free, c&oacute; khu vực giặt phơi ri&ecirc;ng biệt, được nấu ăn.</p>
<p>Căn hộ đ&atilde; được trang bị sẵn m&aacute;y lạnh, tủ &acirc;m tường, m&aacute;y nước n&oacute;ng lạnh. WC ri&ecirc;ng biệt trong ph&ograve;ng với nội thất cao cấp v&agrave; mới 100%</p>
<p>Ph&ugrave; hợp cho người th&iacute;ch sự y&ecirc;n tĩnh, tho&aacute;ng đ&atilde;ng v&agrave; sạch sẽ, d&acirc;n tr&iacute; thức!</p>', 7000000.0000, 3000.0000, 2000.0000, 7000.0000, 0, 0, 1, 1, 1, 0, 0, 3, N'Đông Nam', 3, 4, 1, 1, CAST(0xA03C0B00 AS Date), 0, 1, 1, N'image/5.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (224, 3, 11, N'CHO THUÊ CĂN HỘ CAO CẤP QUẬN NGŨ HÀNH SƠN THOÁNG MÁT, ĐẦY ĐỦ TIỆN NGHI', N'Hòa Vang, Đà Nẵng, Việt Nam', CAST(15.99998800 AS Decimal(10, 8)), CAST(108.14579940 AS Decimal(11, 8)), N'<p class="\\\&quot;MsoNormal\\\&quot;">- Hẻm xe hơi, y&ecirc;n tĩnh, tho&aacute;ng m&aacute;t, an ninh</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- B&atilde;i giữ xe rộng r&atilde;i, an ninh</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Căn hộ rộng 30m2 gồm 1 ph&ograve;ng ngủ-1 ph&ograve;ng kh&aacute;ch c&oacute; đủ nội thất cao cấp.</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Bếp ri&ecirc;ng trong ph&ograve;ng cho bạn tự do nấu nướng</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Giường nệm cho bạn giấc ngủ &ecirc;m &aacute;i</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Gần c&aacute;c si&ecirc;u thị tiện lợi, c&aacute;c qu&aacute;n ăn</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Hệ thống nước n&oacute;ng to&agrave;n bộ</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Tủ quần &aacute;o cho bạn sắp xếp đồ đạc gọn g&agrave;ng</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Nội thất hiện đại, cao cấp v&agrave; sang trọng</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Đặc biệt c&oacute; ban c&ocirc;ng đảm bảo cho căn ph&ograve;ng bạn lu&ocirc;n tho&aacute;ng đ&atilde;ng, ri&ecirc;ng tư</p>
<p class="\\\&quot;MsoNormal\\\&quot;">- Tất cả mọi thứ tuyệt vời tr&ecirc;n ch&uacute;ng t&ocirc;i d&agrave;nh cho bạn với gi&aacute; chỉ 7 triệu/th&aacute;ng</p>', 7000000.0000, 3000.0000, 2000.0000, 7000.0000, 100, 0, 1, 1, 1, 0, 0, 2, N'Tây Bắc', 3, 3, 1, 15, CAST(0xA03C0B00 AS Date), 1, 1, 1, N'image/9.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (226, 3, 11, N'CĂN HỘ VILLA ĐƯỜNG PHẠM VĂN HAI, TIỆN NGHI CAO CẤP', N'Trà Bồng, Quảng Ngãi, Việt Nam', CAST(15.25126450 AS Decimal(10, 8)), CAST(108.49882690 AS Decimal(11, 8)), N'<p>Ph&ograve;ng rộng 25m2 c&oacute; ban c&ocirc;ng, cửa sổ tho&aacute;ng m&aacute;t, đầy đủ tiện nghi:&nbsp;</p>
<p>- M&aacute;y lạnh.&nbsp;</p>
<p>- Tủ lạnh.&nbsp;</p>
<p>- Giường, nệm.&nbsp;</p>
<p>- Tủ quần &aacute;o.&nbsp;</p>
<p>- B&agrave;n l&agrave;m vi&ecirc;̣c.&nbsp;</p>
<p>- M&aacute;y Nước n&oacute;ng năng lượng mặt trời.&nbsp;</p>
<p>- Wifi t&ocirc;́c đ&ocirc;̣ cao (2 line 20Mb).&nbsp;</p>
<p>- M&aacute;y giặt d&ugrave;ng chung miễn ph&iacute;.&nbsp;</p>
<p>- Toilet trong ph&ograve;ng, c&oacute; v&aacute;ch ngăn cao cấp</p>
<p>* Tiện &iacute;ch t&ograve;a nh&agrave;:</p>
<p>Giờ giấc tự do kh&ocirc;ng chung chủ, được nấu ăn, c&oacute; chỗ để xe miễn ph&iacute;, s&acirc;n phơi r&ocirc;̣ng r&atilde;i tho&aacute;ng m&aacute;t</p>
<p>C&oacute; m&aacute;y giặt, bếp lớn, khu cafeteria tr&ecirc;n s&acirc;n thượng, thang m&aacute;y, khu vực tiếp kh&aacute;ch cao cấp</p>', 10000000.0000, 3000.0000, 2000.0000, 6000.0000, 40, 0, 1, 0, 0, 1, 0, 3, N'Đông Nam', 2, 4, 2, 10, CAST(0xA03C0B00 AS Date), 2, 1, 1, N'image/13.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (227, 3, 11, N'CĂN HỘ ĐẦY ĐỦ TIỆN NGHI NGAY CHỢ NON NƯỚC', N'Hòa Xuân, Đà Nẵng, Việt Nam', CAST(16.00199830 AS Decimal(10, 8)), CAST(108.21995880 AS Decimal(11, 8)), N'<p>✔️ Nh&agrave; 7 tầng, mới x&acirc;y, c&oacute; thang m&aacute;y hiện đại di chuyển nhanh v&agrave; an to&agrave;n, c&oacute; s&acirc;n phơi quần &aacute;o ở tầng thượng, tầng trệt rộng r&atilde;i bạn thoải m&aacute;i để xe.<br />✔️ Ph&ograve;ng diện t&iacute;ch 24 - 30m2 sạch sẽ, tho&aacute;ng m&aacute;t. C&oacute; khu bếp ri&ecirc;ng rất thuận tiện nấu ăn h&agrave;ng ng&agrave;y.<br />✔️ Vệ sinh kh&eacute;p k&iacute;n, nh&agrave; tắm sạch sẽ c&oacute; trang bị n&oacute;ng lạnh để Bạn c&oacute; thể tắm thỏa th&iacute;ch trong l&agrave;n nước ấm mỗi ng&agrave;y.<br />✔️ Được l&aacute;t s&agrave;n gỗ: Kh&ocirc;ng những gi&uacute;p ph&ograve;ng của Bạn ấm &aacute;p v&agrave;o m&ugrave;a đ&ocirc;ng, m&aacute;t mẻ v&agrave;o m&ugrave;a h&egrave; m&agrave; c&ograve;n th&ecirc;m Sang Trọng, sạch sẽ v&agrave; Đẳng Cấp hơn so với Bạn b&egrave;.<br />✔️ Nội thất tiện nghi: Kệ Bếp, Bồn Rửa, Giường, Tủ quần &aacute;o, điều h&ograve;a v&agrave; quạt trần... Bạn c&oacute; thể v&agrave;o ở Lu&ocirc;n m&agrave; kh&ocirc;ng phải mất tiền để sắm th&ecirc;m đồ.<br /><br />Sống ở đ&acirc;y bạn sẽ nhận được:<br />➡ An ninh đảm bảo: Hệ thống camera hiện đại, c&oacute; bảo vệ th&acirc;n thiện trực 24/24. Bạn sẽ cảm thấy rất an to&agrave;n v&agrave; kh&ocirc;ng phải lo lắng bị trộm cắp t&agrave;i sản.<br />➡ Kh&ocirc;ng sống chung chủ: Bạn sống thoải m&aacute;i như nh&agrave; của m&igrave;nh, tự do đi lại d&ugrave; c&oacute; s&aacute;ng sớm hay đ&ecirc;m khuya.<br />➡ Internet c&aacute;p quang tốc độ cao: Bạn c&oacute; thể chơi game, tải nhạc, xem phim hay lướt web thoải m&aacute;i m&agrave; kh&ocirc;ng lo giật lag.<br />➡Vệ sinh qu&eacute;t dọn h&agrave;ng ng&agrave;y: Để đảm bảo l&uacute;c n&agrave;o bạn cũng được sống trong m&ocirc;i trường sạch sẽ nhất.<br />➡ gần chợ: C&aacute;ch chợ 50m khiến cho việc mua sắm nấu nướng của c&aacute;c bạn được tiện lợi v&agrave; nhanh ch&oacute;ng nhất.</p>', 3400000.0000, 2000.0000, 3000.0000, 6000.0000, 50, 1, 1, 0, 0, 0, 0, 2, N'Tây Nam', 1, 2, 2, 20, CAST(0xA03C0B00 AS Date), 2, 1, 1, N'image/17.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (228, 5, 7, N'Tìm nam ở ghép', N'Trà Cao, Trà bồng,Quảng Ngãi', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'<p>***Tuyển nam lịch sự &nbsp;ở gh&eacute;p tại căn ph&ograve;ng 35m2 khu trung t&acirc;m&nbsp;<br />- Vị tr&iacute;: Ngay cầu Thị Ngh&egrave;, Thảo Cầm Vi&ecirc;n, c&aacute;ch khu d&acirc;n cư cao cấp City Garden 100m.&nbsp;<br />- Khu vực trung t&acirc;m mất 1 ph&uacute;t sang Q1, gần c&aacute;c trường ĐH Hutech, ĐH T&ocirc;n Đức Thắng, ĐH KHXH&amp;NV.&nbsp;<br />- Kh&ocirc;ng kẹt xe v&agrave; kh&ocirc;ng biết ngập nước l&agrave; g&igrave;.&nbsp;<br />- Ri&ecirc;ng tư, kh&ocirc;ng chung chủ, giờ giấc tự do.&nbsp;<br />- C&oacute; cửa sổ v&agrave; &aacute;nh s&aacute;ng tự nhi&ecirc;n, view th&agrave;nh phố đẹp m&ecirc; ly.&nbsp;<br />- Cạnh si&ecirc;u thị Vinmart, 24h, Ministop, chợ Thị Ngh&egrave;..&nbsp;<br />- Ph&ograve;ng c&oacute; toilet kh&eacute;p k&iacute;n, tủ &acirc;m tường, bồn tắm nằm, b&igrave;nh nước n&oacute;ng &acirc;m tường&nbsp;<br />- Diện t&iacute;ch ph&ograve;ng: 35m2&nbsp;<br />- Tầng trệt diện t&iacute;ch rất rộng để c&aacute;c bạn để xe miễn ph&iacute;, c&oacute; s&acirc;n thượng phơi đồ rất thoải m&aacute;i..&nbsp;<br />- Tiện &iacute;ch kh&aacute;c: Wifi...&nbsp;<br />* Gi&aacute;: 1,3 - 1,4 triệu/người/th&aacute;ng&nbsp;<br />- Ưu ti&ecirc;n c&aacute;c bạn sinh vi&ecirc;n, nh&acirc;n vi&ecirc;n VP.&nbsp;<br />- Li&ecirc;n hệ xem ph&ograve;ng 24/24: 0122 551 0509 gặp Tuấn Anh.&nbsp;<br />H&igrave;nh thật 100%.&nbsp;<br />Địa chỉ: Tr&agrave; Cao, Tr&agrave; Bồng, Quảng Ng&atilde;i.<br />Li&ecirc;n hệ: Tuấn Anh 0122 551 0509&nbsp;<br />H&igrave;nh thật 100%</p>', 1300000.0000, 0.0000, 0.0000, 0.0000, 35, 0, 0, 0, 1, 1, 1, 1, N'tây nam', 1, 1, 1, 12, CAST(0xA03C0B00 AS Date), 7, 1, 1, N'image/1.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (229, 3, 11, N'CĂN HỘ 55M2, LẦU 10 CHUNG CƯ KHANG GIA, TÂN HƯƠNG', N'Sông Trà Khúc, Quảng Ngãi, Việt Nam', CAST(15.14223200 AS Decimal(10, 8)), CAST(108.88782780 AS Decimal(11, 8)), N'<p>Cho thu&ecirc; Căn Hộ 55m2 Lầu 10 mới sử dụng Chung Cư Khang Gia T&acirc;n Hương ngay mặt tiền đường T&acirc;n Hương, trung t&acirc;m quận Sơn Tịnh, nh&agrave; lầu cao, tho&aacute;ng m&aacute;t, y&ecirc;n tĩnh v&agrave; trống giao ngay, 2 thang m&aacute;y v&agrave; 2 thang bộ cho mỗi khối nh&agrave;. Căn hộ c&oacute; cửa ch&iacute;nh hướng Ch&iacute;nh Bắc (lệch ch&uacute;t về hướng T&acirc;y). Ph&iacute;a sau view ra Hồ Bơi của chung cư.</p>
<p>B&ecirc;n dưới c&oacute; nhiều tiện &iacute;ch như: Hồ bơi, si&ecirc;u thị mini, cafe,... Vị tr&iacute; chỉ c&aacute;ch chợ T&acirc;n Hương 300m, si&ecirc;u thị AEON Mall 500m, khu phức hợp Celadon City 500m, gần Trường cấp 1-2, bệnh viện Quận, nh&agrave; thờ T&acirc;n Hương, khu du lịch Đầm Sen,&hellip;chỉ c&aacute;ch s&acirc;n bay T&acirc;n Sơn Nhất 10 ph&uacute;t, c&aacute;ch Trung T&acirc;m Th&agrave;nh Phố chỉ 15 ph&uacute;t đi xe,&hellip;</p>
<p>Nội thất cơ bản gồm: 1 ph&ograve;ng kh&aacute;ch rộng (c&oacute; thể l&agrave;m th&ecirc;m th&agrave;nh 1 ph&ograve;ng ngủ di động), 1 ph&ograve;ng ngủ, 1 s&acirc;n giặt + phơi, 1 toilet, tủ bếp tr&ecirc;n/dưới, bồn rửa ch&eacute;n, điện, nước,&hellip;</p>
<p>G&iacute;a thu&ecirc;: 6 triệu/th&aacute;ng (kh&ocirc;ng t&iacute;nh điện - nước &ndash; ph&iacute; quản l&yacute; chung cư). Thanh to&aacute;n tiền thu&ecirc; v&agrave;o c&aacute;c ng&agrave;y đầu th&aacute;ng/đầu hợp đồng.</p>
<p>Ưu ti&ecirc;n cho người thu&ecirc; ổn định, l&acirc;u d&agrave;i (&iacute;t nhất 1 năm). Cọc 2 th&aacute;ng tiền thu&ecirc; nh&agrave;.</p>', 15000000.0000, 4000.0000, 4000.0000, 7000.0000, 100, 0, 1, 1, 1, 1, 1, 2, N'Tây Bắc', 4, 5, 2, 3, CAST(0xA03C0B00 AS Date), 5, 1, 0, N'image/17.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (230, 5, 7, N'Tìm người ở ghép ở Sơn Tịnh', N'Tịnh Bình, Sơn Tịnh, Quảng  Ngãi', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'<p>Cần Tuyển bạn nam ở gh&eacute;p để share tiền ph&ograve;ng. ph&ograve;ng rộng r&atilde;i tho&aacute;ng m&aacute;t. wifi&nbsp;, c&oacute; b&atilde;i xe ri&ecirc;ng, giờ giấc tự do, quận b&igrave;nh t&acirc;n, nam ở gh&eacute;p quận b&igrave;nh t&acirc;n,</p>
<p>Cần nam ở gh&eacute;p căn hộ/ share ph&ograve;ng quận b&igrave;nh t&acirc;n</p>
<p>Kh&ocirc;ng gian y&ecirc;n tĩnh t&ocirc;n trọng sự ri&ecirc;ng tư</p>
<p>Diện t&iacute;ch 60m2/ - 2 ph&ograve;ng ngủ- quận b&igrave;nh t&acirc;n</p>
<p>Gi&aacute; :900.000/người</p>
<p>Địa chỉ : chung cư Nguyễn Quyền, Tịnh B&igrave;nh, Sơn Tịnh, Quảng Ng&atilde;i.</p>
<p>Bạn n&agrave;o c&oacute; nhu cầu li&ecirc;n hệ : Mr.Ph&aacute;t: 0967 647 115 /</p>', 900000.0000, 0.0000, 3000.0000, 5000.0000, 60, 0, 1, 0, 1, 0, 0, 3, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 4, 1, 1, N'image/5.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (232, 5, 7, N'Tìm nữ ở ghép', N'', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'<p>C&Acirc;̀N TÌM NỮ Ở GHÉP NHÀ NGUY&Ecirc;N CĂN G&Acirc;̀N CHỢ HÒA HƯNG, C&Ocirc;NG VI&Ecirc;N L&Ecirc; THỊ RI&Ecirc;NG, SI&Ecirc;U THỊ BIC C, TRẠM XE BUÝT VÀ CÁC TRƯỜNG ĐẠI HỌC.</p>
<p>NHÀ THOÁNG MÁT CÓ LAN CAN, SẠCH SẼ AN NINH. CÓ CH&Ocirc;̃ Đ&Ecirc;̉ XE AN TOÀN, ĐI&Ecirc;̣N NƯỚC _ WI-FI &nbsp;GIÁ NHÀ NƯỚC.</p>
<p>GIÁ : 800k/1N / tháng.</p>
<p>BẠN NÀO CÓ NHU C&Acirc;̀U XIN LI&Ecirc;N H&Ecirc;̣ :0902952191 Gặp chị HI&Ecirc;̣P&nbsp;</p>', 800000.0000, 3000.0000, 0.0000, 5000.0000, 59, 1, 1, 1, 1, 1, 1, 3, N'đông bắc', 1, 1, 2, 19, CAST(0xA03C0B00 AS Date), 5, 1, 1, N'image/9.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (234, 5, 7, N'Tìm nữ ở ghép chung cư', N'trà đú, trà bồng, Quảng Ngãi', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'<p>- CẦN 1 NỮ Ở GH&Eacute;P Q.7 - căn hộ cao cấp Bellaza. FULL NỘI THẤT. (chỉ cần x&aacute;ch vali v&agrave;o v&agrave; ở)</p>
<p>- Toạ lạc: 2, Hẻm 23, Phạm Hữu Lầu, Ph&uacute; Mỹ, Quận 7, Tp.HCM</p>
<p>- Ưu ti&ecirc;n d&acirc;n văn ph&ograve;ng, ổn định, sạch sẽ hoặc sinh vi&ecirc;n ko h&uacute;t thuốc, ko tệ nạn, kh&ocirc;ng qu&aacute; nhiều đồ.&nbsp;</p>
<p>- C&aacute;ch trung t&acirc;m quận 1 - 10p, gần đh RMIT, đh T&ocirc;n Đức Thắng, sau lưng Cresent mall, gần Sc vivo, Lotte mart Q7.</p>
<p>LH : 0901.003.338 - Ms Anh</p>
<p>Gi&aacute; : 1,5tr/ng - cọc 1 th&aacute;ng, HĐ 1 năm.</p>', 1500000.0000, 4000.0000, 2500.0000, 10000.0000, 92, 0, 1, 0, 1, 0, 0, 3, N'', 2, 2, 2, 11, CAST(0xA03C0B00 AS Date), 4, 1, 1, N'image/12.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (235, 3, 12, N'CĂN HỘ DOANH NHÂN SANG SẠCH ĐẸP, YÊN TĨNH, SÁT CÔNG VIÊN', N'Hòa Bình 7, Hòa Quý, Đà Nẵng, Việt Nam', CAST(15.98882590 AS Decimal(10, 8)), CAST(108.23237400 AS Decimal(11, 8)), N'<p>- Ph&ugrave; hợp với đẳng cấp doanh nh&acirc;n.</p>
<p>- Hợp phong thủy mang lại vận may l&agrave;m ăn kinh doanh?</p>
<p>- Kh&iacute; vận tốt mang lại sức khỏe cho gia đ&igrave;nh?</p>
<p>- Thuận lợi trong c&ocirc;ng việc?</p>
<p>- Tiện lợi di chuyển cho c&ocirc;ng việc của bạn?</p>
<p>- Tự do thoải m&aacute;i, an ninh đảm bảo như ch&iacute;nh nh&agrave; của bạn?</p>
<p>Ch&uacute;ng t&ocirc;i tự h&agrave;o giới thiệu bạn 1 căn hộ tuyệt vời sau:</p>
<p>ĐỊA CHỈ: C&aacute;ch mạng th&aacute;ng 8, Phường 13, Quận 10</p>
<p>- Đường rộng tho&aacute;ng m&aacute;t, thuộc khu d&acirc;n tr&iacute; cao. Nằm ngay khu trung t&acirc;m, c&oacute; thể đi sang nhiều quận nhanh nhất, Gần chợ, gần trường đại học,ng&acirc;n h&agrave;ng ...</p>
<p>Căn hộ Quận 10 c&oacute; c&aacute;c tiện &iacute;ch xung quanh như khu vực t&ograve;a nh&agrave; văn ph&ograve;ng, coffee,... &nbsp;nơi c&oacute; nhiều người nước ngo&agrave;i sinh sống v&agrave; l&agrave;m việc.&nbsp;</p>
<p>Tọa lạc tại khu d&acirc;n cư cao cấp, an ninh v&agrave; cực k&igrave; y&ecirc;n tĩnh. Giao th&ocirc;ng thuận tiện di chuyển đến trung t&acirc;m Q.1, Q.T&acirc;n B&igrave;nh, Q.5, Q.3... Khu vực sống xanh - sạch - đẹp, an ninh, y&ecirc;n tĩnh.</p>
<p>Kế b&ecirc;n c&oacute; c&ocirc;ng vi&ecirc;n nội bộ tho&aacute;ng m&aacute;t trong l&agrave;nh. Ho&agrave;n thiện hạ tầng tiện &iacute;ch xung quanh: trung t&acirc;m thương mại, si&ecirc;u thị, bệnh viện, spa, massage,... Bạn sẽ được trải nghiệm cảm gi&aacute;c tuyệt vời khi l&agrave; cư d&acirc;n VIP.</p>', 3000000.0000, 5000.0000, 3000.0000, 7000.0000, 60, 1, 1, 1, 0, 0, 0, 3, N'Tây Bắc', 4, 4, 2, 19, CAST(0xA03C0B00 AS Date), 1, 1, 1, N'image/20.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (236, 3, 12, N'CĂN HỘ ĐẸP , NỘI THẤT 5 SAO, GIỜ GIẤC TỰ DO, BẢO VỆ 24/24, GẦN COOP MART', N'Tịnh Trà, Quảng Ngãi, Việt Nam', CAST(15.22892990 AS Decimal(10, 8)), CAST(108.69476170 AS Decimal(11, 8)), N'<p>Diện t&iacute;ch căn ph&ograve;ng rộng 27m2.<br />Tiện nghi đầy đủ, mới 100% với:<br />✓ 1 ph&ograve;ng ngủ, ph&ograve;ng kh&aacute;ch v&agrave; bếp, 1 ph&ograve;ng WC rộng r&atilde;i.<br />✓ M&aacute;y lạnh.<br />✓ M&aacute;y nước n&oacute;ng.<br />✓ Giường, nệm.<br />✓ Tivi.<br />✓ Tủ lạnh.<br />✓ Tủ quần &aacute;o.<br />✓ Kệ bếp, tủ bếp, bồn rửa.<br />✓ Bếp từ.<br />✓ B&agrave;n ghế.<br />✓ M&aacute;y giặt gi&uacute;p bạn nhẹ nh&agrave;ng trong việc giặt giũ quần &aacute;o.<br />✓ Wifi, truyền h&igrave;nh c&aacute;p.<br />C&oacute; hầm gửi xe rộng r&atilde;i, camera. Bảo vệ 24/24.<br />Đặc biệt miễn ph&iacute;: Wifi, truyền h&igrave;nh cap, m&aacute;y giặt, r&aacute;c&hellip;.<br />Điện 4ngh&igrave;n.<br />Nước 120ngh&igrave;n/người/th&aacute;ng.<br />Gi&aacute; chỉ: 7triệu/th&aacute;ng.<br />Với 5 năm kinh nghiệm về cho thu&ecirc; căn hộ, ch&uacute;ng t&ocirc;i cam kết khắc phục được tất cả vấn đề đi thu&ecirc; nh&agrave; ở&hellip;.</p>', 2500000.0000, 2000.0000, 3000.0000, 5000.0000, 50, 1, 0, 1, 1, 1, 0, 2, N'Đông Nam', 3, 2, 2, 3, CAST(0xA03C0B00 AS Date), 1, 1, 1, N'image/24.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (237, 3, 12, N'CĂN HỘ CAO CẤP CHO THUÊ, CÓ BẾP, MÁY GIẶT, RỘNG RÃI, GIỜ GIẤC TỰ DO. LH: 009.670.9877', N'tt. Trà Xuân, Quảng Ngãi, Việt Nam', CAST(15.25792440 AS Decimal(10, 8)), CAST(108.51960280 AS Decimal(11, 8)), N'<p>+ Ngay chợ Phạm Văn Hai, khu ăn uống,karaoke, mua sắm, văn ph&ograve;ng.</p>
<p>- Ph&ograve;ng nằm cạnh trung t&acirc;m Quận 10, thuận tiện đi lại c&aacute;c quận nội th&agrave;nh như 5p đến Q1, Q3,..</p>
<p>+ Gần nhiều trường ĐH: Đại học B&aacute;ch Khoa, Học Viện Qu&acirc;n Y. ĐH Ngoại Ngữ Tin Học, đại học Y Dược.</p>
<p>+ Gần nhiều bệnh viện lớn như Viện Tim, bệnh viện 115, Nhi Đồng 1, bệnh viện Chợ Rẫy,...</p>
<p>+ Gần nhiều khu mua sắm như si&ecirc;u thị Maximark 3/2,Superbowl, chợ B&agrave;n Cờ, gần nhiều ng&acirc;n h&agrave;ng,..</p>
<p>+ Gần nhiều khu trung t&acirc;m ăn uống như Sư Vạn Hạnh, Nguyễn Tri Phương,...</p>
<p>+ Khu nh&agrave; ở rất an ninh, gần c&ocirc;ng an phường 12, Quận T&acirc;n B&igrave;nh.</p>
<p>+ Gần bệnh viện, trạm xăng, nh&agrave; văn h&oacute;a, c&ocirc;ng vi&ecirc;n Ho&agrave;ng Văn Thụ.....</p>
<p>* N&ocirc;̣i th&acirc;́t.</p>
<p>Ph&ograve;ng rộng 20m2 c&oacute; WC ri&ecirc;ng, ban c&ocirc;ng, cửa sổ tho&aacute;ng m&aacute;t, View đẹp, &nbsp;đầy đủ tiện nghi cao cấp:</p>
<p>- M&aacute;y lạnh.</p>
<p>- Tủ lạnh.</p>
<p>- Giường gỗ, nệm l&ograve; xo, bộ drap gối cao cấp</p>
<p>- Tủ quần &aacute;o gỗ 4 c&aacute;nh</p>
<p>- Bàn ghế làm vi&ecirc;̣c.</p>
<p>- Bộ sofa b&agrave;n k&iacute;nh cường lực</p>
<p>- M&aacute;y Nước n&oacute;ng</p>
<p>- M&aacute;y giặt</p>
<p>- Bồn tắm massage cao cấp</p>
<p>- Wifi t&ocirc;́c đ&ocirc;̣ cao đặt ngay trong ph&ograve;ng (2 line 30Mb).</p>
<p>- Tivi LCD 32 inch</p>
<p>- Truyền h&igrave;nh c&aacute;p (miễn ph&iacute;)</p>
<p>- Bạn b&egrave; đến chơi tự do thoải m&aacute;i</p>
<p>- Cho nấu ăn c&oacute; trang bị bếp từ</p>', 5000000.0000, 3000.0000, 2000.0000, 7000.0000, 40, 0, 1, 0, 1, 1, 1, 3, N'Tây Bắc', 3, 5, 2, 9, CAST(0xA03C0B00 AS Date), 1, 1, 1, N'image/28.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (238, 3, 12, N'CHÍNH CHỦ CHO THUÊ CĂN HỘ MINI NGAY BỜ KÈ, GẦN CHỢ NON NƯỚC, VỊ TRÍ CỰC TỐT, CÓ BẾP, TỰ DO', N'Nguyễn Hữu Thọ, Đà Nẵng, Việt Nam', CAST(16.03786080 AS Decimal(10, 8)), CAST(108.21021610 AS Decimal(11, 8)), N'<p>CĂN HỘ MINI TIỆN NGHI NGAY BỜ K&Egrave; HO&Agrave;NG SA, CẦU KIỆU QUẬN NGŨ H&Agrave;NH SƠN<br />Địa chỉ: 27/1&nbsp;Nguyễn Văn Nguyễn, T&acirc;n Định, Quận Ngũ H&agrave;nh Sơn HOẶC (27E1 ho&agrave;ng sa, ngay c&agrave; ph&ecirc; Chi&ecirc;u)&nbsp;<br />Vị tr&iacute;: Nằm trong khu d&acirc;n cư y&ecirc;n tĩnh, an ninh, hẻm xe hơi. Ngay mặt tiền Ho&agrave;ng Sa n&ecirc;n m&aacute;t mẻ. S&aacute;t chợ T&acirc;n Định, trường ĐH Văn Lang, ĐH kinh tế, Cao đẳng nghề v&agrave; c&aacute;c trung t&acirc;m thương mại.&nbsp;<br />Tiện nghi: Ph&ograve;ng rộng khoảng 20-25m2,đầy đủ tiện nghi: Giường + nệm, m&aacute;y lạnh, tủ lạnh, tivi, tủ quần &aacute;o, m&aacute;y giặt, kệ bếp + b&agrave;n l&agrave;m việc, .. WC ri&ecirc;ng từng căn hộ, rất sang trọng v&agrave; rộng r&atilde;i. y chang h&igrave;nh.&nbsp;<br />Tiện &iacute;ch:&nbsp;<br />- Giờ tự do 24/24 cho bạn đi l&agrave;m, kh&ocirc;ng chung chủ, c&oacute; ch&igrave;a kh&oacute;a ri&ecirc;ng.&nbsp;<br />- Miễn Ph&iacute; gửi xe.&nbsp;<br />- Được nấu ăn trong ph&ograve;ng, thiết kế bếp ri&ecirc;ng.&nbsp;<br />Đặc biệt:&nbsp;<br />- Hệ thống truyền h&igrave;nh c&aacute;p, internet, điện thoại, nguồn cung cấp nước, cung cấp điện,... Với chất lượng cao.&nbsp;<br />- Thiết kế tất cả c&aacute;c ph&ograve;ng đều tho&aacute;ng m&aacute;t, ban c&ocirc;ng, cửa sổ view đẹp.&nbsp;<br />- Rất y&ecirc;n tĩnh, an ninh. View cực kỳ đẹp, kh&ocirc;ng cần bật m&aacute;y lạnh cũng m&aacute;t mẻ. Ch&uacute;ng t&ocirc;i cam kết lu&ocirc;n chăm s&oacute;c kh&aacute;ch h&agrave;ng chu đ&aacute;o, tận t&acirc;m, th&acirc;n thiện. Lu&ocirc;n giữ g&igrave;n một m&ocirc;i trường sạch sẽ, an to&agrave;n. Dọn vệ sinh nh&agrave; h&agrave;ng kỳ.&nbsp;</p>', 6500000.0000, 3000.0000, 3000.0000, 7000.0000, 500, 1, 1, 1, 1, 1, 0, 3, N'Tây Bắc', 3, 0, 1, 18, CAST(0xA03C0B00 AS Date), 0, 1, 1, N'image/32.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (239, 5, 7, N'Cần phòng ở ghép cho nam', N'Hòa Tan Ngũ Hành Sơn Đà nẵng', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'<p>Hiện m&igrave;nh cần t&igrave;m ph&ograve;ng cần người ở gh&eacute;p, c&ograve;n 1 ph&ograve;ng trống</p>
<p>&nbsp;</p>', 900000.0000, 2993.0000, 0.0000, 0.0000, 50, 0, 1, 0, 1, 0, 1, 1, N'', 5, 0, 1, 16, CAST(0xA03C0B00 AS Date), 6, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (240, 3, 12, N'CHO THUÊ CĂN HỘ MINI DÀNH CHO HỘ GIA ĐÌNH, NHÂN VIÊN VĂN PHÒNG, SINH VIÊN', N'Tịnh Thiện, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.18199290 AS Decimal(10, 8)), CAST(108.84920700 AS Decimal(11, 8)), N'<p>C&oacute; phải bạn muốn một căn hộ thoải m&aacute;i, tho&aacute;ng m&aacute;t? một nơi y&ecirc;n tĩnh, an ninh? c&oacute; lối đi rộng,gần nơi l&agrave;m việc?</p>
<p>Căn hộ mini, khu vực gần s&acirc;n bay gần c&ocirc;ng vi&ecirc;n Gia định, gần chợ Phạm Văn Hai, chợ T&acirc;n Sơn nhất, khu vực an ninh cực tốt gồm:</p>
<p>-2 ph&ograve;ng ngủ, 1 bếp, 1 sảnh l&agrave;m việc học tập, c&oacute; nh&agrave; vệ sinh ri&ecirc;ng, c&oacute; s&acirc;n vườn nhỏ ph&iacute;a sau.</p>
<p>ph&ograve;ng rộng r&atilde;i tho&aacute;ng m&aacute;t, c&oacute; chỗ để xe ri&ecirc;ng, bảo vệ 24/24&nbsp;</p>
<p>đảm bảo xem ph&ograve;ng sẽ th&iacute;ch ngay, Ưu ti&ecirc;n người tới trước!</p>
<p>Li&ecirc;n hệ xem ph&ograve;ng: 0166.446.4487&nbsp;gặp anh&nbsp;Thanh</p>', 3000000.0000, 3000.0000, 4000.0000, 600000.0000, 40, 1, 0, 1, 1, 1, 0, 2, N'Tây Bắc', 3, 3, 1, 6, CAST(0xA03C0B00 AS Date), 0, 1, 0, N'image/36.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (241, 5, 8, N'Tìm phòng ở ghép 2 nữ ', N'Tịnh Sơn, Sơn Tịnh, Quảng Ngãi, Việt Nam', CAST(15.16059380 AS Decimal(10, 8)), CAST(108.70663980 AS Decimal(11, 8)), N'<p>Cần t&igrave;m 1-2 nữ ờ gh&eacute;p, t&iacute;nh t&igrave;nh vui vẻ, th&acirc;n thiện, đang đi học hoặc đ&atilde; đi l&agrave;m! ph&ograve;ng tho&aacute;ng m&aacute;t, c&oacute; cửa sổ, c&oacute; s&acirc;n thượng, c&oacute; nh&agrave; vệ sinh ri&ecirc;ng, c&oacute; wifi, truyền h&igrave;nh c&aacute;p miễn ph&iacute;, rất an ninh, c&oacute; bảo vệ giữ xe, c&oacute; camera quan s&aacute;t, xe để tầng trệt, chỗ phơi đồ rất rộng, c&oacute; chỗ nấu ăn. gần chợ rất thuận tiện, bancong nh&igrave;n xuống s&acirc;n tenis rất đẹp, hiện tại ph&ograve;ng c&oacute; 1 người n&ecirc;n cần t&igrave;m nữ ở gh&eacute;p.&nbsp;</p>
<p>Gi&aacute; ph&ograve;ng 1TR6.</p>
<p>Điện nước th&ecirc;m khoảng 100k/người/th&aacute;ng, li&ecirc;n hệ với m&igrave;nh trước để đến xem ph&ograve;ng! 0938080764</p>', 1600000.0000, 350000.0000, 25000.0000, 5000.0000, 19, 0, 0, 0, 0, 1, 1, 1, N'Nam', 1, 3, 1, 4, CAST(0xA03C0B00 AS Date), 4, 1, 0, N'image/11.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (242, 2, 13, N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU, ĐƯỜNG GÒ CÁT', N'Agribank Tra Bong, tt. Trà Xuân, Trà Xuân, Quảng Ngãi, Việt Nam', CAST(15.25572280 AS Decimal(10, 8)), CAST(108.51541320 AS Decimal(11, 8)), N'<p>Nh&agrave; nhỏ 1 trệt+ 1 lầu (WC đẹp c&oacute; đủ lavabo, sen, xịt vs, kho nhỏ chứa đồ, bếp), c&oacute; s&acirc;n sau ri&ecirc;ng phơi đồ, giếng trời. DT sử dụng 27m2, đồng hồ điện lực gi&aacute; nh&agrave; nước (1.470đ/kwh). &nbsp;&nbsp;</p>
<p>Nh&agrave; khang trang, tường ốp gạch men, nhiều cửa sổ tho&aacute;ng m&aacute;t, h&agrave;ng x&oacute;m hiền h&ograve;a, khu vực an ninh tốt.</p>
<p>To&agrave;n khu nh&agrave; c&oacute; cổng an ninh, mỗi hộ gia đ&igrave;nh c&oacute; ch&igrave;a kh&oacute;a ri&ecirc;ng tự đ&oacute;ng mở.</p>
<p class="\&quot;\\&quot;\\\\&quot;MsoNormal\\\\&quot;\\&quot;\&quot;">Hẻm xe hơi, gần chợ Ph&uacute; Thuận, c&aacute;ch Paragon PMH 1200m. &nbsp;</p>
<p class="\&quot;\\&quot;\\\\&quot;MsoNormal\\\\&quot;\\&quot;\&quot;">Ph&ugrave; hợp gia đ&igrave;nh ở, gần Ph&uacute; Mỹ Hưng, KCX T&acirc;n Thuận, tiện về Q Tr&agrave; Bồng, Nh&agrave; B&egrave;.</p>
<p class="\&quot;\\&quot;\\\\&quot;MsoNormal\\\\&quot;\\&quot;\&quot;">Gi&aacute; thu&ecirc;: ph&ograve;ng trống gi&aacute; 2,1tr/1 th&aacute;ng.&nbsp; Wifi miễn ph&iacute;.</p>
<p class="\&quot;\\&quot;\\\\&quot;MsoNormal\\\\&quot;\\&quot;\&quot;">Đ/c: 1135/63 Huỳnh Tấn Ph&aacute;t, KP3, Ph&uacute; Thuận Q.Tr&agrave; Bồng. (V&agrave;o hẻm 1135 đi thẳng đến số 1135/41 quẹo tr&aacute;i, l&ecirc;n 100m nh&igrave;n b&ecirc;n phải thấy d&atilde;y nh&agrave; mới x&acirc;y sơn v&agrave;ng).</p>
<p class="\&quot;\\&quot;\\\\&quot;MsoNormal\\\\&quot;\\&quot;\&quot;">ĐT: 0984711872</p>', 2100000.0000, 3000.0000, 4000.0000, 4000.0000, 30, 1, 1, 1, 0, 1, 0, 2, N'Tây Nam', 3, 3, 2, 10, CAST(0xA03C0B00 AS Date), 1, 1, 1, N'image/40.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (243, 5, 8, N'Tìm 1 Nam ở ghép', N'Hòa Vang, Đà Nẵng, Việt Nam', CAST(15.99998800 AS Decimal(10, 8)), CAST(108.14579940 AS Decimal(11, 8)), N'<p>Cần nam ở gh&eacute;p nh&agrave; nguy&ecirc;n căn đường B&ugrave;i Quang L&agrave; (Gần ng&atilde; tư Quang Trung - Phan Huy &Iacute;ch).</p>
<p>Nh&agrave; ri&ecirc;ng, kh&ocirc;ng chung chủ, giờ giấc tự do, tho&aacute;ng m&aacute;t, c&oacute; chỗ để xe, nấu ăn, xung quanh rất nhiều h&agrave;ng qu&aacute;n, gần chợ, cafe, đ&aacute; banh, ph&ograve;ng Gym, cửa h&agrave;ng tiện lợi....&nbsp;</p>
<p>Khu d&acirc;n cư y&ecirc;n tĩnh, gần trạm x&aacute;, c&ocirc;ng an phường, chốt tổ d&acirc;n phố...</p>
<p>Mỗi người c&oacute; 1 ch&igrave;a kh&oacute;a ri&ecirc;ng, c&oacute; camera quan s&aacute;t 24/24, an ninh tuyệt đối.&nbsp;</p>
<p>Tiền nh&agrave; mỗi người 700k 1 th&aacute;ng, lu&ocirc;n giữ nguy&ecirc;n kh&ocirc;ng đổi d&ugrave; nh&agrave; c&oacute; đủ người hay chưa</p>
<p>Tiền điện, nước theo h&oacute;a đơn ch&iacute;nh chủ n&ecirc;n rất rẻ, chia đều theo đầu người d&ugrave;ng thoải m&aacute;i chỉ khoảng 60k.</p>
<p>Y&ecirc;u cầu:</p>
<p>- Giấy tờ đầy đủ</p>
<p>- Anh em h&ograve;a đồng, t&ocirc;n trọng nhau, phải c&oacute; &yacute; thức giữ g&igrave;n vệ sinh chung.</p>
<p>- Kh&ocirc;ng tuyển GAY, kh&ocirc;ng quậy ph&aacute; xăm trổ.</p>
<p>- Đặt cọc 300k. Nếu muốn chuyển đi, BẮT BUỘC b&aacute;o m&igrave;nh trước 1 tuần, m&igrave;nh ho&agrave;n trả lại đầy đủ</p>
<p>Li&ecirc;n hệ: O9O2.33.15.1O (Để lại SMS nếu ko thấy m&igrave;nh nghe m&aacute;y nh&eacute;, m&igrave;nh sẽ li&ecirc;n lạc lại)</p>
<p>Địa chỉ: 84/32 B&ugrave;i Quang L&agrave;, phường 12, G&ograve; Vấp</p>
<p>(C&ograve;n tin l&agrave; c&ograve;n tuyển - Khi đến xem nh&agrave; nhớ gọi trước v&igrave; m&igrave;nh hay đi ra ngo&agrave;i)</p>', 700000.0000, 40000.0000, 20000.0000, 20000.0000, 65, 0, 1, 0, 1, 1, 0, 1, N'đông', 2, 2, 1, 15, CAST(0xA03C0B00 AS Date), 2, 1, 1, N'image/14.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (244, 2, 13, N'NHÀ NGUYÊN CĂN CHO THUÊ GẦN NGÃ TƯ HÀNG XANH ', N'Nam Kỳ Khởi Nghĩa, Hòa Hải, Đà Nẵng, Việt Nam', CAST(15.97808630 AS Decimal(10, 8)), CAST(108.26181960 AS Decimal(11, 8)), N'<p>Bạn sẽ l&agrave; chủ của căn nh&agrave; tiện nghi sang trọng chỉ với gi&aacute; cực k&igrave; hấp dẫn 7tr/th&aacute;ng`45m2 kết cấu gồm 1 trệt 1 lầu.2phong ngủ 1 ph&ograve;ng kh&aacute;ch bếp&nbsp;</p>
<p>- Nh&agrave; rộng tho&aacute;ng m&aacute;t, khu d&acirc;n cư tiện nghi th&iacute;ch hợp cho sinh vi&ecirc;n, gia đ&igrave;nh, người đi l&agrave;m văn minh, lịch sự.</p>
<p>Hướng đi qua Q.1, Q2, GV 9.TĐ.......</p>
<p>Đặc điểm ph&ograve;ng:</p>
<p>- Ph&ograve;ng rộng với s&agrave;n nh&agrave; l&aacute;t gạch s&aacute;ng b&oacute;ng sạch sẽ, tho&aacute;ng m&aacute;t.</p>
<p>- Cửa sổ,ban c&ocirc;ng rộng đ&oacute;n kh&iacute; trời v&agrave;o nh&agrave;, tiết kiệm được b&oacute;ng đ&egrave;n v&agrave;o ban ng&agrave;y.</p>
<p>Đặt cọc: 1 th&aacute;ng tiền nh&agrave; (đảm bảo hợp đồng d&agrave;i hạn trong suốt qu&aacute; tr&igrave;nh ở v&agrave; cam kết ho&agrave;n trả 100% cọc khi kết th&uacute;c hợp đồng).</p>
<p>Đặc biệt d&agrave;nh ri&ecirc;ng cho kh&aacute;ch h&agrave;ng lịch sự, tri thức, phong c&aacute;ch đẳng cấp mong muốn sống cuộc sống tự do, tiện nghi. Gọi ngay chủ nh&agrave; để hẹn giờ v&agrave; xem nh&agrave;</p>
<p>Hẹn gặp lại c&aacute;c bạn trong căn nh&agrave; tự do, tiện nghi, sang trọng của ri&ecirc;ng bạn!</p>', 2100000.0000, 3000.0000, 3000.0000, 5000.0000, 40, 1, 1, 0, 0, 1, 1, 2, N'Tây Nam', 3, 2, 1, 14, CAST(0xA03C0B00 AS Date), 2, 1, 1, N'image/44.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (245, 5, 8, N'Tìm 1 bạn nữ ở ghép ưu tiên nhân viên văn phòng, sinh viên', N'Tịnh Bắc, Sơn Tịnh, Quảng Ngãi, Việt Nam', CAST(15.17791470 AS Decimal(10, 8)), CAST(108.66803710 AS Decimal(11, 8)), N'<p>Ph&ograve;ng cần tuyển th&ecirc;m một bạn nữ ở gh&eacute;p. Tiền ph&ograve;ng 2 triệu một th&aacute;ng chia 3 tiền điện, nước, m&aacute;y giặc,wifi cộng lại một người khoảng hơn 800000đ. ph&ograve;ng s&agrave;n gỗ m&aacute;t mẻ sạch sẽ ,ph&ograve;ng tắm bồn tắm m&aacute;y nước n&oacute;ng tiện nghi, khu hẻm xe hơi c&acirc;y cối nhiều kh&ocirc;ng kh&iacute; rất tốt .camera đầy đủ khu an ninh rất đảm bảo . hiện ph&ograve;ng đang ở 3 người c&oacute; 1 ng sắp chuyển ra cần tuyển gấp một bạn nữ, 2 bạn cũng c&oacute; thể xem x&eacute;t,.ph&ograve;ng trong nh&agrave; nguy&ecirc;n căn c&oacute; chổ để xe ri&ecirc;ng , bếp nấu ăn ri&ecirc;ng , m&aacute;y giặc chung. địa điểm ở ngay coop mart phan văn trị ng&atilde; 3 l&ecirc; đức thọ giao vs phan văn trị , kế b&ecirc;n chợ rau rất thuận tiện &nbsp;, gần tường đh c&ocirc;ng nghiệp ,... đi học đi l&agrave;m đều rất tiện &nbsp;.ưu ti&ecirc;n bạn n&agrave;o &iacute;t đồ, sạch sẽ, th&acirc;n thiện vui vẽ, sinh vi&ecirc;n, ng l&agrave;m văn ph&ograve;ng&nbsp;</p>', 850000.0000, 50000.0000, 10000.0000, 0.0000, 20, 0, 0, 0, 0, 1, 0, 2, N'đông', 1, 2, 2, 5, CAST(0xA03C0B00 AS Date), 4, 1, 1, N'image/26.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (246, 5, 8, N'Tìm 1 nữ ở ghép với mình tại Đà Nẵng ưu tiên sinh viên', N'Hòa Thuân Ngũ Hành Sơn Đà Nẵng', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'<p>M&igrave;nh l&agrave; d&acirc;n văn ph&ograve;ng qu&ecirc; ở B&igrave;nh Định,mới thu&ecirc; ph&ograve;ng trọ gi&aacute; 1,3 triệu/ph&ograve;ng/&nbsp;th&aacute;ng , gần ng&atilde; ba T&acirc;n Sơn- Quang Trung. Ph&ograve;ng tho&aacute;ng ,WC ri&ecirc;ng,c&oacute; chỗ phơi đồ, wifi, chỗ để xe ri&ecirc;ng an to&agrave;n, gần chợ.</p>
<p>M&igrave;nh ở tr&ecirc;n g&aacute;c, tầng dưới c&ograve;n kh&aacute; rộng n&ecirc;n cần th&ecirc;m người ở gh&eacute;p&nbsp;share tiền ph&ograve;ng. Nếu l&agrave; Sinh vi&ecirc;n muốn ở m&igrave;nh chỉ lấy tiền ph&ograve;ng l&agrave; 500k.</p>
<p>Y&ecirc;u cầu phải lịch sự, trung thực.</p>', 550000.0000, 20000.0000, 10000.0000, 5000.0000, 20, 1, 0, 0, 0, 1, 0, 3, N'bắc', 1, 2, 2, 18, CAST(0xA03C0B00 AS Date), 16, 1, 1, N'image/19.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (247, 2, 13, N'CHO THUÊ NHÀ NGUYÊN CĂN MỚI, THOÁNG MÁT,SẠCH ĐẸP, AN NINH', N'Hòa Thuận Tây, Đà Nẵng, Việt Nam', CAST(16.04669470 AS Decimal(10, 8)), CAST(108.20958000 AS Decimal(11, 8)), N'<p>Cho thu&ecirc; nh&agrave; nguy&ecirc;n căn mới sơn sửa lại, nh&agrave; đ&uacute;c 1 tấm thật, c&oacute; cổng r&agrave;o.</p>
<p>Diện t&iacute;ch sử dụng 88m2, 2 ph&ograve;ng ngủ, 2 toilet, 1 bếp, nh&agrave; sạch sẽ, tho&aacute;ng m&aacute;t, khu an ninh, đường nhựa trước nh&agrave; 8m - xe tải, xe hơi v&agrave;o được tận nh&agrave;, tiện cho gia đ&igrave;nh thu&ecirc; hoặc kinh doanh văn ph&ograve;ng cty.&nbsp;</p>
<p>Địa chỉ nh&agrave;: 55/13/7 Đường số 18B, KP 1, Phường B&igrave;nh Hưng Ho&agrave; A, Quận Ngũ H&agrave;nh Sơn! Giao th&ocirc;ng tiện lợi, gần AEON Celadon, chợ L&ecirc; Văn Quới, ra Quốc lộ gần.</p>
<p>Mọi chi tiết xin li&ecirc;n hệ <strong>Mr Ch&aacute;nh&nbsp;0975 989 996</strong> hoặc Ms Anh 096 999 8986 nh&agrave; ch&iacute;nh chủ.</p>
<p>Xem nh&agrave; v&agrave;o cuối tuần. Tiếp kh&aacute;ch thiện ch&iacute; (MTG)</p>', 4000000.0000, 2000.0000, 3000.0000, 5000.0000, 80, 1, 1, 1, 1, 0, 0, 3, N'Tây Nam', 3, 2, 1, 18, CAST(0xA03C0B00 AS Date), 0, 1, 1, N'image/44.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (248, 2, 13, N'NHÀ CHO THUÊ NGUYÊN CĂN, LÊ VĂN LƯƠNG, NGUYỄN BÌNH, NHÀ BÈ', N'Sông Trà Khúc, Quảng Ngãi, Việt Nam', CAST(15.14985540 AS Decimal(10, 8)), CAST(108.65170640 AS Decimal(11, 8)), N'<p>- Tầng trệt: 1 ph&ograve;ng kh&aacute;ch, 1 nh&agrave; bếp, 1 WC&nbsp;<br />- Tầng 1: 2 ph&ograve;ng ngủ. 1 wc&nbsp;<br />- Tầng 2: 2 ph&ograve;ng ngủ, 1 wc&nbsp;<br />- Vị tr&iacute;: ng&atilde; tư nguyễn b&igrave;nh, KDC đ&ocirc;ng đ&uacute;c, anh ninh , nh&agrave; &nbsp;mặt tiền</p>
<p>- Đi qua Trung t&acirc;m th&agrave;nh phố 20p, qua Ph&uacute; Mỹ Hưng 10p, ĐH T&ocirc;n Đức Thắng- Lotte Mart từ 5p-10p.</p>
<p>- Đường hẻm rộng cho xe hơi ra v&agrave;o, điện nước nh&agrave; nước&nbsp;</p>
<p>Li&ecirc;n hệ: anh Triết. Sdt 01677944498&nbsp;</p>', 7000000.0000, 3000.0000, 2000.0000, 5000.0000, 70, 1, 1, 1, 1, 1, 1, 2, N'Tây Bắc', 3, 2, 2, 4, CAST(0xA03C0B00 AS Date), 0, 1, 1, N'image/47.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (249, 5, 8, N'Tìm 2 nam ở ghép', N'Hoa Trà, Ho Chi Minh-stad, Hồ Chí Minh, Việt Nam', CAST(10.79782740 AS Decimal(10, 8)), CAST(106.69177640 AS Decimal(11, 8)), N'<p>Hiện tại bọn m&igrave;nh đang cần một người ở gh&eacute;p tại địa chỉ 169/25 Trần Văn Đang, Q.3.</p>
<p>Ph&ograve;ng sạch sẽ tho&aacute;ng m&aacute;t, nh&agrave; vệ sinh ri&ecirc;ng, diện t&iacute;ch khoảng 30m2, nấu ăn v&agrave; giờ giấc thoải m&aacute;i, kh&ocirc;ng chung chủ. chổ để xe ri&ecirc;ng. giờ giấc thoải m&aacute;i. Ph&ograve;ng c&oacute; ban c&ocirc;ng tho&aacute;ng m&aacute;t. Gần chợ, c&ocirc;ng vi&ecirc;n l&ecirc; thị ri&ecirc;ng, ga s&agrave;i g&ograve;n. gần c&aacute;c trường đại học như KHTN, BK, TNMT, ...</p>
<p>Ưu ti&ecirc;n nh&acirc;n vi&ecirc;n văn ph&ograve;ng.</p>
<p>Li&ecirc;n hệ: 0909428540</p>', 550000.0000, 2000.0000, 2000.0000, 10000.0000, 30, 0, 0, 0, 1, 1, 1, 3, N'tây nam', 1, 2, 1, 10, CAST(0xA03C0B00 AS Date), 8, 1, 1, N'image/22.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (250, 1, 35, N'User 29 cho thuê phòng trọ, khác 29 mới được gợi ý', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>User 30 cho thu&ecirc; ph&ograve;ng trọ, kh&aacute;c 30 mới được gợi &yacute;</p>', 1500000.0000, 0.0000, 0.0000, 0.0000, 0, 0, 1, 1, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 6, 1, 1, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (251, 2, 13, N'NHÀ CHO THUÊ NGUYÊN CĂN RẤT ĐẸP', N'Hòa Bình 2, Hòa Quý, Đà Nẵng, Việt Nam', CAST(15.98836420 AS Decimal(10, 8)), CAST(108.23171800 AS Decimal(11, 8)), N'<p>Địa chỉ: Hẻm 220 Ho&agrave;ng Hoa Th&aacute;m (c&aacute;ch đường 30m) P.5, Quận Ngũ H&agrave;nh Sơn, Đ&agrave; Nẵng</p>
<p>DT s&agrave;n: 4m x 8,5 m. &nbsp;DTSD: 70m2</p>
<p>Nh&agrave; mới đẹp, đầy đủ tiện nghi, ph&ograve;ng ngủ c&oacute; m&aacute;y lạnh, c&oacute; m&aacute;y nước n&oacute;ng,1 trệt 1 lầu, 2WC ngay chợ C&acirc;y Qu&eacute;o gần trường học bệnh viện, an ninh tuyệt đối.</p>
<p>Ph&ugrave; hợp với người đi l&agrave;m, hộ gia đ&igrave;nh v&agrave; mở văn ph&ograve;ng kinh doanh</p>', 1200000.0000, 2000.0000, 3000.0000, 4000.0000, 50, 1, 0, 0, 1, 1, 0, 3, N'Đông Bắc', 1, 1, 2, 19, CAST(0xA03C0B00 AS Date), 1, 1, 0, N'image/52.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (252, 4, 9, N'Cho thuê mặt bằng ở Đà Nẵng', N'Hoang Thuan Hair Salon, Hoà Minh, Đà Nẵng, Việt Nam', CAST(16.06013470 AS Decimal(10, 8)), CAST(108.16308260 AS Decimal(11, 8)), N'<p>Cho thu&ecirc; MẶT BẰNG tại số 32 Đường &Iacute;ch Thiện, P. T&acirc;n Th&agrave;nh, Q. T&acirc;n Ph&uacute; (ngay chợ T&acirc;n Ph&uacute; 1). Mới&nbsp;x&acirc;y, đ&uacute;c BTCT đẹp, ki&ecirc;n cố, c&oacute; g&aacute;c, tolet ri&ecirc;ng, DT 35m2.</p>
<p>Vị tr&iacute; đắc địa, ngay trong l&ograve;ng chợ n&ecirc;n thuận tiện bu&ocirc;n b&aacute;n, kinh doanh mọi ng&agrave;nh nghề. Vừa KD, vừa sinh sống.&nbsp;</p>
<p>MP wifi v&agrave; c&aacute;p tivi.</p>
<p>Gi&aacute; 9,5 trd. Cọc 1 th&aacute;ng</p>
<p>LH:&nbsp;A Phi&ecirc;u: 094 7104594/</p>
<p>098 5517408</p>', 9500000.0000, 3000.0000, 2000.0000, 10000.0000, 33, 0, 0, 1, 0, 0, 1, 3, N'Đông', 1, 0, 3, 18, CAST(0xA03C0B00 AS Date), 10, 1, 1, N'image/28.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (253, 1, 35, N'User 29 đi tìm, cần gửi đến 30', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>User 29 đi t&igrave;m, cần gửi đến 30</p>', 0.0000, 0.0000, 0.0000, 0.0000, 0, 1, 1, 1, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 3, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (254, 4, 9, N'Cho thuê mặt bằng rộng dễ buôn bán', N'Hoa Hop Coffee Shop, Đà Nẵng, Việt Nam', CAST(16.07390240 AS Decimal(10, 8)), CAST(108.15196160 AS Decimal(11, 8)), N'<p>Vidoland -cho thu&ecirc; văn ph&ograve;ng trọn g&oacute;i sang trọng, tiết kiệm, trung t&acirc;m T&acirc;n B&igrave;nh-s&acirc;n bay T&acirc;n Sơn Nhất.<br />IBC Office cho thu&ecirc; Văn ph&ograve;ng trọn g&oacute;i, tiện nghi hơn cả văn ph&ograve;ng truyền thống.&nbsp;</p>
<p>-*** T&ograve;a nh&agrave; văn ph&ograve;ng mặt tiền 6 tầng tại: Số B20 Đường Bạch Đằng, Phường 2, Q. T&acirc;n B&igrave;nh.&nbsp;<br />Diện t&iacute;ch: 20m2 - 40m2 &ndash; 60m2 &ndash; 80m2 &ndash; 120m2 &ndash; 150m2 &ndash; 200m2 &ndash; 400m2.&nbsp;<br />Gi&aacute; thu&ecirc;: Từ 5tr - 29tr/th (tỳ v&agrave;o diện t&iacute;ch SD chọn của doanh nghiệp).&nbsp;</p>
<p>***TIỆN &Iacute;CH:</p>
<p>-S&acirc;n thượng 100m2 c&oacute; sẵn hệ thống điện, nước rất th&iacute;ch hợp kinh doanh fast food, coffee....&nbsp;<br />- Văn ph&ograve;ng l&agrave;m việc sang trọng , nằm trong t&ograve;a nh&agrave; hạng A.<br />- Khu vực tiếp kh&aacute;ch khang trang, ph&ograve;ng họp chuy&ecirc;n nghiệp.<br />-Office cho thu&ecirc; &ndash; view sang trọng, tuyến đường huyết mạch Trường Sơn, Bạch Đằng &ndash; c&oacute; m&aacute;y ph&aacute;t điện tự động&hellip;.</p>
<p>-&nbsp;Office Vidoland view đẹp, long mạch nở hậu n&ecirc;n việc kinh doanh lu&ocirc;n thuận lợi v&agrave; ph&aacute;t đạt.&nbsp;</p>
<p>- Cam kết gi&aacute; so s&aacute;nh, c&oacute; rẻ hơn so to&agrave;n khu vực.&nbsp;<br />- Chất lượng phục vụ office ph&ugrave; hợp với gi&aacute; tiền qu&yacute; kh&aacute;ch h&agrave;ng đ&atilde; chọn thu&ecirc;.&nbsp;</p>
<p>- Nh&acirc;n vi&ecirc;n lễ t&acirc;n, IT, tạp vụ chuy&ecirc;n nghiệp, hỗ trợ to&agrave;n thời gian h&agrave;nh ch&iacute;nh.<br />- Hệ thống camera an ninh, hầm gửi xe đảm bảo, thang m&aacute;y hiện đại.<br />**Li&ecirc;n hệ xem ph&ograve;ng trực tiếp tại :B20- BẠCH ĐẰNG,P4,QUẬN T&Acirc;N B&Igrave;NH-TP.HCM.<br /><br />- Điện thoại: 0902 66 2874 Ms Đậm<br />- ĐC Gmail : nguyendam100@GAMIL.COM</p>', 1000000.0000, 2000.0000, 3000.0000, 0.0000, 38, 1, 0, 1, 1, 0, 0, 3, N'', 2, 0, 3, 17, CAST(0xA03C0B00 AS Date), 5, 1, 1, N'image/30.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (255, 1, 35, N'User 29 cho thuê, không hiện bài của 29 mới đúng', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>User 29 cho thu&ecirc;, kh&ocirc;ng hiện b&agrave;i của 29 mới đ&uacute;ng</p>', 0.0000, 0.0000, 0.0000, 0.0000, 0, 0, 1, 1, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 6, 1, 1, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (256, 4, 9, N'Cho thuê mặt bằng trung tâm thành phố', N'Hòa Hải, Đà Nẵng, Việt Nam', CAST(15.98655800 AS Decimal(10, 8)), CAST(108.26740920 AS Decimal(11, 8)), N'<p>Funroom Building quận T&acirc;n B&igrave;nh với vị tr&iacute; đắc địa, ngay cạnh TTTM, t&agrave;i ch&iacute;nh v&agrave; l&agrave; cửa ng&otilde; của TP Hồ Ch&iacute; Minh. Văn ph&ograve;ng cho thu&ecirc; quận t&acirc;n b&igrave;nh l&agrave; nơi l&yacute; tưởng cho c&aacute;c đơn vị danh tiếng v&agrave; l&agrave; bước khởi đầu, nền tảng cho mọi doanh nghiệp.</p>
<p>Tiện &iacute;ch bao gồm :</p>
<p>+ Giao th&ocirc;ng thuận tiện với quận 1, quận 3, b&igrave;nh thạnh, t&acirc;n ph&uacute;,v.v....Gần c&aacute;c trung t&acirc;m thương mại lớn nhất TP.HCM.</p>
<p>+ Văn ph&ograve;ng Funroom Building sở hữu tầm nh&igrave;n tho&aacute;ng đ&aacute;ng, kh&ocirc;ng kh&iacute; trong l&agrave;nh n&ecirc;n sẽ mang lại nguồn cảm hứng, niềm đam m&ecirc; v&agrave; thỏa sức s&aacute;ng tạo trong c&ocirc;ng việc.</p>
<p>+ Ngo&agrave;i ra, t&ograve;a nh&agrave; cũng được trang bị thang m&aacute;y tốc độ cao, hệ thống camera quan s&aacute;t, hệ thống PCCC tự động gi&uacute;p đảm bảo an ninh an to&agrave;n 24/24, hệ thống internet v&agrave; điện thoại tốc độ cao...</p>
<p>+ Được xếp hạng văn ph&ograve;ng &nbsp;với nhiều tiện &iacute;ch ph&ugrave; hợp cho thu&ecirc; văn ph&ograve;ng v&agrave; diện t&iacute;ch đa dạng, t&ograve;a nh&agrave; văn ph&ograve;ng Funroom Building gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; thể thu&ecirc; được văn ph&ograve;ng tốt nhất.</p>
<p>+L&agrave; nơi khơi nguồn cảm hứng, s&aacute;ng tạo hơn, th&agrave;nh c&ocirc;ng hơn trong c&ocirc;ng việc của bạn.</p>
<p>+Diện t&iacute;ch :25m2-50m2</p>
<p>+G&iacute;a thu&ecirc; : 6tr-12tr</p>
<p>Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; nhu cầu t&igrave;m hiểu th&ocirc;ng tin, thu&ecirc; văn ph&ograve;ng quận T&acirc;n B&igrave;nh tại t&ograve;a Funroom Building vui l&ograve;ng li&ecirc;n hệ để được tư vấn v&agrave; đi xem văn ph&ograve;ng trực tiếp.</p>
<p>Địa chỉ : 76 MAI THỊ LỰU, QUẬN 1</p>
<p>Li&ecirc;n hệ : 0902662874 Ms.Đậm quản l&yacute; t&ograve;a nh&agrave;.</p>', 1500000.0000, 2000.0000, 2994.0000, 0.0000, 30, 0, 0, 1, 1, 0, 1, 3, N'Tây', 2, 0, 3, 14, CAST(0xA03C0B00 AS Date), 14, 1, 1, N'image/35.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (257, 1, 35, N'User 29 cho thuê, cần gửi đến khác 29', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>User 29 đi t&igrave;m, cần gửi đến kh&aacute;c 29</p>', 10000000.0000, 0.0000, 0.0000, 0.0000, 0, 0, 1, 1, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 6, 1, 1, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (258, 4, 9, N'Cần tìm mặt bằng rộng để buôn bán', N'Tịnh Sơn, Quảng Ngãi, Việt Nam', CAST(15.16059380 AS Decimal(10, 8)), CAST(108.70663980 AS Decimal(11, 8)), N'<p class="&quot;MsoNormal&quot;">thu&ecirc; mặt bằng diện t&iacute;ch 4 x 17 (nguy&ecirc;n tầng trệt) gi&aacute; 12 triệu / th&aacute;ng khu kinh doanh sầm uất gần ng&atilde; ba &Acirc;u Cơ &ndash; Ba V&acirc;n &ndash; Trương C&ocirc;ng Định, nh&agrave; đối diện c&ocirc;ng vi&ecirc;n, trường học, gần si&ecirc;u thị, bệnh viện, chung cư, phi&aacute; sau c&oacute; ph&ograve;ng ri&ecirc;ng c&oacute; thể ở lại (đường 125 Ba V&acirc;n F14 Q.TB)</p>
<p class="&quot;MsoNormal&quot;">LH: 0937 806 836</p>', 1500000.0000, 2500.0000, 3000.0000, 0.0000, 65, 1, 1, 1, 1, 0, 1, 1, N'Đông nam', 2, 0, 1, 4, CAST(0xA03C0B00 AS Date), 8, 1, 0, N'image/40.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (259, 4, 9, N'Cho thuê mặt bằng mở quán cafe', N'Tịnh Trà, Quảng Ngãi, Việt Nam', CAST(15.22892990 AS Decimal(10, 8)), CAST(108.69476170 AS Decimal(11, 8)), N'<p>Cho thu&ecirc; mặt bằng, gần chợ, gần truong hoc cấp 1,2, gần nh&agrave; thờ Nam Hải, gần trươfng ĐH S&agrave;i G&ograve;n đi bộ khoảng 10\\\\\\\\\\\\\\\''nh&agrave; sạch đep tho&aacute;ng m&aacute;t.</p>
<p>Cần nam sv ở gh&eacute;p gi&aacute; thoả thuận.</p>', 1000000.0000, 3000.0000, 2500.0000, 0.0000, 66, 0, 0, 0, 0, 0, 0, 3, N'Tây', 2, 0, 3, 3, CAST(0xA03C0B00 AS Date), 17, 1, 1, N'image/43.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (260, 1, 35, N'Tôi  là user 29, đang cho thuê', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>T&ocirc;i &nbsp;l&agrave; user 29, đang cho thu&ecirc;</p>', 0.0000, 0.0000, 0.0000, 0.0000, 0, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 3, 1, 1, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (261, 4, 10, N'Cho thuê mặt bằng rộng phong thủy tốt', N'Hòa Vang, Đà Nẵng, Việt Nam', CAST(15.99998800 AS Decimal(10, 8)), CAST(108.14579940 AS Decimal(11, 8)), N'<p>VĂN PH&Ograve;NG CHO THU&Ecirc; BẬT NHẤT KHU VỰC T&Acirc;N B&Igrave;NH-HO&Agrave;NG HOA TH&Aacute;M.</p>
<p>Funroom Building quận T&acirc;n B&igrave;nh với vị tr&iacute; đắc địa, ngay cạnh TTTM, t&agrave;i ch&iacute;nh v&agrave; l&agrave; cửa ng&otilde; của TP Hồ Ch&iacute; Minh. Văn ph&ograve;ng cho thu&ecirc; quận t&acirc;n b&igrave;nh l&agrave; nơi l&yacute; tưởng cho c&aacute;c đơn vị danh tiếng v&agrave; l&agrave; bước khởi đầu, nền tảng cho mọi doanh nghiệp.</p>
<p>Tiện &iacute;ch bao gồm :</p>
<p>+ Giao th&ocirc;ng thuận tiện với quận 1, quận 3, b&igrave;nh thạnh, t&acirc;n ph&uacute;,v.v....Gần c&aacute;c trung t&acirc;m thương mại lớn nhất TP.HCM.</p>
<p>+ Văn ph&ograve;ng Funroom Building sở hữu tầm nh&igrave;n tho&aacute;ng đ&aacute;ng, kh&ocirc;ng kh&iacute; trong l&agrave;nh n&ecirc;n sẽ mang lại nguồn cảm hứng, niềm đam m&ecirc; v&agrave; thỏa sức s&aacute;ng tạo trong c&ocirc;ng việc.</p>
<p>+ Ngo&agrave;i ra, t&ograve;a nh&agrave; cũng được trang bị thang m&aacute;y tốc độ cao, hệ thống camera quan s&aacute;t, hệ thống PCCC tự động gi&uacute;p đảm bảo an ninh an to&agrave;n 24/24, hệ thống internet v&agrave; điện thoại tốc độ cao...</p>
<p>+ Được xếp hạng văn ph&ograve;ng &nbsp;với nhiều tiện &iacute;ch ph&ugrave; hợp cho thu&ecirc; văn ph&ograve;ng v&agrave; diện t&iacute;ch đa dạng, t&ograve;a nh&agrave; văn ph&ograve;ng Funroom Building gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; thể thu&ecirc; được văn ph&ograve;ng tốt nhất.</p>
<p>+ L&agrave; nơi khơi nguồn cảm hứng, s&aacute;ng tạo hơn, th&agrave;nh c&ocirc;ng hơn trong c&ocirc;ng việc của bạn.</p>
<p>Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; nhu cầu t&igrave;m hiểu th&ocirc;ng tin, thu&ecirc; văn ph&ograve;ng quận T&acirc;n B&igrave;nh tại t&ograve;a Funroom Building vui l&ograve;ng li&ecirc;n hệ để được tư vấn v&agrave; đi xem văn ph&ograve;ng trực tiếp.</p>
<p>Địa chỉ : 48A Th&acirc;n Nh&acirc;n Trung, P.13, Quận T&acirc;n B&igrave;nh.</p>
<p>Li&ecirc;n hệ : 0902662874 Ms.Đậm quản l&yacute; t&ograve;a nh&agrave;.</p>', 10000.0000, 2500.0000, 3000.0000, 0.0000, 30, 0, 0, 1, 0, 0, 0, 3, N'đông bắc', 1, 0, 3, 15, CAST(0xA03C0B00 AS Date), 0, 1, 0, N'image/45.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (262, 4, 10, N'Cho thuê mặt bằng ở ngã tư', N'Trà Bồng, Quảng Ngãi, Việt Nam', CAST(15.25126450 AS Decimal(10, 8)), CAST(108.49882690 AS Decimal(11, 8)), N'<p class="&quot;MsoNormal&quot;">CHO THU&Ecirc; MẶT BẰNG TIỆN KINH DOANH CAF&Eacute;, QUẦN &Aacute;O, VĂN PH&Ograve;NG</p>
<p class="&quot;MsoNormal&quot;">Cho thu&ecirc; mặt bằng diện t&iacute;ch 4 x 17 (nguy&ecirc;n tầng trệt) gi&aacute; 12 triệu / th&aacute;ng khu kinh doanh sầm uất gần ng&atilde; ba &Acirc;u Cơ &ndash; Ba V&acirc;n &ndash; Trương C&ocirc;ng Định, nh&agrave; đối diện c&ocirc;ng vi&ecirc;n, trường học, gần si&ecirc;u thị, bệnh viện, chung cư, phi&aacute; sau c&oacute; ph&ograve;ng ri&ecirc;ng c&oacute; thể ở lại (đường 125 Ba V&acirc;n F14 Q.TB)</p>
<p class="&quot;MsoNormal&quot;">LH: 0937 806 836</p>', 10000000.0000, 2000.0000, 2000.0000, 0.0000, 60, 1, 0, 0, 1, 0, 0, 3, N'bắc ', 2, 0, 3, 12, CAST(0xA03C0B00 AS Date), 1, 1, 1, N'image/49.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (263, 4, 10, N'Mặt bằng thuận lợi kinh doanh', N'Tịnh Sơn, Quảng Ngãi, Việt Nam', CAST(15.16059380 AS Decimal(10, 8)), CAST(108.70663980 AS Decimal(11, 8)), N'<p>IBC Office cho thu&ecirc; Văn ph&ograve;ng trọn g&oacute;i, tiện nghi hơn cả văn ph&ograve;ng truyền thống. Tiết kiệm 50% chi ph&iacute;.</p>
<p>- Địa chỉ kinh doanh trung t&acirc;m Q1.</p>
<p>- Văn ph&ograve;ng l&agrave;m việc sang trọng d&agrave;nh cho 3 &ndash; 4 người, nằm trong t&ograve;a nh&agrave; hạng A.</p>
<p>- Khu vực tiếp kh&aacute;ch khang trang, ph&ograve;ng họp chuy&ecirc;n nghiệp.</p>
<p>- Đầy đủ tiện &iacute;ch văn ph&ograve;ng: M&aacute;y in, photocopy, điện thoại cố định tại b&agrave;n l&agrave;m việc, điều h&ograve;a, kết nối internet, m&aacute;y chiếu, tủ lạnh, l&ograve; vi s&oacute;ng, &hellip;.</p>
<p>- Nh&acirc;n vi&ecirc;n Lễ t&acirc;n, IT, tạp vụ chuy&ecirc;n nghiệp, hỗ trợ to&agrave;n thời gian h&agrave;nh ch&iacute;nh.</p>
<p>- Hệ thống camera an ninh, hầm gửi xe đảm bảo, thang m&aacute;y hiện đại.</p>
<p>**Li&ecirc;n hệ IBC Office:</p>
<p>- Ph&ograve;ng 802 Vietnam Business Center Building, 57-59 Hồ T&ugrave;ng Mậu, P.Bến Ngh&eacute;, Q.1.</p>
<p>- Ph&ograve;ng 8.6, Le Meridien Building, 3C T&ocirc;n Đức Thắng, P.Bến Ngh&eacute;, Q.1</p>
<p>- Điện thoại : 08.7309.9986 ext 1</p>
<p>- Website: http://ibcoffice.com.vn</p>', 15000000.0000, 4000.0000, 2500.0000, 20000.0000, 70, 1, 0, 0, 1, 0, 1, 3, N'Tây', 1, 0, 3, 2, CAST(0xA03C0B00 AS Date), 7, 1, 1, N'image/53.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (264, 4, 10, N'Cho thuê mặt bằng mở shop', N'Hòa Xuân, Đà Nẵng, Việt Nam', CAST(16.00199830 AS Decimal(10, 8)), CAST(108.21995880 AS Decimal(11, 8)), N'<p>Cho thue mặt bằng mặt tiền L&ecirc; Văn Thọ tuyệt đẹp rộng v&agrave; khang trang lằm giữa cong vi&ecirc;n l&agrave;ng hoa v&agrave; chợ đ&ecirc;m hạnh th&ocirc;ng t&acirc;y thuận tiện kinh doanh cho nhiều lĩnh vực.&nbsp;</p>', 20000000.0000, 2000.0000, 2000.0000, 30000.0000, 75, 1, 0, 1, 0, 0, 0, 3, N'nam', 2, 0, 3, 20, CAST(0xA03C0B00 AS Date), 7, 1, 0, N'image/57.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (265, 2, 14, N'NHÀ CHO THUÊ NGUYÊN CĂN GIÁ RẺ 5TR/THÁNG,NGŨ HÀNH SƠN, HÒA HẢI, TP. ĐÀ NẴNG', N'Hòa Thuận Tây, Đà Nẵng, Việt Nam', CAST(16.04669470 AS Decimal(10, 8)), CAST(108.20958000 AS Decimal(11, 8)), N'<div id="motachitiet" class="block-content-2"><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong>
<p>Nh&agrave; cho thu&ecirc; nguy&ecirc;n căn gi&aacute; rẻ 5tr/th&aacute;ng.&nbsp;</p>
<p>Địa chỉ: : 827/12/6 Nam Kỳ Khởi Nghĩa, P H&ograve;a Hải, Q.Ngũ H&agrave;nh Sơn.&nbsp;</p>
<p>DT 3,5x11 trệt+1 lầu, 2 ph&ograve;ng, khu d&acirc;n cư y&ecirc;n tĩnh, sau lưng c&ocirc;ng an, ubnd phường BTĐ B, gần bệnh viện, chợ ...tiện mở văn ph&ograve;ng, cty, nh&agrave; xưởng, ở, cho thu&ecirc; l&acirc;u d&agrave;i. li&ecirc;n hệ anh Điều 0918918658</p>
<p>Li&ecirc;n hệ anh Điều 0918918658</p>
</div>
<div class="readmore-url block-content-2">&nbsp;</div>', 5000000.0000, 3000.0000, 1498.0000, 0.0000, 96, 1, 1, 1, 1, 0, 0, 3, N'Đông nam', 2, 6, 3, 18, CAST(0xA03C0B00 AS Date), 1, 1, 1, N'image/16.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (266, 2, 14, N'CHO THUÊ NHÀ NGUYÊN CĂN , PHÒNG MỚI, SẠCH SẼ, CÓ SÂN VƯỜN', N'Trà Bình, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.12382000 AS Decimal(10, 8)), CAST(108.81169900 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p>Gồm 1 trệt, 2 lầu, 1 tầng thượng</p>
<p>Mỗi tầng 2 ph&ograve;ng 18-20m2, toilet v&agrave; cầu thang ở giữa, tầng thượng rộng c&oacute; toilet n&ecirc;n c&oacute; thể thiết kế th&ecirc;m 1 ph&ograve;ng. Bếp tầng trệt, c&oacute; lối đi ri&ecirc;ng ở ph&iacute;a sau.</p>
<p>Tiện nghi: 5 điều h&ograve;a, 4 quạt trần, 3 b&igrave;nh n&oacute;ng lạnh&hellip;</p>
<p>Gi&aacute; thu&ecirc;: 10 triệu/th&aacute;ng, cọc 3 th&aacute;ng.</p>
<p>Hợp đồng 2-3 năm</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', 10000000.0000, 3000.0000, 2000.0000, 0.0000, 100, 1, 1, 1, 1, 0, 1, 3, N'Bắc', 3, 6, 3, 8, CAST(0xA03C0B00 AS Date), 0, 1, 1, N'image/3.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (267, 2, 14, N'CHO THUÊ NHÀ NGUYÊN CĂN 1 TRỆT, 2 LẦU, 1 SÂN THƯỢNG', N'Hòa Vang, Đà Nẵng, Việt Nam', CAST(15.99998800 AS Decimal(10, 8)), CAST(108.14579940 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p>Gồm 1 trệt, 2 lầu, 1 tầng thượng</p>
<p>Mỗi tầng 2 ph&ograve;ng 18-20m2, toilet v&agrave; cầu thang ở giữa, tầng thượng rộng c&oacute; toilet n&ecirc;n c&oacute; thể thiết kế th&ecirc;m 1 ph&ograve;ng. Bếp tầng trệt, c&oacute; lối đi ri&ecirc;ng ở ph&iacute;a sau.</p>
<p>Tiện nghi: 2 điều h&ograve;a, 4 quạt trần, 3 b&igrave;nh n&oacute;ng lạnh&hellip;</p>
<p>Gi&aacute; thu&ecirc;: 7 triệu/th&aacute;ng</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', 7000008.0000, 2000.0000, 1500.0000, 15000.0000, 100, 0, 1, 1, 0, 1, 0, 1, N'tây nam', 3, 6, 1, 15, CAST(0xA03C0B00 AS Date), 3, 1, 1, N'image/30.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (282, 2, 14, N'NHÀ NGUYÊN CĂN (54M2) – SẠCH SẼ, CÓ SÂN MÁT, KHU VỰC TRỒNG RAU KHU VỰC NGŨ HÀNH SƠN, TP ĐÀ NẴNG', N'Hòa Hải, Đà Nẵng, Việt Nam', CAST(15.98655800 AS Decimal(10, 8)), CAST(108.26740920 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p>NH&Agrave; TRỆT MỚI KHU Ở Y&Ecirc;N TỈNH, SẠCH SẼ, 1 PH&Ograve;NG KH&Aacute;CH, 1 PH&Ograve;NG NGỦ, 1 BẾP, 1 NH&Agrave; VỆ SINH.</p>
<p>C&Oacute; S&Acirc;N TRỒNG RAU SẠCH, C&Aacute;CH TRUNG T&Acirc;M QUẬN 1, 30 PH&Uacute;T ĐI XE.</p>
<p>ĐIỆN, NƯỚC, INTERNET</p>
<p>ƯU TI&Ecirc;N C&Aacute;C BẠN SINH VI&Ecirc;N ĐI HỌC HOẶC GIA Đ&Igrave;NH ĐI L&Agrave;M.&nbsp;0909306255</p>', 4000000.0000, 3000.0000, 1000.0000, 0.0000, 54, 1, 1, 1, 0, 0, 1, 3, N'Bắc', 1, 3, 3, 14, CAST(0xA03C0B00 AS Date), 1, 0, 1, N'image/12.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (283, 2, 14, N'CẦN TÌM NHÀ NGUYÊN CĂN, GIÁ RẺ TỪ 2 TRIỆU-3 TRIỆU', N'Trà Bồng, tt. Trà Xuân, Quảng Ngãi, Việt Nam', CAST(15.25903470 AS Decimal(10, 8)), CAST(108.50548260 AS Decimal(11, 8)), N'<p>CẦN T&Igrave;M NH&Agrave; TRỆT MỚI KHU Ở Y&Ecirc;N TỈNH, SẠCH SẼ.</p>
<p>C&Oacute; S&Acirc;N TRỒNG RAU SẠCH, GẦN CHỢ, GẦN TRƯỜNG HỌC</p>
<p>C&Oacute; ĐẦY ĐỦ ĐIỆN, NƯỚC, INTERNET.</p>', 2000000.0000, 0.0000, 0.0000, 0.0000, 0, 1, 1, 1, 0, 0, 1, 3, N'', 0, 0, 3, 9, CAST(0xA03C0B00 AS Date), 1, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (284, 1, 15, N'CẦN TÌM PHÒNG TRỌ SINH VIÊN , GIÁ RẺ TỪ 500 NGHÌN - 1 TRIỆU', N'FPT Complex Building, Hòa Hải, Đà Nẵng, Việt Nam', CAST(15.97828270 AS Decimal(10, 8)), CAST(108.26314940 AS Decimal(11, 8)), N'<p>Cần t&igrave;m ph&ograve;ng trọ:</p>
<p>+Kh&ocirc;ng chung chủ, giờ giấc tự do bạn b&egrave; người th&acirc;n tới chơi thoải m&aacute;i.&nbsp;</p>
<p>+ Gần t&ograve;a nh&agrave; FPT Complex.</p>
<p>+ Ph&ograve;ng sạch sẽ, tho&aacute;ng m&aacute;t, c&oacute; chỗ để xe.</p>
<p>+C&oacute; nước sạch, c&oacute; cửa sổ, v&agrave; đặc biệt l&agrave; gần nơi y&ecirc;n tĩnh.</p>
<p>&nbsp;</p>', 500000.0000, 0.0000, 0.0000, 0.0000, 0, 1, 0, 0, 0, 1, 0, 3, N'', 0, 0, 3, 14, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (285, 1, 15, N'PHÒNG TRỌ CAO CẤP, SẠCH RẺ, AN NINH GIÁ CHỈ TỪ 2TR500 ĐẾN 3TR', N'Tịnh Trà, Quảng Ngãi, Việt Nam', CAST(15.22892990 AS Decimal(10, 8)), CAST(108.69476170 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p><strong>CHO THU&Ecirc; PH&Ograve;NG TRỌ MỚI X&Acirc;Y CAO CẤP C&Oacute; G&Aacute;C LỬNG GI&Aacute; B&Igrave;NH D&Acirc;N</strong></p>
<p>*Nơi mang đến cho bạn m&ocirc;i trường sống văn ho&aacute; ,an to&agrave;n v&agrave; sạch sẽ.</p>
<p>Vị tr&iacute;</p>
<p>* Ph&ograve;ng trọ:</p>
<p>- Giảm 10% cho ban thu&ecirc; ph&ograve;ng lần đầu ti&ecirc;n</p>
<p>Địa chỉ: Tịnh Tr&agrave;- Sơn Tịnh - Quảng Ng&atilde;i</p>
<p>+ Kh&ocirc;ng &nbsp;chung chủ, giờ giấc tự do bạn b&egrave; người th&acirc;n tới chơi thoải m&aacute;i.&nbsp;</p>
<p>+ Ph&ograve;ng &nbsp;ben ngo&agrave;i c&oacute; ban c&ocirc;ng tho&aacute;ng m&aacute;t, s&acirc;n thượng rất rộng , bạn c&oacute; thể ngắm to&agrave;n cảnh th&agrave;nh phố .</p>
<p>&nbsp;</p>
<p>+ To&agrave;n &nbsp;bộ ph&ograve;ng được l&aacute;t gạch men n&ecirc;n ph&ograve;ng ốc tr&ocirc;ng rất&nbsp;sạch sẽ v&agrave; cao cấp.&nbsp;</p>
<p>+Khu &nbsp;vực gần nh&agrave; người dan ở n&ecirc;n rất y&ecirc;n tĩnh</p>
<p>+ Gần chợ n&ecirc;n ban thoải m&aacute;i nấu những m&oacute;n ăn minh th&iacute;ch nh&eacute;</p>
<p>+Chỗ để xe rộng r&atilde;i</p>
<p>+Bảo &nbsp;vệ trực 24/24&nbsp;</p>
<p>Bạn sẽ sở hữu ngay 1 căn ph&ograve;ng như m&igrave;nh mong muốn&nbsp;</p>
<p>+ V&igrave; số lượng c&oacute; hạn n&ecirc;n gọi ngay cho ch&uacute;ng t&ocirc;i để đặt ph&ograve;ng nh&eacute;</p>
<p>Li&ecirc;n hệ: C Hằng</p>
<p>Điện thoại: 0986191475</p>', 2500000.0000, 3000.0000, 1500.0000, 0.0000, 0, 1, 0, 0, 0, 1, 1, 3, N'tây nam', 1, 3, 3, 3, CAST(0xA03C0B00 AS Date), 0, 0, 1, N'image/21.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (286, 1, 15, N'PHÒNG TRỌ AN NINH, TIỆN NGHI, SẠCH SẼ GẦN FPT CITY', N'Khu đô thị FPT City, Đà Nẵng, Việt Nam', CAST(15.97706310 AS Decimal(10, 8)), CAST(108.26296040 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p>M&igrave;nh cần cho thu&ecirc; ph&ograve;ng gần khu FPT City,&nbsp;đường Nam Kỳ Khởi Nghĩa, Quận Ngũ H&agrave;nh Sơn</p>
<p>Ph&ograve;ng rộng r&atilde;i, sạch sẽ, view đẹp ngắm th&agrave;nh phố, giờ giấc tự do, ở chung cư n&ecirc;n rất an ninh, kh&ocirc;ng lo trộm cắp.</p>
<p>Ban c&ocirc;ng rộng, m&aacute;t mẻ thuận tiện phơi quần &aacute;o, sinh hoạt chung,...B&ecirc;n m&igrave;nh trang bị sẵn M&Aacute;Y GIẶT v&agrave; TỦ LẠNH (d&ugrave;ng chung), c&oacute; sẵn kệ bếp nấu ăn ( d&ugrave;ng chung), wifi tốc độ cao (free)&nbsp;</p>
<p>Hiện tại c&oacute; c&aacute;c ph&ograve;ng như sau:&nbsp;</p>
<p>_ Ph&ograve;ng 12 m&eacute;t cửa sổ tho&aacute;ng m&aacute;t (c&oacute; thể dọn v&agrave;o ở ngay) gi&aacute; 1tr6/th&aacute;ng</p>
<p>_Ph&ograve;ng 16 m&eacute;t cửa sổ tho&aacute;ng m&aacute;t, c&oacute; 1 kho nhỏ trong ph&ograve;ng (15/4 c&oacute; thể dọn v&agrave;o) gi&aacute; 1tr8 / th&aacute;ng&nbsp;</p>
<p>* B&ecirc;n m&igrave;nh bao ph&iacute; quản l&yacute;, mỗi tuần sẽ c&oacute; nh&acirc;n vi&ecirc;n l&agrave;m vệ sinh 2 lần. Ph&iacute; giữ xe tầng hầm chung cư 80k/xe m&aacute;y/th&aacute;ng.&nbsp;</p>
<p>*kh&ocirc;g gian sinh hoạt b&ecirc;n dưới chung cư rộng r&atilde;i tho&aacute;ng m&aacute;t, c&ocirc;ng vi&ecirc;n, ph&ograve;ng gym, hồ bơi, qu&aacute;n ăn, cafe, chợ đầy đủ. Trạm taxi v&agrave; xe bu&yacute;t ngay dưới chung cư.</p>
<p>* Đ&acirc;y l&agrave; h&igrave;nh chụp thật, ko copy bừa tr&ecirc;n mạng nh&eacute;!</p>
<p>Li&ecirc;n hệ: 0915446387 (c&ocirc; Nga)</p>', 1800000.0000, 3000.0000, 1500.0000, 0.0000, 0, 1, 1, 1, 1, 1, 1, 3, N'tây nam', 1, 3, 3, 15, CAST(0xA03C0B00 AS Date), 0, 0, 1, N'image/21.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (287, 1, 15, N'PHÒNG TRỌ ĐẦY ĐỦ TIỆN NGHI GẦN CAO ĐẲNG CNTT', N'Cao Đẳng Công Nghệ Thông Tin - Đại Học Đà Nẵng, Điện Ngọc, Quảng Nam, Việt Nam', CAST(15.97218330 AS Decimal(10, 8)), CAST(108.24959620 AS Decimal(11, 8)), N'<p><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></p>
<p>Hiện nay m&igrave;nh c&oacute; một số ph&ograve;ng trống cho thu&ecirc; gần trường CĐ CNTT Đ&agrave; Nằng<br />1. TIỆN &Iacute;CH CHUNG:<br />Giờ giấc tự do (c&oacute; ch&igrave;a kh&oacute;a ri&ecirc;ng)<br />Khu vực an ninh, y&ecirc;n tĩnh, c&oacute; camera gi&aacute;m s&aacute;t trong hẻm.<br />C&oacute; chỗ để xe trong nh&agrave;.<br />Wifi mạnh<br />Ph&ograve;ng c&oacute; đầy đủ nội thất như: m&aacute;y lạnh, m&aacute;y nước n&oacute;ng, tủ gỗ lớn, giường đệm,wc ri&ecirc;ng, m&aacute;y giặt(chung), c&oacute; cửa sổ tho&aacute;ng,<br /><br />Tr&acirc;n trọng c&aacute;m ơn!</p>', 1500000.0000, 3000.0000, 1000.0000, 0.0000, 22, 1, 0, 0, 0, 1, 1, 4, N'', 1, 3, 3, 14, CAST(0xA03C0B00 AS Date), 0, 0, 1, N'image/10.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (288, 1, 15, N'PHÒNG TRỌ DÀNH CHO SINH VIÊN, NHÂN VIÊN VĂN PHÒNG', N'Sơn Tịnh, Quảng Ngãi, Việt Nam', CAST(15.18609450 AS Decimal(10, 8)), CAST(108.73633700 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p class="\&quot;MsoNormal\&quot;">Cần cho thu&ecirc; nh&agrave; mới c&oacute; nhiều ph&ograve;ng, gi&aacute; cả từ 1.7-2,5 triệu/th.<br />Mỗi ph&ograve;ng trang bị gạch ốp cao tường, nh&agrave; VS ri&ecirc;ng, c&oacute; g&aacute;c, wifi, Th c&aacute;p, giờ giấc tự do. Chỗ để xe an to&agrave;n (free nh&eacute;), c&oacute; s&acirc;n thượng, chỗ phơi đồ ri&ecirc;ng. Điện nước gi&aacute; nh&agrave; nước. Ph&ograve;ng ngay khu vực cư x&aacute; Ng&acirc;n h&agrave;ng th&iacute;ch hợp cho ai l&agrave;m v&agrave; học.<br />(chủ nh&agrave;: C&ocirc; B&igrave;nh - 0906911434).</p>', 1700000.0000, 3000.0000, 1000.0000, 0.0000, 22, 1, 0, 0, 0, 1, 1, 4, N'', 1, 3, 3, 8, CAST(0xA03C0B00 AS Date), 0, 0, 1, N'image/10.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (289, 1, 16, N'CẦN TÌM PHÒNG TRỌ DÀNH CHO SINH VIÊN, HỌC SINH GẦN KTX CAO ĐẲNG VIỆT HÀN', N'Hòa Hải, Đà Nẵng, Việt Nam', CAST(15.98655800 AS Decimal(10, 8)), CAST(108.26740920 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p class="\&quot;MsoNormal\&quot;">Cần t&igrave;m ph&ograve;ng trọ gi&aacute; rẻ</p>
<p class="\&quot;MsoNormal\&quot;">Gần trường, d&agrave;nh cho sinh vi&ecirc;n, học sinh. C&oacute; g&aacute;c xếp, c&oacute; internet. Giờ giấc thoải m&aacute;i, y&ecirc;n tĩnh.</p>
<p class="\&quot;MsoNormal\&quot;">Tự do nấu ăn trong ph&ograve;ng.</p>
<p class="\&quot;MsoNormal\&quot;">Kh&ocirc;ng ở chung với chủ.</p>', 0.0000, 0.0000, 0.0000, 0.0000, 0, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 14, CAST(0xA03C0B00 AS Date), 1, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (290, 1, 16, N'CHO THUÊ PHÒNG TRỌ ĐẸP,CÓ BẾP,BAN CÔNG RỘNG', N'Hòa Xuân, Đà Nẵng, Việt Nam', CAST(16.00199830 AS Decimal(10, 8)), CAST(108.21995880 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p>Cho thu&ecirc; ph&ograve;ng trọ , nh&agrave; mới x&acirc;y 100%. an ninh v&agrave; y&ecirc;n tĩnh. Tất cả c&aacute;c ph&ograve;ng đều c&oacute; hệ thống cửa sổ, cửa từ, bảo vệ thang m&aacute;y 24/24. lầu cao gi&oacute; lộng. Cửa sổ cao . 1 lầu chỉ c&oacute; 3 ph&ograve;ng.&nbsp;<br /><br />Đứng trước t&igrave;nh h&igrave;nh x&atilde; hội nhiều bất ổn v&agrave; biến động, c&aacute;c d&atilde;y ph&ograve;ng trọ bị trộm cướp mất cắp, rối loạn trật tự an to&agrave;n, c&oacute; khu nha tro ị cướp rất nhiều.... Khiến người thu&ecirc; chịu nhiều rủi ro, kh&ocirc;ng an cư kh&ocirc;ng lạc nghiệp. M&ocirc; h&igrave;nh ph&ograve;ng cho thu&ecirc; nhằm giải quyết tất cả những vấn đề bất cập n&agrave;y.&nbsp;<br /><br />Nh&agrave; l&agrave; nơi nghỉ ngơi l&yacute; tưởng an ninh với đội ngũ bảo vệ tận t&acirc;m 24/7.&nbsp;<br /><br />Ph&ograve;ng của ch&uacute;ng t&ocirc;i:&nbsp;<br />1. An ninh l&agrave; tr&ecirc;n hết.&nbsp;<br />2. Địa điểm thuận tiện c&ocirc;ng việc, kh&ocirc;ng bị kẹt xe.&nbsp;<br />3. Dịch vụ quản l&yacute; chất lượng, camera ghi h&igrave;nh.&nbsp;<br />4. Điện nước gi&aacute; nh&agrave; nước.&nbsp;<br />5. Dịch vụ bảo vệ chuy&ecirc;n nghiệp, tầng hầm 2000m2, 8 block 24/7.&nbsp;<br />6. Free wifi c&aacute;p quang Viettel 30MB.&nbsp;<br />7. Tận hưởng tiện &iacute;ch xung quanh .&nbsp;<br />8. Vệ sinh được ch&uacute; trọng 2 - 3 lần 1 tuần.&nbsp;<br />9. Giờ giấc tự do cấp ph&aacute;t ri&ecirc;ng key ra v&agrave;o.&nbsp;<br />10. An ninh 100%.&nbsp;<br />C&ograve;n 1 ph&ograve;ng cho thu&ecirc;: WC trong ph&ograve;ng th&iacute;ch hợp tiện lợi sinh vi&ecirc;n học sinh, nh&acirc;n vi&ecirc;n văn ph&ograve;ng.&nbsp;<br />c&ograve;n chần chờ g&igrave; m&agrave; kh&ocirc;ng nhanh ch&acirc;n đến xem để tận hưởng dịch vụ m&agrave; ch&uacute;ng t&ocirc;i mang lại.</p>', 1500000.0000, 2000.0000, 1500.0000, 0.0000, 0, 1, 1, 1, 0, 1, 1, 3, N'', 1, 0, 3, 20, CAST(0xA03C0B00 AS Date), 1, 0, 1, N'image/9.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (291, 1, 16, N'CHO THUÊ PHÒNG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU DÂN CƯ, GIÁ 2TR – 3TR/THÁNG', N'Sơn Tịnh, Quảng Ngãi, Việt Nam', CAST(15.18609450 AS Decimal(10, 8)), CAST(108.73633700 AS Decimal(11, 8)), N'<p><strong><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></strong></p>
<p>CHO THU&Ecirc; PH&Ograve;NG ĐẸP, ĐẦY ĐỦ NỘI THẤT, KHU D&Acirc;N CƯ&nbsp;</p>
<p>- S&agrave;n gỗ mới, đẹp.</p>
<p>- Thang m&aacute;y cho 7 người, 500kg</p>
<p>- Hầm để xe rộng r&atilde;i, tho&aacute;ng m&aacute;t</p>
<p>- C&oacute; chỗ đậu xe hơi.</p>
<p>- Bảo vệ 24/24</p>
<p>- Giờ giấc tự do, thoải m&aacute;i.</p>
<p>- Tivi, tủ lạnh, m&aacute;y lạnh, m&aacute;y giặt.</p>
<p>- Tủ quần &aacute;o, b&agrave;n l&agrave;m vi&ecirc;c</p>
<p>- Giường, nệm, drap, gối mền.</p>
<p>- WC, kệ bếp, b&agrave;n ăn ri&ecirc;ng trong ph&ograve;ng</p>
<p>- Khu vực an ninh, y&ecirc;n tĩnh, d&acirc;n tr&iacute; cao, d&acirc;n ph&ograve;ng 24/24, kh&ocirc;ng ngập nước.</p>
<p>- Camera to&agrave;n bộ khu vực sinh hoạt chung.</p>
<p>- Diện t&iacute;ch: 20m2 - 50m2</p>
<p>Miễn ph&iacute;:&nbsp;</p>
<p>- M&aacute;y giặt.</p>
<p>- Truyền h&igrave;nh c&aacute;p, internet tốc độ cao.</p>
<p>ĐT: 0903.628.959 - 0903.692.575</p>', 2000000.0000, 3000.0000, 1000.0000, 10000.0000, 50, 1, 1, 1, 1, 1, 1, 3, N'', 2, 5, 3, 12, CAST(0xA03C0B00 AS Date), 2, 0, 1, N'image/60.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (292, 1, 16, N'PHÒNG TRỌ CAO CẤP FULL NỘI THẤT MẶT TIỀN TÂN MỸ', N'Hòa Vang, Đà Nẵng, Việt Nam', CAST(15.99998800 AS Decimal(10, 8)), CAST(108.14579940 AS Decimal(11, 8)), N'<p><span class="block_headline">TH&Ocirc;NG TIN M&Ocirc; TẢ</span></p>
<p>Cho thu&ecirc; ph&ograve;ng cao cấp mặt tiền đường T&acirc;n Mỹ</p>
<p>Ph&ograve;ng cao cấp mới 100%, an ninh, sạch sẽ, y&ecirc;n tĩnh, tho&aacute;ng m&aacute;t.</p>
<p>Ph&ugrave; hợp với sinh vi&ecirc;n học tập, nh&acirc;n vi&ecirc;n văn ph&ograve;ng, gia đ&igrave;nh nhỏ.</p>
<p>Th&ocirc;ng tin cơ bản:</p>
<p>- T&ograve;a nh&agrave; cao 7 tầng, được trang bị thang m&aacute;y hiện đại</p>
<p>- Diện t&iacute;ch ph&ograve;ng từ 15m2, gi&aacute; từ 4 triệu/th&aacute;ng</p>
<p>- Tất cả c&aacute;c ph&ograve;ng đều được trang bị: giường, nệm, tủ quần &aacute;o, tủ lạnh, m&aacute;y lạnh, m&aacute;y giặt, m&aacute;y nước n&oacute;ng</p>
<p>* Điện 3000đ/KWh</p>
<p>* Miễn ph&iacute; wifi, chỗ đậu xe, giặt đồ, r&aacute;c.</p>
<p>* Giờ giấc tự do, kh&ocirc;ng chung chủ.</p>
<p>* Đặt cọc 1 th&aacute;ng tiền ph&ograve;ng.</p>
<p>Lưu &yacute;: Ph&ograve;ng kh&ocirc;ng c&oacute; g&aacute;c.</p>
<p>Li&ecirc;n hệ anh Hải: 0919.916.131.</p>', 4000000.0000, 3000.0000, 2000.0000, 0.0000, 15, 1, 1, 1, 0, 0, 1, 3, N'', 1, 0, 3, 15, CAST(0xA03C0B00 AS Date), 2, 0, 1, N'image/62.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (293, 1, 36, N'30 tim mmmmmmmmmmmmmmmmmmmmmmmmmmmmm', N'', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'<p>30 tim mmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>', 100000.0000, 0.0000, 0.0000, 0.0000, 3, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (294, 1, 36, N' 111Ký Túc Xá Sạch An Toàn Nhất Sài Gòn ', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>30 tim mmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>', 100000.0000, 0.0000, 0.0000, 0.0000, 3, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (295, 1, 36, N'User 30 đi tìm, cần gửi đến khác 30', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>SQL: select Thread.*, temp.avgScore from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId WHERE kindOf = 1 AND waterSource = 1 AND categoryId = 1 AND accountId != 36 AND Thread.latitude between 14.957641315128 and 15.317590084871998 and Thread.longitude between 108.62656291512795 and 108.98651168487194 AND Province.provinceId = 1 AND District.districtId = 1 AND Village.villageId = 1 and status = 1 order by threadId offset 0 rows fetch next 12 row only</p>', 100000.0000, 0.0000, 0.0000, 0.0000, 3, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (296, 1, 36, N'select Thread.accountId from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId   WHERE  kindOf = 0  AND   waterSourc', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>select Thread.accountId from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId &nbsp; WHERE &nbsp;kindOf = 0 &nbsp;AND &nbsp; waterSource = &nbsp;1 AND &nbsp; categoryId = &nbsp;1 AND &nbsp; object = 1 AND &nbsp; area between 25 and 35 &nbsp;AND &nbsp; accountId != 36 AND &nbsp;Thread.latitude between 14.957641315128 and 15.317590084871998 and Thread.longitude between 108.62656291512795 and 108.98651168487194 AND &nbsp; Province.provinceId = 1 AND &nbsp; District.districtId = 1 AND &nbsp; Village.villageId = 1 and status = 1 &nbsp; group by Thread.accountId &nbsp;order by Thread.accountId offset 0 rows fetch next 12 row only</p>', 100000.0000, 0.0000, 0.0000, 0.0000, 3, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (297, 1, 36, N'dadasd dd asd as asdasd  asdasdasda  adasd', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>select Thread.accountId from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId &nbsp; WHERE &nbsp;kindOf = 0 &nbsp;AND &nbsp; waterSource = &nbsp;1 AND &nbsp; categoryId = &nbsp;1 AND &nbsp; object = 1 AND &nbsp; accountId != 36 AND &nbsp;Thread.latitude between 14.957641315128 and 15.317590084871998 and Thread.longitude between 108.62656291512795 and 108.98651168487194 AND &nbsp; Province.provinceId = 1 AND &nbsp; District.districtId = 1 AND &nbsp; Village.villageId = 1 and status = 1 &nbsp; group by Thread.accountId &nbsp;order by Thread.accountId offset 0 rows fetch next 12 row only</p>', 100000.0000, 0.0000, 0.0000, 0.0000, 3, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (298, 1, 36, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 2996, 1, 1, 0, 0, 0, 0, 1, N'', 3000, 3000, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (299, 1, 36, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 2996, 1, 1, 0, 0, 0, 0, 1, N'', 3000, 3000, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (300, 1, 36, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 2996, 1, 1, 0, 0, 0, 0, 1, N'', 3000, 3000, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (301, 1, 36, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 2996, 1, 1, 0, 0, 0, 0, 1, N'', 3000, 3000, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (302, 1, 36, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 2996, 1, 1, 0, 0, 0, 0, 1, N'', 3000, 3000, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (303, 1, 36, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 2996, 1, 1, 0, 0, 0, 0, 1, N'', 3000, 3000, 1, 1, CAST(0xA03C0B00 AS Date), 0, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (304, 1, 36, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 2996, 1, 1, 0, 0, 0, 0, 1, N'', 3000, 3000, 1, 1, CAST(0xA03C0B00 AS Date), 0, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (305, 1, 36, N'asd asdasd as asd a adasda aasd a ad ', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>asd asdasd as asd a adasda aasd a ad&nbsp;</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 1, 0, 0, 0, 0, 0, 0, 1, N'', 1, 1, 1, 1, CAST(0xA03C0B00 AS Date), 1, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (306, 1, 36, N'price price price price price', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>price price price price price</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 1, 0, 0, 0, 0, 0, 0, 1, N'', 1, 1, 1, 1, CAST(0xA03C0B00 AS Date), 1, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (307, 1, 36, N'<= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= <= ', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>&lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;= &lt;=&nbsp;</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 1, 0, 0, 0, 0, 0, 0, 1, N'', 1, 1, 1, 1, CAST(0xA03C0B00 AS Date), 1, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (308, 1, 36, N'5000000 5000000 5000000 50000005000000 5000000 5000000 5000000', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>5000000&nbsp;5000000&nbsp;5000000&nbsp;5000000 5000000 5000000 50000005000000&nbsp;5000000</p>', 100000.0000, 3000.0000, 3000.0000, 3000.0000, 1, 0, 0, 0, 0, 0, 0, 1, N'', 1, 1, 1, 1, CAST(0xA03C0B00 AS Date), 2, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (309, 1, 33, N'on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.scor ', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p><span style="color: #000000; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; display: inline !important; float: none;">on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.scor</span></p>', 100000.0000, 0.0000, 0.0000, 0.0000, 1, 0, 0, 0, 0, 0, 0, 1, N'', 0, 0, 1, 1, CAST(0xA03C0B00 AS Date), 1, 1, 0, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (310, 1, 34, N'on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.scor', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>SQL di push: select Thread.accountId from Thread inner join Village on Village.villageId = Thread.villageId inner join District on District.districtId = Village.districtId inner join Province on Province.provinceId = District.provinceId inner join (select Thread.threadId, avg(Cast(Rate.score as Float)) as avgScore, avg(Rate.score) as avgScoreInt from Thread left join Rate on Thread.threadId = Rate.threadId group by Thread.threadId) temp on Thread.threadId = temp.threadId WHERE kindOf = 0 AND waterSource = 1 AND categoryId = 1 AND object = 1 AND area &lt; 15 AND numOfToilets &lt; 2 AND accountId != 36 AND numOfPeople &lt; 2 AND price &lt; 500000 AND Thread.latitude between 14.957641315128 and 15.317590084871998 and Thread.longitude between 108.62656291512795 and 108.98651168487194 AND Province.provinceId = 1 AND District.districtId = 1 AND Village.villageId = 1 and status = 1 group by Thread.accountId order by Thread.accountId offset 0 rows fetch next 12 row only</p>', 99998.0000, 1233.0000, 1313.0000, 12312.0000, 0, 0, 0, 0, 0, 0, 0, 1, N'', 1, 1, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 1, N'image/default.jpg', NULL, 1)
INSERT [dbo].[Thread] ([threadId], [categoryId], [accountId], [name], [address], [latitude], [longitude], [content], [price], [electricFee], [waterFee], [otherFee], [area], [wifi], [waterHeater], [conditioner], [fridge], [attic], [camera], [waterSource], [direction], [numOfToilets], [numOfPeople], [object], [villageId], [created], [viewed], [status], [kindOf], [imageThumb], [note], [available]) VALUES (311, 1, 34, N'http://localhost:8080/Mock_SE7/user/add-thread-action.do', N'Cầu Trà Khúc 2, Thành phố Quảng Ngãi, Quảng Ngãi, Việt Nam', CAST(15.13761570 AS Decimal(10, 8)), CAST(108.80653730 AS Decimal(11, 8)), N'<p>http://localhost:8080/Mock_SE7/user/add-thread-action.do</p>', 99998.0000, 1233.0000, 1313.0000, 12312.0000, 0, 0, 0, 0, 0, 0, 0, 1, N'', 1, 1, 1, 1, CAST(0xA03C0B00 AS Date), 0, 0, 1, N'image/default.jpg', NULL, 1)
SET IDENTITY_INSERT [dbo].[Thread] OFF
SET IDENTITY_INSERT [dbo].[Village] ON 

INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (1, 1, N'Tịnh Bình')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (2, 1, N'Tịnh Sơn')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (3, 1, N'Tịnh Trà')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (4, 1, N'Tịnh Sơn')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (5, 1, N'Tịnh Bắc')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (6, 1, N'Tịnh Thiện')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (7, 1, N'Tịnh Hòa')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (8, 2, N'Trà Bình')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (9, 2, N'Trà Xuân')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (10, 2, N'Trà Hợi')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (11, 2, N'Trà Ðú')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (12, 2, N'Trà Cao')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (13, 2, N'Trà Hợi')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (14, 3, N'Hoà Hải')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (15, 3, N'Hoà Vang')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (16, 3, N'Hoà Tan')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (17, 3, N'Hoà Hợp')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (18, 3, N'Hoà Thuận')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (19, 3, N'Hoà Bình')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (20, 3, N'Hoà Xuân')
SET IDENTITY_INSERT [dbo].[Village] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uc_Account]    Script Date: 3/29/2017 8:05:56 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [uc_Account] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Thread] ADD  CONSTRAINT [DF_Thread_available]  DEFAULT ((1)) FOR [available]
GO
USE [master]
GO
ALTER DATABASE [QLPT1] SET  READ_WRITE 
GO
