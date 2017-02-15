if not exists(select * from sys.tables where name='WF_Approver')
begin
	CREATE TABLE [dbo].[WF_Approver](
		[ApproverID] [uniqueidentifier] NOT NULL,
		[StageID] [uniqueidentifier] NULL,
		[UserID] [uniqueidentifier] NULL,
		[AlternateForID] [uniqueidentifier] NULL,
		[CanEdit] [bit] NULL,
		[Required] [bit] NULL,
		[CanReroute] [bit] NULL,
		[IsDynamic] [bit] NULL,
		[QueryID] [uniqueidentifier] NULL,
	 CONSTRAINT [PK_WF_Approver] PRIMARY KEY CLUSTERED 
	(
		[ApproverID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'IsDynamic'  
            and Object_ID = Object_ID('WF_Approver'))
BEGIN
	ALTER TABLE WF_Approver
	Add [IsDynamic] [bit] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'QueryID'  
            and Object_ID = Object_ID('WF_Approver'))
BEGIN
	ALTER TABLE WF_Approver
	Add [QueryID] [uniqueidentifier] NULL
END
GO
update b
set AlternateForID=c.ApproverID
from wf_approver b
join WF_Approver c on b.AlternateForID=c.UserID and b.StageID=c.StageID
where b.AlternateForID is not null
GO
if not exists(select * from sys.tables where name='WF_Audit')
begin
	CREATE TABLE [dbo].[WF_Audit](
		[AuditID] [uniqueidentifier] NOT NULL,
		[DocumentID] [uniqueidentifier] NULL,
		[StageID] [uniqueidentifier] NULL,
		[StepNumber] [int] NULL,
		[ActionDate] [datetime] NULL,
		[Message] [varchar](MAX) NULL,
		[ActionType] [int] NULL,
		[UserID] [uniqueidentifier] NULL,
		[OnBehalfOfID] [uniqueidentifier] NULL,
		[DynamicApproverID] [uniqueidentifier] NULL,
	 CONSTRAINT [PK_WF_Audit] PRIMARY KEY CLUSTERED 
	(
		[AuditID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO

alter table wf_audit
alter column [message] varchar(MAX) null
GO

IF NOT EXISTS (select * from sys.columns where Name = 'DynamicApproverID'  
            and Object_ID = Object_ID('WF_Audit'))
BEGIN
	ALTER TABLE WF_Audit
	Add [DynamicApproverID] [uniqueidentifier] NULL
END
GO
if not exists(select * from sys.tables where name='WF_AuthKeys')
begin
	CREATE TABLE [dbo].[WF_AuthKeys](
		[AuthID] [uniqueidentifier] NOT NULL,
		[AuthKey] [uniqueidentifier] NULL,
	 CONSTRAINT [PK_WF_AuthKeys] PRIMARY KEY CLUSTERED 
	(
		[AuthID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

	end
go
if not exists(select * from sys.tables where name='WF_Document')
begin
	CREATE TABLE [dbo].[WF_Document](
		[DocumentID] [uniqueidentifier] NOT NULL,
		[TrackID] [uniqueidentifier] NULL,
		[CurrentStageID] [uniqueidentifier] NULL,
		[CurrentStep] [int] NULL,
		[AssignToID] [uniqueidentifier] NULL,
		[AssignToUserID] [uniqueidentifier] NULL,
		[AccessPath] [varchar](500) NULL,
		[FileType] [varchar](10) NULL,
		[SubmittedDate] [datetime] NULL,
		[ReRouted] [bit] NULL,
		[OwnerID] [uniqueidentifier] NULL,
		[FilePath] [varchar](500) NULL,
		[SubmittedByEmail] [varchar](255) NULL,
		[DocumentDefID] [uniqueidentifier] NULL,
	 CONSTRAINT [PK_WF_Document] PRIMARY KEY CLUSTERED 
	(
		[DocumentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'CurrentStep'  
            and Object_ID = Object_ID('WF_Document'))
BEGIN
	ALTER TABLE WF_Document
	Add [CurrentStep] [int] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'AssignToID'  
            and Object_ID = Object_ID('WF_Document'))
BEGIN
	ALTER TABLE WF_Document
	Add [AssignToID] [uniqueidentifier] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'AssignToUserID'  
            and Object_ID = Object_ID('WF_Document'))
BEGIN
	ALTER TABLE WF_Document
	Add [AssignToUserID] [uniqueidentifier] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'DocumentDefID'  
            and Object_ID = Object_ID('WF_Document'))
BEGIN
	ALTER TABLE WF_Document
	Add [DocumentDefID] [uniqueidentifier] NULL
END
GO
if not exists(select * from sys.tables where name='WF_DocumentApprover')
begin
	CREATE TABLE [dbo].[WF_DocumentApprover] (
		[DocumentApproverID] [uniqueidentifier] NOT NULL,
		[DocumentID] [uniqueidentifier],
		[ApproverID] [uniqueidentifier],
		[UserID] [uniqueidentifier],
	 CONSTRAINT [PK_WF_DocumentApprover] PRIMARY KEY CLUSTERED 
	(
		[DocumentApproverID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
if not exists(select * from sys.tables where name='WF_Email')
begin
	CREATE TABLE [dbo].[WF_Email](
		[EmailID] [uniqueidentifier] NOT NULL,
		[StageID] [uniqueidentifier] NULL,
		[EmailTo] [varchar](500) NULL,
		[EmailFrom] [varchar](500) NULL,
		[CC] [varchar](500) NULL,
		[Bcc] [varchar](500) NULL,
		[Subject] [varchar](500) NULL,
		[Body] [varchar](max) NULL,
		[OnEvent] [int] NULL,
		[SendToSubmitter] [bit] NULL,
		[SendToApprover] [bit] NULL,
		[SendAfterUntouched] [int] NULL,
		[ResendEvery] [int] NULL,
		[AttachDocument] [bit],
	 CONSTRAINT [PK_WF_Email] PRIMARY KEY CLUSTERED 
	(
		[EmailID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'SendAfterUntouched'  
            and Object_ID = Object_ID('WF_Email'))
BEGIN
	ALTER TABLE WF_Email
	Add [SendAfterUntouched] [int] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'ResendEvery'  
            and Object_ID = Object_ID('WF_Email'))
BEGIN
	ALTER TABLE WF_Email
	Add [ResendEvery] [int] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'AttachDocument'  
            and Object_ID = Object_ID('WF_Email'))
BEGIN
	ALTER TABLE WF_Email
	Add [AttachDocument] [bit]
END
GO
if not exists(select * from sys.tables where name='WF_Stage')
begin
	CREATE TABLE [dbo].[WF_Stage](
		[StageID] [uniqueidentifier] NOT NULL,
		[TrackID] [uniqueidentifier] NULL,
		[Name] [varchar](50) NULL,
		[Description] [varchar](255) NULL,
		[OrderNum] [int] NULL,
		[ExecuteMapping] [bit] NULL,
		[NumRequiredResponses] [int] NULL,
		[LogEmailsToAudit] [bit] NULL,
	 CONSTRAINT [PK_WF_Stage] PRIMARY KEY CLUSTERED 
	(
		[StageID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'LogEmailsToAudit'  
            and Object_ID = Object_ID('WF_Stage'))
BEGIN
	ALTER TABLE WF_Stage
	Add [LogEmailsToAudit] [bit] NULL
END
GO

update WF_Stage
set LogEmailsToAudit=0
where LogEmailsToAudit=NULL
GO

if not exists(select * from sys.tables where name='WF_Track')
begin
	CREATE TABLE [dbo].[WF_Track](
		[TrackID] [uniqueidentifier] NOT NULL,
		[Name] [varchar](50) NULL,
		[Description] [varchar](255) NULL,
		[IsPublic] [bit] NULL,
		[OwnerID] [uniqueidentifier] NULL,
		[FileStorePath] [varchar](MAX) NULL,
	 CONSTRAINT [PK_WF_Track] PRIMARY KEY CLUSTERED 
	(
		[TrackID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'FileStorePath'  
            and Object_ID = Object_ID('WF_Track'))
BEGIN
	ALTER TABLE WF_Track
	Add [FileStorePath] [varchar](max) NULL
END
GO
if not exists(select * from sys.tables where name='WF_Comment')
begin
	CREATE TABLE [dbo].[WF_Comment](
		[CommentID] [uniqueidentifier] NOT NULL,
		[DocumentID] [uniqueidentifier] NULL,
		[CommentBy] [uniqueidentifier] NULL,
		[Datestamp] [datetime] NULL,
		[Message] [varchar](max) NULL,
		[FilePath] [varchar](max) NULL,
		[StageID] [uniqueidentifier] NULL,
		[StepNum] [int] NULL,
	 CONSTRAINT [PK_WF_Comment] PRIMARY KEY CLUSTERED 
	(
		[CommentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'FilePath'  
            and Object_ID = Object_ID('WF_Comment'))
BEGIN
	ALTER TABLE WF_Comment
	Add [FilePath] [varchar](max) NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'StageID'  
            and Object_ID = Object_ID('WF_Comment'))
BEGIN
	ALTER TABLE WF_Comment
	Add [StageID] [uniqueidentifier] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'StepNum'  
            and Object_ID = Object_ID('WF_Comment'))
BEGIN
	ALTER TABLE WF_Comment
	Add [StepNum] [int] NULL
END
GO
if not exists(select * from sys.tables where name='WF_DocumentDefinition')
begin
	CREATE TABLE [dbo].[WF_DocumentDefinition](
		[DocumentDefID] [uniqueidentifier] NOT NULL,
		[OwnerID] [uniqueidentifier] NULL,
		[PortletID] [uniqueidentifier] NULL,
		[TrackID] [uniqueidentifier] NULL,
		[Name] [varchar](50) NULL,
		[Description] [varchar](1000) NULL,
		[StartDate] [datetime] NULL,
		[EndDate] [datetime] NULL,
		[AllowTrackChoice] [bit] NULL,
		[ReportType] [varchar](50) NULL,
		[DatabaseID] [uniqueidentifier] NULL,
		[Query] [varchar](MAX) NULL,
	 CONSTRAINT [PK_WF_DocumentDefinition] PRIMARY KEY CLUSTERED 
	(
		[DocumentDefID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'PortletID'  
            and Object_ID = Object_ID('WF_DocumentDefinition'))
BEGIN
	ALTER TABLE WF_DocumentDefinition
	Add [PortletID] [uniqueidentifier] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'ReportType'  
            and Object_ID = Object_ID('WF_DocumentDefinition'))
BEGIN
	ALTER TABLE WF_DocumentDefinition
	Add [ReportType] [varchar](50) NULL
	
	ALTER TABLE WF_DocumentDefinition
	Add [DatabaseID] [uniqueidentifier] NULL
	
	ALTER TABLE WF_DocumentDefinition
	Add [Query] [varchar](MAX) NULL
END
GO
if not exists(select * from sys.tables where name='WF_Task')
begin
	CREATE TABLE [dbo].[WF_Task](
		[TaskID] [uniqueidentifier] NOT NULL,
		[StageID] [uniqueidentifier] NULL,
		[UserID] [uniqueidentifier] NULL,
		[Description] [varchar](50) NULL,
		[OrderNum] [int] NULL,
	 CONSTRAINT [PK_WF_Task] PRIMARY KEY CLUSTERED 
	(
		[TaskID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
IF NOT EXISTS (select * from sys.columns where Name = 'OrderNum'  
            and Object_ID = Object_ID('WF_Task'))
BEGIN
	ALTER TABLE WF_Task
	Add [OrderNum] [int] NULL
END
GO
IF NOT EXISTS (select * from sys.columns where Name = 'NumRequiredResponses'  
            and Object_ID = Object_ID('WF_Stage'))
BEGIN
	ALTER TABLE WF_Stage
	Add [NumRequiredResponses] [int] NULL
END
GO
if not exists(select * from sys.tables where name='WF_DynamicApprover')
begin
	CREATE TABLE [dbo].[WF_DynamicApprover](
		[QueryID] [uniqueidentifier] NOT NULL,
		[DatabaseID] [uniqueidentifier] NULL,
		[Title] [varchar](50) NULL,
		[Query] [varchar](max) NULL,
	 CONSTRAINT [PK_WF_DynamicApprovers] PRIMARY KEY CLUSTERED 
	(
		[QueryID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
GO
if not exists(select * from sys.tables where name='WF_StoredProcedures')
begin
CREATE TABLE [dbo].[WF_StoredProcedures](
	[ProcedureID] [uniqueidentifier] NOT NULL,
	[TrackID] [uniqueidentifier] NULL,
	[StageID] [uniqueidentifier] NULL,
	[ProcName] [varchar](255) NULL,
	[DatabaseID] [uniqueidentifier] NULL,
	[OnEvent] [int] NULL,
 CONSTRAINT [PK_WF_StoredProcedures] PRIMARY KEY CLUSTERED 
(
	[ProcedureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sys.tables where name='WF_DataPoints')
begin
	CREATE TABLE [dbo].[WF_DataPoints](
	[DataPointID] [uniqueidentifier] NOT NULL,
	[TrackID] [uniqueidentifier] NULL,
	[TagName] [varchar](50) NULL,
	[Description] [varchar](1000) NULL,
	[ShowInGrid] [bit],
 CONSTRAINT [PK_WF_DataPoints] PRIMARY KEY CLUSTERED 
(
	[DataPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
go
IF NOT EXISTS (select * from sys.columns where Name = 'ShowInGrid'  
            and Object_ID = Object_ID('WF_DataPoints'))
BEGIN
	ALTER TABLE WF_DataPoints
	Add [ShowInGrid] [bit] 
END
GO
if not exists(select * from sys.tables where name='WF_DataPointValues')
begin
CREATE TABLE [dbo].[WF_DataPointValues](
	[DataPointValueID] [uniqueidentifier] NOT NULL,
	[DocumentID] [uniqueidentifier] NULL,
	[DataPointID] [uniqueidentifier] NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_WF_DataPointValues] PRIMARY KEY CLUSTERED 
(
	[DataPointValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end
go

if not exists(select * from sys.tables where name='WF_Rules')
begin
CREATE TABLE [dbo].[WF_Rules](
	[RuleID] [uniqueidentifier] NOT NULL,
	[StageID] [uniqueidentifier] NULL,
	[DataPointID] [uniqueidentifier] NULL,
	[Action] [int] NULL,
	[Conjunction] [int] NULL,
	[Event] [int] NULL,
	[Operator] [varchar](10) NULL,
	[Value] [varchar](max) NULL,
	[OrderNum] [int] NULL,
	[Text] [varchar](max) NULL,
 CONSTRAINT [PK_WF_Rules] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end
go
IF NOT EXISTS (select * from sys.columns where Name = 'Text'  
            and Object_ID = Object_ID('WF_Rules'))
BEGIN
	ALTER TABLE WF_Rules
	Add [Text] [varchar](max) null
END
GO
if exists (select * from sys.procedures where name='sp_WF_AddDocumentToTrack')
begin
	drop procedure sp_WF_AddDocumentToTrack
end
go

if exists (select * from sys.procedures where name='WF_spAddDocument')
begin
	drop procedure WF_spAddDocument
end
go
CREATE PROCEDURE dbo.WF_spAddDocument
	@document_id as uniqueidentifier,
	@def_id as uniqueidentifier,
	@file_type as varchar(10),
	@owner_id as uniqueidentifier,
	@submitted_by_email as varchar(255),
	@access_path as varchar(500) = null,
	@track_id as uniqueidentifier = null
AS
BEGIN

	IF @track_id is null
	BEGIN
		SET @track_id = (select trackid from WF_DocumentDefinition where DocumentDefID=@def_id)
	END
	
	DECLARE @current_stage_id as uniqueidentifier = (select top 1 s.StageID from WF_Stage s where s.TrackID=@track_id order by s.OrderNum)
	
	IF @file_type = 'WFQ' and @access_path is null
	BEGIN
		SET @access_path = '/ICS/Portlets/CUS/ICS/Jenzabar.Workflow/Views/ExternalQueryView.aspx?UniqueID=' + cast(@document_id as varchar(40))
	END
	
	INSERT INTO WF_Document (DocumentID, 
							TrackID, 
							CurrentStageID, 
							CurrentStep, 
							AssignToID, 
							AssignToUserID, 
							AccessPath, 
							FileType, 
							SubmittedDate, 
							ReRouted, 
							OwnerID, 
							FilePath, 
							SubmittedByEmail,
							DocumentDefID)
					VALUES (@document_id,
							@track_id,
							@current_stage_id,
							0,
							null,
							null,
							@access_path,
							@file_type,
							GETDATE(),
							0,
							@owner_id,
							null,
							@submitted_by_email,
							@def_id)
END
GO
delete from WF_DataPointValues where DataPointID is null
go

if not exists(select * from fwk_configsettings where Category='Workflow' and [Key]='AssignApprover')
begin
	insert into FWK_ConfigSettings (Category, [Key], Value, DefaultValue)
	values('Workflow','AssignApprover','N','N')
end
go

if not exists(select * from fwk_htmlheadelement where htmlheadelementid='A6512005-BE4D-4112-8C63-C2E67E785D10')
begin
  insert into FWK_HtmlHeadElement(HtmlHeadElementID, HtmlHeadElementCategoryID, Name, ElementContent, IsRequired, IsCustomRequired)
  values ('A6512005-BE4D-4112-8C63-C2E67E785D10', '4DB3CF3A-F405-4C71-93F7-EDD3628EC40B', 'Workflow Styles', '<link rel="stylesheet" type="text/css" href="Portlets/CUS/ICS/Jenzabar.Workflow/Styles/WorkflowStyles.css" />', 1, 0)
end
go

if not exists(select * from sys.tables where name='WF_DocumentVersions')
begin
	CREATE TABLE [dbo].[WF_DocumentVersions](
		[VersionID] [uniqueidentifier] NOT NULL,
		[DocumentID] [uniqueidentifier] NULL,
		[VersionNum] [int] NULL,
		[UserID] [uniqueidentifier] NULL,
		[UploadDate] [datetime] NULL,
		[FilePath] [varchar](max) NULL,
		[CommitNotes] [varchar](max) NULL,
	 CONSTRAINT [PK_WF_DocumentVersions] PRIMARY KEY CLUSTERED 
	(
		[VersionID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end
go
update WF_Document
set AccessPath=REPLACE(AccessPath, '/Jenzabar.ContainedForm/Views/', '/Jenzabar.Workflow/Extensions/')
where FileType='JCF'
go

if not exists (select * from FWK_PortletTemplate where PortletTemplateID = 'D7503F17-15E5-4CC2-B5DC-BC1546051834')
	insert into FWK_PortletTemplate values('D7503F17-15E5-4CC2-B5DC-BC1546051834')
go
if exists (select * from FWK_PageType p where p.PortletTemplateID = 'D7503F17-15E5-4CC2-B5DC-BC1546051834')
	update FWK_PageType set PageTypeGroupID = '0C12A773-DD2A-45E6-B86D-25840EFD6B81', CssClass = 'generalPurposeGroup', NameFormatKey = NULL
			where PortletTemplateID = 'D7503F17-15E5-4CC2-B5DC-BC1546051834';
else
	insert into FWK_PageType values (NEWID(), 'D7503F17-15E5-4CC2-B5DC-BC1546051834', '0C12A773-DD2A-45E6-B86D-25840EFD6B81',
			'MSG_PORTLET_TYPE_JENZABAR_WORKFLOW', 1, 0, 0, 0, 0, 'generalPurposeGroup', NULL);
go

if not exists(select * from FWK_Globalization where Text_Key='JWF_TXT_SETTING_REQUIRED')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JWF_TXT_SETTING_REQUIRED', 'Required/Authoritative', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JWF_TXT_SETTING_ALLOW_EDIT')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JWF_TXT_SETTING_ALLOW_EDIT', 'Allow Edit', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JWF_TXT_SETTING_ALLOW_REROUTE')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JWF_TXT_SETTING_ALLOW_REROUTE', 'Allow Reroute', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JWF_TXT_SETTING_CAN_APPROVE_FOR')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JWF_TXT_SETTING_CAN_APPROVE_FOR', 'Can Approve For', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JWF_TXT_APPROVER')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JWF_TXT_APPROVER', 'Approver', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JWF_TXT_APPROVER_TYPE')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JWF_TXT_APPROVER_TYPE', 'Approver Type', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JWF_TXT_ADD_EMAIL')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JWF_TXT_ADD_EMAIL', 'Add Email', null)
end
go