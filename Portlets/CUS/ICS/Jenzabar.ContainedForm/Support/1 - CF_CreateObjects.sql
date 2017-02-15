if not exists(select * from sysobjects where name='CF_ANSWERS')
BEGIN
CREATE TABLE [dbo].[CF_Answers](
	[AnswerID] [uniqueidentifier] NOT NULL,
	[SubmissionID] [uniqueidentifier] NULL,
	[ItemID] [uniqueidentifier] NULL,
	[AnswerValue] [varchar](max) NULL,
	[MItemID] [uniqueidentifier] NULL,
	[RowIndex] [int] NULL,
	[ChildItemID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CF_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

if not exists(select * from sysobjects where name='CF_AUDIT')
BEGIN
	CREATE TABLE [dbo].[CF_Audit](
		[AuditID] [uniqueidentifier] NOT NULL,
		[SubmissionID] [uniqueidentifier] NULL,
		[Event] [varchar](50) NULL,
		[IsError] [bit] NULL,
		[Summary] [varchar](50) NULL,
		[Message] [varchar](max) NULL,
		[LoggedDate] [datetime] NULL,
		[OrderNum] [int] NULL,
	 CONSTRAINT [PK_CF_Audit] PRIMARY KEY CLUSTERED 
	(
		[AuditID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

if not exists(select * from sysobjects where name='CF_DATABASES')
begin
CREATE TABLE [dbo].[CF_Databases](
	[DataBaseID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[ConnectionString] [varchar](500) NOT NULL,
 CONSTRAINT [PK_CF_Databases] PRIMARY KEY CLUSTERED 
(
	[DataBaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
alter table CF_Databases
alter column [ConnectionString] varchar(500) NOT NULL
go
if not exists(select * from sysobjects where name='CF_DATASOURCES')
begin
CREATE TABLE [dbo].[CF_DataSources](
	[QueryID] [uniqueidentifier] NOT NULL,
	[DataBaseID] [uniqueidentifier] NULL,
	[TagName] [varchar](50) NULL,
	[Query] [varchar](max) NULL,
	[IsACL] [bit] NULL,
 CONSTRAINT [PK_CF_DataSources] PRIMARY KEY CLUSTERED 
(
	[QueryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name='CF_EMAILTEMPLATES')
begin
CREATE TABLE [dbo].[CF_EmailTemplates](
	[EmailID] [uniqueidentifier] NOT NULL,
	[FormID] [uniqueidentifier] NULL,
	[Subject] [varchar](255) NULL,
	[EmailTo] [varchar](4000) NULL,
	[FromAddress] [varchar](255) NULL,
	[Message] [varchar](max) NULL,
	[IncludeSubmission] [bit] NULL,
	[SendEvent] [varchar] (50) NULL,
 CONSTRAINT [PK_CF_EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name='CF_EVENTRULES')
begin
CREATE TABLE [dbo].[CF_EventRules](
	[ItemID] [uniqueidentifier] NULL,
	[RuleID] [uniqueidentifier] NOT NULL,
	[Value] [varchar](max) NULL,
	[Action] [int] NULL,
	[Parameter] [varchar](max) NULL,
	[Conjunction] [int] NULL,
	[OrderNum] [int] NULL,
	[EmailID] [uniqueidentifier] NULL,
	[TargetItemID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CF_EventRules] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from information_schema.tables where table_name = 'CF_EX_Mapping') and exists(select * from FWK_ConfigSettings where [key]='ERPType' and value='EX')
BEGIN
	CREATE TABLE [dbo].[CF_EX_Mapping](
		[ColumnID] [uniqueidentifier] NOT NULL,
		[RowID] [uniqueidentifier] NULL,
		[FormID] [uniqueidentifier] NULL,
		[ItemID] [varchar](50) NULL,
		[MapTableID] [int] NULL,
		[MapColumnID] [int] NULL,
		[MapTableName] [varchar](100) NULL,
		[MapColumnName] [varchar](100) NULL,
		[RowName] [varchar](100) NULL,
		[StaticValue] [varchar](max) NULL,
	 CONSTRAINT [PK_CF_EX_Mapping] PRIMARY KEY CLUSTERED 
	(
		[ColumnID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (select * 
				from sys.tables t
				join sys.schemas s on t.schema_id=s.schema_id
				where t.name = 'CF_ExternalUsers'
				and s.name = 'dbo')
    AND EXISTS (select *
				from sys.tables t
				where t.name = 'CF_ExternalUsers')
BEGIN
    ALTER SCHEMA dbo TRANSFER OBJECT::CF_ExternalUsers;
END
ELSE if not exists(select * from sys.tables where name='CF_ExternalUsers')
begin
    CREATE TABLE [dbo].[CF_ExternalUsers]
    (
	   ExternalUserID uniqueidentifier,
	   FirstName varchar(50),
	   LastName varchar(50),
	   EmailAddress varchar(150),
	   Password varchar(150),
	   LastLogin DateTime
    )
end
go

if not exists((select * from information_schema.tables where table_name = 'CF_FormItemOption')) 
BEGIN

	CREATE TABLE [dbo].[CF_FormItemOption](
		[ID] [uniqueidentifier] NOT NULL,
		[ItemID] [uniqueidentifier] NOT NULL,
		[Type] [varchar](50) NOT NULL,
		[Settings] [text] NOT NULL,
	 CONSTRAINT [PK_CF_FormItemOption] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE [dbo].[CF_FormItemOption]  WITH CHECK ADD  CONSTRAINT [FK_CF_FormItemOption_CF_ItemDef] FOREIGN KEY([ItemID])
	REFERENCES [dbo].[CF_ItemDef] ([ID])

	ALTER TABLE [dbo].[CF_FormItemOption] CHECK CONSTRAINT [FK_CF_FormItemOption_CF_ItemDef]

END
GO

if not exists((select * from information_schema.tables where table_name = 'CF_FormOption')) 
BEGIN

	CREATE TABLE [dbo].[CF_FormOption](
		[ID] [uniqueidentifier] NOT NULL,
		[FormID] [uniqueidentifier] NOT NULL,
		[Type] [varchar](50) NOT NULL,
		[Settings] [text] NOT NULL,
	 CONSTRAINT [PK_CF_FormOption] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	ALTER TABLE [dbo].[CF_FormOption]  WITH CHECK ADD  CONSTRAINT [FK_CF_FormOption_CF_PortletForms] FOREIGN KEY([FormID])
	REFERENCES [dbo].[CF_PortletForms] ([FormID])

	ALTER TABLE [dbo].[CF_FormOption] CHECK CONSTRAINT [FK_CF_FormOption_CF_PortletForms]

END
GO

if not exists(select * from sysobjects where name='CF_FORMTABS')
begin
CREATE TABLE [dbo].[CF_FormTabs](
	[TabID] [uniqueidentifier] PRIMARY KEY,
	[FormID] [uniqueidentifier],
	[OrderNum] [int],
	[Name] [varchar](100),
	[IsActive] [bit],
	[ShowInReport] [bit]
)
end
go

if not exists (select * from sysobjects where name='CF_ITEMDEF')
begin
CREATE TABLE [dbo].[CF_ItemDef](
	[ID] [uniqueidentifier] NOT NULL,
	[FormID] [uniqueidentifier] NULL,
	[QuestionNum] [int] NOT NULL,
	[RowNum] [int] NULL,
	[ColumnNum] [int] NULL,
	[Type] [int] NULL,
	[Text] [varchar](max) NULL,
	[TextPos] [int] NULL,
	[GroupName] [varchar](255) NULL,
	[IsHeader] [bit] NULL,
	[ReadOnly] [bit] NULL,
	[Required] [bit] NULL,
	[Randomize] [bit] NULL,
	[OptionsType] [int] NULL,
	[QueryID] [uniqueidentifier] NULL,
	[AllowedAnswers] [int] NULL,
	[Path] [varchar](300) NULL,
	[Alignment] [varchar](10) NULL,
	[Link] [varchar](300) NULL,
	[ValidationID] [uniqueidentifier] NULL,
	[Length] [int] NULL,
	[DefaultText] [varchar](max) NULL,
	[SelectedDate] [datetime] NULL,
	[UseTime] [bit] NULL,
	[Orientation] [int] NULL,
	[IsActive] [bit] NULL,
	[ReportOnly] [bit] NULL,
	[HideOnLoad] [bit] NULL,
	[PaymentField] [varchar](50) NULL,
	[AddToBalance] [bit] NULL,
	[MultiplyBalance] [bit] NULL,
	[Width] [varchar](10) NULL,
	[Height] [varchar](10) NULL,
	[FontSize] [varchar] (20) NULL,
	[OverRideSubmitterID] [bit] NULL,
	[LabelWidth] [int] NULL,
	[ElementWidth] [int] NULL,
	[TabID] [uniqueidentifier] NULL,
	[LookUpDataSourceID] [uniqueidentifier],
	[GridID] [uniqueidentifier] NULL,
	[GridFunction] [int] NULL,
	[Label] [varchar] (255),
	[ColumnWidth] [int],
	[BalanceFormula] [varchar](MAX) NULL,
	[ExecuteLookupOnLoad] [bit],
	[ShowCGDetails] [bit],
	[ShowCGUpdate] [bit],
	[FileNameFormat] [varchar](MAX) NULL,
	[VersionNumber] [int] NULL,
	[CGFileName] [varchar](100) NULL,
	[CompareID] [uniqueidentifier] NULL,
	[TriggerAfterSet] [bit] NULL,
	[WaiverCodeDatasourceID] uniqueidentifier NULL,
 CONSTRAINT [PK_CF_ItemDef] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name='CF_ITEMOPTIONS')
begin
CREATE TABLE [dbo].[CF_ItemOptions](
	[ID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NULL,
	[OrderNum] [int] NULL,
	[Text] [varchar](255) NULL,
	[Explanation] [varchar](400) NULL,
	[Value] [varchar](255) NULL,
	[DoubleValue] [decimal](18, 6) NULL,
	[Selected] [bit] NULL,
	[MaxAnswers] [int] NULL,
 CONSTRAINT [PK_CF_ItemOptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name='CF_LOOKUPMAPPING')
begin

	CREATE TABLE [dbo].[CF_LookupMapping](
		[MappingID] [uniqueidentifier] NOT NULL,
		[ItemID] [uniqueidentifier] NULL,
		[TargetID] [uniqueidentifier] NULL,
		[ColumnName] [varchar](255) NULL,
	 CONSTRAINT [PK_CF_LookupMapping] PRIMARY KEY CLUSTERED 
	(
		[MappingID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

end
go

if not exists((select * from information_schema.tables where table_name = 'CF_MapLog')) 
BEGIN
	CREATE TABLE [dbo].[CF_MapLog](
		[LogID] [uniqueidentifier] NOT NULL,
		[SubmissionID] [uniqueidentifier] NULL,
		[ProcedureID] [uniqueidentifier] NULL,
		[Success] [bit] NULL,
		[QueryExecuted] [varchar](max) NULL,
		[Message] [varchar](max) NULL,
	 CONSTRAINT [PK_CF_MapLog] PRIMARY KEY CLUSTERED 
	(
		[LogID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

if not exists(select * from sysobjects where name='CF_MAPSTATEMENTS')
begin 
CREATE TABLE [dbo].[CF_MapStatements](
	[MapStatementID] [uniqueidentifier] NOT NULL,
	[form_id] [uniqueidentifier] NOT NULL,
	[order_num] [int] NOT NULL,
	[query] [text] NULL,
	[execute_on_approve] [bit] NULL,
	[statement_type] [varchar](10) NULL,
	[multiitem_id] [uniqueidentifier] NULL,
	[database_id] [uniqueidentifier] NULL,
	[execute_event] [varchar](50) NULL,
 CONSTRAINT [PK_CF_MapStatements] PRIMARY KEY CLUSTERED 
(
	[MapStatementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name='CF_PARAMETERS')
begin
CREATE TABLE [dbo].[CF_Parameters](
	[ParameterID] [uniqueidentifier] NOT NULL,
	[ParentID] [uniqueidentifier] NULL,
	[Name] [varchar](50) NULL,
	[Value] [varchar](max) NULL,
	[IsQuestion] [bit] NULL,
	[IsLSR] [bit] NULL,
	[OrderNum] [int] NULL,
 CONSTRAINT [PK_CF_Parameters] PRIMARY KEY CLUSTERED 
(
	[ParameterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name='CF_PAYMENTPROFILES')
begin
CREATE TABLE [dbo].[CF_PaymentProfiles](
	[ConfigID] [uniqueidentifier] NOT NULL,
	[FormID] [uniqueidentifier] NULL,
	[FeeAmount] [decimal](18, 2) NULL,
	[AccountCode] [varchar](50) NULL,
	[Requestor] [varchar](50) NULL,
	[TransactionCode] [varchar](13) NULL,
	[FeeDescription] [varchar](255) NULL,
	[UsePlugins] [bit] NULL,
 CONSTRAINT [PK_CF_PaymentProfiles] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists (select * from sysobjects where name='CF_PORTLETFORMS')
begin
CREATE TABLE [dbo].[CF_PortletForms](
	[PortletID] [uniqueidentifier] NOT NULL,
	[FormID] [uniqueidentifier] NOT NULL,
	[FormOrder] [int] NULL,
	[IsVisible] [bit] NULL,
	[Name] [varchar](200) NULL,
	[Description] [varchar](max) NULL,
	[ShowInMainView] [bit] NULL,
	[ThanksMessage] [varchar](max) NULL,
	[DisplayOn] [datetime] NULL,
	[MessageBefore] [varchar](max) NULL,
	[EndOn] [datetime] NULL,
	[MessageAfter] [varchar](max) NULL,
	[DisplayInToDo] [bit] NULL,
	[RedirectURL] [varchar](500) NULL,
	[MaxUserSubmissions] [int] NULL,
	[MakeAnonymous] [bit] NULL,
	[AllowOwnReview] [bit] NULL,
	[RandomizeQuestions] [bit] NULL,
	[AccessListID] [uniqueidentifier] NULL,
	[FormType] [int] NULL,
	[UseAudit] [bit] NULL,
	[BalanceEquation] [varchar] (2000) NULL,
	[UseCaptcha] [bit] NULL,
	[CaptchaPublic] [varchar] (255) NULL,
	[CaptchaPrivate] [varchar] (255) NULL,
	[CaptchaColor] [varchar] (50) NULL,
	[Required] [bit],
	[TabOrientation] [smallint],
	[FileUploadPath] [varchar](MAX) NULL,
 CONSTRAINT [PK_CF_PortletForms_1] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists (select * from sysobjects where name='CF_STOREDPROCEDURES')
begin
CREATE TABLE [dbo].[CF_StoredProcedures](
	[StoredProcID] [uniqueidentifier] NOT NULL,
	[FormID] [uniqueidentifier] NULL,
	[OrderNum] [int] NULL,
	[Name] [varchar](50) NULL,
	[ExecuteOnApprove] [bit] NULL,
	[DataBaseID] [uniqueidentifier] NULL,
	[ExecuteEvent] [varchar](50) NULL,
	[ForEachItemID] [uniqueidentifier] null,
 CONSTRAINT [PK_CF_StoredProcedures] PRIMARY KEY CLUSTERED 
(
	[StoredProcID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name = 'CF_SUBMISSIONS')
begin
CREATE TABLE [dbo].[CF_Submissions](
	[SubmissionID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[FormID] [uniqueidentifier] NULL,
	[SubmittedDate] [datetime] NULL,
	[FinalBalance] [decimal](18, 2) NULL,
	[WorkflowID] [uniqueidentifier] NULL,
	[Status] [int] NULL,
	[TransactionID] [varchar](50) NULL,
	[WaiverCode] [varchar](MAX) NULL,
 CONSTRAINT [PK_CF_Submissions] PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists((select * from information_schema.tables where table_name = 'CF_TabProgress')) 
BEGIN

CREATE TABLE [dbo].[CF_TabProgress](
	[ProgressID] [uniqueidentifier] NOT NULL,
	[SubmissionID] [uniqueidentifier] NULL,
	[TabID] [uniqueidentifier] NULL,
	[Complete] [bit] NULL,
 CONSTRAINT [PK_CF_TabProgress] PRIMARY KEY CLUSTERED 
(
	[ProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO

if not exists(select * from sysobjects where name='CF_WF_DataPointMapping')
begin
CREATE TABLE [dbo].[CF_WF_DataPointMapping](
	[MappingID] [uniqueidentifier] NOT NULL,
	[FormID] [uniqueidentifier] NULL,
	[ItemID] [uniqueidentifier] NULL,
	[DataPointID] [uniqueidentifier] NULL,
	[IsEmail] [bit] NULL,
 CONSTRAINT [PK_CF_WF_DataPointMapping] PRIMARY KEY CLUSTERED 
(
	[MappingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
go

if not exists(select * from sysobjects where name='CF_VALIDATIONS')
begin
CREATE TABLE [dbo].[CF_Validations](
	[ValidationID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[RegEx] [varchar](500) NULL,
	[ValidationMsg] [varchar](500) NULL,
	[IsMask] [bit],
 CONSTRAINT [PK_CF_Validations] PRIMARY KEY CLUSTERED 
(
	[ValidationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

if not exists(select * from sysobjects where name='CUS_LiteralStringReplacer')
begin
CREATE TABLE [dbo].[CUS_LiteralStringReplacer](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Literal] [nvarchar](50) NOT NULL,
	[SourceType] [smallint] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[ConnectionInfo] [nvarchar](max) NULL,
	[CacheType] [smallint] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_CUS_LiteralStringReplacer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end
GO

IF EXISTS (select * from sys.views where name = 'CF_vwSubmissionResponse')
BEGIN
    DROP VIEW dbo.CF_vwSubmissionResponse
END
GO
CREATE VIEW dbo.CF_vwSubmissionResponse
AS
SELECT  s.SubmissionID, 
	   f.FormID,  
	   u.HostID, 
	   eu.EmailAddress AS [ExternalUserLogin], 
	   s.SubmittedDate, 
	   case s.Status when 0 then 'Active'
	   when 1 then 'Submitted'
	   when 2 then 'Returned'
	   when 3 then 'PaymentPending'
	   end as [Status], 
	   s.FinalBalance, 
	   f.Name,
	   i.RowNum AS [DisplayRowNumber], 
	   i.ColumnNum AS [DisplayColumnNumber], 
	   i.ID AS [ParentItemID], 
	   i.Label AS [ParentItemLabel], 
	   c.ID AS [ChildItemID], 
	   c.Label AS [ChildItemLabel], 
	   a.AnswerID,
	   a.AnswerValue, 
	   ex.MapColumnID, 
	   a.RowIndex AS [ResponseRowNumber],
	   ex.MapTableName AS [EXMapTableName], 
	   ex.MapColumnName AS [EXMapColumnName]
FROM CF_Submissions s
     JOIN CF_Answers a ON s.SubmissionID = a.SubmissionID
     JOIN CF_PortletForms f ON s.FormID = f.FormID
     JOIN CF_ItemDef i ON a.ItemID = i.ID
     LEFT JOIN FWK_User u ON s.UserID = u.ID
     LEFT JOIN CF_ExternalUsers eu ON eu.ExternalUserID=s.UserID
     LEFT JOIN CF_ItemDef c ON a.ChildItemID = c.ID
     LEFT JOIN CF_EX_Mapping ex ON ex.FormID = f.FormID
        AND (ex.ItemID = CAST(i.ID AS VARCHAR(36))
                    OR ex.ItemID = CAST(c.ID AS VARCHAR(36))
            )
WHERE i.Type not in (0, 7, 9, 12, 13, 14)
GO
