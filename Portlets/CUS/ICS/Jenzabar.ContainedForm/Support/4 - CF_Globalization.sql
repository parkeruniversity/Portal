if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_CG_UPDATE_BTN')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_CG_UPDATE_BTN', 'Update', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_CG_DETAIL_BTN')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_CG_DETAIL_BTN', 'Details', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_REQ_VIOLATION')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_REQ_VIOLATION', 'Please provide valid answers and answer all required questions.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_SAVE_SUCCESS')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_SAVE_SUCCESS', 'The form has been successfully saved.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_SUBMISSION_LIMIT_MET')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_SUBMISSION_LIMIT_MET', 'You have met the submission limit for this form.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_NO_PERMISSION')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_NO_PERMISSION', 'You do not have permission to this form.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_LINK_TO_FILE')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_LINK_TO_FILE', 'Link to File', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_LOGIN_BUTTON')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_LOGIN_BUTTON', 'View my forms', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_CREATE_LOGIN_BUTTON')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_CREATE_LOGIN_BUTTON', 'Don''t have a my forms login? Create one.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_STG_ACCESS_TYPE')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_STG_ACCESS_TYPE', 'Access Type', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_STG_ACCESS_TYPE_DESC')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_STG_ACCESS_TYPE_DESC', 'Allow JICS to manage permissions to forms in this portlet or allow external users to create credentials to be able to retrieve their forms.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ACCESS_TYPE_PUBLIC')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ACCESS_TYPE_PUBLIC', 'JICS Management (Default)', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ACCESS_TYPE_EXTERNAL')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ACCESS_TYPE_EXTERNAL', 'External Signup', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ACCESS_TYPE_EXTERNAL')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ACCESS_TYPE_EXTERNAL', 'External Signup', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_STG_LOGIN_INFO')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_STG_LOGIN_INFO', 'Login Instructions', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_STG_LOGIN_INFO_DESC')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_STG_LOGIN_INFO_DESC', 'Instructions to be displayed to the end user on the login page.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_EMAIL_ADDRESS')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_EMAIL_ADDRESS', 'My Forms Email', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_PASSWORD')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_PASSWORD', 'My Forms Access Code', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ACCOUNT_NOT_FOUND')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ACCOUNT_NOT_FOUND', 'A user account for that email address and password combination could not be found.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ACCOUNT_CREATED')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ACCOUNT_CREATED', 'Your temporary account has been created. You may login with the credentials you just created.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ACCOUNT_EXISTS')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ACCOUNT_EXISTS', 'A user account already exists with that email address.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ACCOUNT_LOGOUT_BUTTON')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ACCOUNT_LOGOUT_BUTTON', 'Log Out', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_PASSWORD_NOT_VALID')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_PASSWORD_NOT_VALID', 'The password entered is not in a valid format. It must be between {0} and {1} characters long.', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_CREATE_ACCOUNT_BUTTON')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_CREATE_ACCOUNT_BUTTON', 'Create my forms login', null)
end
go
if not exists(select * from FWK_Globalization where Text_Key='JCF_TXT_ALREADY_HAS_LOGIN')
begin
    insert into FWK_Globalization (Language_Code, Text_Key, Text_Value, Text_Custom_Value)
    values('en', 'JCF_TXT_ALREADY_HAS_LOGIN', 'Already have a form login?', null)
end
go

DECLARE @key VARCHAR(500) = 'JCF_TAB_DEFINITION';
DECLARE @value VARCHAR(500) = 'Definition';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TAB_SETTING';
DECLARE @value VARCHAR(500) = 'Settings';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TAB_OPTIONS';
DECLARE @value VARCHAR(500) = 'Options';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TAB_RULES';
DECLARE @value VARCHAR(500) = 'Rules';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TAB_LOOKUP';
DECLARE @value VARCHAR(500) = 'Look Up';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_UNIQUEID';
DECLARE @value VARCHAR(500) = 'Unique ID';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_TYPE';
DECLARE @value VARCHAR(500) = 'Type';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_TEXT';
DECLARE @value VARCHAR(500) = 'Text';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_TEXTPOS';
DECLARE @value VARCHAR(500) = 'Text Position';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_GROUP';
DECLARE @value VARCHAR(500) = 'Group';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_GRID';
DECLARE @value VARCHAR(500) = 'Grid';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_GRIDFUNCTION';
DECLARE @value VARCHAR(500) = 'Grid Function';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_ALIGNMENT';
DECLARE @value VARCHAR(500) = 'Alignment';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_WIDTH';
DECLARE @value VARCHAR(500) = 'Width';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_HEIGHT';
DECLARE @value VARCHAR(500) = 'Height';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_FONTSIZE';
DECLARE @value VARCHAR(500) = 'Font Size';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_REQUIRED';
DECLARE @value VARCHAR(500) = 'Required';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_READONLY';
DECLARE @value VARCHAR(500) = 'Read Only';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_SHOWINREPORT';
DECLARE @value VARCHAR(500) = 'Show Only in Report';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_HIDEONLOAD';
DECLARE @value VARCHAR(500) = 'Hide On Load (Legacy)';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_INCLUDEINREPORT';
DECLARE @value VARCHAR(500) = 'Include in Report Grid';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_OVERRIDEID';
DECLARE @value VARCHAR(500) = 'Use ID Number value to override Submitter''s ID';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_UPLOADFILE';
DECLARE @value VARCHAR(500) = 'Upload a File';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_ENTERIMAGEURL';
DECLARE @value VARCHAR(500) = 'OR Enter Image URL';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_FILENAMEFORMAT';
DECLARE @value VARCHAR(500) = 'File Name Format';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_ALLOWEDEXTENSIONS';
DECLARE @value VARCHAR(500) = 'Allowed Extensions';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_SEPARATEDBYCOMMA';
DECLARE @value VARCHAR(500) = 'Separated by comma (.docx, .pdf, etc)';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_COMPARETO';
DECLARE @value VARCHAR(500) = 'Compare To';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_CGFILEHEADER';
DECLARE @value VARCHAR(500) = 'Collection Grid File Header';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_DEFAULTVALUE';
DECLARE @value VARCHAR(500) = 'Default Value';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_ADDDOUBLEVALUE';
DECLARE @value VARCHAR(500) = 'Add Double Value to Final Balance';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_MULTIPLEBYDOUBLEVALUE';
DECLARE @value VARCHAR(500) = 'Multiply Balance by Double Value';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_WAIVERCODEDS';
DECLARE @value VARCHAR(500) = 'Waiver Code Datasource';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_MAPTOPAYMENT';
DECLARE @value VARCHAR(500) = 'Map to Payment Field';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_SELECTEDDATE';
DECLARE @value VARCHAR(500) = 'Selected Date';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_DATEFROMTAG';
DECLARE @value VARCHAR(500) = 'Date from Tag';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_DSIPLAYTIME';
DECLARE @value VARCHAR(500) = 'Display Time';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_MAXLENGTH';
DECLARE @value VARCHAR(500) = 'Max Length';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_VALIDATION';
DECLARE @value VARCHAR(500) = 'Validation';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_AUTOCOMPLETEDS';
DECLARE @value VARCHAR(500) = 'Auto Complete Datasource';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_ORIENTATION';
DECLARE @value VARCHAR(500) = 'Orientation';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_OPTIONS';
DECLARE @value VARCHAR(500) = 'Options';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_NO_ACCESS_FILE';
DECLARE @value VARCHAR(500) = 'You do not have permission to access this file. Please use the login link below to authenticate with the portal.';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_FILE_DOWNLOAD_BEGIN';
DECLARE @value VARCHAR(500) = 'Your file download should begin shortly. If the download does not begin automatically, please <a href="{0}" target="_blank">click here</a>.';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_CHOOSE_FILE';
DECLARE @value VARCHAR(500) = 'Choose a file';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_UPLOAD_FILE';
DECLARE @value VARCHAR(500) = 'Upload file';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_FILE_UPLOAD_SUCCESSFUL';
DECLARE @value VARCHAR(500) = '&nbsp;Upload successful';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_TXT_NO_FILE_SELECTED';
DECLARE @value VARCHAR(500) = 'No file selected';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO

DECLARE @key VARCHAR(500) = 'JCF_HNT_CONNECTION_STRINGS';
DECLARE @value VARCHAR(500) = 'Connection strings should be entered in the proper ODBC format. <a href="" target="_blank">Learn more</a>';
IF NOT EXISTS ( SELECT * FROM FWK_Globalization WHERE Text_Key = @key)
    BEGIN
        INSERT INTO FWK_Globalization (Text_Key, Language_Code, Text_Value, Text_Custom_Value)
        VALUES (@key, 'en', @value, NULL);
    END;
GO