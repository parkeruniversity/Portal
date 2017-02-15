<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailHeader.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.DetailHeader" %>
<div class="detailHeader">
	<div class="detailHeaderNav">
		<asp:Image ID="_imgPrev" runat="server" />
		<asp:HyperLink ID="_hypPrev" runat="server" />
		<div style="display:inline;font-style:italic;margin:0px 10px 0px 10px;"><asp:Literal ID="_litDescrip" runat="server" /></div>
		<asp:HyperLink ID="_hypNext" runat="server" />
		<asp:Image ID="_imgNext" runat="server" /> 
	</div>
	<div id="_divInfo" runat="server" class="detailInfo">
		<div runat="server" id="_divDetail" class="detailInfoContent">
			<asp:Label ID="_lblName" CssClass="Title" runat="server" />
			<asp:Label ID="_lblInfo" CssClass="Descrip" runat="server" />
			<asp:HyperLink ID="_hypTitle" CssClass="TitleLink" runat="server" />
		</div>
	</div>
	<div style="clear:both;"></div>
</div>