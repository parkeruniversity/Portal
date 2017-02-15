<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Admin.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CoursepackPortlet.Views.Admin" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>


	<script type="text/javascript" src="Portlets/LMS/CoursepackPortlet/Views/Admin.js?ver=070710.1"></script>
	<script type="text/javascript">
		
		window.$this = new Jenzabar$LMS$Portlets$CoursepackPortlet$Views$Admin("$this", auto_generated_code_placeholder_variable);
			
	</script>

	<div id="$this.DIVmain" class="CCI__portlet_body">
		<table cellpadding="0px" cellspacing="0px" style="width:100%;">
			<tr>
				<td>
					<h4>[G]COURSEPACK__ADMIN_ALL_CONTENT[/G]</h4>
				</td>
			</tr>
			<tr>
				<td>
					<!--
					<input type="checkbox"/>
					<span>Select ALL</span>
					-->
					<div id="DIVcontent" runat="server" class="CCI__content_body"></div>
				</td>
			</tr>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" style="width: 100%;">
						<tr>
							<td>
								<span id="SPNcoursepack_specifics" runat="server" class="CCI__pack_info"></span>
							</td>
							<td style="text-align:left;">
								<!--
								<span>[G]COURSEPACK__STUDENT_VIEWABLE[/G]</span><input type="checkbox" />
								-->
							</td>
							<td style="text-align:right;">
								<div style="margin-right:20px;">
									<a id="LNK_delete" runat="server" onclick="preventDefaultEvent(event, $this.delete_coursepack());">[G]COURSEPACK__DELETE_COURSEPACK[/G]</a>
								</div>
							</td>
						</tr>
					</table>					
				</td>
			</tr>
			<tr>
				<td class="CCI__line_devider"></td>
			</tr>
			<tr>
				<td>
					<div id="DIVadmin" runat="server" style="margin-left:10px; margin-top:10px; margin-bottom:10px;"></div>
				</td>
			</tr>
		</table>
	</div>
	<!---->
	<div id="$this.DIV_export_dialog" class="DialogWindow_Body" style="display:none; width:300px; height:200px; padding:10px;">
		<table cellpadding="0px" ccellspacing="0px" height="100%" width="100%">
			<tr>
				<td align="center">
					Exporting selected content
					<br />
					<br />
					<div id="$this.DIV_export_dialog.ExportProgressBar" data-control_class="control:ProgressBar" class="CCI__progress_bar" style="width:200px; height:17px;"></div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="button" id="$this.DIV_export_dialog.BTN_cancel" value="Cancel" />
				</td>
			</tr>
		</table>
	</div>
	<!---->
	<div id="$this.DIV_cw_export_prefs" class="DialogWindow_Body" style="display:none; width:500px; height:150px;">
		<table cellpadding="0" cellspacing="0" style="width:100%;">
			<tbody>
				<tr style="vertical-align:top;">
					<td>
						<table style="border-color:Gray; border-style:solid; border-width:1px;">
							<colgroup>
								<col style="text-align:right;" />
							</colgroup>
							<tbody>
								<tr>
									<td>Type:</td>
									<td>
										<select id="$this.DIV_cw_export_prefs.SEL_type" style="width:300px; font-size:9px;"></select>
									</td>
								</tr>
								<tr>
									<td>Unit:</td>
									<td>
										<select id="$this.DIV_cw_export_prefs.SEL_unit" style="width:300px; font-size:9px;"></select>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td align="right">
						<table>
							<tbody>
								<tr>
									<td>
										<input type="button" id="$this.DIV_cw_export_prefs.BTN_ok" value="OK" style="width:75px;" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" id="$this.DIV_cw_export_prefs.BTN_cancel" value="Cancel" style="width:75px;" />
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	