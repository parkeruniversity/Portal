<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextSectionsView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextSectionsView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cust" tagname="ConfirmYourAction" src="~/UI/CommonPortlets/CommonControls/ConfirmYourAction.ascx" %>
<%@ Register TagPrefix="cust" tagname="ContextAddEditSection" src="~/UI/CommonPortlets/CustomizeContext/ContextAddEditSection.ascx" %>
<%@ Register TagPrefix="cust" tagname="CustContextSections" src="~/UI/CommonPortlets/CustomizeContext/CustContextSections.ascx" %>
<%@ Register TagPrefix="cust" tagname="ReorderContextSections" src="~/UI/CommonPortlets/CustomizeContext/ReorderContextSections.ascx" %>
<div><cust:CustContextSections id="ctlCustContextSections" runat="server" Visible="True" /></div>
<div><cust:ContextAddEditSection id="ctlContextAddEditSection" runat="server" Visible="False" /></div>
<div><cust:ConfirmYourAction id="ctlConfirmYourAction" runat="server" Visible="False" /></div>
<div><cust:ReorderContextSections id="ctlReorderContextSections" runat="server" Visible="False" /></div>
