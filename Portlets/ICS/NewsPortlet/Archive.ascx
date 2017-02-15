<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Archive.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Archive" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls"%>
<%@ Register src="Controls/NewsPost.ascx" tagname="NewsPost" tagprefix="JICS" %>
<%@ Register src="Controls/ViewingMySubs.ascx" tagname="ViewingMySubs" tagprefix="JICS" %>

<div class="newsArchive">
    <cmn:SubHeader id="_hdrArchive" runat="server" ></cmn:SubHeader>
        <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="sideBarColor" valign="top">
                 <div class="newsArchiveSideBar">
                    <asp:DropDownList ID="_ddlYears" runat="server"></asp:DropDownList>
                    <ul>
                        <asp:Repeater ID="_rptMonths" runat="server" EnableViewState="false">
                            <ItemTemplate>
                                <li><asp:LinkButton ID="_lbtnMonth" runat="server"></asp:LinkButton></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </td>
            <td valign="top">
                 <div class="newsArchiveItems">
                    <JICS:ViewingMySubs id="_vMySubs" runat="server" />
                    <asp:PlaceHolder ID="_phMySub" runat="server" />
                    <asp:Repeater ID="_rptPost" runat="server" EnableViewState="false" >
                        <ItemTemplate>
                            <JICS:NewsPost ID="_newsPost" RenderDiscussion="true" runat="server" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="blogFontSize" style="clear:both;padding-top:20px;margin-bottom:10px;">
                        <cmn:GlobalizedHyperLink ID="_ghypMain" runat="server"></cmn:GlobalizedHyperLink>
                        &nbsp;
                        <cmn:ImageAndTextButton ID="_itbMySubs" runat="server" OnClick="_itbMySubs_Click" />
                    </div>
                </div>
            </td>
        </tr>
        </table>
</div>