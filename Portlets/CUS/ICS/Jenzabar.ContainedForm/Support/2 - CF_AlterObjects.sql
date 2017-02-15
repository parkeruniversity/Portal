/*************************** Answers ******************************/
IF NOT EXISTS (select * from sys.columns where Name = 'MItemID'  
            and Object_ID = Object_ID('CF_ANSWERS'))
BEGIN
	ALTER TABLE CF_ANSWERS
	Add [MItemID] [uniqueidentifier] NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'ChildItemID'  
            and Object_ID = Object_ID('CF_ANSWERS'))
BEGIN
	ALTER TABLE CF_ANSWERS
	Add [ChildItemID] [uniqueidentifier] NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'RowIndex'  
            and Object_ID = Object_ID('CF_ANSWERS'))
BEGIN
	ALTER TABLE CF_ANSWERS
	Add [RowIndex] [int] NULL
END
GO

/*********************** Datasources **************************/
if not exists(select * from sysobjects where name='FK_CF_DataSources_CF_Databases')
begin
ALTER TABLE [dbo].[CF_DataSources]  WITH CHECK ADD  CONSTRAINT [FK_CF_DataSources_CF_Databases] FOREIGN KEY([DataBaseID])
REFERENCES [dbo].[CF_Databases] ([DataBaseID])

ALTER TABLE [dbo].[CF_DataSources] CHECK CONSTRAINT [FK_CF_DataSources_CF_Databases]
end
GO

/*********************** Email Templates **************************/
IF NOT EXISTS (select * from sys.columns where Name = 'SendEvent'  
            and Object_ID = Object_ID('CF_EMAILTEMPLATES'))
BEGIN
	alter table CF_EMAILTEMPLATES
	add SendEvent varchar(50)
END
GO

/************************** Event Rules ****************************/
if not exists(select * from sysobjects where name='FK_CF_EventRules_CF_EmailTemplates')
begin
ALTER TABLE [dbo].[CF_EventRules]  WITH CHECK ADD  CONSTRAINT [FK_CF_EventRules_CF_EmailTemplates] FOREIGN KEY([EmailID])
REFERENCES [dbo].[CF_EmailTemplates] ([EmailID])

ALTER TABLE [dbo].[CF_EventRules] CHECK CONSTRAINT [FK_CF_EventRules_CF_EmailTemplates]
end
GO

if not exists(select * from sysobjects where name='FK_CF_EventRules_CF_ItemDef')
begin
ALTER TABLE [dbo].[CF_EventRules]  WITH CHECK ADD  CONSTRAINT [FK_CF_EventRules_CF_ItemDef] FOREIGN KEY([ItemID])
REFERENCES [dbo].[CF_ItemDef] ([ID])

ALTER TABLE [dbo].[CF_EventRules] CHECK CONSTRAINT [FK_CF_EventRules_CF_ItemDef]
end
GO

if not exists(select * from sysobjects where name='FK_CF_EventRules_CF_ItemDef1')
begin
ALTER TABLE [dbo].[CF_EventRules]  WITH CHECK ADD  CONSTRAINT [FK_CF_EventRules_CF_ItemDef1] FOREIGN KEY([TargetItemID])
REFERENCES [dbo].[CF_ItemDef] ([ID])

ALTER TABLE [dbo].[CF_EventRules] CHECK CONSTRAINT [FK_CF_EventRules_CF_ItemDef1]
end
GO

alter table CF_EventRules
alter column Action [varchar](50) NOT NULL
GO

/************************** EX Mapping ***************************/
IF NOT EXISTS (select * from sys.columns where Name = 'MapTableName'  
            and Object_ID = Object_ID('CF_EX_Mapping'))
BEGIN
	alter table CF_EX_Mapping
	add [MapTableName] varchar(100) null
END
GO

/************************** Form Tabs ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'ShowInReport'  
            and Object_ID = Object_ID('CF_FORMTABS'))
BEGIN
	alter table cf_formtabs
	add ShowInReport bit
END
GO

IF EXISTS (select * from sys.columns where Name = 'Order'  
            and Object_ID = Object_ID('CF_FORMTABS'))
begin
	alter table CF_FormTabs
	drop column [Order]
end
GO

IF NOT EXISTS (select * from sys.columns where Name = 'OrderNum'  
            and Object_ID = Object_ID('CF_FORMTABS'))
begin
	alter table CF_FormTabs
	add [OrderNum] [int]
end
GO

IF NOT EXISTS (select * from sys.columns where Name = 'IsActive'  
            and Object_ID = Object_ID('CF_FORMTABS'))
begin
	alter table CF_FormTabs
	add [IsActive] [bit]
end
GO

/************************** Item Def ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'Width'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [Width] [int] NULL
	
	ALTER TABLE CF_ITEMDEF
	Add [Height] [int] NULL
	
	ALTER TABLE CF_ITEMDEF
	Add [FontSize] [varchar] (20) NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'OverRideSubmitterID'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [OverRideSubmitterID] [bit] null
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'LabelWidth'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [LabelWidth] [int] null
	ALTER TABLE CF_ITEMDEF
	Add [ElementWidth] [int] null
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'ColumnWidth'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [ColumnWidth] [int] null
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'TabID'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [TabID] [uniqueidentifier] null
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'LookUpDataSourceID'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [LookUpDataSourceID] [uniqueidentifier] NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'GridID'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [GridID] [uniqueidentifier] null
	
	ALTER TABLE CF_ITEMDEF
	Add [GridFunction] [int] null

	ALTER TABLE CF_ITEMDEF
	Add [Label] [varchar] (255)
END
GO

alter table CF_ItemDef
alter column Width varchar(10)
GO

alter table CF_ItemDef
alter column Height varchar(10)
GO

IF NOT EXISTS (select * from sys.columns where Name = 'BalanceFormula'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [BalanceFormula] [varchar](MAX) null
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'ExecuteLookupOnLoad'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [ExecuteLookupOnLoad] [bit] DEFAULT 1
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'TriggerAfterSet'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [TriggerAfterSet] [bit] NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'ShowCGDetails'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [ShowCGDetails] [bit] DEFAULT 1
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'ShowCGUpdate'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [ShowCGUpdate] [bit] DEFAULT 1
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'FileNameFormat'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [FileNameFormat] [varchar] (MAX) NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'AllowedExtensions'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add AllowedExtensions [varchar] (MAX) NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'VersionNumber'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [VersionNumber] [int]
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'CGFileName'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [CGFileName] [varchar](100) null
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'CompareID'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [CompareID] [uniqueidentifier] null
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'WaiverCodeDatasourceID'  
            and Object_ID = Object_ID('CF_ITEMDEF'))
BEGIN
	ALTER TABLE CF_ITEMDEF
	Add [WaiverCodeDatasourceID] [uniqueidentifier] null
END
GO

if not exists(select * from sysobjects where name='FK_CF_ItemDef_CF_DataSources')
begin
ALTER TABLE [dbo].[CF_ItemDef]  WITH CHECK ADD  CONSTRAINT [FK_CF_ItemDef_CF_DataSources] FOREIGN KEY([QueryID])
REFERENCES [dbo].[CF_DataSources] ([QueryID])

ALTER TABLE [dbo].[CF_ItemDef] CHECK CONSTRAINT [FK_CF_ItemDef_CF_DataSources]
end
GO

if not exists(select * from sysobjects where name='FK_CF_ItemDef_CF_PortletForms')
begin
ALTER TABLE [dbo].[CF_ItemDef]  WITH CHECK ADD  CONSTRAINT [FK_CF_ItemDef_CF_PortletForms] FOREIGN KEY([FormID])
REFERENCES [dbo].[CF_PortletForms] ([FormID])

ALTER TABLE [dbo].[CF_ItemDef] CHECK CONSTRAINT [FK_CF_ItemDef_CF_PortletForms]
end
GO

if not exists(select * from sysobjects where name='FK_CF_ItemDef_CF_Validations')
begin
ALTER TABLE [dbo].[CF_ItemDef]  WITH CHECK ADD  CONSTRAINT [FK_CF_ItemDef_CF_Validations] FOREIGN KEY([ValidationID])
REFERENCES [dbo].[CF_Validations] ([ValidationID])

ALTER TABLE [dbo].[CF_ItemDef] CHECK CONSTRAINT [FK_CF_ItemDef_CF_Validations]
end
GO

/************************** Item Options ****************************/
if not exists(select * from sysobjects where name='FK_CF_ItemOptions_CF_ItemDef')
begin
ALTER TABLE [dbo].[CF_ItemOptions]  WITH CHECK ADD  CONSTRAINT [FK_CF_ItemOptions_CF_ItemDef] FOREIGN KEY([ItemID])
REFERENCES [dbo].[CF_ItemDef] ([ID])

ALTER TABLE [dbo].[CF_ItemOptions] CHECK CONSTRAINT [FK_CF_ItemOptions_CF_ItemDef]
end
GO

/************************** Literal String Replacer ****************************/
if not exists(select * from sysobjects where name='DF_CUS_LiteralStringReplacer_Id')
begin
ALTER TABLE [dbo].[CUS_LiteralStringReplacer] ADD  CONSTRAINT [DF_CUS_LiteralStringReplacer_Id]  DEFAULT (newid()) FOR [Id]
end
GO

/************************** Map Statements ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'MapStatementID'  
            and Object_ID = Object_ID('CF_MAPSTATEMENTS'))
BEGIN
	ALTER TABLE CF_MAPSTATEMENTS
	ADD [MapStatementID] [uniqueidentifier]

	ALTER TABLE CF_MAPSTATEMENTS
	DROP CONSTRAINT [PK_CF_MapStatements]
END
GO
UPDATE CF_MAPSTATEMENTS
SET [MapStatementID] = NEWID()
WHERE [MapStatementID] is null
GO
ALTER TABLE CF_MAPSTATEMENTS
ALTER COLUMN [MapStatementID] [uniqueidentifier] NOT NULL
GO
IF NOT EXISTS (select * from sys.objects where Name = 'PK_CF_MapStatements')
BEGIN

	ALTER TABLE CF_MAPSTATEMENTS
	ADD CONSTRAINT [PK_CF_MapStatements] PRIMARY KEY ([MapStatementID])

END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'statement_type'  
            and Object_ID = Object_ID('CF_MAPSTATEMENTS'))
BEGIN
	ALTER TABLE CF_MAPSTATEMENTS
	Add [statement_type] [varchar](10) NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'execute_event'  
            and Object_ID = Object_ID('CF_MAPSTATEMENTS'))
BEGIN
	ALTER TABLE CF_MAPSTATEMENTS
	Add [execute_event] [varchar](50) NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'multiitem_id'  
            and Object_ID = Object_ID('CF_MAPSTATEMENTS'))
BEGIN
	ALTER TABLE CF_MAPSTATEMENTS
	Add [multiitem_id] [uniqueidentifier] NULL
END
GO

IF NOT EXISTS (select * from sys.columns where Name = 'database_id'  
            and Object_ID = Object_ID('CF_MAPSTATEMENTS'))
BEGIN
	ALTER TABLE CF_MAPSTATEMENTS
	Add [database_id] [uniqueidentifier] NULL
END
GO

/************************** Parameters ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'ordernum'  
            and Object_ID = Object_ID('CF_PARAMETERS'))
BEGIN
	ALTER TABLE CF_PARAMETERS
	Add [OrderNum] [int] NULL
END
GO

/************************** Payment Profile ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'UsePlugins'  
            and Object_ID = Object_ID('CF_PAYMENTPROFILES'))
BEGIN
	ALTER TABLE CF_PAYMENTPROFILES
	Add [UsePlugins] [bit] NULL
END
GO

ALTER TABLE CF_PAYMENTPROFILES
alter column [TransactionCode] [varchar](13) NULL
GO

/************************** Portlet Forms ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'UseAudit'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [UseAudit] [bit] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'Required'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [Required] [bit]
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'UseCaptcha'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [UseCaptcha] [bit] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'CaptchaPublic'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [CaptchaPublic] [varchar] (255) NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'CaptchaPrivate'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [CaptchaPrivate] [varchar] (255) NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'CaptchaColor'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [CaptchaColor] [varchar] (50) NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'FormType'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [FormType] [int] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'BalanceEquation'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [BalanceEquation] [varchar] (2000) NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'TabOrientation'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [TabOrientation] [smallint] default 0
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'FileUploadPath'  
            and Object_ID = Object_ID('CF_PortletForms'))
BEGIN
	ALTER TABLE CF_PORTLETFORMS
	Add [FileUploadPath] [varchar] (MAX)
END
GO
if not exists(select * from sysobjects where name='FK_CF_PortletForms_CF_DataSources')
begin
ALTER TABLE [dbo].[CF_PortletForms]  WITH CHECK ADD  CONSTRAINT [FK_CF_PortletForms_CF_DataSources] FOREIGN KEY([AccessListID])
REFERENCES [dbo].[CF_DataSources] ([QueryID])

ALTER TABLE [dbo].[CF_PortletForms] CHECK CONSTRAINT [FK_CF_PortletForms_CF_DataSources]
end
GO

/************************** Stored Procedures ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'DataBaseID'  
            and Object_ID = Object_ID('CF_StoredProcedures'))
BEGIN

	ALTER TABLE CF_StoredProcedures
	Add [DataBaseID] [uniqueidentifier] NULL
	
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'ForEachItemID'  
            and Object_ID = Object_ID('CF_StoredProcedures'))
BEGIN

	ALTER TABLE CF_StoredProcedures
	Add [ForEachItemID] [uniqueidentifier] NULL
	
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'ExecuteEvent'  
            and Object_ID = Object_ID('CF_StoredProcedures'))
BEGIN

	ALTER TABLE CF_StoredProcedures
	Add [ExecuteEvent] [varchar](50) NULL
END
GO

/************************** Submissions ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'WorkflowID'  
            and Object_ID = Object_ID('CF_SUBMISSIONS'))
BEGIN
	ALTER TABLE CF_SUBMISSIONS
	Add [WorkflowID] [uniqueidentifier] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'Status'  
            and Object_ID = Object_ID('CF_SUBMISSIONS'))
BEGIN
	ALTER TABLE CF_SUBMISSIONS
	Add [Status] [int] null
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'TransactionID'  
            and Object_ID = Object_ID('CF_SUBMISSIONS'))
BEGIN
	ALTER TABLE CF_SUBMISSIONS
	Add [TransactionID] [varchar](50) null
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'WaiverCode'  
            and Object_ID = Object_ID('CF_SUBMISSIONS'))
BEGIN
	ALTER TABLE CF_SUBMISSIONS
	Add [WaiverCode] [varchar](MAX) NULL
END
GO

/************************** WF Data Point Mapping ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'IsEmail'  
            and Object_ID = Object_ID('CF_WF_DataPointMapping'))
BEGIN
	ALTER TABLE CF_WF_DataPointMapping
	Add [IsEmail] [bit] NULL
END
GO

/************************** Validations ****************************/
IF NOT EXISTS (select * from sys.columns where Name = 'IsMask'  
            and Object_ID = Object_ID('CF_VALIDATIONS'))
BEGIN
	ALTER TABLE CF_VALIDATIONS
	Add [IsMask] [bit]
END
GO
if not exists(select * from sys.indexes where name='IX_CF_Validations')
begin
CREATE UNIQUE NONCLUSTERED INDEX IX_CF_Validations ON dbo.CF_Validations
	(
	Name
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE dbo.CF_Validations SET (LOCK_ESCALATION = TABLE)
end
go