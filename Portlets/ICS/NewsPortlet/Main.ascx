<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Main" %>
<%@ Register src="Controls/NewsPost.ascx" tagname="NewsPost" tagprefix="JICS" %>
<%@ Register src="Controls/MySubscriptions.ascx" tagname="MySub" tagprefix="JICS" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls"%>
<%@ Register src="Controls/DynamicStyle.ascx" tagname="DynamicStyle" tagprefix="JICS" %>
<%@ Register src="Controls/ViewingMySubs.ascx" tagname="ViewingMySubs" tagprefix="JICS" %>

<div class="pSection">
    <JICS:DynamicStyle ID="_dynamicStyle" runat="server" />
    <asp:PlaceHolder ID="_phLightbox" runat="server" />
    <JICS:ViewingMySubs id="_vMySubs" runat="server" />
    <asp:PlaceHolder ID="_phMySub" runat="server"  />   
    <asp:Panel ID="_panAdmin" runat="server" CssClass="newsAdminSection" EnableViewState="false">
    	<table class="newsAction newsActionBorderSideBottom newsActionBorderTop" cellspacing="0"  cellpadding="10">
		    <tr>
			    <td class="newsActionSave" id="_tdAdd" runat="server" style="width:200px;text-align:left;" >
			        <asp:Image ID="_imgAddPost" runat="server" AlternateText="Add icon" />&nbsp;
                    <cmn:GlobalizedHyperLink ID="_ghypAddPost" runat="server"></cmn:GlobalizedHyperLink>
			    </td>
			    <td style="padding-top:20px;" id="_tdSetup" runat="server" >
			        <asp:Image ID="_imgSetup" runat="server" AlternateText="Setup icon" />&nbsp;
                    <cmn:GlobalizedHyperLink ID="_ghypSetup" runat="server"></cmn:GlobalizedHyperLink>
			    </td>
		    </tr>
        </table>
    </asp:Panel>
    <div style="clear:both;"></div>
    <asp:Repeater ID="_rptPost" runat="server">
        <ItemTemplate>
            <JICS:NewsPost ID="_newsPost" RenderDiscussion="true" runat="server"/>
        </ItemTemplate>
    </asp:Repeater>
    <div class="blogFontSize" style="float:left;margin-bottom:10px;">
        <div style="float:left;padding-top:6px;" id="_divAvailLinks" runat="server">
            <cmn:ImageAndTextLink ID="_itlArchive" runat="server" />
        </div>
        <div style="float:left;margin-left:20px;">
            <cmn:ImageAndTextLink ID="_itlSubscribe" runat="server" />
            &nbsp;
            <cmn:ImageAndTextButton ID="_itbMySubs" runat="server" OnClick="_itbMySubs_Click" />
            &nbsp;
            <cmn:ImageAndTextLink ID="_itlRSS" runat="server" />
        </div>
    </div>
    <div style="clear:both;"></div>
</div>