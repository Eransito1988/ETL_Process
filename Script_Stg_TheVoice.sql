--Stg_TheVoice

CREATE DATABASE Stg_TheVoice


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
	[Mobile Prefix] [nvarchar](50) NOT NULL,
	[Operating Company] [nvarchar](50) NOT NULL,
)

CREATE TABLE [dbo].[Stg_Customer_Invoice](
	[Invoice Number] int NOT NULL,
	[Operating Company] [nvarchar](50) NOT NULL,
	[Phone Number] [nvarchar](20) NOT NULL,
	[Invoice Type] [nvarchar](10) NOT NULL,
	[Invoice Date] [datetime] NULL,
	[Invoice Status] int NOT NULL,
	[Invoice Descripion] [nvarchar](50) NOT NULL,
	[Invoice Currncy] [nvarchar](50) NOT NULL,
	[Invoice Amount] decimal(10) NOT NULL,
)

CREATE TABLE [dbo].[Stg_Package_Catalog](
	[Package Number] int NOT NULL,
	[Create Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Status] [nvarchar](10) NOT NULL,
	[Package Type] [nvarchar](10) NOT NULL,
	[Package Descripion] [nvarchar](100) NOT NULL,
	[Insert Date] [datetime] NULL,
	[Update Date] [datetime] NULL
)

CREATE TABLE [dbo].[Stg_Customer_Lines](
	[Phone Number] [nvarchar](20) NOT NULL,
	[Create Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Status] [nvarchar](4) NOT NULL,
	[Package Type] [nvarchar](10) NOT NULL,
	[Package Descripion] [nvarchar](100) NOT NULL,
	[Insert Date] [datetime] NULL,
	[Update Date] [datetime] NULL,
	[Discount Percent] int NOT NULL,
	[Number Of Free Minutes] int NOT NULL,
	[Country Prefix] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Mobile Prefix] [nvarchar](20) NOT NULL
)

CREATE TABLE [dbo].[Stg_XXCOUNTRYPRE](
	[Country] [nvarchar](100) NOT NULL,
	[Country Prefix] [nvarchar](10) NOT NULL
)




