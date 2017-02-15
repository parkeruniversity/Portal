<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Browse.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CoursepackPortlet.Views.Browse" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

	<script type="text/javascript" src="Portlets/LMS/CoursepackPortlet/Views/Browse.js?ver=070710.1"></script>
	<script type="text/javascript">
		
		window.$this = new Jenzabar$LMS$Portlets$CoursepackPortlet$Views$Browse("$this", auto_generated_code_placeholder_variable);
			
	</script>
	
	<div id="$this.DIVmain" class="CCI__portlet_body" style="vertical-align:top;">
		<table cellpadding="0px" cellspacing="0px" style="width:100%; height:100%;">
			<tr style="vertical-align:top;">
				<td style="border-right-style:solid; border-right-color:gray; border-right-width:1px;">
					<table cellpadding="0px" cellspacing="0px">
						<tr>
							<td>
								<div id="$this.DIVcontents" style="border-bottom-style:solid; border-bottom-width:1px; border-bottom-color:gray;">
									<table cellpadding="0px" cellspacing="0px" width="100%">
										<tr style="height:35px;" class="CCI__toc">
											<td style="width:100%;">
												<span id="$this.CELcontents" style="font-weight:bold; padding-left:10px;">[G]COURSEPACK__CONTENTS[/G]</span>
											</td>
											<td style="text-align:right; padding-top:3px; padding-left:3px; padding-right:3px; cursor:pointer;">
												<img id="IMG_sizer_hide" runat="server" style=""/>
												<img id="IMG_sizer_show" runat="server" style="display:none;"/>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr id="$this.TTRadmin" style="display:none;">
							<td style="height:30px;">
								<table cellpadding="0px" cellspacing="0px" style="padding-left:10px; padding-top:3px;">
									<tr>
										<td>
											<img id="IMGadmin" runat="server" />
										</td>
										<td style="padding-left:5px;">
											<a id="LNK_admin" runat="server" href="javascript:" style="font-size:85%;">[G]COURSEPACK__manage_content[/G]</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td id="$this.ROWbanner">
								<div style="display:block; height:20px; width:100%;" class="CCI__banner"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="DIV_toc" runat="server" style="display:none; white-space:nowrap; overflow:auto;" class="CCI__toc"></div>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div id="$this.DIVsizer" style="cursor:col-resize;" class="CCI__pane_sizer"></div>
				</td>
				<td style="width:100%;">
					<iframe id="$this.FRAcontent" frameborder="no" style="width:100%;"></iframe>
				</td>
			</tr>
		</table>
		<a runat="server" id="LNK_delete" style="display:none;"></a>
	</div>
