<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ReviewAndSubmit.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.ReviewAndSubmit" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.EX.FormBuilder/PortletScreens/FBScripts.js") %>"></script>
<script language="javascript" type="text/javascript">
function showDisabledButton(){
	for(i = 0; i < document.forms[0].elements.length; i ++){
		if( document.forms[0].elements[i].type == "button" && document.forms[0].elements[i].value == "<%=submitBtnTxt%>" ){
			document.forms[0].elements[i].style.display = "block";
		}
	}
}
</script>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><asp:Label id="lblHeaderBar" runat="server" /></h4>
<div id="Layer1" class="pSection">
	<table class="BlueBordered" width="100%" align="center" cellpadding="3" border="0" id="tblMessages" runat=server>
		<tr>
			<td><b><asp:label id="lblReviewHeader" runat="server" /></b></td>
		</tr>
		<tr>
			<td><asp:label id="lblReview" runat="server" /></td>
		</tr>
		<tr>
			<td><asp:literal id="litErrors" runat="server" /></td>
		</tr>
	</table>
	<div id="divValidateEmail" runat="server" class="FBQuestionList">
		<span class="Error"><asp:Literal ID="litValidateEmail" Runat="server" /></span>
	</div>
	<p><asp:PlaceHolder ID="phMain" Runat="server" /></p>
	<p>
	<table width="100%" cellpadding="5" cellspacing="0" border="0">
		<tr>
			<td class="fbBorderLeftRightTop"><b><jenzabar:globalizedliteral id="glitSubmit" runat="server" /></b></td>
		</tr>
		<tr>
			<td class="fbBorderLeftRight"><asp:label id="lblSubmitMessage" runat="server" /></td>
		</tr>
		<tr id="trAskEmail" runat="server">
			<td class="fbBorderLeftRight">
				<asp:CheckBox ID="cbAskEmail" Runat="server" /> <%=strAskEmailTxt%>
			</td>
		</tr>
		<tr id="trEmailTB" runat="server">
			<td class="fbBorderLeftRight">
				<%=Globalizer.Format("FB_EMAIL_SUBMSG_TXT",strAskEmailInstrux)%><br/><asp:TextBox ID="tbEmailMSG" Runat="server" Width="250" /> <asp:Literal ID="litEmailMSGReq" Runat="server" />
			</td>
		</tr>
		<tr>
			<td class="fbBorderLeftRight"><jenzabar:globalizedlabel id="glblWaiverCode" runat="server" TextKey="TXT_AO_WAIVER_CODE" visible=false /> <asp:textbox id=tbWaiverCode runat=server width="150" visible=false /></td>
		</tr>
		<tr>
			<td class="fbBorderLeftRight" align="center">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td><asp:Button id="btnSubmitWithoutPayment" runat="server" Visible="False" /></td>
						<td><asp:Button id="btnSubmitApp" runat="server" /></td>
						<td><input id="buttonFaux" style="display:none;" type="button" disabled value="<%=submitBtnTxt%>"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</p>
	<a>&nbsp;</a>
	<div id="Layer2">
		<div id="Layer3">
			<table width="100%" cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td width="25%" align="center" class="GrayBorderBottom"><asp:LinkButton ID="lbPrev" Runat="server" OnClientClick="disableLink(this, 'prevDisable');" /><span id="prevDisable" class="hiddenFB"><%=Globalizer.GetGlobalizedString("FB_PREV")%></span></td>
					<td width="50%" align="center" class="GrayBorderSides"><a href="javascript:;" onClick="moveTOC()"><div id="toctext">View Table of 
							Contents</div></a></td>
					<td width="25%" align="center" class="GrayBorderBottom">&nbsp;</td>
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
					<td>Review and Submit</td>
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
<div id="divFB" class="GrayBase" runat="server">
	<table width="100%" cellpadding="5" cellspacing="0" border="0">
		<tr>
			<td align="center"><jenzabar:globalizedlinkbutton id="gbtnGoToFB" runat="server" TextKey="TXT_AO_BACK_FORM_BUILDER" /></td>
		</tr>
	</table>
</div>
<asp:Literal runat="server" ID="litIframe"></asp:Literal>