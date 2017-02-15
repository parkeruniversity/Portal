<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Upload.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CoursepackPortlet.Views.Upload" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
	
	<script type="text/javascript" src="Portlets/LMS/CoursepackPortlet/Views/Upload.js?ver=051111.1"></script>
	<script type="text/javascript">

		window.$this = new Jenzabar$LMS$Portlets$CoursepackPortlet$Views$Upload("$this", auto_generated_code_placeholder_variable);
			
	</script>
	
	<div id="$this.DIVmain" class="CCI__portlet_body, CCI__UploadView_body" style="position:relative; margin:10px; padding-top:10px; padding-bottom:15px;">
		<div id="$this.DIVloading" style="display:none; position:absolute; left:0px; top:0px; width:100%; height:100%; filter:alpha(opacity=95); -moz-opacity:0.95; opacity:0.95; background-color:#DDDDDD;">
			<table cellpadding="0px" cellspacing="0px" style="width:100%; margin-top:80px; text-align:center;">
				<tr>
					<td>
						<span id="$this.SPNloading" style="font-weight:bolder;">.</span>
					</td>
				</tr>
				<tr>
					<td style="padding-top:10px;">[G]COURSEPACK__COURSEPACK_LOAD[/G]</td>
				</tr>
			</table>
		</div>
		<table cellpadding="0px" cellspacing="0px" style="width:100%; text-align:center;">
			<tr>
				<td style="font-weight:bold; font-size:85%;">[G]COURSEPACK__NO_CONTENT[/G]</td>
			</tr>
			<tr>
				<td style="padding-top:5px; font-size:75%;">[G]COURSEPACK__PORTLET_USED[/G]</td>
			</tr>
			<tr>
				<td style="display:none; padding-top:15px;">
					<img id="IMGhelp" runat="server" src="" />
					<a href="javascript:" style="font-size:75%;">[G]COURSEPACK__CONTENT_TYPE[/G]</a>
				</td>
			</tr>
			<tr>
				<td align="center">
					<table cellspacing="0px" cellpadding="0px" style="margin-top:20px;">
						<tr>
							<td style="vertical-align:top;">
								<img id="IMGzip" runat="server" style="padding-right:5px;" />
							</td>
							<td style="text-align:left;">
								<table cellpadding="0px" cellspacing="0px">
									<tr>
										<td style="padding-bottom:8px; font-weight:bold; font-size:75%;">[G]COURSEPACK__UPLOAD_FILE[/G]</td>
									</tr>
									<tr>
										<td>
											<input id="filer" type="file" runat="server" style="width:300px" />
										</td>
									</tr>
									<tr>
										<td style="padding-top:5px;">
											<table cellspacing="0px" cellpadding="0px">
												<tr>
													<td>
														<input id="BTN_upload" runat="server" type="button" value="[G]COURSEPACK__UPLOAD[/G]" style="width:70px;" />
													</td>
													<td style="padding-left:15px;">
														<input id="$this.CHK_fc" type="checkbox"/>
													</td>
													<td style="font-size:75%;">[G]COURSEPACK__SAVE_FC[/G]</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td style="padding-top:25px;">
							</td>
						</tr>
						<tr style="padding-top:25px;">
							<td style="vertical-align:top;">
								<img id="IMGfc" runat="server" src="" style="padding-right:5px;"/>
							</td>
							<td style="text-align:left;">
								<table id="$this.TBLload_fc" cellspacing="0px" cellpadding="0px">
									<tr>
										<td style="padding-bottom:8px; font-weight:bold; font-size:75%;">[G]COURSEPACK__LOAD_FC[/G]</td>
									</tr>
									<tr>
										<td>
											<select id="SELcoursepacks" runat="server" style="width:300px;"></select>
											<!--<span id="$this.IMG_manage_saved">Manage</span>-->
										</td>
									</tr>
									<tr>
										<td style="padding-top:5px;">
											<input id="BTN_load" runat="server" type="button" value="[G]COURSEPACK__LOAD[/G]" style="width:70px;" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
