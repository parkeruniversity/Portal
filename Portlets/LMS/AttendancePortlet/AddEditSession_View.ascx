<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditSession_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.AddEditSession_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<script language="JavaScript" type="text/javascript" src="<%=ResolveUrl("~/UI/Common/Scripts/jenz.js")%>"></script>
<div class="pSection">
	<asp:Label ID="lblError" Runat="server" Visible="False" ForeColor="Red" />
	<fieldset>
		<table>
			<tr>
				<th>
					<common:GlobalizedLabel ID="lblStart" TextKey="LBL_START" Runat="server" />
				</th>
				<td>
					<common:DatePicker ID="dpStart" runat="server" TimeDisplayFormat="Short" />
				</td>
			</tr>
			<tr>
				<th>
					<common:GlobalizedLabel ID="lblEnd" TextKey="LBL_END" Runat="server" />
				</th>
				<td>
					<common:DatePicker ID="dpEnd" runat="server" TimeDisplayFormat="Short" />
				</td>
			</tr>
			<tr>
				<th>
					<common:GlobalizedLabel ID="lblMinutes" TextKey="LBL_MINUTES" Runat="server" />
				</th>
				<td>
					<asp:TextBox ID="txtMin" runat="server" MaxLength="4" Columns="10"  />
					<br />
					<common:Hint id="hntMinutes" runat="server" TextKey="MSG_ADD_SESSION_TOTAL_MINUTES" />
				</td>
			</tr>
			<tr>
				<th>
					<common:GlobalizedLabel ID="lblNote" TextKey="LBL_NOTE" Runat="server" />
				</th>
				<td>
					<common:TextBoxEditor ID="txtNote" MaxLength="1000" Runat="server" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<common:GlobalizedButton ID="btnSave" TextKey="TXT_SAVE" Runat="server" />
					<common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" Runat="server" />
				</td>
			</tr>
		</table>
	</fieldset>
</div>
