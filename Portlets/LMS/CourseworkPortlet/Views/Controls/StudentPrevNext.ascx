<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentPrevNext.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentPrevNext" %>
<div class="detailHeaderNav" id="_divPrevNextStudent" runat="server">
	<asp:Image ID="_imgPrev" runat="server" />
	<asp:HyperLink ID="_hypPrev" runat="server" />
	<div class="detailHeaderLinkContainer">
        <asp:HyperLink ID="_hlOtherStudents" runat="server" CssClass="detailHeaderMainLink" />
    </div>
	<asp:HyperLink ID="_hypNext" runat="server" />
	<asp:Image ID="_imgNext" runat="server" />
</div>