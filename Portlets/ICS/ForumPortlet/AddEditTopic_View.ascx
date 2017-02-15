<%@ Import namespace="Jenzabar.ICS.Web.Portlets.ForumPortlet" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.Common" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditTopic_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.AddEditTopic_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<div class="pSection">
	<fieldset>
		<table>
			<TR>
				<TD>
					<TABLE align="left">
						<tr>
							<th>
								<asp:label id="lblName" Runat="Server"></asp:label></th>
							<td><asp:textbox id="txtName" Columns="40" MaxLength="250" runat="server"></asp:textbox>&nbsp;
								<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtName" /></td>
						</tr>
						<tr>
							<th>
								<asp:label id="lblDescriprion" Runat="Server"></asp:label></th>
							<td><jenzabar:textboxeditor id="txtDescription" MaxLength="2000"  runat="server" ></jenzabar:textboxeditor></td>
						</tr>
						<tr>
							<td></td>
							<td vAlign="top" align="right"><asp:label id="lblMaxChars" Runat="Server"></asp:label></td>
						</tr>
					</TABLE>
				</TD>
			</TR>
			<asp:placeholder id="ShowCategories" Runat="server">
				<TR>
					<TD>
						<TABLE>
							<TR>
								<TH>
									<asp:label id="lblCatagory" Runat="Server"></asp:label></TH>
								<TD>
									<asp:dropdownlist id="ddCategories" runat="server"></asp:dropdownlist></TD>
								<TD>&nbsp;
									<asp:ImageButton id="AddNewCategory" Runat="server" Visible="False" CommandName="AddCategory"></asp:ImageButton>&nbsp;
									<SECURED:SLINKBUTTON id="lnkAddCategory" runat="server" CausesValidation="False" IsSecured="True" AccessCheckType="Union"
										OperationNames="CanManageSets"></SECURED:SLINKBUTTON></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</asp:placeholder><asp:placeholder id="ShowPositions" Runat="server">
				<TR>
					<TD>
						<TABLE align="left">
							<TR>
								<TH>
									<asp:label id="lblListTopic" Runat="Server"></asp:label></TH>
								<TD>
									<asp:dropdownlist id="ddPositions" runat="server"></asp:dropdownlist></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</asp:placeholder>
			<tr height="10">
				<td></td>
			</tr>
			<tr>
				<td colSpan="2"><jenzabar:displayindicator id="ctlDisplayIndicator" runat="server" ShowTime="True"></jenzabar:displayindicator></td>
			</tr>
			<asp:placeholder id="phDeleteAfter" Runat="server">
				<TR>
					<TH>
						<asp:label id="lblDeleteThreadsAfter" Runat="Server"></asp:label></TH>
					<TD>
						<asp:dropdownlist id="ddDeleteAfter" runat="server"></asp:dropdownlist></TD>
				</TR>
			</asp:placeholder>
			<tr height="10">
				<td></td>
			</tr>
			<tr>
				<TD>
					<TABLE align="left">
						<tr>
							<th class="psTitleCell">
								<asp:label id="lblPermittedUsers" Runat="Server"></asp:label></th>
							<td class="psCell">
								<div><asp:label id="lblTopicInstrTitle" Runat="Server"></asp:label></div>
								<jenzabar:collapsiblepanel id="cpPermitPanel" runat="server" text="Selected Users">
									<DIV>
										<asp:label id="lblTopicInstr" Runat="Server"></asp:label></DIV>
									<DIV>
										<asp:label id="lblViewInstrHowever" Runat="Server"></asp:label></DIV>
									<BR>
									<div class="psCell"><framework:PrincipalSelector id="psPermitRoles" runat="server"></framework:PrincipalSelector></div>
								</jenzabar:collapsiblepanel></td>
						</tr>
						<tr height="10">
				            <th></th><td></td>
			            </tr>
			            <tr>
			                <th></th>
				            <td>
					            <TABLE align="center">
						            <tr>
							            <td><asp:button id="btnSave" Font-Size="x-small" runat="server" />&nbsp;
								            <asp:button id="btnCancel" Font-Size="x-small" runat="server" CausesValidation="False"></asp:button></td>
						            </tr>
					            </TABLE>
				            </td>
			            </tr>
					</TABLE>
				</TD>
			</tr>
		</table>
	</fieldset>
</div>
