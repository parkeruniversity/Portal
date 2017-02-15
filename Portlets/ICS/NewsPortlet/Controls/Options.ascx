<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Options.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Controls.Options" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<div id="newsOptions"> 
    <div>
        <asp:Label ID="_lblComments" CssClass="contentTitle"  runat="server"></asp:Label>
        <cmn:GlobalizedCheckBox ID="_gcbxComment" runat="server" />
    </div>
    <div>
        <asp:Label ID="_lblAttribution" runat="server"   CssClass="contentTitle"></asp:Label>
        <cmn:GlobalizedCheckBox ID="_gcbxAttribution" runat="server" />
    </div>
    <div class="roleSelector">
        <asp:Label ID="_lblShowTo"  runat="server" CssClass="contentTitle"></asp:Label>
        <asp:Label ID="_lblShowToInfo"  runat="server"></asp:Label>
        <jenz:PrincipalSelector id="_pSelector" runat="server" ></jenz:PrincipalSelector>
    </div>
    <div>
        <cmn:displayindicator id="_diDateRange" runat="server" ShowTime="True" ></cmn:displayindicator>
    </div>
    
    <asp:Panel ID="_panCrossPost"  runat="server">
        <asp:Label ID="_lblCrossPost" runat="server" CssClass="contentTitle"></asp:Label>
        <div style="clear:none;">
            <asp:Label ID="_lblCrossPostInfo" Font-Italic="true" runat="server"></asp:Label>
            <br />
            <cmn:GlobalizedLabel ID="_glblNoCourse" Font-Bold="true" runat="server"></cmn:GlobalizedLabel>
            <asp:CheckBoxList ID="_cbxlCourses" runat="server" RepeatDirection="Vertical" RepeatLayout="Table">
            </asp:CheckBoxList>
        </div>
    </asp:Panel>
    <div style="clear:both;"></div>
</div>