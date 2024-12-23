USE [master]
GO
/****** Object:  Database [FurnitureProjectDB]    Script Date: 2024/11/11 11:11:19 ******/
CREATE DATABASE [FurnitureProjectDB] ON  PRIMARY 
( NAME = N'FurnitureProjectDB', FILENAME = N'G:\SQL2022\FurnitureProjectDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FurnitureProjectDB_log', FILENAME = N'G:\SQL2022\FurnitureProjectDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FurnitureProjectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FurnitureProjectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FurnitureProjectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FurnitureProjectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FurnitureProjectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FurnitureProjectDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FurnitureProjectDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FurnitureProjectDB] SET  MULTI_USER 
GO
ALTER DATABASE [FurnitureProjectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FurnitureProjectDB] SET DB_CHAINING OFF 
GO
USE [FurnitureProjectDB]
GO

/****** Object:  Table [dbo].[address]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](250) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[mark] [varchar](50) NULL,
	[createtime] [date] NULL,
	[uid] [int] NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[power] [smallint] NOT NULL,
	[createtime] [date] NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catename] [varchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[detail] [varchar](50) NOT NULL,
	[uid] [int] NOT NULL,
	[shop_id] [int] NOT NULL,
	[createtime] [date] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[order_num] [varchar](50) NULL,
	[sum_price] [decimal](8, 2) NULL,
	[mark] [varchar](50) NULL,
	[createtime] [date] NULL,
	[is_pay] [smallint] NULL,
	[state] [smallint] NULL,
	[pay_way] [varchar](20) NULL,
	[address_id] [int] NULL,
	[address] [varchar](250) NULL,
	[name] [varchar](50) NULL,
	[phone] [varchar](12) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[count] [int] NULL,
	[price] [decimal](8, 2) NULL,
	[sum_price] [decimal](8, 2) NULL,
	[shop_id] [int] NULL,
	[title] [varchar](255) NULL,
	[aid] [int] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_attribute]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_attribute](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NULL,
	[price] [decimal](18, 2) NULL,
	[pid] [int] NULL,
 CONSTRAINT [PK_attribute] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shop_car]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop_car](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[shopid] [int] NULL,
	[shopNum] [int] NULL,
	[createtime] [date] NULL,
	[aid] [int] NULL,
 CONSTRAINT [PK_shop_car] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[cid] [int] NULL,
	[price] [decimal](8, 2) NOT NULL,
	[sale_price] [decimal](8, 2) NULL,
	[number] [int] NOT NULL,
	[detail] [text] NOT NULL,
	[img] [varchar](255) NOT NULL,
	[shop_number] [varchar](255) NOT NULL,
 CONSTRAINT [PK_shopping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2024/11/11 11:11:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[sex] [smallint] NULL,
	[introduce] [varchar](50) NULL,
	[age] [int] NULL,
	[img] [varchar](200) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([id], [address], [name], [phone], [mark], [createtime], [uid]) VALUES (1, N'Guangdong Province, Zhongshan City, Chaoyang District, Xinshan Road Community 3-201', N'Chen Mingfeng', N'18877881232', N'Home', CAST(N'2023-04-27' AS Date), 2)
INSERT [dbo].[address] ([id], [address], [name], [phone], [mark], [createtime], [uid]) VALUES (3, N'Guangdong Province, Zhongshan City, Chaoyang District, Xinshan Road Community 5-201', N'Chen Mingming', N'18877881231', N'Company', CAST(N'2023-04-27' AS Date), 3)
INSERT [dbo].[address] ([id], [address], [name], [phone], [mark], [createtime], [uid]) VALUES (4, N'Guangdong Province, Zhongshan City, Chaoyang District, Xinshan Road Community 3-201', N'Chen Yu', N'18877881231', N'Home Address', CAST(N'2023-04-29' AS Date), 4)
INSERT [dbo].[address] ([id], [address], [name], [phone], [mark], [createtime], [uid]) VALUES (5, N'Guangdong Province, Zhongshan City, Chaoyang District, Xinshan Road Community 3-201', N'Wang Yu', N'18877881231', N'Home Address', CAST(N'2023-04-29' AS Date), 8)
INSERT [dbo].[address] ([id], [address], [name], [phone], [mark], [createtime], [uid]) VALUES (6, N'Guangdong Province, Zhongshan City, Chaoyang District, Xinshan Road Community 3-201', N'Liu Xiaoxia', N'18877881231', N'Home Address', CAST(N'2023-04-29' AS Date), 11)
INSERT [dbo].[address] ([id], [address], [name], [phone], [mark], [createtime], [uid]) VALUES (7, N'Guangdong Province, Shenzhen City, Nanshan District, Xinshan Road Community 3-201', N'Liu Lixia', N'18877881232', N'Company Address', CAST(N'2023-04-29' AS Date), 11)
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [pwd], [nickname], [power], [createtime]) VALUES (1, N'admin', N'admin', N'Wang Fei', 1, CAST(N'2023-04-20' AS Date))
INSERT [dbo].[admin] ([id], [username], [pwd], [nickname], [power], [createtime]) VALUES (3, N'admin2', N'admin2', N'Chen Xiao', 0, CAST(N'2023-04-20' AS Date))
INSERT [dbo].[admin] ([id], [username], [pwd], [nickname], [power], [createtime]) VALUES (4, N'123', N'123', N'Minmin', 0, CAST(N'2023-04-12' AS Date))
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [catename]) VALUES (1, N'Food')
INSERT [dbo].[category] ([id], [catename]) VALUES (3, N'Digital')
INSERT [dbo].[category] ([id], [catename]) VALUES (4, N'Specialty')
INSERT [dbo].[category] ([id], [catename]) VALUES (5, N'Others')
INSERT [dbo].[category] ([id], [catename]) VALUES (6, N'Snacks')
INSERT [dbo].[category] ([id], [catename]) VALUES (7, N'Sports')
INSERT [dbo].[category] ([id], [catename]) VALUES (8, N'Cosmetics')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [uid], [order_num], [sum_price], [mark], [createtime], [is_pay], [state], [pay_way], [address_id], [address], [name], [phone]) VALUES (17, 2, N'o24111111', CAST(16.00 AS Decimal(8, 2)), N'send me quickly', CAST(N'2024-11-11' AS Date), 1, 0, N'Bank Card', 1, N'Guangdong Province, Zhongshan City, Chaoyang District, Xinshan Road Community 3-201', N'Chen Mingfeng', N'18877881232')
INSERT [dbo].[order] ([id], [uid], [order_num], [sum_price], [mark], [createtime], [is_pay], [state], [pay_way], [address_id], [address], [name], [phone]) VALUES (18, 2, N'o241111SS11', CAST(16.00 AS Decimal(8, 2)), N'', CAST(N'2024-11-11' AS Date), 1, 0, N'Bank Card', 1, N'Guangdong Province, Zhongshan City, Chaoyang District, Xinshan Road Community 3-201', N'Chen Mingfeng', N'18877881232')
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title], [aid]) VALUES (24, 17, 2, CAST(8.00 AS Decimal(8, 2)), CAST(16.00 AS Decimal(8, 2)), 1, N'great food', 4)
INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title], [aid]) VALUES (25, 18, 1, CAST(8.00 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 1, N'great food', 0)
INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title], [aid]) VALUES (26, 18, 1, CAST(8.00 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 1, N'great food', 5)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product_attribute] ON 

INSERT [dbo].[product_attribute] ([id], [title], [price], [pid]) VALUES (4, N'red', CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[product_attribute] ([id], [title], [price], [pid]) VALUES (5, N'green', CAST(8.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[product_attribute] ([id], [title], [price], [pid]) VALUES (6, N'blue', CAST(10.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[product_attribute] OFF
GO
SET IDENTITY_INSERT [dbo].[shopping] ON 

INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number]) VALUES (1, N'great food', 1, CAST(10.00 AS Decimal(8, 2)), CAST(8.00 AS Decimal(8, 2)), 96, N'<p>very good foods</p>', N'/Content/pic/1111095846.png', N'1222')
SET IDENTITY_INSERT [dbo].[shopping] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (2, N'123', N'123', N'Chen Mingfeng', 1, N'Handsome guy!!', 23, N'/Content/pic/0427095647.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (3, N'1231', N'123', N'Chen Ming', 1, N'Handsome guy', 20, N'/assets/img/head.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (4, N'hello', N'hello', N'Chen Yu', 1, N'Handsome!', 33, N'/Content/pic/0429123938.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (5, N'123123', N'123123', N'Minmin!!', 1, N'Beautiful lady!!', 20, N'/assets/img/head.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (6, N'test', N'test', N'Minmin', 0, N'Beautiful lady', 22, N'/Content/pic/0411171619.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (7, N'1234', N'1234', N'Wang Feifei', NULL, NULL, NULL, N'/assets/img/head.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (8, N'zhangsan', N'123456', N'Zhang San', 1, N'Hahaha', 18, N'/Content/pic/0429140608.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (9, N'123456', N'123456', N'Wang Wu', NULL, NULL, NULL, N'/assets/img/head.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (10, N'test1', N'test1', N'Wang Wu', NULL, NULL, NULL, N'/assets/img/head.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (11, N'1234567', N'1234567', N'Liu Xiaoxia', 0, NULL, NULL, N'/assets/img/head.png')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_user] FOREIGN KEY([uid])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_user]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_shopping] FOREIGN KEY([shop_id])
REFERENCES [dbo].[shopping] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_shopping]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_user] FOREIGN KEY([uid])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_user]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([uid])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_shopping] FOREIGN KEY([shop_id])
REFERENCES [dbo].[shopping] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_shopping]
GO
ALTER TABLE [dbo].[product_attribute]  WITH CHECK ADD  CONSTRAINT [FK_product_attribute_shopping] FOREIGN KEY([pid])
REFERENCES [dbo].[shopping] ([id])
GO
ALTER TABLE [dbo].[product_attribute] CHECK CONSTRAINT [FK_product_attribute_shopping]
GO
ALTER TABLE [dbo].[shop_car]  WITH CHECK ADD  CONSTRAINT [FK_shop_car_shopping] FOREIGN KEY([shopid])
REFERENCES [dbo].[shopping] ([id])
GO
ALTER TABLE [dbo].[shop_car] CHECK CONSTRAINT [FK_shop_car_shopping]
GO
ALTER TABLE [dbo].[shop_car]  WITH CHECK ADD  CONSTRAINT [FK_shop_car_user] FOREIGN KEY([uid])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[shop_car] CHECK CONSTRAINT [FK_shop_car_user]
GO
ALTER TABLE [dbo].[shopping]  WITH CHECK ADD  CONSTRAINT [FK_shopping_category] FOREIGN KEY([cid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[shopping] CHECK CONSTRAINT [FK_shopping_category]
GO
USE [master]
GO
ALTER DATABASE [FurnitureProjectDB] SET  READ_WRITE 
GO
