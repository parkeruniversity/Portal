<%@ Control CodeBehind="DisplayForm.ascx.cs" Language="c#" AutoEventWireup="false" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.PortletScreens.DisplayForm" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.FormBuilder/PortletScreens/FBScripts.js") %>"></script>
<script language="JavaScript" src="<%= this.ResolveUrl("~/ui/common/scripts/jquery.blockui.js") %>"></script>

<script type="text/javascript" language="javascript">
    setTimeout('hideTOC()', 700);
</script>

<jenzabar:errordisplay id="error" Runat="server" />
<h4><asp:Label id="lblHeaderBar" runat="server" /></h4>

<div id="Layer1" class="pSection">
	<table class="YellowBordered" width="100%" align="center" cellpadding="3" border="0" id="tblMessages" runat=server visible=false>
		<tr>
			<td><b class="RedErrorText"><jenzabar:globalizedliteral id=glitOneOrMore runat=server TextKey="TXT_AO_ONE_OR_MORE" /></b></td>
		</tr>

		<tr>
			<td><asp:literal id="litErrors" runat="server" /></td>
		</tr>
	</table>
	<h5><b><asp:Label ID="lblSectionName" Runat="server" /></b></h5>
	<asp:Literal ID="litPageNum" runat="server" />
	<p><jenzabar:complexcontentdisplay id="ccdMain" runat="server" /></p>
	<asp:PlaceHolder ID="phSection" Runat="server" />
	<asp:LinkButton ID="lbutGoPreReqSect" Runat="server" />
	<a>&nbsp;</a>
	<div id="Layer2">
		<div id="Layer3">
			<table width="100%" cellspacing="0" cellpadding="5" border="0" id="htmlTableTOC" runat="server">
				<tr>
					<td width="25%" align="center" class="GrayBorderBottom"><asp:LinkButton ID="lbPrev" Runat="server" OnClientClick="disableLink(this, 'prevDisable');" /><span id="prevDisable" class="hiddenFB"><%=Globalizer.GetGlobalizedString("FB_PREV")%></span></td>
					<td width="50%" align="center" class="GrayBorderSides"><a href="javascript:;" onClick="moveTOC();"><div id="toctext">View Table of 
							Contents</div></a></td>
					<td width="25%" align="center" class="GrayBorderBottom"><asp:LinkButton ID="lbNext" Runat="server" OnClientClick="disableLink(this, 'nextDisable');" /><span id="nextDisable" class="hiddenFB"><%=Globalizer.GetGlobalizedString("FB_NEXT")%></span></td>
				</tr>
			</table>
		</div>
		<div id="Layer4" style="visibility:hidden">
			<table cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td><asp:LinkButton ID="lbIntro" Runat="server" Visible="False" CommandName="Intro">Introduction</asp:LinkButton></td>
				</tr>
				<tr>
					<td><asp:LinkButton ID="lbInstructions" Runat="server" Visible="False" CommandName="Instructions">Instructions</asp:LinkButton></td>
				</tr>
				<asp:Repeater ID="rptSecGrid" Runat="server">
					<HeaderTemplate>
				<tr>
					<td>
						<table cellspacing="0" cellpadding="0" border="0" style="margin-bottom:-5px;">
					</HeaderTemplate>
					<ItemTemplate>
							<tr>
								<td align="right" style="padding:0px 5px 10px 0px;"><asp:Label ID="lblSection" Runat="server" /></td>
								<td style="padding:0px 0px 10px 0px;"><asp:LinkButton ID="lbSec" Runat="server" CommandName="Navigate"><%#DataBinder.Eval(Container.DataItem, "Name")%></asp:LinkButton><asp:Label ID="lblActive" Runat="server" Visible="False" /></td>
							</tr>
					</ItemTemplate>
					<FooterTemplate>
						</table>
					</td>
				</tr>
					</FooterTemplate>
				</asp:Repeater>
				<tr>
					<td><asp:LinkButton ID="lbReview" Runat="server" Visible="True">Review and Submit</asp:LinkButton></td>
				</tr>
				<asp:Repeater ID="rptSupFiles" Runat="server" Visible="False">
					<HeaderTemplate>
				<tr>
					<td><br/><%=Globalizer.GetGlobalizedString("FB_SUP_FILES_TXT")%></td>
				</tr>
					</HeaderTemplate>
					<ItemTemplate>
				<tr>
					<td>
						<asp:Literal ID="litSF" Runat="server" Visible="False" />
						<asp:HyperLink ID="hl" Runat="server" Visible="False" />
					</td>
				</tr>
					</ItemTemplate>
					<FooterTemplate />
				</asp:Repeater>
			</table>
		</div>
	</div>
</div>
<div id="Layer5" class="GrayBase">
	<table width="100%" cellpadding="5" cellspacing="0" border="0">
		<tr>
			<td align="center">
				<jenzabar:globalizedbutton id="gbtnSave" runat="server" TextKey="TXT_AO_SAVE_AND_FINISH_LATER" />
				<jenzabar:globalizedlinkbutton id="gbtnGoToFB" runat="server" TextKey="TXT_AO_BACK_FORM_BUILDER" />
			</td>
		</tr>
	</table>
</div>
<iframe id="iFrameKeepSessionAlive" width="0" height="0" runat="server"></iframe>