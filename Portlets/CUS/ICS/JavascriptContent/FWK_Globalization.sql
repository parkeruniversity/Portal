DELETE FROM FWK_Globalization where Text_Key like 'CUS_JSCONTENT%'
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_PLAINTEXTTOP_TXT', 'En', 'Plain Text at Top')
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_PLAINTEXTTOP_DESC', 'En', 'You can put plain or HTML text here including &lt;embed&gt; or &lt;object&gt;, but not including &lt;script&gt; tags. (max 3000 char)')
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_SOURCE_TXT', 'En', 'Javascript Source')
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_SOURCE_DESC', 'En', 'Place here anything you would like to appear where XXX resides in this example: &lt;script type="text/javascript" src="XXX"&gt;&lt;/script&gt;. (max 3000 char)')
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_CODE_TXT', 'En', 'Javascript Code')
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_CODE_DESC', 'En', 'Place here anything you would like to appear where YYY resides in this example: &lt;script type="text/javascript"&gt;YYY&lt;/script&gt;. (max 3000 char)')
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_PLAINTEXTBOTTOM_TXT', 'En', 'Plain Text at Bottom')
;
INSERT INTO FWK_Globalization ([Text_Key], [Language_Code], [Text_Value])
	VALUES ('CUS_JSCONTENT_PLAINTEXTBOTTOM_DESC', 'En', 'Plain text like in the first Setting, only this text is inserted after both Javascript Source and Code content. (max 3000 char)')
;

