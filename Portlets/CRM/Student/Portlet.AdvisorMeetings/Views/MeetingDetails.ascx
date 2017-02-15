<%@ Control Language="c#" AutoEventWireup="True" Codebehind="MeetingDetails.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AdvisorMeetingsPortlet.MeetingDetails" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.CRM.Student.Web.Portlets.AdvisorMeetingsPortlet" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<input type="hidden" value="0" name="isChanged"/> <input type="hidden" value="0" id="nameChangeFlag" name="nameChanged" runat="server"/>
<script type="text/javascript" language="JavaScript">	
</script>
<asp:PlaceHolder id="plhJavaScript" runat="server"></asp:PlaceHolder>
<div class="pSection" id="divError" visible="False" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<h4><asp:label id="lblUserName" Runat="server" Font-Bold="True" Visible="true"></asp:label></h4>
<div class="psection" id="divMain" visible="true" runat="server">
	<TABLE id="tblAdvisorMeetMain" cellSpacing="1" cellPadding="1" width="99%">
		<TBODY>
			<tr>
				<td colSpan="2">&nbsp;</td>
			</tr>
			<TR>
				<TD width="15%"><asp:label id="lblName" runat="server" Font-Bold="True"></asp:label></TD>
				<TD align="left"><asp:dropdownlist id="ddlName" runat="server" AutoPostBack="True" onselectedindexchanged="ddlName_SelectedIndexChanged"></asp:dropdownlist><asp:label id="lblNameData" runat="server" Visible="False"></asp:label></TD>
			</TR>
			<TR>
				<TD vAlign="top" align="left" width="10%"><asp:label id="lblMeetDate" runat="server" Font-Bold="True"></asp:label></TD>
				<td align="left"><jenzabar:datepicker id="dpMeetDate" runat="server" TimeDisplayFormat="Short"></jenzabar:datepicker>
				<asp:label id="lblDateData" runat="server" Visible="False"></asp:label>
				<asp:Label ID="lblDateError" runat="server" Visible="false" CssClass="PortletError" />
				</td>
			</TR>
			<TR>
				<TD width="15%"><asp:label id="lblDesc" runat="server" Font-Bold="True"></asp:label></TD>
				<TD align="left"><asp:dropdownlist id="ddlDesc" runat="server"></asp:dropdownlist><asp:label id="lblDescData" runat="server" Visible="False"></asp:label></TD>
			</TR>
			<TR>
				<TD width="15%"><asp:label id="lblStatus" runat="server" Font-Bold="True"></asp:label></TD>
				<TD align="left"><asp:dropdownlist id="ddlStatus" runat="server"></asp:dropdownlist><asp:label id="lblStatusData" runat="server" Visible="False"></asp:label></TD>
			</TR>
			<TR>
				<TD width="15%"><asp:label id="lblPurpose" runat="server" Font-Bold="True"></asp:label></TD>
				<TD align="left"><asp:textbox id="txtPurpose" runat="server" Width="368px"></asp:textbox><asp:label id="lblPurposeData" runat="server" Visible="False"></asp:label></TD>
			</TR>
			<TR>
				<TD width="15%"><asp:label id="lblNotes" runat="server" Font-Bold="True"></asp:label></TD>
				<TD align="left"><asp:textbox id="txtNotes" runat="server" Visible="False" Width="384px" TextMode="MultiLine"
						Height="68px"></asp:textbox><asp:label id="lblNotesData" runat="server" Visible="False"></asp:label></TD>
			</TR>
			<tr>
				<td align="left" colSpan="3" width='99%'><cmn:Hint id="hntNotesMaxChar" runat="server" />
				</td>
			</tr>
			<TR>
				<TD colSpan="3" height="20">&nbsp;</TD>
			</TR>
			<TR>
				<TD colSpan="3" height="23"><asp:linkbutton id="lnkSendNoficationToStudent" Runat="server"></asp:linkbutton>&nbsp; 
					&nbsp;
					<asp:linkbutton id="lnkSendNotificationToAdvisor" runat="server" Visible="False"></asp:linkbutton><asp:label id="lblEMailWarning" CssClass="PortletError" Runat="server" Visible="False"></asp:label></TD>
			</TR>
			<TR>
				<TD colSpan="3"><asp:hyperlink id="hlnkStudentNotify" runat="server" Visible="False"></asp:hyperlink></TD>
			</TR>
			<TR>
				<TD colSpan="3">
					<TABLE id="Table1" cellSpacing="2" cellPadding="1" width="300">
						<TR>
							<TD><asp:button id="btnSave" runat="server" Width="175px" onclick="btnSave_Click"></asp:button></TD>
							<TD><asp:button id="btnSaveAndSched" runat="server" Width="175px" onclick="btnSaveAndSched_Click"></asp:button></TD>
							<TD><asp:button id="btnReset" runat="server" Width="175px" onclick="btnReset_Click"></asp:button></TD>
							<TD><asp:button id="btnCancel" runat="server" Width="175px" onclick="btnCancel_Click"></asp:button></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD colSpan="3">&nbsp;</TD>
			</TR>
			<TR>
				<TD colSpan="3"><asp:label id="lblMessage" runat="server" Visible="False"></asp:label></TD>
			</TR>
			<TR>
				<TD noWrap colSpan="3">
					<DIV class="scrollAll" id="divMeetings" style="BORDER-RIGHT: 2px; BORDER-TOP: 1px; DISPLAY: block; MARGIN: 1px; BORDER-LEFT: 0px; WIDTH: 99%; BORDER-BOTTOM: 0px; POSITION: relative; align: left"
						align="left" visible="false" runat="server"><cmn:groupedgrid id="ggdMeetings" runat="server" AllowSorting="True" RenderTableHeaders="True" DataKeyField="Meeting Key"
							width="100%">
							<TableHeaderTemplate>
								<table>
									<tr>
										<td colspan="10"><%#base.strGridHeader%></td>
									</tr>
								</table>
							</TableHeaderTemplate>
							<Columns>
								<cmn:GlobalizedTemplateColumn SortExpression="Date/Time" HeaderText="TXT_DATE_SLASH_TIME" HeaderTextKey="TXT_DATE_SLASH_TIME">
									<ItemStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem, AMMessages.COL_DATE_TIME)%>
									</ItemTemplate>
								</cmn:GlobalizedTemplateColumn>
								<cmn:GlobalizedTemplateColumn SortExpression="Description" HeaderText="TXT_DESCRIPTION" HeaderTextKey="TXT_DESCRIPTION">
									<ItemStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem, AMMessages.COL_DESC)%>
									</ItemTemplate>
								</cmn:GlobalizedTemplateColumn>
								<cmn:GlobalizedTemplateColumn SortExpression="Status" HeaderText="TXT_STATUS" HeaderTextKey="TXT_STATUS">
									<ItemStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
									<ItemTemplate>
										<%#DataBinder.Eval(Container.DataItem, AMMessages.COL_MEET_STATUS)%>
									</ItemTemplate>
								</cmn:GlobalizedTemplateColumn>
								<cmn:GlobalizedTemplateColumn Visible="true">
									<ItemTemplate>
										<asp:LinkButton ID="lnkDetails" OnClick="GetMeetingDetail" CommandName="GetMeetingDetail" CommandArgument='<%# DataBinder.Eval(Container.DataItem, AMMessages.COL_MEET_KEY)%>' Runat="server" Text = '<%#AMMessages.TXT_DETAILS %>' Visible="True">
										</asp:LinkButton>
									</ItemTemplate>
								</cmn:GlobalizedTemplateColumn>
							</Columns>
						</cmn:groupedgrid></DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
</div>
