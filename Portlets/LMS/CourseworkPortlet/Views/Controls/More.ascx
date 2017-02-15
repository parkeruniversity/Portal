<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="More.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.More" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Src="../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="LMS" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:PlaceHolder ID="_phFC" runat="server">
    <script language="javascript" src="UI/Common/Scripts/jquery.blockui.js"></script>
    <script language="javascript" type="text/javascript">

        function pageLoad() { onLoad(); }
        $(document).ready(function () { onLoad(); });

        function onLoad() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                $.unblockUI();
            });
        }
        
        function showBlock() {
            $.blockUI({ message: $('#divBlock'), css: { border: 'none', background: 'transparent' }, overlayCSS: { backgroundColor: '#000', opacity: 0.3} });
        }
    </script>
</asp:PlaceHolder>

<script language="javascript" type="text/javascript">
	$(document).ready(function () { SetMoreMenu(); });

	function SetMoreMenu() {
		MoreMenu("moreLink", "menuContent");
	}
</script>


<common:GlobalizedLabel ID="_glMore" runat="server" CssClass="more" /> <img src="<%=GetMoreImgUrl() %>" />
<div class="menuContent">
	<div class="innerMenuContent">
		<asp:DataList ID="_dlLinks" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow"  ItemStyle-CssClass="linkItem">
			<ItemTemplate>
				<asp:PlaceHolder ID="_phLink" runat="server" />
			</ItemTemplate>
		</asp:DataList>					
		<div class="moreContainer" >
			<asp:Repeater ID="_rptMoreInfo" runat="server">
				<ItemTemplate>
					<div class="moreInfo">
						<asp:Label ID="_lblLabel" runat="server" />
						<asp:Label ID="_lblValue" CssClass="infoValue" runat="server" />
					</div>
				</ItemTemplate>
			</asp:Repeater>
			<asp:Panel id="_panMoreExtra" runat="server" class="moreInfo">
				<asp:Label ID="_lblMoreExtra" runat="server" />
				<span class="infoValue">
					<asp:Repeater ID="_rptMoreExtra" runat="server">
						<ItemTemplate>
							<div>
								<asp:PlaceHolder ID="_phMoreExtra" runat="server" />
							</div>
						</ItemTemplate>
					</asp:Repeater>
				</span>
			</asp:Panel>
            <br /><a id="_aLearningTool" runat="server" target="_blank" />
		</div>
	</div>
</div>
<div id="divBlock" style="display:none;" >
    <img src="<%=GetAJAXImageUrl()%>" />
</div>
