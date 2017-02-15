update CF_EMAILTEMPLATES
set SendEvent = 'Save'
where SendEvent is null
GO

UPDATE CF_ITEMDEF
SET TriggerAfterSet = 1
WHERE TriggerAfterSet is null
GO

update CF_ItemDef
set ShowCGUpdate=1
where ShowCGUpdate is null
go

update CF_ItemDef
set ShowCGDetails=1
where ShowCGDetails is null
go

update CF_ItemDef
set ExecuteLookupOnLoad=1
where ExecuteLookupOnLoad is null
go

update cf_itemdef
set VersionNumber = 1
where VersionNumber is null
go

update CF_MapStatements
set execute_event='Submit'
where execute_event is null and execute_on_approve=0
go

UPDATE CF_PARAMETERS
SET OrderNum=0
WHERE OrderNum is NULL
GO

update CF_PortletForms set TabOrientation=0 where TabOrientation is null
GO

update CF_PortletForms set FormType=0 where FormType is null
GO

update CF_StoredProcedures
set ExecuteEvent='Submit'
where ExecuteEvent is null
and ExecuteOnApprove=0
go

update cf_submissions
set [status]=1
where status is null
GO

insert into CF_WF_DataPointMapping
select NEWID(), i.FormID, e.TargetItemID, null, 1 
from CF_EventRules e
join CF_ItemDef i on e.ItemID=i.ID
where e.[Action]=6 and TargetItemID is not null

update CF_EventRules
set TargetItemID=null
where [Action]=6 and TargetItemID is not null
go


alter table CF_FormItemOption
alter column Settings text null
go

if not exists(select * from CF_Validations where Name='EmailAddress')
begin
	insert into CF_Validations (ValidationID, Name, RegEx, ValidationMsg) values (NewID(), 'EmailAddress', '/^[A-z\_\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/', 'Please enter a valid email address.')
end
go

update cf_validations
set RegEx='/^[A-z\_\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/'
where Name='EmailAddress' and RegEx='/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/'
go

if not exists(select * from CF_Validations where Name='Integer')
begin
	insert into CF_Validations (ValidationID, Name, RegEx, ValidationMsg) values (NEWID(), 'Integer', '/^\d+$/', 'Please enter a valid integer.')
end
go

update cf_validations
set RegEx='/^\d+$/'
where Name='Integer' and RegEx='/^\d$/'
go

if not exists(select * from CF_Validations where Name='Money')
begin
	insert into CF_Validations (ValidationID, Name, RegEx, ValidationMsg) values (NEWID(), 'Money', '/^([0-9,\s]*\.?[0-9]{0,2})$/','Please enter a valid amount.')
end
go

if not exists(select * from CF_Validations where Name='PhoneNumber')
begin
	insert into CF_Validations (ValidationID, Name, RegEx, ValidationMsg) values (NEWID(), 'PhoneNumber', '/^(\+\d)*\s*(\(\d{3}\)\s*)*\d{3}(-{0,1}|\s{0,1})\d{2}(-{0,1}|\s{0,1})\d{2}$/',' Please enter a valid phone number.')
end
go

if not exists(select * from CF_Validations where Name='SSN')
begin
insert into CF_Validations (ValidationID, Name, RegEx, ValidationMsg) values (NEWID(), 'SSN', '/^\d{3}-\d{2}-\d{4}$/', 'Please enter a valid SSN.')
end
go

if not exists(select * from CF_Validations where Name='ZipCode')
begin
	insert into CF_Validations (ValidationID, Name, RegEx, ValidationMsg) values (NEWID(), 'ZipCode','/^\d{5}(-\d{4})?$/', 'Please enter a valid zip code.')
end
go

update CF_VALIDATIONS
set Regex='/^\d{5}(?:[-\s]\d{4})?$/'
where Regex='/^\d{5}(-\d{4})?$/' and Name='ZipCode'
go

declare @val as char(1) = 'Y'
if exists(select * from FWK_VersionInfo where ApplicationName='jics' and VersionNumber like '7.%')
begin
	set @val = 'N'
end
if not exists (select * from fwk_configsettings where category='ContainedForm' and [Key] = 'jQueryUI8')
begin
	insert into FWK_ConfigSettings (ID, Category, [Key], Value, DefaultValue)
		values(NEWID(), 'ContainedForm', 'jQueryUI8', @val, 'Y')
end
else
begin
	update FWK_ConfigSettings
	set Value=@val, DefaultValue='Y'
	where Category='ContainedForm' and [key]='jQueryUI8'
end
go

if exists(select * from FWK_ConfigSettings where [Key]='ERPType' and Value='EX')
begin
	declare @id as uniqueidentifier = (select top 1 databaseid from CF_Databases where name='EX')
	update CF_MapStatements
	set database_id=@id
	where database_id is null

	update CF_StoredProcedures
	set DataBaseID=@id
	where databaseid is null
end
go

if not exists(select * from fwk_htmlheadelement where htmlheadelementid='D274D213-8BBD-4234-AB38-E167A42EBE27')
begin
  insert into FWK_HtmlHeadElement(HtmlHeadElementID, HtmlHeadElementCategoryID, Name, ElementContent, IsRequired, IsCustomRequired, ElementOrder)
  values ('D274D213-8BBD-4234-AB38-E167A42EBE27', '4DB3CF3A-F405-4C71-93F7-EDD3628EC40B', 'Contained Form Styles', '<link rel="stylesheet" type="text/css" href="Portlets/CUS/ICS/Jenzabar.ContainedForm/Styles/ContainedFormStyles.css" />', 1, 0, 1)
end
go
if not exists(select * from fwk_htmlheadelement where htmlheadelementid='3D1B6B32-70C6-40D8-AA11-681ED540BA52')
begin
  insert into FWK_HtmlHeadElement(HtmlHeadElementID, HtmlHeadElementCategoryID, Name, ElementContent, IsRequired, IsCustomRequired, ElementOrder)
  values ('3D1B6B32-70C6-40D8-AA11-681ED540BA52', '4DB3CF3A-F405-4C71-93F7-EDD3628EC40B', 'Contained Form App Styles', '<link rel="stylesheet" type="text/css" href="Portlets/CUS/ICS/Jenzabar.ContainedForm/Styles/jcf-app-ui.css" />', 1, 0, 2)
end
go

--Replace Listbox with Collection Grid
select i.ID, i.FormID, i.TabID, i.Text, i.RowNum, i.ColumnNum, i.IsActive, i.QuestionNum, NEWID() as ButtonID
into #cf_cg_convert
from CF_ItemDef i
where i.Type=6

update cf_itemdef
set type=15
from cf_itemdef i
join #cf_cg_convert c on i.id=c.id

insert into CF_ItemDef (ID, FormID, TabID, IsActive, GridFunction, GridID, Text, RowNum, ColumnNum, QuestionNum, Type)
select NEWID(), FormID, TabID, IsActive, 1, ID, Text, RowNum-1, ColumnNum, QuestionNum, 1
from #cf_cg_convert

insert into CF_ItemDef (ID, FormID, TabID, IsActive, GridFunction, GridID, Text, RowNum, ColumnNum, QuestionNum, Type)
select ButtonID, FormID, TabID, IsActive, 3, ID, 'Add', RowNum-1, ColumnNum+1, QuestionNum, 12
from #cf_cg_convert

insert into CF_EventRules (ItemID, RuleID, OrderNum, Action, Value, Conjunction)
select ButtonID, NEWID(), 0, 14, '*', 0
from #cf_cg_convert

drop table #cf_cg_convert
go

update CF_EventRules
set Action = 'usePaymentProfile'
where Action = '0'
GO
update CF_EventRules
set Action = 'clearPaymentProfile'
where Action = '1'
GO
update CF_EventRules
set Action = 'showQuestionGroup'
where Action = '2'
GO
update CF_EventRules
set Action = 'hideQuestionGroup'
where Action = '3'
GO
update CF_EventRules
set Action = 'makeGroupRequired'
where Action = '4'
GO
update CF_EventRules
set Action = 'makeGroupNotRequired'
where Action = '5'
GO
update CF_EventRules
set Action = 'useApprovalTrack'
where Action = '6'
GO
update CF_EventRules
set Action = 'sendEmail'
where Action = '7'
GO
update CF_EventRules
set Action = 'showMessage'
where Action = '8'
GO
update CF_EventRules
set Action = 'submitForm'
where Action = '9'
GO
update CF_EventRules
set Action = 'clearForm'
where Action = '11'
GO
update CF_EventRules
set Action = 'setQuestionsDataSource'
where Action = '10'
GO
update CF_EventRules
set Action = 'overrideBalance'
where Action = '12'
GO
update CF_EventRules
set Action = 'changeTab'
where Action = '13'
GO
update CF_EventRules
set Action = 'addToGrid'
where Action = '14'
GO
update CF_EventRules
set Action = 'saveForm'
where Action = '15'
GO
update CF_EventRules
set Action = 'printForm'
where Action = '16'
GO
update CF_EventRules
set Action = 'showTab'
where Action = '17'
GO
update CF_EventRules
set Action = 'hideTab'
where Action = '18'
GO
update CF_EventRules
set Action = 'toggleQuestionGroup'
where Action = '19'
GO
update CF_EventRules
set Action = 'cancelEmail'
where Action = '20'
GO
update CF_EventRules
set Action = 'updateProgress'
where Action = '21'
GO

declare @groupId as uniqueidentifier = (select PageTypeGroupID from FWK_PageTypeGroup where GlobalizationKeyRoot='MSG_PAGE_TYPE_GROUP_GENERAL_PURPOSE')
update FWK_PageType
set PageTypeGroupID = @groupId
where GlobalizationKeyRoot = 'MSG_PORTLET_TYPE_JENZABAR_CONTAINED_FORM'
go
if not exists (select * from FWK_PortletTemplate where PortletTemplateID = '7E776EB6-F3D2-46E5-AD15-257E6E88E89F')
	insert into FWK_PortletTemplate values('7E776EB6-F3D2-46E5-AD15-257E6E88E89F')
go
if exists (select * from FWK_PageType p where p.PortletTemplateID = '7E776EB6-F3D2-46E5-AD15-257E6E88E89F')
	update FWK_PageType set PageTypeGroupID = '0C12A773-DD2A-45E6-B86D-25840EFD6B81', CssClass = 'generalPurposeGroup', NameFormatKey = NULL
			where PortletTemplateID = '7E776EB6-F3D2-46E5-AD15-257E6E88E89F';
else
	insert into FWK_PageType values (NEWID(), '7E776EB6-F3D2-46E5-AD15-257E6E88E89F', '0C12A773-DD2A-45E6-B86D-25840EFD6B81',
			'MSG_PORTLET_TYPE_JENZABAR_CONTAINED_FORM', 1, 0, 0, 0, 0, 'generalPurposeGroup', NULL);
go

update CF_DataSources
set Query = 'select seChild.AppId,
				rtrim(seChild.ScheduledTitle) + '' ('' + FORMAT(ct.StartDate, ''MM/dd/yy h:mm tt'') + '', '' + f.AbbreviatedName + '')'' as subevent
		  from ScheduledEvent seChild 
					   join ScheduledEventDetails sed on seChild.AppID = sed.AppID 
					   join ScheduledEventRelationship ser on seChild.AppID = ser.ChildScheduledEventAppID
					   join ScheduledEvent seParent on ser.ParentScheduledEventAppID = seParent.AppID
							    join ScheduledEventEventGroup seg on seChild.AppID = seg.ScheduledEventAppID
							    join EventGroup eg on seg.AppID = eg.AppID
							    join EventGroupTimeslot egt on eg.AppID = egt.EventGroupAppID
							    join CalendarTimeslot ct on egt.CalendarTimeSlotAppID = ct.AppID
							    join EventGroupTimeslot facilityegt on ct.AppID = facilityegt.CalendarTimeSlotAppID
							    join EventGroup facilityeg on facilityegt.EventGroupAppID = facilityeg.AppID
									  join ScheduledEventFacility seFacility on seFacility.ScheduledEventAppID = seChild.AppID
							    join Facility f on seFacility.FacilityAppID = f.AppID
		  where seChild.ScheduledEventCategoryAppID = -3 
						  and seParent.ScheduledAbbreviatedTitle = ##ScheduledAbbreviatedTitle
						  and sed.EventRegRequiredDefAppID in (-4, -2)
		  and seChild.ScheduledEventStatusAppID = -7
		  order by ct.StartDate'
where TagName = 'JZB - Sub-event List'
go