<%@ Register TagPrefix="cust" tagname="ConfirmYourAction" src="~/UI/CommonPortlets/CommonControls/ConfirmYourAction.ascx" %>
<%@ Register TagPrefix="cust" tagname="ContextAddEditPage" src="~/UI/CommonPortlets/CustomizeContext/ContextAddEditPage.ascx" %>
<%@ Register TagPrefix="cust" tagname="CustContextPages" src="~/UI/CommonPortlets/CustomizeContext/CustContextPages.ascx" %>
<%@ Register TagPrefix="cust" tagname="ReorderContextPages" src="~/UI/CommonPortlets/CustomizeContext/ReorderContextPages.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextPagesView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextPagesView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<div><cust:CustContextPages id="ctlCustContextPages" runat="server" Visible="True" /></div>
<div><cust:ContextAddEditPage id="ctlContextAddEditPage" runat="server" Visible="False" /></div>
<div><cust:ReorderContextPages id="ctlReorderContextPages" runat="server" Visible="False" /></div>
<div><cust:ConfirmYourAction id="ctlConfirmYourAction" runat="server" Visible="False" /></div>
