-- SQL for CRM Stu/Fac
IF EXISTS (SELECT ID FROM FWK_ConfigSettings
           WHERE ID = '476a23c5-4779-4fbe-9867-5c615fb085a0')
    UPDATE dbo.FWK_ConfigSettings SET Value= 'Y'
    WHERE ID = '476a23c5-4779-4fbe-9867-5c615fb085a0'
ELSE 
insert into dbo.FWK_ConfigSettings (ID,Category,[Key],[Value],DefaultValue) 
    VALUES ('476a23c5-4779-4fbe-9867-5c615fb085a0','SiteSettings','DisplayBookstoreTab','N','N')

if not exists (select * from FWK_Globalization where Text_Key = 'TXT_CS_CREDIT_TYPE')
	insert into FWK_Globalization values( 'TXT_CS_CREDIT_TYPE', 'En', 'Credit Type', null )
if not exists (select * from FWK_Globalization where Text_Key = 'TXT_CS_DIVISION')
	insert into FWK_Globalization values( 'TXT_CS_DIVISION', 'En', 'Division', null )
if not exists (select * from FWK_Globalization where Text_Key = 'TXT_CS_RESOLUTION_REPEAT')
	insert into FWK_Globalization values( 'TXT_CS_RESOLUTION_REPEAT', 'En', '<table border=0 cellspacing=1 cellpadding=1 align=left>{0}<tr><td colspan=2><i>If you''d like to add this course and drop the course(s) with a different section, click the "Swap" button (No courses will be dropped if this course cannot be added successfully). Otherwise, click the "Do Not Add" button.</i></td></tr></table>', null )