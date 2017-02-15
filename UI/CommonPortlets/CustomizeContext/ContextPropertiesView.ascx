<%@ Register TagPrefix="cust" tagname="CustContextProperties" src="~/UI/CommonPortlets/CustomizeContext/CustContextProperties.ascx" %>
<%@ Register TagPrefix="cust" tagname="ContextImportCourseTemplate" src="~/UI/CommonPortlets/CustomizeContext/ContextImportCourseTemplate.ascx" %>
<%@ Register TagPrefix="cust" tagname="ContextSaveCourseTemplate" src="~/UI/CommonPortlets/CustomizeContext/ContextSaveCourseTemplate.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextPropertiesView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextPropertiesView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div><cust:CustContextProperties id="ctlCustContextProperties" runat="server" Visible="True" /></div>
<div><cust:ContextImportCourseTemplate id="ctlContextImport" runat="server" Visible="false" /></div>
<div><cust:ContextSaveCourseTemplate id="ctlContextSave" runat="server" Visible="false" /></div>