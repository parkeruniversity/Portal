<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentHeaderNav.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.StudentHeaderNav" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<div class="detailHeader" id="_divStudentHeaderContainer" runat="server">
    <div class="detailHeaderNav" id="_divPrevNextStudent" runat="server">
		<asp:Image ID="_imgPrev" runat="server" />
		<asp:HyperLink ID="_hypPrev" runat="server" />
		<div style="display:inline;font-style:italic;margin:0px 10px 0px 10px;"><asp:Literal ID="_litDescrip" runat="server" /></div>
		<asp:HyperLink ID="_hypNext" runat="server" />
		<asp:Image ID="_imgNext" runat="server" /> 
	</div>
    <div id="_divAssignmentDetail" runat="server" class="detailInfo studentInfo">
        <asp:Hyperlink ID="_hypUser" runat="server">
		    <span><%=GetBy()%></span>
		    <framework:MyInfoPopup id="_myInfo" runat="server" />
        </asp:Hyperlink>
        <asp:HyperLink ID="_hypEmail" runat="server" />
    </div>
	<div id="_divClear" runat="server"></div>
</div>