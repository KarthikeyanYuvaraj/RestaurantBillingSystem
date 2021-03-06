USE [Restaurant_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdate_BillInfo]    Script Date: 09/06/2014 22:48:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================private Int32	_billid;
		
ALTER PROCEDURE [dbo].[sp_InsertUpdate_BillInfo]
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
        @kotno nchar(10) = null,
        @pax int = null,
        @customername nvarchar(20) = null
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
		kotno = @kotno,
		pax = @pax,
		customername = @customername
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
			kotno,
			pax,
			customername
		
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
			@kotno,
			@pax,
			@customername
		)


	--SET @billid = SCOPE_IDENTITY()
	SELECT SCOPE_IDENTITY()
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_MenuItemId_By_MenuCode]    Script Date: 09/06/2014 22:48:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_MenuItemId_By_MenuCode]
	-- Add the parameters for the stored procedure here
	@menuitemcode nchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @menuid int
    -- Insert statements for procedure here
	SELECT @menuid = menuitemid
	FROM MenuItem
	WHERE RTRIM(menuitemcode) = RTRIM(@menuitemcode)
	
	SELECT @menuid
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Report_Item_Wise_Sales_Summary]
	@StartDate date,
	@EndDate date,
	@paymenttype nvarchar(20)
AS
BEGIN
	IF @paymenttype = 'All'
	BEGIN
		SELECT SUM(BI.subtotal) AS subtotal, SUM(BI.discountamount) AS discount, SUM(BI.servicechargeamount) AS servicechrg,
			SUM(BI.vatamount) AS vat, SUM(BI.grandtotal) AS grandtotal
		FROM BillInfo BI
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
	END
	
	ELSE IF @paymenttype = 'Sales'
	BEGIN
		SELECT SUM(BI.subtotal) AS subtotal, SUM(BI.discountamount) AS discount, SUM(BI.servicechargeamount) AS servicechrg,
			SUM(BI.vatamount) AS vat, SUM(BI.grandtotal) AS grandtotal
		FROM BillInfo BI
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
			AND BI.paymenttypeid != 5
	END
	
	ELSE IF @paymenttype = 'Complimentary'
	BEGIN
		SELECT SUM(BI.subtotal) AS subtotal, SUM(BI.discountamount) AS discount, SUM(BI.servicechargeamount) AS servicechrg,
			SUM(BI.vatamount) AS vat, SUM(BI.grandtotal) AS grandtotal
		FROM BillInfo BI
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
			AND BI.paymenttypeid = 4
	END
	
	ELSE IF @paymenttype = 'Void'
	BEGIN
		SELECT SUM(BI.subtotal) AS subtotal, SUM(BI.discountamount) AS discount, SUM(BI.servicechargeamount) AS servicechrg,
			SUM(BI.vatamount) AS vat, SUM(BI.grandtotal) AS grandtotal
		FROM BillInfo BI
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
			AND BI.paymenttypeid = 5
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Report_Item_Wise_Sales_details]    Script Date: 10/03/2014 03:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Report_Item_Wise_Sales_details]
	@StartDate date,
	@EndDate date,
	@paymenttype nvarchar(20)
AS
BEGIN
	IF @paymenttype = 'All'
	BEGIN
		SELECT BD.menuitemid, MI.menuitemname, MC.menucategoryname, SUM(BD.quantity) AS quantity,BD.unitprice, SUM(BD.totalprice) AS totalprice
		FROM BillInfo BI
			LEFT JOIN BillDetails BD ON BI.billid = BD.billid
			LEFT JOIN MenuItem MI ON BD.menuitemid = MI.menuitemid
			LEFT JOIN MenuCategory MC ON MI.menucategoryid = MC.menucategoryid
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
		GROUP BY BD.menuitemid, BD.unitprice, MI.menuitemname, MC.menucategoryname
	END
	
	ELSE IF @paymenttype = 'Sales'
	BEGIN
		SELECT BD.menuitemid, MI.menuitemname, MC.menucategoryname, SUM(BD.quantity) AS quantity,BD.unitprice, SUM(BD.totalprice) AS totalprice
		FROM BillInfo BI
			LEFT JOIN BillDetails BD ON BI.billid = BD.billid
			LEFT JOIN MenuItem MI ON BD.menuitemid = MI.menuitemid
			LEFT JOIN MenuCategory MC ON MI.menucategoryid = MC.menucategoryid
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
			AND BI.paymenttypeid != 5
		GROUP BY BD.menuitemid, BD.unitprice, MI.menuitemname, MC.menucategoryname
	END
	
	ELSE IF @paymenttype = 'Complimentary'
	BEGIN
		SELECT BD.menuitemid, MI.menuitemname, MC.menucategoryname, SUM(BD.quantity) AS quantity,BD.unitprice, SUM(BD.totalprice) AS totalprice
		FROM BillInfo BI
			LEFT JOIN BillDetails BD ON BI.billid = BD.billid
			LEFT JOIN MenuItem MI ON BD.menuitemid = MI.menuitemid
			LEFT JOIN MenuCategory MC ON MI.menucategoryid = MC.menucategoryid
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
			AND BI.paymenttypeid = 4
		GROUP BY BD.menuitemid, BD.unitprice, MI.menuitemname, MC.menucategoryname
	END
	
	ELSE IF @paymenttype = 'Void'
	BEGIN
		SELECT BD.menuitemid, MI.menuitemname, MC.menucategoryname, SUM(BD.quantity) AS quantity,BD.unitprice, SUM(BD.totalprice) AS totalprice
		FROM BillInfo BI
			LEFT JOIN BillDetails BD ON BI.billid = BD.billid
			LEFT JOIN MenuItem MI ON BD.menuitemid = MI.menuitemid
			LEFT JOIN MenuCategory MC ON MI.menucategoryid = MC.menucategoryid
		WHERE BI.billdate >= @StartDate AND BI.billdate <= @EndDate AND BI.isclosed = 'True'
			AND BI.paymenttypeid = 5
		GROUP BY BD.menuitemid, BD.unitprice, MI.menuitemname, MC.menucategoryname
	END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductValidation](
	[validtill] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_ValidDate]    Script Date: 10/28/2014 21:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get_ValidDate] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX(validtill) AS validtill
	FROM ProductValidation
END
GO

