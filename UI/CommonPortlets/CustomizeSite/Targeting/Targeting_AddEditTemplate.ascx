<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Targeting_AddEditTemplate.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Targeting_AddEditTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="TargetingControl" TagName="MessageForm" Src="MessageForm.ascx" %>
<div class="pSection">
	<common:SubHeader id="shAddEditHeader" runat="server" />
	<TargetingControl:MessageForm ID="tcMessageForm" Runat="server" />
</div>