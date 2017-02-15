<%@ Control Language="c#" AutoEventWireup="false" Codebehind="FormStart_SinglePageView.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.FormStart_SinglePageView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.EX.FormBuilder/PortletScreens/FBScripts.js") %>"></script>
<script language="JavaScript" src="<%= this.ResolveUrl("~/ui/common/scripts/jquery.blockui.js") %>"></script>
<script language="javascript" type="text/javascript">
function showDisabledButton(){
	for(i = 0; i < document.forms[0].elements.length; i ++){
		if( document.forms[0].elements[i].type == "button" && document.forms[0].elements[i].value == "<%=Globalizer.GetGlobalizedString("RMFB_SAVE_FORM_TXT")%>"  ){
			document.forms[0].elements[i].style.display = "block";
		}
	}
}
</script>
<cmn:errordisplay id="errorDisplay" Runat="server" />
<h4><%=pFName%></h4>
<div id="divFrmEles" class="pSection">
    <div class="FormBuilder"><div class="ErrorMsg"><b><asp:Literal ID="litErr" runat="server" /></b></div></div>
	<div id="divIntro" runat="server">
	    <b><%=Globalizer.GetGlobalizedString("TXT_INTRODUCTION")%></b><br />
		<p><cmn:complexcontentdisplay ID="ccdIntro" Runat="server" /></p>
	</div>
	<div id="divInstrux" runat="server">
	    <b><%=Globalizer.GetGlobalizedString("TXT_INSTRUCTIONS")%></b><br />
		<p><cmn:complexcontentdisplay ID="ccdInstrux" Runat="server" /></p>
	</div>
	<b><cmn:GlobalizedLabel ID="SavedFilesLabel" TextKey="FB_SUP_FILES_TXT" runat="server" visible="true" /></b>
	<asp:Repeater ID="SavedFiles" Runat="server">
		<ItemTemplate>
			<div style="padding: 4px 0px 4px 10px;">
				<asp:Literal ID="SavedFileID" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Visible="false" runat="server" />
				<asp:HyperLink ID="FileLink" 
						NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Path") %>' 
						Target="_blank" Runat="server">
					<%# DataBinder.Eval(Container.DataItem, "Name") %>
				</asp:HyperLink> 
				(<%# DataBinder.Eval(Container.DataItem, "Size") %>) 
			</div>
		</ItemTemplate>
	</asp:Repeater>
	<asp:PlaceHolder ID="phSectionSingleView" Runat="server" />
	<asp:LinkButton ID="lbutGoPreReqSect" Runat="server" />
</div>
<div id="divBtns" class="GrayBase" runat="server">
	<table cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td><cmn:GlobalizedButton ID="gBtnSubmitApp" Runat="server" TextKey="TXT_SUBMIT" /></td>
			<td><input id="buttonFaux" style="display:none;" type="button" disabled value="<%=Globalizer.GetGlobalizedString("RMFB_SAVE_FORM_TXT")%>"></td>
			<td> &nbsp; &nbsp; </td>
			<td><cmn:GlobalizedButton ID="gBtnCancel" Runat="server" TextKey="RMFB_CANCEL_FORM_TXT" /></td>
		</tr>
		<tr id="trBackToFB" runat="server">
			<td colspan="4"><br/><a href="<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View//" + FormID)%>"><%=Globalizer.GetGlobalizedString("TXT_AO_BACK_FORM_BUILDER")%></a></td>
		</tr>
	</table><br/>
</div>
<asp:LinkButton ID="lbGoBack" runat="server" CssClass="pSection" Visible="false">Go Back</asp:LinkButton>