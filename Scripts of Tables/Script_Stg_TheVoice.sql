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
	[Package Type] [nvarchar](10) NOT NULL
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



