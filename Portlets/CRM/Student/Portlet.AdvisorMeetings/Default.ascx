<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.CRM.Student.Web.Portlets.AdvisorMeetingsPortlet" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="fwk" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AdvisorMeetingsPortlet.Default"%>
<input type="hidden" value="0" name="isChanged"/>
<script type="text/javascript" language="JavaScript">	

</script>
<div class="pSection" id="divError" visible="False" runat="server"><cmn:errordisplay id="ctlError" RunAt="server"></cmn:errordisplay></div>
<div class="pSection" id="divWarning" visible="False" runat="server"><asp:label id="lblWarning" CssClass="PortletError" Runat="server"></asp:label></div>
<div id="divUserName" visible="False" runat="server"><h4><asp:label id="lblUserName" Runat="server" Visible="true" Font-Bold="True"></asp:label></h4>
</div>
<div class="psection" id="divMain" visible="true" runat="server" style="HEIGHT:auto">
	<TABLE id="tblAdvMeetDefMain" cellSpacing="2" cellPadding="2" width="99%">
		<TR>
			<TD colSpan="2"><asp:label id="lblInstructions" runat="server"></asp:label></TD>
		</TR>
		<TR>
			<TD colSpan="2">
				<div id="divYesNo" style="BORDER-RIGHT: 2px; BORDER-TOP: 1px; DISPLAY: block; MARGIN: 1px; BORDER-LEFT: 0px; WIDTH: 95%; BORDER-BOTTOM: 0px; HEIGHT: 50px; align: left"
					visible="False" runat="server">
					<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="50%" border="0">
						<TR>
							<TD><asp:button id="btnYes" runat="server" Width="110px"></asp:button></TD>
							<TD><asp:button id="btnNo" runat="server" Width="110px"></asp:button></TD>
						</TR>
					</TABLE>
				</div>
			</TD>
		</TR>
		<TR>
			<TD colSpan="2">
				<div id="divStartDate" visible="false" runat="server">
					<table width="100%">
						<tr>
							<td width="12%"><asp:label id="lblStartDate" runat="server" Font-Bold="True"></asp:label></td>
							<td align="left"><cmn:datepicker id="dpStartDate" runat="server"></cmn:datepicker></td>
						</tr>
					</table>
				</div>
			</TD>
		</TR>
		<TR>
			<TD colSpan="2">
				<div id="divEndDate" visible="false" runat="server">
					<table width="100%">
						<tr>
							<td width="12%"><asp:label id="lblEndDate" runat="server" Font-Bold="True"></asp:label></td>
							<td align="left"><cmn:datepicker id="dpEndDate" runat="server"></cmn:datepicker></td>
						</tr>
					</table>
				</div>
			</TD>
		</TR>
		<TR>
			<TD colSpan="2"><asp:button id="btnDisplay" runat="server" Visible="False"></asp:button></TD>
		</TR>
		<TR>
			<TD></TD>
		</TR>
		<TR>
			<TD>
				<div class="psection" id="divMessage" visible="false" runat="server"><asp:label id="lblMessage" CssClass="PortletError" Runat="server"></asp:label></div>
			</TD>
		</TR>
		<TR>
			<TD colSpan="2">
				<TABLE id="tblAddDelete" cellSpacing="2" cellPadding="2" width="99%">
					<TR>
						<TD colSpan="2">
							<DIV class="scrollAll" id="divMeetings" style="BORDER-RIGHT: 0px; BORDER-TOP: 1px; DISPLAY: block; OVERFLOW: auto; BORDER-LEFT: 0px; WIDTH: auto; BORDER-BOTTOM: 0px; POSITION: relative; HEIGHT: auto; align: left"
								align="left" runat="server" visible="false">
								<cmn:groupedgrid id="ggdMeetings" runat="server" DataKeyField="Meeting Key" RenderTableHeaders="True"
									AllowSorting="True" width="100%">
									<TableHeaderTemplate>
										<table>
											<tr>
												<td colspan="10"><%#base.strGridHeader%></td>
											</tr>
										</table>
									</TableHeaderTemplate>
									<Columns>
										<cmn:GlobalizedTemplateColumn HeaderTextKey="" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:CheckBox ID="chkDelete" Visible="True" Runat="server"></asp:CheckBox>
											</ItemTemplate>
										</cmn:GlobalizedTemplateColumn>
										<cmn:GlobalizedTemplateColumn SortExpression="Name" HeaderText="TXT_NAME" HeaderTextKey="TXT_NAME">
											<ItemStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											<ItemTemplate>
												<fwk:myinfopopup id="NamePopup" NameFormat="LastNameFirst" runat="server" ERPDisplayName='<%# DataBinder.Eval(Container.DataItem, AMMessages.COL_NAME)%>' User='<%# PortalUser.FindByHostID(DataBinder.Eval(Container.DataItem, AMMessages.COL_ID).ToString()) %>'>
												</fwk:myinfopopup>
											</ItemTemplate>
										</cmn:GlobalizedTemplateColumn>
										<cmn:GlobalizedTemplateColumn SortExpression="Name" HeaderText="TXT_NAME" HeaderTextKey="TXT_NAME">
											<ItemStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											<ItemTemplate>
												<%#DataBinder.Eval(Container.DataItem, AMMessages.COL_NAME)%>
											</ItemTemplate>
										</cmn:GlobalizedTemplateColumn>
										<cmn:GlobalizedTemplateColumn visible="false">
											<ItemStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
											<ItemTemplate>
												<%#DataBinder.Eval(Container.DataItem, AMMessages.COL_MEET_KEY)%>
											</ItemTemplate>
										</cmn:GlobalizedTemplateColumn>
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
											<ItemStyle></ItemStyle>
											<ItemTemplate>
												<asp:LinkButton ID="lnkDetails" OnClick="GetMeetingDetail" CommandName="GetMeetingDetail" CommandArgument='<%# DataBinder.Eval(Container.DataItem, AMMessages.COL_MEET_KEY)%>' Runat="server" Text = '<%#AMMessages.TXT_DETAILS %>' Visible="True">
												</asp:LinkButton>
											</ItemTemplate>
										</cmn:GlobalizedTemplateColumn>
									</Columns>
								</cmn:groupedgrid></DIV>
						</TD>
					</TR>
					<tr>
						<td colSpan="2"><asp:LinkButton ID="LnkMeetDetails" runat="server"></asp:LinkButton></td>
					</tr>
					<TR>
						<TD><asp:button id="btnAdd" runat="server" Width="110px"></asp:button></TD>
						<TD><asp:button id="btnDelete" runat="server"></asp:button></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
</div>
