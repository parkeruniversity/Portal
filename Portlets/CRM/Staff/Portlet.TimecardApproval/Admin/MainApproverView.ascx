<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="MainApproverView.ascx.cs" Inherits="Portlet.TimecardApproval.Admin.MainApproverView" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="PageHeader" TextKey="TXT_SUPERVISORS_AND_ALTERNATE_APPROVERS" runat="server" />
<div id="MainSection" class="pSection" runat="server">
    <table id="tblMainPage" cellpadding="2" cellspacing="2">
        <tr>
            <td>
                <framework:PortalImage ID="AlternateApprovalIcon" ImageCategory="PortletIcon" ImageUrl="supervisor-alt-app-icon.gif" 
						CssClass="tcaFloatLeft" runat="server" />
            </td>
            <td>
                <p>
                    <common:GlobalizedLiteral ID="AltApprovalLiteral" 
							TextKey="MSG_TCAPPROVAL_MAINAPPROVERVIEW_HEADER" runat="server" />
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table id="tblSupervisorBlock" class="tcaApproverTableFormat" cellspacing="0">
                    <tr>
                        <td class="tcaApproverTableFormatHeader">
                            <common:GlobalizedLiteral ID="SupervisorHeader" TextKey="TXT_SUPERVISOR(S)" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tcaApproverTableFormatSubHeader">
                            <common:GlobalizedLiteral id="glitSupervisorDescription" 
									TextKey="MSG_TCAPPROVAL_MAINAPPROVERVIEW_SUPERVISOR_DESCRIPTION" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <asp:TableCell runat="server" ID="tdSupervisorCell">
                            <framework:PortalImage ID="GroupIcon1" ImageCategory="PortletIcon" ImageUrl="group.gif" 
									CssClass="tcaFloatLeft" runat="server" />&nbsp;<asp:Literal ID="litSupervisorList" 
									runat="server" />&nbsp;<common:GlobalizedLinkButton ID="lbSupervisor" TextKey="TXT_EDIT_SUPERVISORS" 
									runat="server" />
                        </asp:TableCell>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table id="tblAAByGroup" class="tcaApproverTableFormat" cellspacing="0" width="100%">
                    <tr>
                        <td class="tcaApproverTableFormatHeader" colspan="4">
                            <common:GlobalizedLiteral ID="AlternateApproversHeader" 
									TextKey="TXT_ALTERNATE_APPROVERS_BY_GROUP" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tcaApproverTableFormatSubHeaderBlue" width="20%">
                            <framework:PortalImage ID="AddPostIcon1" ImageCategory="PortletIcon" ImageUrl="add_post.gif" 
									CssClass="tcaFloatLeft" runat="server" /><common:GlobalizedLinkButton id="glbAAByGroupAdd"
									TextKey="MSG_TCAPPROVAL_MAINAPPROVERVIEW_AABG_ADD_ICON_DESCRIPTION" runat="server" />
                        </td>
                        <td colspan="3" class="tcaApproverTableFormatSubHeaderLight">
                            <common:GlobalizedLiteral id="glitAABGDescription" 
									TextKey="MSG_TCAPPROVAL_MAINAPPROVERVIEW_AABG_ADD_DESCRIPTION" runat="server" />
                        </td>
                    </tr>
                    <asp:Repeater ID="rptAABG" runat="server">
                        <HeaderTemplate>
                            <tr>
                                <td class="tcaApproverTableFormatSubHeader">
									<common:GlobalizedLiteral ID="PayGroupHeader" TextKey="TXT_PAY_GROUP(S)" runat="server" />
                                </td>
                                <td class="tcaApproverTableFormatSubHeader">
									<common:GlobalizedLiteral ID="AltApproverHeader" TextKey="TXT_ALTERNATE_APPROVERS" runat="server" />
                                </td>
                                <td class="tcaApproverTableFormatSubHeader" width="16">
                                    &nbsp;
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TableRow ID="tr" runat="server">
                                <asp:TableCell>
                                    <asp:Literal ID="litAABGPayGroup" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell ID="tdPrincipalSelectorCell"  runat="server">
                                    <framework:PortalImage ID="GroupIcon2" ImageCategory="PortletIcon" ImageUrl="group.gif" 
											CssClass="tcaFloatLeft" runat="server" />&nbsp;<asp:Literal ID="litAABGAlternateApprover" 
											runat="server" />&nbsp;<asp:ImageButton ID="ibAABGEdit" CommandName="Edit" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell align="center">
                                    <asp:ImageButton ID="ibAABGDelete" CommandName="Delete" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <asp:TableRow ID="tr" runat="server">
                                <asp:TableCell CssClass="tcaApproverTableFormatAlternateItem">
                                    <asp:Literal ID="litAABGPayGroup" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell ID="tdPrincipalSelectorCell" class="tcaApproverTableFormatAlternateItem" runat="server">
                                    <framework:PortalImage ID="GroupIcon3" ImageCategory="PortletIcon" ImageUrl="group.gif" 
											CssClass="tcaFloatLeft" runat="server" />&nbsp;<asp:Literal ID="Literal1" 
											runat="server" />&nbsp;<asp:Literal ID="litAABGAlternateApprover" 
											runat="server"/>&nbsp;<asp:ImageButton ID="ibAABGEdit" CommandName="Edit" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell align="center" CssClass="tcaApproverTableFormatAlternateItem">
                                    <asp:ImageButton ID="ibAABGDelete" CommandName="Delete" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
        </tr>
        </table> </td> </tr>
        <tr>
            <td colspan="2">
                <table id="Table1" class="tcaApproverTableFormat" cellspacing="0" width="100%">
                    <tr>
                        <td class="tcaApproverTableFormatHeader" colspan="4">
							<common:GlobalizedLiteral ID="AltManagerHeader" 
									TextKey="TXT_ALTERNATE_APPROVERS_FOR_SPECIFIC_MANAGERS" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tcaApproverTableFormatSubHeaderBlue" width="20%">
                             <framework:PortalImage ID="AddPostIcon2" ImageCategory="PortletIcon" ImageUrl="add_post.gif" 
									CssClass="tcaFloatLeft" runat="server" /><common:GlobalizedLinkButton id="glitAABySpecificAdd"
									TextKey="MSG_TCAPPROVAL_MAINAPPROVERVIEW_AASM_ADD_ICON_DESCRIPTION" runat="server" />
                        </td>
                        <td colspan="3" class="tcaApproverTableFormatSubHeaderLight">
                            <common:GlobalizedLiteral id="glitAASMDescription" 
									TextKey="MSG_TCAPPROVAL_MAINAPPROVERVIEW_AASM_ADD_DESCRIPTION" runat="server" />
                        </td>
                    </tr>
                    
                        <asp:Repeater ID="rptAASM" runat="server">
                            <HeaderTemplate>
                            <tr>
                                <td class="tcaApproverTableFormatSubHeader">
									<common:GlobalizedLiteral ID="ManagerHeader" TextKey="TXT_MANAGER" runat="server" />
                                </td>
                                <td class="tcaApproverTableFormatSubHeader">
									<common:GlobalizedLiteral ID="AltApproverHeader" TextKey="TXT_ALTERNATE_APPROVERS" runat="server" />
                                </td>
                                <td class="tcaApproverTableFormatSubHeader" width="16">
                                    &nbsp;
                                </td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <asp:TableRow ID="tr" runat="server">
                                <asp:TableCell>
                                    <asp:Literal ID="litAASMManager" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell ID="tdPrincipalSelectorCell" runat="server">
                                    <framework:PortalImage ID="GroupIcon4" ImageCategory="PortletIcon" ImageUrl="group.gif" 
											CssClass="tcaFloatLeft" runat="server" />&nbsp;<asp:Literal ID="litAABGAlternateApprover" 
											runat="server" />&nbsp;<asp:Literal ID="litAASMAlternateApprover"
											runat="server" />&nbsp;<asp:ImageButton ID="ibAASMEdit" CommandName="Edit" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell align="center">
                                    <asp:ImageButton ID="ibAASMDelete" CommandName="Delete" runat="server" />
                                </asp:TableCell>
                             </asp:TableRow>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                            <asp:TableRow ID="tr" runat="server">
                                <asp:TableCell CssClass="tcaApproverTableFormatAlternateItem">
                                    <asp:Literal ID="litAASMManager" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell ID="tdPrincipalSelectorCell" class="tcaApproverTableFormatAlternateItem" runat="server">
                                    <framework:PortalImage ID="GroupIcon5" ImageCategory="PortletIcon" ImageUrl="group.gif" 
											CssClass="tcaFloatLeft" runat="server" />&nbsp;<asp:Literal ID="litAABGAlternateApprover" 
											runat="server" />&nbsp;<asp:Literal ID="litAASMAlternateApprover" 
											runat="server" />&nbsp;<asp:ImageButton ID="ibAASMEdit" CommandName="Edit" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell align="center" CssClass="tcaApproverTableFormatAlternateItem">
                                    <asp:ImageButton ID="ibAASMDelete" CommandName="Delete" runat="server" />
                                </asp:TableCell>
                             </asp:TableRow>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                             </tr>
        </table> </td> </tr>
        <tr>
            <td colspan="2">
                <common:GlobalizedLinkButton id="BackButton" runat="server" TextKey="TXT_BACK_TO_ADMIN_OPTIONS" />
            </td>
        </tr>
    </table>
</div>
