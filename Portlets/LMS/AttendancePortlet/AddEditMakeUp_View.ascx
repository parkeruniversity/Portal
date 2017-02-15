<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditMakeUp_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.AddEditMakeUp_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div class="pSection">
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
					<asp:Label ID="lblMinutes" Runat="server" />
				</th>
				<td>
					<asp:TextBox ID="txtMin" runat="server" MaxLength="4" Columns="10"  />
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
