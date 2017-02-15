<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CourseNeedsProgramRequirements.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.CourseNeedsPortlet.ProgramRequirements" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common"%>
<div id="divError" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<cmn:subheader id="hdrName" runat="server"></cmn:subheader>
<br>
<div class="pSection" id="divContents" runat="server">
	<cmn:Hint id="ltMessage" EnableViewState="true" Runat="server"></cmn:Hint><br>
	<table width="100%">
		<tr>
			<th width="5%" nowrap>
				<cmn:globalizedliteral id="litProgram" runat="server" TextKey="LBL_PROGRAM"></cmn:globalizedliteral></th>
			<td><asp:dropdownlist id="ddlProgram" DataValueField="Code" DataTextField="Description" AutoPostBack="True"
					Runat="server"></asp:dropdownlist></td>
		</tr>
	</table>
	<cmn:groupedgrid id="ggProgReq" runat="server" RenderTableHeaders="True">
		<Columns>
			<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_REQUIREMENT" ItemStyle-Wrap="False">
				<ItemTemplate>
					<asp:LinkButton ID="gglnkReqCode" CommandName="ReqCode" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "RequirementKey") + "|" + DataBinder.Eval(Container.DataItem, "RequirementCode")%>' Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "AimType").ToString().Trim()=="R" && DataBinder.Eval(Container.DataItem, "IsMet").ToString().Trim()!="Y"%>'>
						<%#DataBinder.Eval(Container.DataItem, "RequirementCode")%>
					</asp:LinkButton>
					<asp:Literal ID="gglitReqCode" Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "AimType").ToString().Trim()=="CT" || DataBinder.Eval(Container.DataItem, "IsMet").ToString().Trim()=="Y"%>' Text='<%#DataBinder.Eval(Container.DataItem, "RequirementCode")%>' />
				</ItemTemplate>
			</cmn:GlobalizedTemplateColumn>
			<cmn:GlobalizedBoundColumn DataField="Description" HeaderTextKey="TXT_DESCRIPTION" />
			<cmn:GlobalizedTemplateColumn HeaderTextKey="TXT_NEEDED" ItemStyle-Wrap="False">
				<ItemTemplate>
					<b><font color="#00AA00">
							<cmn:GlobalizedLiteral ID="litCreditNeeded" Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "IsMet").ToString().Trim()=="Y"%>' TextKey="TXT_ALL_REQUIREMENTS_MET" /></font></b>
					<asp:Literal ID="litReqMet" Runat="server" Visible='<%#DataBinder.Eval(Container.DataItem, "IsMet").ToString().Trim()!="Y"%>' Text='<%#DataBinder.Eval(Container.DataItem, "CreditNeeded")%>' />
				</ItemTemplate>
			</cmn:GlobalizedTemplateColumn>
			<cmn:GlobalizedBoundColumn DataField="CreditEarned" HeaderTextKey="TXT_EARNED" ItemStyle-Wrap="False" />
		</Columns>
	</cmn:groupedgrid><br>
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td noWrap width="35%"><cmn:globalizedliteral id="ltPDFLink" runat="server"></cmn:globalizedliteral></td>
			<td width="65%"><cmn:GlobalizedButton id="btnUpdate" TextKey="TXT_RECALC_STUDENT_PROGRESS" runat="server"></cmn:GlobalizedButton></td>
		</tr>
	</table>
</div>
