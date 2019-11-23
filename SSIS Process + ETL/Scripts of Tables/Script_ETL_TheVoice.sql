Use master
go

 --TheVoice 

USE [TheVoice]
GO
Create Table [Call Type](
	[Call Type] NVARCHAR(50),
	PricePerMinuter MONEY,
	[Call Type Desc] NVARCHAR(50),
	[Call Type Code] NVARCHAR(50)
)

Create Table OPFILEOPP(
	Prepre NVARCHAR(50),
	OPDDD NVARCHAR(50),
	OPCCC NVARCHAR(50)
)
 
 
 --------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------
  --Mrr_TheVoice


  Use master
  go


IF EXISTS(select * from sys.databases where name='Mrr_TheVoice')
DROP DATABASE Mrr_TheVoice
go

Create database Mrr_TheVoice
go

USE [Mrr_TheVoice]
GO

CREATE TABLE Mrr_Countries(
	[COUNTRY_CODE][nvarchar](100)  primary key  NOT NULL,
	[DESC] [nvarchar](100) NULL,
	[REGION] [nvarchar](100) NULL,
	[AREA] [nvarchar](100) NULL,
	[insert_date] [datetime] NULL,
	[update_date] [datetime] NULL)

CREATE TABLE Mrr_Customer(
	[customer_id]  [int] primary key NOT NULL,
	[CUST_NUMBER] [nvarchar](20) NOT NULL,
	[cust_name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[insert_date] [datetime] NULL,
	[update_date] [datetime] NULL)

CREATE TABLE Mrr_Customer_Invoice(
	[INVOICE_NUM]  [int] primary key NOT NULL,
	[PHONE_NO] [nvarchar](20) NOT NULL,
	[INVOICE_TYPE] [nvarchar](10) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[INVOICE_IND] [tinyint] NULL,
	[INVOICE_DESC] [nvarchar](100) NULL,
	[INVOICE_CURRNCY] [nvarchar](10) NULL,
	[INVOICE_AMOUNT] [decimal](10, 4) NULL,
	[insert_date] [datetime] NULL,
	[update_date] [datetime] NULL)

	CREATE TABLE Mrr_Customer_Lines(
	[PHONE_NO] nvarchar(20) primary key  NOT NULL,
	[createdate] [datetime] NOT NULL,
	[enddate] [datetime] NULL,
	[status] [nvarchar](4) NULL,
	[TYPE] [nvarchar](10) NULL,
	[DESC] [nvarchar](100) NULL,
	[insert_date] [datetime] NULL,
	[update_date] [datetime] NULL,
	[discountpct] [int] NULL,
	[numberoffreeminutes] [int] NULL)

	CREATE TABLE Mrr_Package_Catalog(
	[PACKAGE_NUM] [int] primary key  NOT NULL,
	[createdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[status] [nvarchar](4) NULL,
	[pack_type] [nvarchar](10) NULL,
	[pack_desc] [nvarchar](100) NULL,
	[insert_date] [datetime] NULL,
	[update_date] [datetime] NULL)

	CREATE TABLE Mrr_Usage_Main(
	[CALL_NO] [int] primary key NOT NULL,
	[ANSWER_TIME] [datetime] NOT NULL,
	[SEIZED_TIME] [datetime] NOT NULL,
	[DISCONNECT_TIME] [datetime] NOT NULL,
	[CALL_DATETIME] [datetime] NULL,
	[CALLING_NO] [nvarchar](18) NULL,
	[CALLED_NO] [nvarchar](18) NULL,
	[DES_NO] [nvarchar](25) NULL,
	[DURATION] [int] NULL,
	[CUST_ID] [int] NULL,
	[CALL_TYPE] [nvarchar](20) NULL,
	[PROD_TYPE] [nvarchar](20) NULL,
	[RATED_AMNT] [int] NULL,
	[RATED_CURR_CODE] [nvarchar](10) NULL,
	[CELL] [int] NULL,
	[CELL_ORIGIN] [int] NULL,
	[HIGH_LOW_RATE] [int] NULL,
	[insert_DATE] [datetime] NULL,
	[update_date] [datetime] NULL)

	CREATE TABLE Mrr_XXCOUNTRYPRE(
	[COUNTRY_CODE] nvarchar(100) primary key  NOT NULL,
	[COUNTRY_PRE] [nvarchar](10) NOT NULL)

	CREATE TABLE Mrr_Call_Type( 
	[Call Type] [NVARCHAR](50) NOT NULL,
	PricePerMinuter MONEY NOT NULL,
	[Call Type Desc] [NVARCHAR](50) NOT NULL,
	[Call Type Code] [NVARCHAR](50) NOT NULL)

	CREATE TABLE Mrr_OPFILEOPP
	(Prepre [NVARCHAR](50) NOT NULL,
	OPDDD [NVARCHAR](50) NOT NULL,
	OPCCC [NVARCHAR](50) NOT NULL)
 

 --------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------
 --------------------------------------------------------------------------------------

 --Stg_TheVoice

Use master
go


IF EXISTS(select * from sys.databases where name='Stg_TheVoice')
DROP DATABASE Stg_TheVoice
go

Create database Stg_TheVoice
go

Use Stg_TheVoice
go


CREATE TABLE [dbo].[Stg_Countries](
	[Country] [nvarchar](100) NOT NULL,
	[Region] [nvarchar](100) NULL,
	[Area] [nvarchar](100) NULL,
)

CREATE TABLE [dbo].[Stg_Call_Type](
	[Call Type] [nvarchar](50) NULL,
	[PricePerMinuter] [money] NULL,
	[Category Of Call][nvarchar](50) NULL,
	[Call Type Descripion] [nvarchar](50) NULL,
	[Call Type Code] [nvarchar](50) NULL
)

CREATE TABLE [dbo].[Stg_OPFILEOPP](
	[Prefix Operation] [nvarchar](50) NOT NULL,
	[Operating Company] [nvarchar](50) NOT NULL,
	[Descripion Operator] [nvarchar](50) NOT NULL
)

CREATE TABLE [dbo].[Stg_Customer_Invoice](
	[Invoice Number] int NOT NULL,
	[Prefix Country] [nvarchar](20) NOT NULL,
	[Prefix Operation] [nvarchar](50) NOT NULL,
	[Phone Number] [nvarchar](20) NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[Invoice Type] [nvarchar](10) NOT NULL,
	[Invoice Date] [datetime] NULL,
	[Invoice Status] int NOT NULL,
	[Invoice Descripion] [nvarchar](50) NOT NULL,
	[Invoice Currncy] [nvarchar](50) NOT NULL,
	[Invoice Amount] money NOT NULL,
)

CREATE TABLE [dbo].[Stg_Package_Catalog](
	[Package Number] int NOT NULL,
	[Create Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Package Active Days] int NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
	[Package Type] [nvarchar](10) NOT NULL,
	[Package Descripion] [nvarchar](100) NOT NULL
)


CREATE TABLE [dbo].[Stg_Customer_Lines](
	[Phone Number] [nvarchar](20) NOT NULL,
	[Prefix Country] [nvarchar](20) NOT NULL,
	[Prefix Operation] [nvarchar](20) NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[Create Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Status] [nvarchar](4) NOT NULL,
	[Package Type] [nvarchar](10) NOT NULL,
	[Package Descripion] [nvarchar](100) NOT NULL,
	[Discount Percent] int NOT NULL,
	[Number Of Free Minutes] int NOT NULL,
)

CREATE TABLE [dbo].[Stg_XXCOUNTRYPRE](
	[Country] [nvarchar](100) NOT NULL,
	[Country Prefix] [nvarchar](10) NOT NULL
)

CREATE TABLE [dbo].[Stg_Customer](
	[Customer ID] int NOT NULL,
	[Customer Number] [nvarchar](20) NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[Customer Full Name] [nvarchar](40) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Country Prefix] [nvarchar](100) NOT NULL,
	[Prefix Operation] [nvarchar](20) NOT NULL
)

CREATE TABLE [dbo].[Stg_Usage_Main](
	[Call Number] int NOT NULL,
	[Customer ID] int  NOT NULL,
	[Calling Number] [nvarchar](20) NOT NULL,
	[C_Number] [nvarchar](20) NOT NULL,
	[Calling Country Prefix] [nvarchar](20) NOT NULL,
	[Calling Prefix Operation] [nvarchar](20) NOT NULL,
	[Answer Time] [datetime] NOT NULL,
	[Seized Date] [date] NOT NULL,
	[Seized Time] [time] NOT NULL,
	[Disconnect Time] [datetime] NOT NULL,
	[Duration] int NOT NULL,
	[Destination Number] [nvarchar](20) NOT NULL,
	[D_Number] [nvarchar](20) NOT NULL,
	[Destination Country Prefix] [nvarchar](20) NOT NULL,
	[Destination Prefix Operation] [nvarchar](20) NOT NULL,
	[Call Type] [nvarchar](50) NOT NULL,
	[Call Type Descripion] [nvarchar](50) NULL,
	[Call Rank] int NOT NULL,
	[Currency] [nvarchar](50) NOT NULL,
	[Cell] int NOT NULL,
	[Cell Origin] int NOT NULL,
	[High or Low Time Rating] int NOT NULL,
	[Call Date] [datetime] NULL
)

CREATE TABLE [dbo].[Stg_Region_Prefix](
	[Country] [nvarchar](100) NOT NULL,
	[Country Prefix] [nvarchar](10) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[City Prefix][nvarchar](10) NOT NULL
)

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

Use master
go


IF EXISTS(select * from sys.databases where name='DW_TheVoice')
DROP DATABASE DW_TheVoice
go

Create database DW_TheVoice
go

Use DW_TheVoice
go


CREATE TABLE [dbo].[Dim_Call_Types](
	[Key Call Type] int identity (1,1),
	[Price Per Minuter] money,
	[Call Type] nvarchar(100),
	[Call Type Descripion] nvarchar(100),
	[Category Of Call] nvarchar(100),
	[Call Type Code] nvarchar(100)
)

CREATE TABLE [dbo].[Dim_Countries](
	[Key Country] int identity (1,1),
	[Country] nvarchar(100),
	[Region] nvarchar(100),
	[Area] nvarchar(100),
	[Country Prefix] nvarchar(100)
)

CREATE TABLE [dbo].[Dim_Package_Catalog](
	[Package Number] int,
	[Create Date] date,
	[End Date] date,
	[Code Package Activities Days] int,
	[Status] nvarchar(100),
	[Package Type] nvarchar(100),
	[Package Descripion] nvarchar(120)
)

CREATE TABLE [dbo].[Dim_Operators](
	[Key Mobile Prefix] int,
	[Descripion Operator] nvarchar(50)
)

CREATE TABLE [dbo].[Dim_Customers](
	[Customer ID] int,
	[Customer Number] nvarchar(50),
	[Customer Full Name] nvarchar(100),
	[Address] nvarchar(100),
	[Country] nvarchar(100),
	[Mobile Operator] nvarchar(50),
	[Package Descripion] nvarchar(100)  
)

CREATE TABLE [dbo].[Dim_Call_Origin_Type](
	[Key Source Cell] int,
	[Call Origin Type] nvarchar(100)
)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Dim date and Dim time


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TABLE [dbo].[Calander_Table]
	(	[DateKey] INT primary key, 
		[Date] DATETIME,
		[FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
		[FullDateUSA] CHAR(10),-- Date in MM-dd-yyyy format
		[DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
		[DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
		[DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
		[DayOfWeekUSA] CHAR(1),-- First Day Sunday=1 and Saturday=7
		[DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
		[DayOfWeekInMonth] VARCHAR(2), --1st Monday or 2nd Monday in Month
		[DayOfWeekInYear] VARCHAR(2),
		[DayOfQuarter] VARCHAR(3),
		[DayOfYear] VARCHAR(3),
		[WeekOfMonth] VARCHAR(1),-- Week Number of Month 
		[WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
		[WeekOfYear] VARCHAR(2),--Week Number of the Year
		[Month] VARCHAR(2), --Number of the Month 1 to 12
		[MonthName] VARCHAR(9),--January, February etc
		[MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
		[Quarter] CHAR(1),
		[QuarterName] VARCHAR(9),--First,Second..
		[Year] CHAR(4),-- Year value of Date stored in Row
		[YearName] CHAR(7), --CY 2012,CY 2013
		[MonthYear] CHAR(10), --Jan-2013,Feb-2013
		[MMYYYY] CHAR(6),
		[FirstDayOfMonth] DATE,
		[LastDayOfMonth] DATE,
		[FirstDayOfQuarter] DATE,
		[LastDayOfQuarter] DATE,
		[FirstDayOfYear] DATE,
		[LastDayOfYear] DATE,
		[IsHolidayUSA] BIT,-- Flag 1=National Holiday, 0-No National Holiday
		[IsWeekday] BIT,-- 0=Week End ,1=Week Day
		[HolidayUSA] VARCHAR(50),--Name of Holiday in US
		[IsHolidayUK] BIT Null,-- Flag 1=National Holiday, 0-No National Holiday
		[HolidayUK] VARCHAR(50) Null --Name of Holiday in UK
	)
GO

--Specify Start Date and End date here
--Value of Start Date Must be Less than Your End Date 

DECLARE @StartDate DATETIME = '01/01/1900' --Starting value of Date Range
DECLARE @EndDate DATETIME = '12/31/2066' --End Value of Date Range

--Temporary Variables To Hold the Values During Processing of Each Date of Year
DECLARE
	@DayOfWeekInMonth INT,
	@DayOfWeekInYear INT,
	@DayOfQuarter INT,
	@WeekOfMonth INT,
	@CurrentYear INT,
	@CurrentMonth INT,
	@CurrentQuarter INT

/*Table Data type to store the day of week count for the month and year*/
DECLARE @DayOfWeek TABLE (DOW INT, MonthCount INT, QuarterCount INT, YearCount INT)

INSERT INTO @DayOfWeek VALUES (1, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (2, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (3, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (4, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (5, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (6, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (7, 0, 0, 0)

--Extract and assign various parts of Values from Current Date to Variable

DECLARE @CurrentDate AS DATETIME = @StartDate
SET @CurrentMonth = DATEPART(MM, @CurrentDate)
SET @CurrentYear = DATEPART(YY, @CurrentDate)
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)

/********************************************************************************************/
--Proceed only if Start Date(Current date ) is less than End date you specified above

WHILE @CurrentDate < @EndDate
BEGIN
 
/*Begin day of week logic*/

         /*Check for Change in Month of the Current date if Month changed then 
          Change variable value*/
	IF @CurrentMonth != DATEPART(MM, @CurrentDate) 
	BEGIN
		UPDATE @DayOfWeek
		SET MonthCount = 0
		SET @CurrentMonth = DATEPART(MM, @CurrentDate)
	END

        /* Check for Change in Quarter of the Current date if Quarter changed then change 
         Variable value*/

	IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET QuarterCount = 0
		SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
	END
       
        /* Check for Change in Year of the Current date if Year changed then change 
         Variable value*/
	

	IF @CurrentYear != DATEPART(YY, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET YearCount = 0
		SET @CurrentYear = DATEPART(YY, @CurrentDate)
	END
	
        -- Set values in table data type created above from variables 

	UPDATE @DayOfWeek
	SET 
		MonthCount = MonthCount + 1,
		QuarterCount = QuarterCount + 1,
		YearCount = YearCount + 1
	WHERE DOW = DATEPART(DW, @CurrentDate)

	SELECT
		@DayOfWeekInMonth = MonthCount,
		@DayOfQuarter = QuarterCount,
		@DayOfWeekInYear = YearCount
	FROM @DayOfWeek
	WHERE DOW = DATEPART(DW, @CurrentDate)
	
/*End day of week logic*/


/* Populate Your Dimension Table with values*/
	
	INSERT INTO [dbo].[Calander_Table]
	SELECT
		
		CONVERT (char(8),@CurrentDate,112) as DateKey,
		@CurrentDate AS Date,
		CONVERT (char(10),@CurrentDate,103) as FullDateUK,
		CONVERT (char(10),@CurrentDate,101) as FullDateUSA,
		DATEPART(DD, @CurrentDate) AS DayOfMonth,
		--Apply Suffix values like 1st, 2nd 3rd etc..
		CASE 
			WHEN DATEPART(DD,@CurrentDate) IN (11,12,13) 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 1 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'st'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 2 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'nd'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 3 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'rd'
			ELSE CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th' 
			END AS DaySuffix,
		
		DATENAME(DW, @CurrentDate) AS DayName,
		DATEPART(DW, @CurrentDate) AS DayOfWeekUSA,

		-- check for day of week as Per US and change it as per UK format 
		CASE DATEPART(DW, @CurrentDate)
			WHEN 1 THEN 7
			WHEN 2 THEN 1
			WHEN 3 THEN 2
			WHEN 4 THEN 3
			WHEN 5 THEN 4
			WHEN 6 THEN 5
			WHEN 7 THEN 6
			END 
			AS DayOfWeekUK,
		
		@DayOfWeekInMonth AS DayOfWeekInMonth,
		@DayOfWeekInYear AS DayOfWeekInYear,
		@DayOfQuarter AS DayOfQuarter,
		DATEPART(DY, @CurrentDate) AS DayOfYear,
		DATEPART(WW, @CurrentDate) + 1 - DATEPART(WW, CONVERT(VARCHAR,
		DATEPART(MM, @CurrentDate)) + '/1/' + CONVERT(VARCHAR,
		DATEPART(YY, @CurrentDate))) AS WeekOfMonth,
		(DATEDIFF(DD, DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0),
		@CurrentDate) / 7) + 1 AS WeekOfQuarter,
		DATEPART(WW, @CurrentDate) AS WeekOfYear,
		DATEPART(MM, @CurrentDate) AS Month,
		DATENAME(MM, @CurrentDate) AS MonthName,
		CASE
			WHEN DATEPART(MM, @CurrentDate) IN (1, 4, 7, 10) THEN 1
			WHEN DATEPART(MM, @CurrentDate) IN (2, 5, 8, 11) THEN 2
			WHEN DATEPART(MM, @CurrentDate) IN (3, 6, 9, 12) THEN 3
			END AS MonthOfQuarter,
		DATEPART(QQ, @CurrentDate) AS Quarter,
		CASE DATEPART(QQ, @CurrentDate)
			WHEN 1 THEN 'First'
			WHEN 2 THEN 'Second'
			WHEN 3 THEN 'Third'
			WHEN 4 THEN 'Fourth'
			END AS QuarterName,
		DATEPART(YEAR, @CurrentDate) AS Year,
		'CY ' + CONVERT(VARCHAR, DATEPART(YEAR, @CurrentDate)) AS YearName,
		LEFT(DATENAME(MM, @CurrentDate), 3) + '-' + CONVERT(VARCHAR,
		DATEPART(YY, @CurrentDate)) AS MonthYear,
		RIGHT('0' + CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)),2) +
		CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS MMYYYY,
		CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD,
		@CurrentDate) - 1), @CurrentDate))) AS FirstDayOfMonth,
		CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD,
		(DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1,
		@CurrentDate)))) AS LastDayOfMonth,
		DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0) AS FirstDayOfQuarter,
		DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1) AS LastDayOfQuarter,
		CONVERT(DATETIME, '01/01/' + CONVERT(VARCHAR, DATEPART(YY,
		@CurrentDate))) AS FirstDayOfYear,
		CONVERT(DATETIME, '12/31/' + CONVERT(VARCHAR, DATEPART(YY,
		@CurrentDate))) AS LastDayOfYear,
		NULL AS IsHolidayUSA,
		CASE DATEPART(DW, @CurrentDate)
			WHEN 1 THEN 0
			WHEN 2 THEN 1
			WHEN 3 THEN 1
			WHEN 4 THEN 1
			WHEN 5 THEN 1
			WHEN 6 THEN 1
			WHEN 7 THEN 0
			END AS IsWeekday,
		NULL AS HolidayUSA, Null, Null

	SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END


go

--View The Table

--select * from Calander_Table

--Create Your Table

CREATE TABLE [dbo].[Dim_Date](
	[Key Date] int,
	[Full Date] date,
	[Year] int,
	[Code Year] int,
	[Descripion Year] nvarchar(50),
	[Key Month] int,
	[Code Month] int,
	[Descripion Month] nvarchar(50),
	[Code Day In Week] int,
	[Descripion Day In Week] nvarchar(50),
)

--Insert Data to your table
insert into dbo.[Dim_Date] 
select DateKey,FullDateUSA,convert(int,Year),convert(int,Year),Year,convert(int,MMYYYY),convert(int,month),MonthName,convert(int,DayOfWeekUK),DayName
from Calander_Table
go


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE  TABLE [dbo].[Time](
[TimeKey] [int] NOT NULL,
[Hour24] [int] NULL,
[Hour24ShortString] [varchar](2) NULL,
[Hour24MinString] [varchar](5) NULL,
[Hour24FullString] [varchar](8) NULL,
[Hour12] [int] NULL,
[Hour12ShortString] [varchar](2) NULL,
[Hour12MinString] [varchar](5) NULL,
[Hour12FullString] [varchar](8) NULL,
[AmPmCode] [int] NULL,
[AmPmString] [varchar](2) NOT NULL,
[Minute] [int] NULL,
[MinuteCode] [int] NULL,
[MinuteShortString] [varchar](2) NULL,
[MinuteFullString24] [varchar](8) NULL,
[MinuteFullString12] [varchar](8) NULL,
[HalfHour] [int] NULL,
[HalfHourCode] [int] NULL,
[HalfHourShortString] [varchar](2) NULL,
[HalfHourFullString24] [varchar](8) NULL,
[HalfHourFullString12] [varchar](8) NULL,
[Second] [int] NULL,
[SecondShortString] [varchar](2) NULL,
[FullTimeString24] [varchar](8) NULL,
[FullTimeString12] [varchar](8) NULL,
[FullTime] [time](7) NULL,
CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED
(

[TimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go

go
declare @hour int
declare @minute int
declare @second int

set @hour=0

while @hour<24
begin

set @minute=0

while @minute<60
begin

set @second=0

while @second<60
begin

INSERT INTO [dbo].[Time]
([TimeKey]
,[Hour24]
,[Hour24ShortString]
,[Hour24MinString]
,[Hour24FullString]
,[Hour12]
,[Hour12ShortString]
,[Hour12MinString]
,[Hour12FullString]
,[AmPmCode]
,[AmPmString]
,[Minute]
,[MinuteCode]
,[MinuteShortString]
,[MinuteFullString24]
,[MinuteFullString12]
,[HalfHour]
,[HalfHourCode]
,[HalfHourShortString]
,[HalfHourFullString24]
,[HalfHourFullString12]
,[Second]
,[SecondShortString]
,[FullTimeString24]
,[FullTimeString12]
,[FullTime])


select
(@hour*10000) + (@minute*100) + @second as TimeKey,
@hour as [Hour24],

right('0'+convert(varchar(2),@hour),2) [Hour24ShortString],
right('0'+convert(varchar(2),@hour),2)+':00' [Hour24MinString],
right('0'+convert(varchar(2),@hour),2)+':00:00' [Hour24FullString],

@hour%12 as [Hour12],

right('0'+convert(varchar(2),@hour%12),2) [Hour12ShortString],
right('0'+convert(varchar(2),@hour%12),2)+':00' [Hour12MinString],
right('0'+convert(varchar(2),@hour%12),2)+':00:00' [Hour12FullString],

@hour/12 as [AmPmCode],

case when @hour<12 then 'AM' else 'PM' end as [AmPmString],
@minute as [Minute],

(@hour*100) + (@minute) [MinuteCode],

right('0'+convert(varchar(2),@minute),2) [MinuteShortString],
right('0'+convert(varchar(2),@hour),2)+':'+
right('0'+convert(varchar(2),@minute),2)+':00' [MinuteFullString24],
right('0'+convert(varchar(2),@hour%12),2)+':'+
right('0'+convert(varchar(2),@minute),2)+':00' [MinuteFullString12],

@minute/30 as [HalfHour],

(@hour*100) + ((@minute/30)*30) [HalfHourCode],

right('0'+convert(varchar(2),((@minute/30)*30)),2) [HalfHourShortString],
right('0'+convert(varchar(2),@hour),2)+':'+
right('0'+convert(varchar(2),((@minute/30)*30)),2)+':00' [HalfHourFullString24],
right('0'+convert(varchar(2),@hour%12),2)+':'+
right('0'+convert(varchar(2),((@minute/30)*30)),2)+':00' [HalfHourFullString12],

@second as [Second],

right('0'+convert(varchar(2),@second),2) [SecondShortString],
right('0'+convert(varchar(2),@hour),2)+':'+
right('0'+convert(varchar(2),@minute),2)+':'+
right('0'+convert(varchar(2),@second),2) [FullTimeString24],
right('0'+convert(varchar(2),@hour%12),2)+':'+
right('0'+convert(varchar(2),@minute),2)+':'+
right('0'+convert(varchar(2),@second),2) [FullTimeString12],

convert(time,right('0'+convert(varchar(2),@hour),2)+':'+
right('0'+convert(varchar(2),@minute),2)+':'+
right('0'+convert(varchar(2),@second),2)) as [FullTime]

set @second=@second+1
end

set @minute=@minute+1
end

set @hour=@hour+1
end

CREATE TABLE dbo.[Dim_Time](
	[Key Time] int,
	[Full Time] time, 
	[Code Hour] int,
	[Descripion Hour] nvarchar(50),
	[Key Minute] int,
	[Code Minute] int,
	[Descripion Minute] nvarchar(50)
)
go


insert into dbo.[Dim_Time] 
select Timekey,fulltimeString24,minutecode,minuteshortstring, Timekey ,second,secondshortstring
from Time
go


--Build that Fact Table 

CREATE TABLE [dbo].[Fact_Usage_Main] (
	[Call ID] int identity (1,1),
	[Key Customer] int,
	[Key Call Type] int,
	[Key Origin Country] int,
	[Key Origin Operator] int,
	[Key Destination Country] int,
	[Key Destination Operator] int,
	[Key Package] int,
	[Key Call Origin Type] int,
	[Key Call Date] int,
	[Key Call Time] int, 
	[Duration] int,
	[Billable Duration] int,
	[Amount] float,
	[Billable Amount] float
)