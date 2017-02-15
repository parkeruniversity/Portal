<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditReading_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ReadingPortlet.AddEditReading_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<script language="JavaScript" src='<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>'></script>
<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat="server" />
	<div><asp:ValidationSummary id="valSummary" runat="server"></asp:ValidationSummary></div>
	<fieldset>
		<table>
			<tr>
				<th>
					<cmn:formlabel id="lblLabel" runat="server" forcontrol="txtLabel"></cmn:formlabel>
				</th>
				<td><asp:textbox id="txtLabel" runat="server" Columns="35" MaxLength="75"></asp:textbox>&nbsp;
					<asp:requiredfieldvalidator id="vldLabel" runat="server" Text="*" ControlToValidate="txtLabel" Display="Dynamic"></asp:requiredfieldvalidator></td>
			</tr>
			<tr>
				<th>
					<cmn:formlabel id="lblAuthor" runat="server" forcontrol="txtAuthor"></cmn:formlabel>
				</th>
				<td><asp:textbox id="txtAuthor" runat="server" Columns="35" MaxLength="50"></asp:textbox>&nbsp;
					<asp:requiredfieldvalidator id="vldAuthor" runat="server" Text="*" ControlToValidate="txtAuthor" Display="Dynamic"></asp:requiredfieldvalidator></td>
			</tr>
			<tr>
				<th>
					<cmn:formlabel id="lblEdition" runat="server" forcontrol="txtEdition"></cmn:formlabel>
				</th>
				<td><asp:textbox id="txtEdition" runat="server" Columns="35" MaxLength="50"></asp:textbox>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" style="FONT-WEIGHT: bold"><cmn:FormLabel ID="lblURLDesc" runat="server" ForControl="txtURL"></cmn:FormLabel></td>
			</tr>
			<tr>
				<th>
				</th>
				<td>
					<table>
						<tr>
							<th>
								<cmn:formlabel id="lblURL" runat="server" forcontrol="txtURL"></cmn:formlabel>
							</th>
							<td><asp:textbox id="txtURL" runat="server" Columns="35" MaxLength="255"></asp:textbox>&nbsp;
								<asp:regularexpressionvalidator id="vldURL" runat="server" Text="*" ControlToValidate="txtURL" EnableClientScript="True"
									Display="Dynamic"></asp:regularexpressionvalidator>
							</td>
						</tr>
						<tr>
							<th>
								<cmn:formlabel id="lblURLLabel" runat="server" forcontrol="txtURLLabel"></cmn:formlabel>
							</th>
							<td><asp:textbox id="txtURLLabel" runat="server" Columns="35" MaxLength="255"></asp:textbox>&nbsp;</td>
						</tr>
					</table>
				</td>
			<tr>
				<th>
					<cmn:formlabel id="lblPages" runat="server" forcontrol="txtPages"></cmn:formlabel>
				</th>
				<td><asp:textbox id="txtPages" runat="server" Columns="35" MaxLength="50"></asp:textbox>&nbsp;</td>
			</tr>
			<tr>
				<th>
					<cmn:formlabel id="lblStatus" runat="server" forcontrol="ddStatus"></cmn:formlabel>
				</th>
				<td><asp:dropdownlist id="ddStatus" runat="server"></asp:dropdownlist>&nbsp;</td>
			</tr>
			<tr id="trSet" runat="server">
				<th>
					<cmn:formlabel id="lblSets" runat="server" forcontrol="ddSets" /></th>
				<td><asp:dropdownlist id="ddSets" runat="server"></asp:dropdownlist>
					&nbsp;
					<asp:PlaceHolder ID="plhAddSet" Runat="server">
<asp:ImageButton id="imbAddSet" runat="Server" CommandName="AddSet"></asp:ImageButton>&nbsp; 
<asp:LinkButton id="lnkAddSet" Runat="server" CommandName="AddSet" CausesValidation="False"></asp:LinkButton>
			</asp:PlaceHolder>
				</td>
			</tr>
			<tr>
				<th>
					<cmn:formlabel id="lblDescription" runat="server" forcontrol="txtDescription" /></th>
				<td><cmn:TextEditorControl id="txtDescription" MaxLength="2000" runat="server" /></td>
			</tr>
			<tr>
				<th>
				</th>
				<td><cmn:formlabel id="lblMaxChars" runat="server" forcontrol="txtDescription" /></td>
			</tr>
			<tr>
				<th>
				</th>
				<td><asp:button id="btnSave" runat="server" />&nbsp;
					<asp:button id="btnSaveAndAdd" runat="server" />&nbsp;
					<asp:button id="btnCancel" runat="server" CausesValidation="False" /></td>
			</tr>
		</table>
	</fieldset>
</div>