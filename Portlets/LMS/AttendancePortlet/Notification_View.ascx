<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Notification_View.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AttendancePortlet.Notification_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.LMS" %>
<div class="pSection">
	<fieldset>
		<table width="100%">
			<tr>
				<td colspan="2">
					<h4 class="attNonDividingHeader"><common:GlobalizedLabel ID="lblAttMethod" Runat="server" TextKey="TXT_ATTENDANCE_METHOD" /><hr>
					</h4>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<common:GlobalizedRadioButton ID="radUseWhole" GroupName="Marking" TextKey="TXT_USE_WHOLE_SESSIONS" Runat="server" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<common:Hint id="hntWholeSessions" runat="server" TextKey="MSG_USE_WHOLE_SESSIONS" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<common:GlobalizedRadioButton ID="radUseHours" GroupName="Marking" TextKey="TXT_USE_HOURS" Runat="server" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<common:Hint id="hntHours" runat="server" TextKey="MSG_USE_HOURS" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<common:GlobalizedRadioButton ID="radUseMin" GroupName="Marking" TextKey="TXT_USE_MINUTES" Runat="server" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<common:Hint id="hntMinutes" runat="server" TextKey="MSG_USE_MINUTES" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h4 class="attNonDividingHeader"><common:GlobalizedLabel ID="lblNotif" Runat="server" TextKey="TXT_NOTIFICATION" /><hr>
					</h4>
				</td>
			</tr>
			<tr>
				<td align="right">
					<common:GlobalizedLabel ID="lblSendWarningAfter" TextKey="LBL_SEND_WARNING_AFTER" Runat="server" />
				</td>
				<td>
					<asp:TextBox ID="txtAfter" runat="server" MaxLength="2" Columns="2" />
					<asp:DropDownList ID="ddlAfter" Runat="server" onChange="checkConsecutive()" />
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td id="tdCons" runat="server">
					<asp:PlaceHolder ID="phConsecutive" Runat="server">
						<common:GlobalizedCheckBox id="chkConsecutive" TextKey="TXT_CONSECUTIVE" Runat="server"></common:GlobalizedCheckBox>
					</asp:PlaceHolder>
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="right">
					<common:GlobalizedLabel ID="lblSendWarningTo" TextKey="LBL_SEND_WARNING_TO" Runat="server" />
				</td>
				<td>
					<common:GlobalizedCheckBox ID="chkStudent" TextKey="TXT_STUDENT" Runat="server" />
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<common:GlobalizedCheckBox ID="chkFaculty" TextKey="TXT_FACULTY" Runat="server" />
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<common:GlobalizedCheckBox ID="chkOther" TextKey="LBL_OTHER" Runat="server" />
					<asp:TextBox ID="txtOther" Runat="server" MaxLength="200" Columns="60" />
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<common:Hint id="hntOther" runat="server" TextKey="MSG_MORE_THAN_ONE_ADDRESS" />
				</td>
			</tr>
			<tr>
				<th>
				</th>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="right">
					<common:GlobalizedLabel ID="lblResend" TextKey="LBL_RESEND_ALL_WARNINGS" Runat="server" />
				</td>
				<td>
					<common:GlobalizedButton ID="btnResend" TextKey="TXT_SEND" Runat="server" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td><common:Hint id="hntResend" runat="server" TextKey="MSG_RESEND_ALL_WARNINGS" /></td>
			</tr>
			<tr>
				<th>
				</th>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="right">
					<common:GlobalizedLabel ID="lblHighlight" TextKey="LBL_WARNING_HIGHLIGHT" Runat="server" />
				</td>
				<td>
					<common:GlobalizedCheckBox ID="chkHighlight" TextKey="MSG_WARNING_HIGHLIGHT_CHECKBOX" Runat="server" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td><common:Hint id="hntHighlight" runat="server" TextKey="MSG_WARNING_HIGHLIGHT" /></td>
			</tr>
			<tr>
				<th>
				</th>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<common:GlobalizedButton ID="btnSave" TextKey="TXT_SAVE" Runat="server" />
					<common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" Runat="server" />
				</td>
			</tr>
		</table>
	</fieldset>
</div>
<!-- Below is the massive amount of client-side scripting used on this screen. -->
<script>
	//Format values.
	var showConsecutive = <%=(int) AttendanceNotificationType.UnexcusedAbsences%>;

	//Show or hide a field.
	function setFieldVisibility (id, isVisible)
	{
		var obj = document.getElementById(id);
		if (obj != null)
		{
			obj.style.display = (isVisible ? '' : 'none');
		}
	}

	//Get the value of the selected item in a control.
	function getSelectedValue (id)
	{
		var obj = document.getElementById(id);
		return obj.options[obj.selectedIndex].value;
	}

	//Modify controls' visibility, based on current selected value of ddlAfter.
	function checkConsecutive()
	{
		
		var after = getSelectedValue('<%=ddlAfter.ClientID%>');
		
		setFieldVisibility ('<%=tdCons.ClientID%>', (after == showConsecutive));
		
	}
</script>
