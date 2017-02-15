---------------------BEGIN Create Tables for PDF Report Portlets---------------------

if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_PDFSubscriptions]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE CUS_PDFSubscriptions( SubscriptionID UNIQUEIDENTIFIER PRIMARY KEY,
			   UserID         UNIQUEIDENTIFIER,
			   ReportID	      UNIQUEIDENTIFIER,
			   Frequency      INT,
			   NumSetting     INT,
			   LastSent		  DATETIME);
								   
GO

if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_PDFParmTypes]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[CUS_PDFParmTypes] (
	[TypeID] uniqueidentifier ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CUS_PDFParmTypesTypeID] DEFAULT (newid()),
	[TypeName] [char] (60),
	CONSTRAINT [PK_CUS_PDFParmTypes] PRIMARY KEY CLUSTERED 
	(
		[TypeID]
	)
	ON [PRIMARY]
)
ON [PRIMARY]

GO

--For version 2.5
if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_PDFParmDropDown]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[CUS_PDFParmDropDown] (
	[DropDownID] uniqueidentifier ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CUS_PDFParmDropDownDropDownID] DEFAULT (newid()),
	[DropDownName] [char] (60),
	[DropDownSelect] varchar(max), --KBK|2.9.4 - Change to max per client request on wiki
	CONSTRAINT [PK_CUS_PDFParmDropDown] PRIMARY KEY CLUSTERED 
	(
		[DropDownID]
	)
	ON [PRIMARY]
)
ON [PRIMARY]

GO

if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_PDFCategories]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[CUS_PDFCategories] (
	[CategoryID] uniqueidentifier ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CUS_PDFCategoriesCategoryID] DEFAULT (newid()),
	[CategoryName] [char] (60),
	CONSTRAINT [PK_CUS_PDFCategories] PRIMARY KEY CLUSTERED 
	(
		[CategoryID]
	)
	ON [PRIMARY]
)
ON [PRIMARY]

GO

if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_PDFReports]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[CUS_PDFReports] (
	[ReportID] uniqueidentifier ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CUS_PDFReportsReportID] DEFAULT (newid()),
	[CategoryID] [uniqueidentifier],
	[ReportName] [char] (60),
	[LinkName] [char] (60),
	[ERPReportName] [char] (60), --KBK|2.9.4 - Added this so that ERPReportName could be the same for two different Reports
	[AllowSubscription] [bit],
	CONSTRAINT [PK_CUS_PDFReports] PRIMARY KEY CLUSTERED 
	(
		[ReportID]
	)
	ON [PRIMARY],
	CONSTRAINT [FK_PDFReportCategoryID] FOREIGN KEY 
	(
		[CategoryID]
	) REFERENCES [CUS_PDFCategories] (
		[CategoryID]
	)
)
ON [PRIMARY]

GO

if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_PDFParameters]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[CUS_PDFParameters] (
	[ParmID] uniqueidentifier ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CUS_PDFParametersParmID] DEFAULT (newid()),
	[ReportID] [uniqueidentifier],
	[TypeID] [uniqueidentifier],
	[Display] [bit] NOT NULL CONSTRAINT [DF_CUS_PDFParametersDisplay] DEFAULT (0),
	[DisplayName] [char] (60),
	[DefaultValue] [char] (20),
	[ParmLength] [tinyint],
	[ParmOrder] [tinyint],	
	[DisplayDesc] [varchar] (255),
	[DropDownID] [uniqueidentifier],
	[AllowWildcard] [bit] NOT NULL CONSTRAINT [DF_CUS_PDFParametersAllowWildcard] DEFAULT (0),
	CONSTRAINT [PK_CUS_PDFParameters] PRIMARY KEY CLUSTERED 
	(
		[ParmID]
	)
	ON [PRIMARY],
	CONSTRAINT [FK_CUS_PDFParametersReportID] FOREIGN KEY 
	(
		[ReportID]
	) REFERENCES [CUS_PDFReports] (
		[ReportID]
	),
	CONSTRAINT [FK_CUS_PDFParametersTypeID] FOREIGN KEY 
	(
		[TypeID]
	) REFERENCES [CUS_PDFParmTypes] (
		[TypeID]
	),
	CONSTRAINT [FK_CUS_PDFParametersDropDownID] FOREIGN KEY 
	(
		[DropDownID]
	) REFERENCES [CUS_PDFParmDropDown] (
		[DropDownID]
	)
)
ON [PRIMARY]

GO

if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_PDFPermissions]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[CUS_PDFPermissions] (
	[PermissionID] uniqueidentifier ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CUS_PDFPermissionsID] DEFAULT (newid()),
	[GroupID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] ,
	CONSTRAINT [PK_CUS_PDFPermissions] PRIMARY KEY CLUSTERED 
	(
		[PermissionID] ASC
	)
	ON [PRIMARY]
)
ON [PRIMARY]

GO

alter table CUS_PDFPermissions
alter column CategoryID uniqueidentifier null
GO

if not exists (select * from dbo.sysobjects
where id = object_id(N'[dbo].[CUS_LiteralStringReplacer]') and
OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[CUS_LiteralStringReplacer](
	[Id] uniqueidentifier ROWGUIDCOL  NOT NULL CONSTRAINT [DF_CUS_LiteralStringReplacer_Id] DEFAULT (newid()),
	[Literal] [nvarchar](50) NOT NULL,
	[SourceType] [smallint] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[ConnectionInfo] [nvarchar](max) NULL,
	[CacheType] [smallint] NOT NULL,
	[Description] [nvarchar](500) NOT NULL
	 CONSTRAINT [PK_CUS_LiteralStringReplacer] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	)
	ON [PRIMARY]

GO


---------------------END Create Tables for PDF Report Portlets---------------------

-------------------BEGIN Alter Tables for PDF Report Portlets----------------------
--For version 2.5
--Add DisplayDesc column if not there
if not exists (select 1
                   from sysobjects so
                   join syscolumns sc
                     on sc.id = so.id
                  where so.name = 'CUS_PDFParameters'
                    and sc.name= 'DisplayDesc')
	ALTER TABLE CUS_PDFParameters ADD DisplayDesc varchar(255) NULL
GO

if not exists (select 1
                   from sysobjects so
                   join syscolumns sc
                     on sc.id = so.id
                  where so.name = 'CUS_PDFReports'
                    and sc.name= 'AllowSubscription')
	ALTER TABLE CUS_PDFReports ADD AllowSubscription bit
GO

--Add DropDownID column if not there
if not exists (select 1
                   from sysobjects so
                   join syscolumns sc
                     on sc.id = so.id
                  where so.name = 'CUS_PDFParameters'
                    and sc.name= 'DropDownID')
	ALTER TABLE CUS_PDFParameters ADD DropDownID uniqueidentifier NULL
GO

--Add AllowWildcard column if not there
if not exists (select 1
                   from sysobjects so
                   join syscolumns sc
                     on sc.id = so.id
                  where so.name = 'CUS_PDFParameters'
                    and sc.name= 'AllowWildcard')
	ALTER TABLE CUS_PDFParameters ADD AllowWildcard bit NOT NULL CONSTRAINT [DF_CUS_PDFParametersAllowWildcard] DEFAULT (0)
GO

--KBK|2.9.4 - Added ERPReportName so that ERPReportName could be the same for two different Reports
if not exists (select 1
                   from sysobjects so
                   join syscolumns sc
                     on sc.id = so.id
                  where so.name = 'CUS_PDFReports'
                    and sc.name= 'ERPReportName')
	ALTER TABLE CUS_PDFReports ADD ERPReportName char(60) NULL
GO

--KBK|2.9.4 - Default data clean up... Update ERPReportName with ReportName where ERPReportName is NULL
if exists (select * from CUS_PDFReports where RTRIM(ISNULL(ERPReportName, '')) = '')
BEGIN
	UPDATE	CUS_PDFReports
	SET		ERPReportName = ReportName
	WHERE	RTRIM(ISNULL(ERPReportName, '')) = ''
END
GO

--KBK|2.9.4 - Increase DropDownSelect to varchar(max)
ALTER TABLE CUS_PDFParmDropDown
ALTER COLUMN DropDownSelect varchar(max)
GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
		WHERE CONSTRAINT_SCHEMA='dbo' AND CONSTRAINT_NAME='FK_CUS_PDFParametersDropDownID' AND
		TABLE_NAME='CUS_PDFParameters')
BEGIN
	ALTER TABLE [dbo].[CUS_PDFParameters]  WITH CHECK
	ADD  CONSTRAINT [FK_CUS_PDFParametersDropDownID] FOREIGN KEY([DropDownID])
	REFERENCES [dbo].[CUS_PDFParmDropDown] ([DropDownID])
	ALTER TABLE [dbo].[CUS_PDFParameters] CHECK CONSTRAINT [FK_CUS_PDFParametersDropDownID]
END
GO

--------------------END Alter Tables for PDF Report Portlets-----------------------

---------------------BEGIN Stored Procedures for PDF Report Portlets---------------------

/********************************************************************************************************************
CUS_PDFParmTypes - Procedure Definitions
-------------------------------------------------
Application:		CUS
Date:				7/5/2007 2:45:20 PM
*********************************************************************************************************************/


if exists (select id from sysobjects where name = 'CUS_spPDFParmTypesDelete')
drop procedure CUS_spPDFParmTypesDelete
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmTypesFindAll')
drop procedure CUS_spPDFParmTypesFindAll
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmTypesFindByID')
drop procedure CUS_spPDFParmTypesFindByID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmTypesInsert')
drop procedure CUS_spPDFParmTypesInsert
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmTypesUpdate')
drop procedure CUS_spPDFParmTypesUpdate
GO


/********************************************************************************************************************
CUS_PDFParmDropDown - Procedure Definitions
-------------------------------------------------
Application:		CUS
Date:				2/5/2009 3:10:00 PM
*********************************************************************************************************************/


if exists (select id from sysobjects where name = 'CUS_spPDFParmDDDelete')
drop procedure CUS_spPDFParmDDDelete
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmDDFindByID')
drop procedure CUS_spPDFParmDDFindByID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmDDFindAll')
drop procedure CUS_spPDFParmDDFindAll
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmDDInsert')
drop procedure CUS_spPDFParmDDInsert
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParmDDUpdate')
drop procedure CUS_spPDFParmDDUpdate
GO



/********************************************************************************************************************
CUS_PDFReports - Procedure Definitions
-------------------------------------------------
Application:		CUS
Date:				7/5/2007 3:16:25 PM
*********************************************************************************************************************/


if exists (select id from sysobjects where name = 'CUS_spPDFReportsDelete')
drop procedure CUS_spPDFReportsDelete
GO

if exists (select id from sysobjects where name = 'CUS_spPDFReportsFindAll')
drop procedure CUS_spPDFReportsFindAll
GO

if exists (select id from sysobjects where name = 'CUS_spPDFReportsFindByID')
drop procedure CUS_spPDFReportsFindByID
GO
--KBK|2.9.4 - Added these two stored procedures for better management with EX database reports and add category drop down to default page
if exists (select id from sysobjects where name = 'CUS_spPDFReportsFindByERPRpt')
drop procedure CUS_spPDFReportsFindByERPRpt
GO

if exists (select id from sysobjects where name = 'CUS_spPDFReportsFindByCatID')
drop procedure CUS_spPDFReportsFindByCatID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFReportsInsert')
drop procedure CUS_spPDFReportsInsert
GO

if exists (select id from sysobjects where name = 'CUS_spPDFReportsUpdate')
drop procedure CUS_spPDFReportsUpdate
GO

/********************************************************************************************************************
CUS_PDFCategories - Procedure Definitions
-------------------------------------------------
Application:		CUS
Date:				7/5/2007 2:55:50 PM
*********************************************************************************************************************/


if exists (select id from sysobjects where name = 'CUS_spPDFCategoriesDelete')
drop procedure CUS_spPDFCategoriesDelete
GO

if exists (select id from sysobjects where name = 'CUS_spPDFCategoriesFindAll')
drop procedure CUS_spPDFCategoriesFindAll
GO

if exists (select id from sysobjects where name = 'CUS_spPDFCategoriesFindByID')
drop procedure CUS_spPDFCategoriesFindByID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFCategoriesInsert')
drop procedure CUS_spPDFCategoriesInsert
GO

if exists (select id from sysobjects where name = 'CUS_spPDFCategoriesUpdate')
drop procedure CUS_spPDFCategoriesUpdate
GO

/********************************************************************************************************************
CUS_PDFParameters - Procedure Definitions
-------------------------------------------------
Application:		CUS
Date:				7/5/2007 3:02:13 PM
*********************************************************************************************************************/


if exists (select id from sysobjects where name = 'CUS_spPDFParametersDelete')
drop procedure CUS_spPDFParametersDelete
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParametersFindAll')
drop procedure CUS_spPDFParametersFindAll
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParametersFindByRpUse')
drop procedure CUS_spPDFParametersFindByRpUse
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParametersFindByNxOrd')
drop procedure CUS_spPDFParametersFindByNxOrd
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParametersFindByRptID')
drop procedure CUS_spPDFParametersFindByRptID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParametersFindByID')
drop procedure CUS_spPDFParametersFindByID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParametersInsert')
drop procedure CUS_spPDFParametersInsert
GO

if exists (select id from sysobjects where name = 'CUS_spPDFParametersUpdate')
drop procedure CUS_spPDFParametersUpdate
GO

/********************************************************************************************************************
PDFPermissions - Procedure Definitions
-------------------------------------------------
Application:		CUS
Date:				6/18/2012 10:51:13 AM
*********************************************************************************************************************/

if exists (select id from sysobjects where name = 'CUS_spPDFPermissionsFindAll')
drop procedure CUS_spPDFPermissionsFindAll
GO

if exists (select id from sysobjects where name = 'CUS_spPDFPermissionsFindByID')
drop procedure CUS_spPDFPermissionsFindByID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFPermissionsDelete')
drop procedure CUS_spPDFPermissionsDelete
GO

if exists (select id from sysobjects where name = 'CUS_spPDFPermissionsFindByCategoryID')
drop procedure CUS_spPDFPermissionsFindByCategoryID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFPermissionsFindByGroupCategoryID')
drop procedure CUS_spPDFPermissionsFindByGroupCategoryID
GO

if exists (select id from sysobjects where name = 'CUS_spPDFPermissionsInsert')
drop procedure CUS_spPDFPermissionsInsert
GO

if exists (select id from sysobjects where name = 'CUS_spPDFPermissionsUpdate')
drop procedure CUS_spPDFPermissionsUpdate
GO

---------------------END Stored Procedures for PDF Report Portlets---------------------

---------------------BEGIN Default Data PDF Report Portlets---------------------

if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'STRING')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('2EC2622B-27AE-42A7-BDDD-3BAF308FF516', 'STRING')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'LONG')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('FFD72BFE-FD6B-41E3-A56E-B6A61AD2C4F6', 'LONG')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'NUMBER')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('DE93F1C1-1B55-441B-8039-EB02B3EFFDB3', 'NUMBER')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'INTEGER')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('5FDC546D-AD70-490D-AA49-007CAC71862A', 'INTEGER')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'DECIMAL')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('750AE1D4-CBFF-424F-A06A-5F45F8014243', 'DECIMAL')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'DATE')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('50FBE6AB-B9D3-48DE-A38F-972153EC1667', 'DATE')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'DATETIME')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('08F481F8-3AA2-4C54-892B-18203666EFB8', 'DATETIME')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'TIME')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('67CA59B9-AF3D-4A68-A98E-C565A6E6A13F', 'TIME')
END
if not exists (select * from CUS_PDFParmTypes where [TypeName] = 'BOOLEAN')
BEGIN
	INSERT INTO CUS_PDFParmTypes VALUES ('B8F606B7-A3E6-4F6B-B66C-B67130C01BD2', 'BOOLEAN')
END

if not exists (select * from CUS_PDFCategories where [CategoryName] = 'CustomReports')
BEGIN
	INSERT INTO CUS_PDFCategories ([CategoryID], [CategoryName])
	VALUES ('6FA6ED50-26B9-4CE6-98C0-34C900D7F00E', 'CustomReports')
END

if exists (select * from CUS_PDFCategories where [CategoryName] = 'AccountsReceivable')
BEGIN
	UPDATE CUS_PDFCategories SET [CategoryName] = 'AccountsReceivable2'
	where [CategoryName] = 'AccountsReceivable'
END

if exists (select * from CUS_PDFCategories where [CategoryName] = 'Advising')
BEGIN
	UPDATE CUS_PDFCategories SET [CategoryName] = 'Advising2'
	where [CategoryName] = 'Advising'
END

if exists (select * from CUS_PDFCategories where [CategoryName] = 'Registration')
BEGIN
	UPDATE CUS_PDFCategories SET [CategoryName] = 'Registration2'
	where [CategoryName] = 'Registration'
END

if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport1')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport1', 'En', 'Report 1')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport1_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport1_Desc', 'En', 'First report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport2')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport2', 'En', 'Report 2')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport2_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport2_Desc', 'En', 'Second report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport3')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport3', 'En', 'Report 3')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport3_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport3_Desc', 'En', 'Third report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport4')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport4', 'En', 'Report 4')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport4_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport4_Desc', 'En', 'Forth report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport5')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport5', 'En', 'Report 5')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport5_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport5_Desc', 'En', 'Fifth report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport6')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport6', 'En', 'Report 6')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport6_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport6_Desc', 'En', 'Sixth report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport7')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport7', 'En', 'Report 7')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport7_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport7_Desc', 'En', 'Seventh report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport8')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport8', 'En', 'Report 8')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport8_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport8_Desc', 'En', 'Eighth report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport9')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport9', 'En', 'Report 9')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport9_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport9_Desc', 'En', 'Ninth report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport10')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport10', 'En', 'Report 10')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReport10_Desc')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReport10_Desc', 'En', 'Tenth report to display on the portlet')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReportNewHelpNonEX')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReportNewHelpNonEX', 'En', 'Category must be a category defined in your ERP.<br>ERP Report name must match a report name defined in your ERP within the category you specify. This is not the InfoMaker report name.<br>The link name will be the text that shows up for the end user.<br>Once you have saved the report definition by clicking save, then you can define parameters for the report.')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFReportNewHelpEX')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFReportNewHelpEX', 'En', 'The ERP Report Name, InfoMaker Report Name and Report Description is saved to your EX database.<br>The link name will be the text that shows up for the end user.<br>Once you have saved the report definition by clicking save, then you can define parameters for the report.')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDFDropDownNewHint')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDFDropDownNewHint', 'En', 'Be sure your select has a code and description column.  The first column must be the code and the second column must be a description. Also make sure this is a valid select from your EX database. Hint: @HostID, @SessionID, @Username, @UserID can be used as a placeholder and the logged in user''s JICS information will be inserted into the drop down select.')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'SET_PDFREPORT_DO_NOT_CACHE_REPORT')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('SET_PDFREPORT_DO_NOT_CACHE_REPORT', 'En', 'Do Not Cache Report')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'SET_PDFREPORT_DO_NOT_CACHE_REPORT_DESC')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('SET_PDFREPORT_DO_NOT_CACHE_REPORT_DESC', 'En', 'Check if you do not want the report cached')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_ADMIN_PDF_REPORTS')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_ADMIN_PDF_REPORTS', 'En', 'Admin PDF Reports')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_MANAGE_CATEGORIES')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_MANAGE_CATEGORIES', 'En', 'Manage Categories')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_MANAGE_CATEGORY')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_MANAGE_CATEGORY', 'En', 'Manage Category')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_MANAGE_REPORT')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_MANAGE_REPORT', 'En', 'Manage Report')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_MANAGE_PARAMETER')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_MANAGE_PARAMETER', 'En', 'Manage Parameter')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_MANAGE_DROP_DOWNS')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_MANAGE_DROP_DOWNS', 'En', 'Manage Drop Downs')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_MANAGE_DROP_DOWN')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_MANAGE_DROP_DOWN', 'En', 'Manage Drop Down')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_PDF_REPORTS')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_PDF_REPORTS', 'En', 'PDF Reports')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_REPORT_PARAMETERS')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_REPORT_PARAMETERS', 'En', 'Report Parameters')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'PDF_REPORT')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('PDF_REPORT', 'En', 'Report')
END
if not exists (select * from FWK_Globalization where [Text_Key] = 'CUS_PDF_VIEW_REPORTS_FOR_CATEGORY')
BEGIN
	INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_PDF_VIEW_REPORTS_FOR_CATEGORY', 'En', 'Manage Reports for Category:')
END
GO

---------------------END Default Data PDF Report Portlets---------------------