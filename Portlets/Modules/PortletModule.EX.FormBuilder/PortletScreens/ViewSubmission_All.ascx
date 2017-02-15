<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewSubmission_All.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.ViewSubmission_All" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<script language="javascript" type="text/javascript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.EX.FormBuilder/Importing/utils.js") %>"></script>
<script language="javascript" type="text/javascript">
function clearTxt(ele){
	if(ele.value == "<%=Globalizer.GetGlobalizedString("FB_SEARCH_SUBS_TXT")%>"){
		ele.value = "";
	}
}
</script>
<jenzabar:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
<h4><jenzabar:globalizedliteral id="litSetup" runat="server" /></h4>
<div class="FormBuilder">
	<div class="pSection">
		<div class="ErrorMsg" id="divErrMain" runat="server"><b><asp:Literal id="litErrMain" Runat="server" /></b></div>
		<b><asp:Literal ID="litFName" runat="server" /></b> (<a id="aBackToOView" runat="server" />)
		<br/><br/>
		<fieldset>
			<asp:TextBox ID="tbSearch" Runat="server" /> <jenzabar:GlobalizedButton ID="gbSearch" Runat="server" TextKey="FB_SEARCH_BUT_TXT" />
		</fieldset>
		<br/>
		<asp:Repeater ID="rptrSubs" Runat="server" OnItemDataBound="rptrSubs_ItemDataBound">
			<HeaderTemplate>
				<table class="GridStyle GridStyleFullWidth" cellpadding="2" cellspacing="0">
					<thead>
					<tr id="trSubmitted" runat="server">
						<td colspan="4"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions.gif" width="16" height="17" align="absmiddle" alt="<%=Globalizer.GetGlobalizedString("TXT_ALL_SUBMISSIONS")%>" /> <%=Globalizer.GetGlobalizedString("TXT_ALL_SUBMISSIONS")%></td>
					</tr>
					<tr id="trSfl" runat="server">
						<td colspan="4"><img src="UI/Common/Images/PortletImages/Icons/fb_icon_submissions_sfl.gif" width="16" height="17" align="absmiddle" alt="<%=Globalizer.GetGlobalizedString("TXT_ALL_DRAFTS")%>" /> <%=Globalizer.GetGlobalizedString("TXT_ALL_DRAFTS")%></td>
					</tr>
					</thead>
					<tr>
						<th><input onclick="doCheck(this.checked, 'cb', 'rptrSubs');" type="checkbox"></th>
						<th>Name</th>
						<th><%=Globalizer.GetGlobalizedString("TXT_STATUS")%></th>
						<th class="RightTableCell">Submitted</th>
					</tr>
			</HeaderTemplate>
			<ItemTemplate>
					<tr id="tr" runat="server">
						<td><asp:CheckBox ID="cb" Runat="server" /><asp:Label ID="lbSubID" Runat="server" Visible="False" /></td>
						<td><asp:Literal ID="litUName" Runat="server" /></td>
						<td><a id="aSingleIcon" runat="server"><img id="imgIcon" runat="server" width="16" height="17" align="middle" alt="Recent Submission" border="0" /></a> <asp:Literal ID="litPrefix" runat="server" /> <a id="aSingle" runat="server">Review</a></td>
						<td class="RightTableCell"><asp:Literal ID="litLastUpdated" runat="server" /></td>
					</tr>
			</ItemTemplate>
			<FooterTemplate>
				</table>
			</FooterTemplate>
		</asp:Repeater>
		<jenzabar:GlobalizedButton ID="gbDelete" Runat="server" OnClick="ProcessDelete" />
		<br /><br />
		<img id="imgPrint" runat="server" width="14" height="17" align="absmiddle" alt="Print All Submissions" border="0" /> <a id="aPrint" runat="server">Print All Submissions</a>
		<br /><br />
		<a id="aBackToMain" runat="server" />
		<br /><br />
		<table width="100%" id="tblPaging" runat="server">
			<tr>
				<td width="15%"><asp:Literal ID="litPrevPage" Runat="server" /></td>
				<td width="70%" align="center"><asp:Literal ID="litPageLinks" Runat="server" /></td>
				<td width="15%" align="right"><asp:Literal ID="litNextPage" Runat="server" /></td>
			</tr>
		</table>		
	</div>
</div>