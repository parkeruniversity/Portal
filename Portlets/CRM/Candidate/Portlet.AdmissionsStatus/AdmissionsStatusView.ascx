<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdmissionsStatusView.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.AdmissionsStatusPortlet.AdmissionsStatusView" %>
<%@ Import Namespace="Jenzabar.CRM.Candidate.Web.Portlets.AdmissionsStatusPortlet" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<script language="javascript" type="text/javascript">function initIETOC(){};function resizeTheDiv(){}</script>
<div id="divError" class="pSection" runat="server" visible="false">
	<asp:label id="lblError" CssClass="PortletError" Runat="server"></asp:label>
</div>
<div id="divContent" class="pSection" runat="server" visible="false">
	<table width="100%">
		<tr>
			<th align="left">
				<asp:Label ID="lblCandName" Runat="server"></asp:Label>
			</th>
		</tr>
	</table>
	<cmn:subheader id="shProgramHeader" runat="server"></cmn:subheader>
	&nbsp;&nbsp;<asp:dropdownlist id="ddlProgram" Runat="server" AutoPostBack="True"></asp:dropdownlist>&nbsp;<asp:Label ID="lblProgram" Runat="server"></asp:Label>
	<cmn:subheader id="shFieldOfStudyHeader" runat="server"></cmn:subheader>
	<asp:datagrid id="gdgFieldOfStudy" AutoGenerateColumns="False" CellPadding="3" GridLines="None"
		ShowHeader="False" runat="server">
		<Columns>
			<asp:TemplateColumn>
				<ItemTemplate>
					&nbsp;&nbsp;
					<asp:Label CssClass="PortletItemTitle" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "column1" )%>'>
					</asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<Columns>
			<asp:TemplateColumn>
				<ItemTemplate>
					<asp:Label Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "column2" )%>' ID="Label1" NAME="Label1">
					</asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<Columns>
			<asp:TemplateColumn>
				<ItemTemplate>
					<asp:Label Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "column3" )%>' ID="Label2" NAME="Label2">
					</asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<Columns>
			<asp:TemplateColumn>
				<ItemTemplate>
					<asp:Label CssClass="PortletItemTitle" Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "column4" )%>' ID="Label3" NAME="Label3">
					</asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<Columns>
			<asp:TemplateColumn>
				<ItemTemplate>
					<asp:Label Runat="server" Text='<%# DataBinder.Eval( Container.DataItem, "column5" )%>' ID="Label4" NAME="Label4">
					</asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid>
	<cmn:subheader id="shStatusHeader" runat="server"></cmn:subheader>
	<asp:Table ID="tblStatusInfo" Visible="True" Width="100%" BorderStyle="None" Runat="server">
		<asp:TableRow ID="trStage" Visible="True" Runat="server">
			<asp:TableCell>
				&nbsp;&nbsp;<asp:label id="lblStageInfo" Runat="server"></asp:label>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow ID="trWaitlist" Visible="False" Runat="server">
			<asp:TableCell>
				&nbsp;&nbsp;<asp:label id="lblWaitlist" Runat="server"></asp:label>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow ID="trWaitlistRank" Visible="False" Runat="server">
			<asp:TableCell>
				&nbsp;&nbsp;<asp:label id="lblWaitlistRank" Runat="server"></asp:label>
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
	<cmn:subheader id="shContacts" runat="server"></cmn:subheader>
	<asp:Table ID="tblContactInfo" Visible="True" Width="100%" BorderStyle="None" Runat="server">
		<asp:TableRow ID="trOfficeLastContact" Visible="False" Runat="server">
			<asp:TableCell>
				&nbsp;&nbsp;<asp:label id="lblOfficeLastContact" Runat="server"></asp:label>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow ID="trCandidateLastContact" Visible="False" Runat="server">
			<asp:TableCell>
				&nbsp;&nbsp;<asp:label id="lblCandidateLastContact" Runat="server"></asp:label>
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
	<cmn:subheader id="shNextStep" runat="server"></cmn:subheader>
	<asp:Table ID="tblNextStep" Visible="True" Width="100%" BorderStyle="None" Runat="server">
		<asp:TableRow ID="trApplyForAdmissions" Visible="False" Runat="server">
			<asp:TableCell>
				&nbsp;&nbsp;<asp:LinkButton ID="lnkbApplyForAdmissions" Runat="server" Visible="false" /><a id="aFB2" runat="server" />
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow ID="trCompletionStatus" Visible="False" Runat="server">
			<asp:TableCell>
				&nbsp;&nbsp;<asp:label id="lblCompletionStatus" Runat="server"></asp:label>
			</asp:TableCell>
		</asp:TableRow>
		<asp:TableRow ID="trCounselorEmail" Visible="False" Runat="server">
			<asp:TableCell>&nbsp;&nbsp;<%=ASMessages.TXT_NEXT_STEP_COUNSELOR_EMAIL_1%>&nbsp;<asp:HyperLink ID="hlnkCouselorEmail" Runat="server"></asp:HyperLink>&nbsp;<%=ASMessages.TXT_NEXT_STEP_COUNSELOR_EMAIL_2%>
			</asp:TableCell>
		</asp:TableRow>
	</asp:Table>
</div>
<div id="divLinks" class="pSection" runat="server" visible="false">
	<table>
		<tr>
			<td><asp:linkbutton id="lnkFindCandidate" Runat="server"></asp:linkbutton></td>
		</tr>
		<tr>
			<td><asp:linkbutton id="lnkBack" Runat="server"></asp:linkbutton></td>
		</tr>
	</table>
</div>