USE [master]
GO
/****** Object:  Database [QLPT1]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[Rate]    Script Date: 3/29/2017 8:56:03 AM ******/
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
/****** Object:  Table [dbo].[Thread]    Script Date: 3/29/2017 8:56:03 AM ******/
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
 CONSTRAINT [pk_Thread] PRIMARY KEY CLUSTERED 
(
	[threadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Village]    Script Date: 3/29/2017 8:56:03 AM ******/
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
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (14, 3, NULL, N'User 8', N'user8@gmail.com', N'123', N'phone 14', 0, N'image/avatar6.jpg')
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
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (35, 3, NULL, N'User 29', N'user29@gmail.com', N'123', N'phone 35', 1, N'image/avatar6.jpg')
INSERT [dbo].[Account] ([accountId], [level], [categoryId], [name], [email], [password], [phone], [status], [avatar]) VALUES (36, 3, NULL, N'User 30', N'user30@gmail.com', N'123', N'phone 36', 0, N'image/avatar7.jpg')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryId], [name]) VALUES (1, N'Phòng trọ')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (2, N'Nhà ở')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (3, N'Căn hộ')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (4, N'Mặt bằng')
INSERT [dbo].[Category] ([categoryId], [name]) VALUES (5, N'Người ở ghép')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([districtId], [provinceId], [name]) VALUES (1, 1, N'Sơn Tịnh')
INSERT [dbo].[District] ([districtId], [provinceId], [name]) VALUES (2, 1, N'Trà Bồng')
INSERT [dbo].[District] ([districtId], [provinceId], [name]) VALUES (3, 2, N'Ngũ Hành Sơn')
INSERT [dbo].[District] ([districtId], [provinceId], [name]) VALUES (4, 2, N'Sơn Trà')
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([provinceId], [name]) VALUES (1, N'Quảng Ngãi')
INSERT [dbo].[Province] ([provinceId], [name]) VALUES (2, N'Ðà Nẵng')
SET IDENTITY_INSERT [dbo].[Province] OFF
SET IDENTITY_INSERT [dbo].[Village] ON 

INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (1, 1, N'Tịnh Bình')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (2, 1, N'Tịnh Sơn')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (3, 1, N'Tịnh Sơn')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (4, 1, N'Tịnh Thiện')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (5, 2, N'Trà Bình')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (6, 2, N'Trà Xuân')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (7, 2, N'Trà Ðú')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (8, 3, N'Khuê Mỹ')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (9, 3, N'Mỹ An')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (10, 3, N'Hoà Hải')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (11, 3, N'Hoà Quý')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (12, 4, N'An Hải Bắc')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (13, 4, N'An Hải Đông')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (14, 4, N'An Hải Tây')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (15, 4, N'Mân Thái')
INSERT [dbo].[Village] ([villageId], [districtId], [name]) VALUES (16, 4, N'Nại Hiên Đông')
SET IDENTITY_INSERT [dbo].[Village] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uc_Account]    Script Date: 3/29/2017 8:56:03 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [uc_Account] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [QLPT1] SET  READ_WRITE 
GO
