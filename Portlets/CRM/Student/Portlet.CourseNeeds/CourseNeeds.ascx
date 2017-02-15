<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseNeeds.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseNeedsPortlet.CourseNeedsView" %>
<cmn:errordisplay id="errDisplay" Runat="server"></cmn:errordisplay><br>
<div id="divMain" runat="server">
	<table width="100%">
		<tr>
			<td noWrap width="100%"><cmn:GlobalizedLinkButton id="glinkButtonClickHere" runat="server" TextKey="TXT_CLICK_HERE" />&nbsp;<asp:literal id="litClickToViewCNFor" Runat="server" /></td>
		</tr>
	</table>
</div>
