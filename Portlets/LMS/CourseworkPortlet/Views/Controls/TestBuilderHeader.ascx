<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestBuilderHeader.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.TestBuilderHeader" %>
<%@ Register Src="More.ascx" TagName="More" TagPrefix="JICS" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:UpdatePanel id="_updatePanel" runat="server">
	<ContentTemplate>
		<div class="detailHeader testBuilderHeader">
			<div id="_divAlert" runat="server" class="attention tbMissingPoints">
				<img src="<%=GetAlertIcon()%>" />
				<asp:Literal ID="_litAlert" runat="server" />
			</div>
            <div id="_divActivate" runat="server" class="tbMissingPoints">
                <asp:Button ID="_btnActivate" runat="server" />
            </div>
			<div class="detailInfo detailInfoLink">
				<asp:Label ID="_lblName" CssClass="Title" runat="server" />
				<asp:Label ID="_lblInfo" CssClass="Descrip" runat="server" />
                <asp:HyperLink ID="_hypTitle" runat="server" CssClass="TitleLink" />
			</div>
            <div style="clear:both;"></div>
		</div>	
	</ContentTemplate>
</asp:UpdatePanel>
<div class="detailSubHeader testBuilderSubHeader">
	<ul>
		<li>
			<asp:Label ID="_lblTimeLimit" CssClass="timeBarNormal" runat="server" />
			<asp:Label ID="_lblTimeLimitValue" CssClass="timeLimit" runat="server" />
		</li>
		<li>          
			<div class="timeBar" >
				<div class="timeBarText">
					<asp:Label ID="_lblDueOn" CssClass="timeBarNormal due" runat="server" />
					<asp:Label ID="_lblOpenOn" CssClass="timeBarNormal open" runat="server" />
				</div> 
				<div class="timeBarDate">
					<asp:Label ID="_lblStart"  runat="server" />
					<asp:Image ID="_imgNext" runat="server" />
					<asp:Label ID="_lblEnd" runat="server" />
				</div> 
			</div>
		</li>
		<li class="moreLink"><JICS:More id="_more" runat="server" /></li>
	</ul>
</div>