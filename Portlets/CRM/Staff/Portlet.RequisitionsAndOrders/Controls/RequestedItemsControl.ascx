<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestedItemsControl.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Controls.RequestedItemsControl" %>

<%@ Import Namespace="EX.Data" %>
<%@ Import Namespace="Portlet.RequisitionsAndOrders" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<%@ Register TagPrefix="dd" TagName="DetailedDescription" Src="~/Portlets/CRM/Staff/Portlet.RequisitionsAndOrders/Controls/DetailedDescriptionControl.ascx" %>

<table class="ROMarginLeft">
    <tr>
        <td>
            <span class="ROHeaderText">Requested items</span>
        </td>
    </tr>
    <tr>
        <td>
            <table class="ROCellPadding ROOutlineGridView ROMarginLeft ROSectionMarginBottom">
                <asp:UpdatePanel ID="upResult" runat="server" UpdateMode="Conditional">
                   
                    <ContentTemplate>
                        <asp:Repeater ID="rRequestAccounts" runat="server">
                            <ItemTemplate>
                                <tr class='<%# GetRequestAccountTopClass(Eval("AccountCode")) %> <%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                    <td>
                                        <%#Eval("AccountDesc") %><span class="ROInformativeText"><%#Eval("FormattedAccountCode")%></span>
                                    </td>
                                    <td class="ROInformativeText">
                                        <div visible='<%# !string.IsNullOrEmpty(Convert.ToString(Eval("AccountCode"))) && GLConfig.CallBudgetChecking %>'
                                            runat="server">
                                            <img class="ROMarginRight" src='<%# GetBudgetIconPath(Eval("AccountCode"))%>' alt="budget" />
                                            <%# Eval("BudgetStatusDescription") %>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:LinkButton runat="server" Visible='<%# Eval("IsAdjustBudgetVisible")%>' Text='Adjust budget'
                                            CommandArgument='<%# Eval("WorksheetID") + ";" + Eval("LineItemID") + ";" + Eval("AccountTotal")%>'
                                            CssClass="ROOverLink ROFloatRight" OnClick="AdjustBudget_Click" ValidationGroup="vgRequest" />
                                    </td>
                                </tr>
                                <asp:Repeater ID="rRequestLineItems" DataSource='<%# Eval("RequestLineItems") %>'
                                    OnItemCreated="rRequestLineItems_ItemCreated" runat="server">
                                    <ItemTemplate>
                                        <tr class='<%# GetRequestLineItemClass(Eval("TransKeyLineNum")) %>  <%# ((RepeaterItem)Container.Parent.Parent).ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                            <td>
                                                <span class="ROFloatLeft ROInformativeText ROMarginRight"><%# Eval("ReqQuantity")%></span>
                                                <span class="ROFloatLeft ROMarginRight" visible='<%# string.IsNullOrEmpty(Convert.ToString(Eval("DetailedDescription")))%>'
                                                    runat="server"><%# Eval("Inventory.Description")%></span>
                                                <asp:LinkButton ID="reqDescriptionButton" Text='<%# Eval("Inventory.Description")%>'
                                                    CssClass="ROFloatLeft ROHoverBlackLink ROMarginRight" Visible='<%# !string.IsNullOrEmpty(Convert.ToString(Eval("DetailedDescription")))%>'
                                                    CommandName="Desc" CommandArgument='<%# Eval("DetailedDescription") %>' OnCommand="reqDescriptionButton_Command"
                                                     runat="server" />
                                                <span class="ROFloatLeft ROInformativeText ROMarginRight">at</span>
                                                <span class="ROFloatLeft ROInformativeText ROMarginRight"><%# Convert.ToDecimal(Eval("Inventory.UnitCost")).ToString("C2")%></span>
                                                <span class="ROFloatLeft ROInformativeText ROMarginRight">for</span>
                                                <span class="ROFloatLeft ROInformativeText ROMarginRight"><%# Convert.ToDecimal(Eval("Amount")).ToString("C2") %></span>
                                            </td>
                                            <td>                                                
                                                <asp:ImageButton ID="reqLineItemFeedbackButton" ImageUrl='<%# DeriveItemFeedbackIcon(Eval("TransKeyLineNum"))%>'
                                                    CommandArgument='<%# Eval("TransKeyLineNum") %>' CssClass="ROMarginRight ROFloatLeft" 
                                                    OnClick="feedbackButton_Click" runat="server" />
                                                <asp:ImageButton ID="EditItem" Visible="<%# CanEdit %>" runat="server" CommandArgument='<%# Eval("TransKeyLineNum") %>'
                                                    OnClick="editItem_Click" ImageUrl='<%# GetEditIconPath() %>' CssClass="ROMarginRight" />
                                                <asp:ImageButton ID="DeleteItem" Visible="<%# CanDeleteItem %>" runat="server" CommandArgument='<%# Eval("TransKeyLineNum") %>'
                                                    OnClick="deleteItem_Click" ImageUrl='<%# GetDeleteIconPath() %>' CssClass="ROMarginRight" />
                                            </td>
                                            <td>
                                                <asp:Label runat="server" ID="AccountTotal" Visible='<%#IsAccountTotalVisible(Container.ItemIndex, Eval("AccountCode"))%>'
                                                    Text='<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.FormattedAccountTotal") %>'
                                                    CssClass="ROFloatRight" />
                                            </td>
                                        </tr>
                                        <tr class='<%# GetRequestLineItemClass(Eval("TransKeyLineNum")) %>  <%# ((RepeaterItem)Container.Parent.Parent).ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                            <td colspan="3" class="ROSubText">
                                                <div visible='<%# Eval("HasProject")%>' runat="server">
                                                    <span class="ROFloatLeft ROInformativeSubText ROMarginRight"><%# Eval("Project.ProjectDesc")%></span> 
                                                    <span class="ROFloatLeft ROInformativeSubText ROMarginRight">(<%# Eval("Project.ProjectCode")%>)</span>
                                                    <span class="ROFloatLeft ROInformativeSubText ROMarginRight">-</span> 
                                                    <asp:Label CssClass='<%# DeriveProjectAvailableNowCSS(Eval("Project.AvailableNow"))%>'
                                                        Text='<%# DeriveProjectAvailableNowText(Eval("Project.AvailableNow"))%>' runat="server" />
                                                    <span class="ROFloatLeft ROInformativeSubText ROMarginRight">,</span> 
                                                    <span class="ROFloatLeft ROInformativeSubText ROMarginRight"><%# Convert.ToDecimal(Eval("Project.Spent")).ToString("C2")%></span> 
                                                    <span class="ROFloatLeft ROInformativeSubText ROMarginRight">spent so far.</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr class='<%# GetRequestAccountBottomClass(Eval("AccountCode")) %>'>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                <tr>
                                    <td>
                                         <asp:ImageButton CssClass="ROMarginRight" Visible="<%# CanAdd %>" ImageUrl='<%# GetAddIconPath()%>'
                                              runat="server" />
                                        <asp:LinkButton Text="Add another item" OnClick="AddAnotherItem_Click" Visible="<%# CanAdd %>"
                                             runat="server" />
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <span class="ROInformativeText ROMarginRight">Total:</span><asp:Label ID="RequestedItemsTotal"
                                            Text='<%# Requisition.Amount.ToString("C2") %>' runat="server" />
                                    </td>
                                </tr>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </table>

            <asp:Button ID="btnShowRequestItemFeedbackPopup" runat="server" Style="display: none" />
            <ajaxToolkit:ModalPopupExtender ID="RequestItemFeedbackPopup" runat="server" TargetControlID="btnShowRequestItemFeedbackPopup"
                PopupControlID="_divFeedbackModal" PopupDragHandleControlID="RequestItemFeedbackModalHeader"
                BackgroundCssClass="ROModalPopup" />
            <div id="_divFeedbackModal" runat="server" class="ROModalDiv ROFeedbackWidthHeight"
                style="display: none;">
                <div class="ROInnerModal">
                    <div id="RequestItemFeedbackModalHeader" class="ROModalHeading">
                        <asp:ImageButton ID="_imgFeedbackClose" CssClass="ROModalHeadingImg" runat="server" />
                        <asp:UpdatePanel ID="upFeedbackModalHeader" ChildrenAsTriggers="false" UpdateMode="Conditional"
                            runat="server">
                            <ContentTemplate>
                                <asp:Label ID="_lblFeedbackName" CssClass="ROHeaderText ROBoldText" runat="server" />
                                <asp:Label Text=" Comments" CssClass="ROHeaderText" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <fb:FeedbackView ID="modalFeedbackView" runat="server" GlobalObjectType="<%# EX.Data.Constants.StaffConstants.TRANS_HIST_EXT %>"
                        IsModalFeedback="<%# true %>" AttachmentUseCde="<%# ROConstants.PO_PROCESS %>"
                        AttachmentTypeCde="<%# ROConstants.RQ_SUPPORT %>" />
                </div>
            </div>

            <asp:Button ID="btnDetailedDescription" runat="server" Style="display: none" />
            <ajaxToolkit:ModalPopupExtender ID="DetailedDescriptionPopup" runat="server" TargetControlID="btnDetailedDescription"
                PopupControlID="detailedDescriptionModal" PopupDragHandleControlID="detailedDescriptionModalHeader"
                BackgroundCssClass="ROModalPopup" BehaviorID="DetailedDescriptionPopupBehaviorID" />
            <div id="detailedDescriptionModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
                <div class="ROInnerModal">
                    <div id="detailedDescriptionModalHeader" class="ROModalHeading">
                        <asp:Label runat="server" CssClass="ROHeaderText" Text="Detailed Description" />
                        <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                            OnClientClick="$find('DetailedDescriptionPopupBehaviorID').hide(); return false;" />
                    </div>
                    <div>
                        <dd:DetailedDescription ID="detailedDescriptionControl" runat="server" />
                    </div>
                </div>
            </div>

            <asp:Button ID="btnShowRequestItemErrorPopup" runat="server" Style="display: none" />
            <ajaxToolkit:ModalPopupExtender ID="RequestItemErrorPopup" runat="server" TargetControlID="btnShowRequestItemErrorPopup"
                PopupControlID="RequestItemErrorModal" PopupDragHandleControlID="RequestItemErrorModalHeader"
                BackgroundCssClass="ROModalPopup" BehaviorID="RequestItemErrorPopupBehaviorID" />
            <div id="RequestItemErrorModal" runat="server" class="ROModalDiv ROMessageWidthHeight">
                <div class="ROInnerModal">
                    <asp:UpdatePanel ID="upRequestItemError" ChildrenAsTriggers="false" UpdateMode="Conditional"
                        runat="server">
                        <ContentTemplate>
                            <div id="RequestItemErrorModalHeader" class="ROModalHeading">
                                <asp:Label ID="RequestItemErrorHeaderText" runat="server" CssClass="ROHeaderText" />
                            </div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="RequestItemErrorText" CssClass="ROErrorText" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <table class="ROStretchWidth">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkBackToMain" Text="Close, go back" OnClick="btnCancel_Click"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>
