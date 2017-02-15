<%@ Control Language="c#" AutoEventWireup="false" Codebehind="RemoteContentAdmin_View.ascx.cs" Inherits="Jenzabar.Portal.Web.Applications.ICS.Portlets.CustomContentPortlet.RemoteContentAdmin_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="pSection">
	<common:globalizedLiteral runat="server" textKey="LBL_URL" ID="Globalizedliteral1" />
	<asp:TextBox ID="tbRemoteUrl" Runat="server" Width="65%" />
    <asp:RegularExpressionValidator ID="regexRemoteUrl" ControlToValidate="tbRemoteUrl" runat="server" ValidationExpression="^(ht|f)tp(s?)://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$" Text="Must use valid URL (http:// or https://) - 500 characters max" />
    <common:GlobalizedButton id="btnSave" TextKey="TXT_SAVE" runat="server" />
	<common:GlobalizedButton id="btnCancel" TextKey="TXT_CANCEL" runat="server" />	
</div>