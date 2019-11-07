USE Master
go

--DB
drop DATABASE IF EXISTS DW_TheVoice

CREATE DATABASE DW_TheVoice

USE DW_TheVoice
GO


CREATE TABLE [dbo].[Dim_Call_Types](
	[Key Call Type] int identity (1,1),
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
	[Package Number] int identity (1,1),
	[Create Date] date,
	[End Date] date,
	[Status] nvarchar(100),
	[Package Type] nvarchar(100),
	[Package Descripion] nvarchar(120),
	[Insert Date] date
	[CodePackageActivitiesDays] int
)



CREATE TABLE [dbo].[Dim_DimOperators](
	[Mobile Prefix] int,
	[Operating Company] nvarchar(50)
)


CREATE TABLE [dbo].[Dim_DimCustomers](
	[Customer ID] int,
	[Customer Number] int,
	[Customer Full Name] nvarchar(100),
	[Address] nvarchar(100),
	[Mobile Prefix] nvarchar(50),
	[Country] nvarchar(100),
	[Package Descripion] nvarchar(100)  
)



CREATE TABLE [dbo].[Dim_DimCallOriginType](
	[Key Source Cell] int identity (1,1),
	[Source Cell] nvarchar(100)
)





