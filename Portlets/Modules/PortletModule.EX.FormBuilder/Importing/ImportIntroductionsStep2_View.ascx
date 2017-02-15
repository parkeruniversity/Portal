<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImportIntroductionsStep2_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Importing.ImportIntroductionsStep2_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i> <span id="spnFormName" runat="server" /></h4>
	</div>
	<div class="pSection">
		<cmn:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5><strong>
			<cmn:GlobalizedLiteral Runat="server" TextKey="FB_VIEW_FORM_INTRO" id="glBodyTitle" />
		</strong></h5>
		<p class="hint"><%=Globalizer.GetGlobalizedString("FB_INTRO_HINTCANNOTEDIT")%></p>
		<cmn:ComplexContentDisplay id="ccdCC" runat="server" />
		<br/>
		<cmn:GlobalizedButton id="btnImport" runat="server" TextKey="TXT_IMPORT" /> &nbsp; 
		<cmn:GlobalizedButton id="btnCancel" runat="server" TextKey="FB_IMPORT_CANCEL_TXT" />
	</div>
</div>