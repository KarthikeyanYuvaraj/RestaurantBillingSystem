USE [master]
GO
/****** Object:  Database [Restaurant_DB]    Script Date: 08/14/2014 01:17:29 ******/
CREATE DATABASE [Restaurant_DB] ON  PRIMARY 
( NAME = N'Restaurant_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2K8\MSSQL\DATA\Restaurant_DB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Restaurant_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2K8\MSSQL\DATA\Restaurant_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Restaurant_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurant_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurant_DB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Restaurant_DB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Restaurant_DB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Restaurant_DB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Restaurant_DB] SET ARITHABORT OFF
GO
ALTER DATABASE [Restaurant_DB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Restaurant_DB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Restaurant_DB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Restaurant_DB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Restaurant_DB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Restaurant_DB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Restaurant_DB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Restaurant_DB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Restaurant_DB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Restaurant_DB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Restaurant_DB] SET  DISABLE_BROKER
GO
ALTER DATABASE [Restaurant_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Restaurant_DB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Restaurant_DB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Restaurant_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Restaurant_DB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Restaurant_DB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Restaurant_DB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Restaurant_DB] SET  READ_WRITE
GO
ALTER DATABASE [Restaurant_DB] SET RECOVERY FULL
GO
ALTER DATABASE [Restaurant_DB] SET  MULTI_USER
GO
ALTER DATABASE [Restaurant_DB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Restaurant_DB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Restaurant_DB', N'ON'
GO
USE [Restaurant_DB]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[servicetypeid] [int] IDENTITY(1,1) NOT NULL,
	[servicetype] [nchar](20) NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[servicetypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ServiceType] ON
INSERT [dbo].[ServiceType] ([servicetypeid], [servicetype]) VALUES (1, N'Dine In             ')
INSERT [dbo].[ServiceType] ([servicetypeid], [servicetype]) VALUES (2, N'Take Out            ')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
/****** Object:  Table [dbo].[RestaurantInfo]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantInfo](
	[id] [int] NULL,
	[restaurantname] [nvarchar](100) NULL,
	[address] [nvarchar](250) NULL,
	[city] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[contactno1] [nvarchar](50) NULL,
	[contactno2] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[RestaurantInfo] ([id], [restaurantname], [address], [city], [country], [contactno1], [contactno2], [email]) VALUES (1, N'Restaurant Name', N'77/1 Anarkali Super Market, Siddishawari, Dhaka 1217', N'Dhaka', N'Bangladesh', N'01921884040', NULL, NULL)
/****** Object:  Table [dbo].[PaymentType]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[paymenttypeid] [int] IDENTITY(1,1) NOT NULL,
	[paymenttype] [nchar](20) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[paymenttypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (1, N'Cash                ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (2, N'Card                ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (3, N'Company Credit      ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (4, N'Complementary       ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (5, N'Void                ')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
/****** Object:  Table [dbo].[MenuItem]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[menuitemid] [int] IDENTITY(1,1) NOT NULL,
	[menuitemname] [nvarchar](250) NULL,
	[price] [money] NULL,
	[menuitemcode] [int] NOT NULL,
	[menucategoryid] [int] NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[menuitemcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MenuItem] ON
INSERT [dbo].[MenuItem] ([menuitemid], [menuitemname], [price], [menuitemcode], [menucategoryid], [description]) VALUES (1, N'Chicken breast', 240.0000, 201, 2, N'Chicken breast stuffed with stilton, wrapped in bacon and roasted')
INSERT [dbo].[MenuItem] ([menuitemid], [menuitemname], [price], [menuitemcode], [menucategoryid], [description]) VALUES (2, N'Beef', 250.0000, 202, 2, N'Beef curry')
SET IDENTITY_INSERT [dbo].[MenuItem] OFF
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategory](
	[menucategoryid] [int] IDENTITY(1,1) NOT NULL,
	[menucategoryname] [nvarchar](250) NULL,
 CONSTRAINT [PK_MenuCategory] PRIMARY KEY CLUSTERED 
(
	[menucategoryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MenuCategory] ON
INSERT [dbo].[MenuCategory] ([menucategoryid], [menucategoryname]) VALUES (1, N'STARTERS')
INSERT [dbo].[MenuCategory] ([menucategoryid], [menucategoryname]) VALUES (2, N'MAIN COURSES')
INSERT [dbo].[MenuCategory] ([menucategoryid], [menucategoryname]) VALUES (4, N'DRINKS')
SET IDENTITY_INSERT [dbo].[MenuCategory] OFF
/****** Object:  Table [dbo].[ChargeConfiguration]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChargeConfiguration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discountpercent] [int] NULL,
	[servicechargepercent] [int] NULL,
	[vatpercent] [int] NULL,
 CONSTRAINT [PK_ChargeConfiguration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChargeConfiguration] ON
INSERT [dbo].[ChargeConfiguration] ([id], [discountpercent], [servicechargepercent], [vatpercent]) VALUES (1, 10, 10, 15)
SET IDENTITY_INSERT [dbo].[ChargeConfiguration] OFF
/****** Object:  Table [dbo].[BillInfo]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[billid] [int] IDENTITY(1,1) NOT NULL,
	[billno] [nchar](10) NULL,
	[subtotal] [money] NULL,
	[discountpercent] [int] NULL,
	[discountamount] [money] NULL,
	[vatpercent] [int] NULL,
	[vatamount] [money] NULL,
	[grandtotal] [money] NULL,
	[billdate] [date] NULL,
	[paymenttype] [int] NULL,
	[tableno] [int] NULL,
	[billstatus] [nchar](10) NULL,
	[entrydatetime] [datetime] NULL,
	[receivedby] [int] NULL,
	[remarks] [nvarchar](50) NULL,
	[isclosed] [bit] NULL,
	[servicechargepercent] [int] NULL,
	[servicechargeamount] [money] NULL,
	[servicetypeid] [int] NULL,
	[paymenttypeid] [int] NULL,
	[waiterid] [int] NULL,
	[tableid] [int] NULL,
	[kotno] [nchar](10) NULL,
 CONSTRAINT [PK_BillInfo] PRIMARY KEY CLUSTERED 
(
	[billid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[billdetailid] [int] IDENTITY(1,1) NOT NULL,
	[billid] [int] NULL,
	[menuitemid] [int] NULL,
	[quantity] [int] NULL,
	[unitprice] [money] NULL,
	[isdiscountavailable] [bit] NULL,
	[totalprice] [money] NULL,
	[receivedby] [int] NULL,
 CONSTRAINT [PK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[billdetailid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Waiters]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Waiters](
	[waiterid] [int] IDENTITY(1,1) NOT NULL,
	[waitername] [nvarchar](100) NULL,
	[waitercode] [nchar](10) NULL,
 CONSTRAINT [PK_Waiters] PRIMARY KEY CLUSTERED 
(
	[waiterid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Waiters] ON
INSERT [dbo].[Waiters] ([waiterid], [waitername], [waitercode]) VALUES (1, N'A', N'W1        ')
INSERT [dbo].[Waiters] ([waiterid], [waitername], [waitercode]) VALUES (2, N'B', N'W2        ')
SET IDENTITY_INSERT [dbo].[Waiters] OFF
/****** Object:  Table [dbo].[UserInfo]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[userpassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON
INSERT [dbo].[UserInfo] ([userid], [username], [userpassword]) VALUES (1, N'admin', N'123456')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
/****** Object:  Table [dbo].[TempBillDetails]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempBillDetails](
	[billdetailid] [int] IDENTITY(1,1) NOT NULL,
	[billid] [int] NULL,
	[menuitemid] [int] NULL,
	[quantity] [int] NULL,
	[unitprice] [money] NULL,
	[isdiscountavailable] [bit] NULL,
	[totalprice] [money] NULL,
	[receivedby] [int] NULL,
	[isdeleted] [bit] NULL,
 CONSTRAINT [PK_TempBillDetails] PRIMARY KEY CLUSTERED 
(
	[billdetailid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableDetails]    Script Date: 08/14/2014 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDetails](
	[tableid] [int] IDENTITY(1,1) NOT NULL,
	[tablecode] [nchar](10) NULL,
 CONSTRAINT [PK_TableDetails] PRIMARY KEY CLUSTERED 
(
	[tableid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TableDetails] ON
INSERT [dbo].[TableDetails] ([tableid], [tablecode]) VALUES (1, N'1         ')
INSERT [dbo].[TableDetails] ([tableid], [tablecode]) VALUES (2, N'2         ')
INSERT [dbo].[TableDetails] ([tableid], [tablecode]) VALUES (3, N'3         ')
SET IDENTITY_INSERT [dbo].[TableDetails] OFF
/****** Object:  StoredProcedure [dbo].[sp_Select_Waiters_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_Waiters_All]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Waiters
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_UserInfo_By_Username]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_UserInfo_By_Username]
	-- Add the parameters for the stored procedure here
	@username nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM UserInfo
	WHERE RTRIM(username) = RTRIM(@username)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_TempBillDetail_By_BillId]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_TempBillDetail_By_BillId]
	-- Add the parameters for the stored procedure here
	@billid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT T.*, MI.menuitemname
	FROM TempBillDetails T
	LEFT JOIN MenuItem MI ON T.menuitemid = MI.menuitemid
	WHERE T.billid = @billid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_TableDetails_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_TableDetails_All]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM TableDetails
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_ServiceType_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_ServiceType_All]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM ServiceType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_PaymentType_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_PaymentType_All]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	From PaymentType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_Open_BillId_By_TableId]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_Open_BillId_By_TableId]
	-- Add the parameters for the stored procedure here
	@tableid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT billid
	FROM BillInfo
	WHERE tableid = @tableid AND isclosed = 'False'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_MenuItem_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_MenuItem_All]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	    [menuitemid],
	    [menuitemname],
	    [price],
	    [menuitemcode],
	    MenuItem.menucategoryid,
	    MenuCategory.menucategoryname,
	    [description]
FROM
	[dbo].[MenuItem]
	LEFT JOIN MenuCategory ON MenuItem.menucategoryid = MenuCategory.menucategoryid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_MenuItem]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_MenuItem]
	@menuitemid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	    [menuitemid],
	    [menuitemname],
	    [price],
	    [menuitemcode],
	    MenuItem.menucategoryid,
	    MenuCategory.menucategoryname,
	    [description]
FROM
	[dbo].[MenuItem]
	LEFT JOIN MenuCategory ON MenuItem.menucategoryid = MenuCategory.menucategoryid
	
	WHERE
	[menuitemid] = @menuitemid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_MenuCategory_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_MenuCategory_All]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	    [menucategoryid],
	    [menucategoryname]
FROM
	[dbo].[MenuCategory]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_MenuCategory]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_MenuCategory]
	@menucategoryid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	    [menucategoryid],
	    [menucategoryname]
FROM
	[dbo].[MenuCategory]
	
	WHERE
	[menucategoryid] = @menucategoryid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_ChargeConfiguration_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_ChargeConfiguration_All] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM ChargeConfiguration
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_BillInfo_All]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_BillInfo_All]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT billid,billno, subtotal, discountpercent, discountamount, vatpercent, vatamount,
			grandtotal, billdate, paymenttype, tableno, billstatus, entrydatetime, receivedby, remarks,
			isclosed, servicechargepercent, servicechargeamount, servicetypeid, paymenttypeid, waiterid, tableid,
			kotno
	From BillInfo
	WHERE isclosed = 'False'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_BillInfo]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_BillInfo]
	@billid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT billid,billno, subtotal, discountpercent, discountamount, vatpercent, vatamount,
			grandtotal, billdate, paymenttype, tableno, billstatus, entrydatetime, receivedby, remarks,
			isclosed, servicechargepercent, servicechargeamount, servicetypeid, paymenttypeid, waiterid, tableid,
			kotno
			
	From BillInfo
	where billid = @billid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_BillDetail_By_BillId]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_BillDetail_By_BillId]
	-- Add the parameters for the stored procedure here
	@billid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT T.*, MI.menuitemname
	FROM BillDetails T
	LEFT JOIN MenuItem MI ON T.menuitemid = MI.menuitemid
	WHERE T.billid = @billid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdate_TempBillDetails]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertUpdate_TempBillDetails]
	-- Add the parameters for the stored procedure here
	@billdetailid int OUTPUT,
	@billid int,
	@menuitemid int,
	@quantity int,
	@unitprice money,
	@isdiscountavailable bit,
	@totalprice money,
	@receivedby int,
	@isdeleted bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT billid FROM TempBillDetails WHERE billid = @billid AND menuitemid = @menuitemid AND isdeleted = 'False')
	BEGIN
	UPDATE 
        TempBillDetails
        SET
		quantity = @quantity,
		unitprice = @unitprice,
		isdiscountavailable = @isdiscountavailable,
		totalprice = @totalprice,
		receivedby = @receivedby,
		isdeleted = @isdeleted
	WHERE
		billid = @billid AND menuitemid = @menuitemid AND isdeleted = 'False'
	END
	ELSE
	BEGIN
		INSERT INTO TempBillDetails(
			billid,
			menuitemid,
			quantity,
			unitprice,
			isdiscountavailable,
			totalprice,
			receivedby,
			isdeleted
		
		) VALUES (
			@billid,
			@menuitemid,
			@quantity,
			@unitprice,
			@isdiscountavailable,
			@totalprice,
			@receivedby,
			@isdeleted
		)


	SET @billdetailid = SCOPE_IDENTITY()
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdate_MenuItem]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertUpdate_MenuItem]
	-- Add the parameters for the stored procedure here
	@menuitemid int OUTPUT,
	@menuitemname nvarchar(250),
	@price money,
	@menuitemcode int,
	@menucategoryid int,
	@description nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON


IF EXISTS(SELECT [menuitemid] FROM [dbo].[MenuItem] WHERE [menuitemid] = @menuitemid)
BEGIN
	UPDATE 
        [dbo].[MenuItem] 
        SET
		[menuitemname] = @menuitemname,
		[price] = @price,
		[menuitemcode] = @menuitemcode,
		[menucategoryid] = @menucategoryid,
		[description] = @description
	WHERE
		[menuitemid] = @menuitemid
END
ELSE
BEGIN
    INSERT INTO [dbo].[MenuItem] (
	[menuitemname],
	price,
	menuitemcode,
	menucategoryid,
	[description]
	
    ) VALUES (
	@menuitemname,
	@price,
	@menuitemcode,
	@menucategoryid,
	@description
)


SET @menuitemid = SCOPE_IDENTITY()
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdate_MenuCategory]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertUpdate_MenuCategory]
	-- Add the parameters for the stored procedure here
	@menucategoryid int OUTPUT,
	@menucategoryname nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON


IF EXISTS(SELECT [menucategoryid] FROM [dbo].[MenuCategory] WHERE [menucategoryid] = @menucategoryid)
BEGIN
	UPDATE 
        [dbo].[MenuCategory] 
        SET
		[menucategoryname] = @menucategoryname
	WHERE
		[menucategoryid] = @menucategoryid
END
ELSE
BEGIN
    INSERT INTO [dbo].[MenuCategory] (
	[menucategoryname]
    ) VALUES (
	@menucategoryname
)


SET @menucategoryid = SCOPE_IDENTITY()
END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdate_BillInfo]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================private Int32	_billid;
		
CREATE PROCEDURE [dbo].[sp_InsertUpdate_BillInfo]
	@billid int OUTPUT,
	@billno nchar(10) = null,
		@subtotal money,
		@discountpercent int,
		@discountamount money,
		@vatpercent int,
		@vatamount money,
		@grandtotal money,
		@billdate date,
		@paymenttype int,
		@tableno int,
		@billstatus nchar(10) = null,
		@entrydatetime datetime,
		@receivedby int,
		@remarks nvarchar(50) = null,
		@isclosed bit,
        @servicechargepercent int,
        @servicechargeamount money,
        @servicetypeid int,
        @paymenttypeid int, 
        @waiterid int,
        @tableid int,
        @kotno nchar(10) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	IF EXISTS(SELECT billid FROM BillInfo WHERE billid = @billid)
	BEGIN
	UPDATE 
        BillInfo
        SET
        billno = @billno,
		subtotal = @subtotal,
		discountpercent = @discountpercent,
		discountamount = @discountamount,
		vatpercent = @vatpercent,
		vatamount = @vatamount,
		grandtotal = @grandtotal,
		billdate = @billdate,
		paymenttype = @paymenttype,
		tableno = @tableno,
		billstatus = @billstatus,
		entrydatetime = @entrydatetime,
		receivedby = @receivedby,
		remarks = @remarks,
		isclosed =@isclosed,
		servicechargepercent = @servicechargepercent,
		servicechargeamount = @servicechargeamount,
		servicetypeid = @servicetypeid,
		paymenttypeid = @paymenttypeid,
		waiterid = @waiterid,
		tableid = @tableid,
		kotno = @kotno
	WHERE
		billid = @billid
		
		SELECT @billid
	END
	ELSE
	BEGIN
		INSERT INTO BillInfo(
			billno,
			subtotal,
			discountpercent,
			discountamount,
			vatpercent,
			vatamount,
			grandtotal,
			billdate ,
			paymenttype ,
			tableno ,
			billstatus ,
			entrydatetime ,
			receivedby ,
			remarks,
			isclosed,
			servicechargepercent,
			servicechargeamount,
			servicetypeid,
			paymenttypeid, 
			waiterid,
			tableid,
			kotno
		
		) VALUES (
			@billno,
			@subtotal,
			@discountpercent,
			@discountamount,
			@vatpercent,
			@vatamount,
			@grandtotal,
			@billdate ,
			@paymenttype ,
			@tableno ,
			@billstatus ,
			@entrydatetime ,
			@receivedby ,
			@remarks,
			@isclosed,
			@servicechargepercent,
			@servicechargeamount,
			@servicetypeid,
			@paymenttypeid, 
			@waiterid,
			@tableid,
			@kotno
		)


	--SET @billid = SCOPE_IDENTITY()
	SELECT SCOPE_IDENTITY()
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdate_BillDetails]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[sp_InsertUpdate_BillDetails]
	-- Add the parameters for the stored procedure here
	@billdetailid int OUTPUT,
	@billid int,
	@menuitemid int,
	@quantity int,
	@unitprice money,
	@isdiscountavailable bit,
	@totalprice money,
	@receivedby int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT billid FROM BillDetails WHERE billid = @billid AND menuitemid = @menuitemid)
	BEGIN
	UPDATE 
        BillDetails
        SET
		quantity = @quantity,
		unitprice = @unitprice,
		isdiscountavailable = @isdiscountavailable,
		totalprice = @totalprice,
		receivedby = @receivedby
	WHERE
		billid = @billid AND menuitemid = @menuitemid
	END
	ELSE
	BEGIN
		INSERT INTO BillDetails(
			billid,
			menuitemid,
			quantity,
			unitprice,
			isdiscountavailable,
			totalprice,
			receivedby
		
		) VALUES (
			@billid,
			@menuitemid,
			@quantity,
			@unitprice,
			@isdiscountavailable,
			@totalprice,
			@receivedby
		)


	SET @billdetailid = SCOPE_IDENTITY()
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_TempBillDetails]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Delete_TempBillDetails]
	-- Add the parameters for the stored procedure here
	@billid int,
	@menuitemid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE 
        TempBillDetails
        SET
		isdeleted = 'True'
	WHERE
		billid = @billid
		AND menuitemid = @menuitemid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_MenuItem]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Delete_MenuItem]
	@menuitemid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	
DELETE FROM [dbo].[MenuItem]
WHERE
	[menuitemid] = @menuitemid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_MenuCategory]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Delete_MenuCategory]
	@menucategoryid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	
DELETE FROM [dbo].[MenuCategory]
WHERE
	[menucategoryid] = @menucategoryid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_BillInfo]    Script Date: 08/14/2014 01:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Delete_BillInfo]
	-- Add the parameters for the stored procedure here
	@billid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE From BillInfo
	Where billid = @billid
END
GO
