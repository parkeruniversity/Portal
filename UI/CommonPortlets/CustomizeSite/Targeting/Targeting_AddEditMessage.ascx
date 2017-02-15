<%@ Register TagPrefix="TargetingControl" TagName="MessageForm" Src="MessageForm.ascx" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Targeting_AddEditMessage.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Targeting_AddEditMessage" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="pSection">
	<common:SubHeader id="shAddEditHeader" textKey="" runat="server" />
	<TargetingControl:MessageForm ID="tcMessageForm" Runat="server" />
</div>
