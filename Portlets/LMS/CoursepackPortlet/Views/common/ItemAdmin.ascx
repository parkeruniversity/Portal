<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ItemAdmin.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CoursepackPortlet.Views.common.ItemAdmin" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

	<table cellpadding="0px" cellspacing="0px" style="white-space:nowrap;">
		<tr>
			<td style="vertical-align:top; padding-top:4px; padding-left:10px;">
				<h1>[G]COURSEPACK__INTEGRATE_INTO[/G]</h1>
				<!-- IE inserts a line break or some other maring/padding here -->
				<span style="display:none;">
					<img id="IMGhelp" runat="server" alt="" src="" />
					<a href="javascript:" style="font-size:75%;">[G]COURSEPACK__INFORMATION_ABOUT_PROCESS[/G]</a>
				</span>
				<div style="padding-left:20px;">
					<table cellpadding="2px" cellspacing="0px" style="width:100%;">
						<tr>
							<td valign="top" class="CCI__ItemAdmin_devider">
								<img id="$this.IMG_select_refresh" alt="refresh export drop-downs" src="UI/Common/Images/AJAXImages/R01a.png" style="cursor:pointer;" />
							</td>
							<td>
								<table cellpadding="3px" cellspacing="0px">
									<colgroup>
										<col style="width:60px;" />
									</colgroup>
									<tbody>
										<tr>
											<td style="text-align:right;">Page:</td>
											<td>
												<select id ="$this.SEL_page" style="width:450px; font-size:75%;"></select>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">Portlet:</td>
											<td>
												<select id ="$this.SEL_portlet" style="width:450px; font-size:75%;"></select>
											</td>
										</tr>
										<tr id="$this.ItemAdmin.TTR_subder">
											<td style="text-align:right;">
												<span id="$this.SPN_subder"></span><span>:</span>
											</td>
											<td>
												<select id ="$this.SEL_subder" style="width:450px; font-size:75%;"></select>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td valign="middle" style="padding-left:50px">
								<input id="$this.BTN_export" type="button" value="[G]COURSEPACK__PROCESS[/G]" style="width:120px;" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>