<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="User_Submissions.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.PortletScreens.UserControls.User_Submissions" %>
<table width="100%" id="tableMain" runat="server">
    <tr>
        <td width="50%" valign="top" id="tdRptr" runat="server">
            <table border="0" cellpadding="3" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="4" class="fbBorderTopLeftBottomRight"><asp:Literal ID="litTitle" runat="server" /></td>
                        </tr>
            <asp:Repeater ID="rptrSubs" runat="server">
                <HeaderTemplate>
                        <tr class="fbTblAdminSubHead">
                            <th class="BorderLeftBottom" width="1%">&nbsp;</th>
                            <th class="BorderLeftBottom" width="30%">Date</th>
                            <th class="BorderLeftBottom" width="39%">View</th>
                            <th class="BorderLeftRightBottom" width="30%">Status</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr id="trData" runat="server">
                        <td class="BorderLeftBottom"><asp:Image ID="imgIcon" runat="server" /></td>
                        <td class="BorderLeftBottom"><%#DataBinder.Eval(Container.DataItem, "LastUpdated")%></td>
                        <td class="BorderLeftBottom"><a id="aViewSub" runat="server" /></td>
                        <td class="BorderLeftRightBottom"><asp:Literal ID="litStatus" runat="server" /></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            </table>
        </td>
        <td width="40%" id="tdMsg" runat="server">
            <asp:Literal ID="litNoSubMsg" runat="server" />
        </td>
        <td width="50%" valign="top" id="tdFillOutNew" runat="server">
            <table id="tableFON" runat="server">
                <tr>
                    <td valign="top"><img src="UI/Common/Images/PortletImages/Icons/FB_FillOutNew.gif" /></td>
                    <td valign="top">Fill out a new<br /><a id="aFillOutNew" runat="server" /></td>
                </tr>
            </table>
        </td>
        <td width="50%" valign="top" id="tdContinue" runat="server">
            <table>
                <tr>
                    <td valign="top"><img src="UI/Common/Images/PortletImages/Icons/FB_Continue.gif" /></td>
                    <td valign="top">Continue your saved<br /><a id="aContinue" runat="server" /></td>
                </tr>
            </table>
            <span id="spanStartAndDelete" runat="server"><img src="UI/Common/Images/PortletImages/Icons/FB_StartAndDelete.gif" align="absmiddle" /> <a id="aStartDelete" runat="server" /></span>
        </td>
    </tr>
    <tr>
        <td><br /><br /></td>
    </tr>
</table>