CREATE DATABASE Mrr_TheVoice

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
	[status] [nvarchar](10) NULL,
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

CREATE TABLE Mrr_Call_Type 
([Call Type] [NVARCHAR](50) NOT NULL,
PricePerMinuter MONEY NOT NULL,
[Call Type Desc] [NVARCHAR](50) NOT NULL,
[Call Type Code] [NVARCHAR](50) NOT NULL)

CREATE TABLE Mrr_OPFILEOPP
(Prepre [NVARCHAR](50) NOT NULL,
OPDDD [NVARCHAR](50) NOT NULL,
OPCCC [NVARCHAR](50) NOT NULL)
 
