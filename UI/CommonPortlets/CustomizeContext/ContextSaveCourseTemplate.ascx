<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContextSaveCourseTemplate.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.ContextSaveCourseTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<cmn:SubHeader id="shSaveCourse" runat="server" />
<div class="pSection">
	<% = Globalizer.GetGlobalizedString("MSG_SAVE_TO_FC") %>
</div>
<div class="pActionsTransp">
	<cmn:GlobalizedButton ID="btnSave" TextKey="TXT_SAVE" Runat="server" />
	&nbsp;
	<cmn:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" Runat="server" />
</div>

