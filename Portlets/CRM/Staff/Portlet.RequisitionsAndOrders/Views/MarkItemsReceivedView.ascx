<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarkItemsReceivedView.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Views.MarkItemsReceivedView" %>
<script type="text/javascript" src="<%= this.ResolveUrl("../ROScript.js") %>"></script>
<%@ Import Namespace="Portlet.RequisitionsAndOrders" %>
<%@ Import Namespace="EX.Data" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Jenzabar.EX.Feedback" Namespace="Jenzabar.EX.Feedback" TagPrefix="fb" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="fb" TagName="FeedbackView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FeedbackView.ascx" %>
<table class="ROLayoutTable">
    <tr>
        <td class="ROBackToMain" colspan="2">
            <!-- PO Header -->
            <div class="ROFloatLeft">
                <asp:Label ID="lblPOName" CssClass="ROMarginLeft ROMarginRight ROFloatLeft ROMarginTop ROLabelText" runat="server" />
                <asp:Label CssClass="ROMarginRight ROFloatLeft ROMarginTop ROLabelText" Text="-"
                    runat="server" />
                <asp:Label ID="lblAmountRemaining" CssClass="ROFloatLeft ROMarginTop ROMarginRight ROLabelText"
                    runat="server" />
                <asp:Label CssClass="ROInformativeText ROMarginRight ROFloatLeft ROMarginTop" Text="to be received from"
                    runat="server" />
                <asp:Label ID="lblVendorName" CssClass="ROFloatLeft ROMarginTop ROMarginRight ROLabelText"
                    runat="server" />
            </div>
            <div class="ROFloatRight">
                <table>
                    <tr>
                        <td>
                            <asp:LinkButton ID="BackToMain" CssClass="ROFloatLeft ROMarginTop ROMarginLeft" Text="Cancel, go back"
                                OnClick="btnCancel_Click" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div id="MarkAllReceivedArea" class="ROFloatLeft ROGreyBox ROGreyBackground" style="display: block;"
                runat="server">
                <img class="ROMarginLeft ROFloatLeft ROMarginRight" src="<%=GetMarkAllReceivedIconPath()%>"
                    alt="Mark All Items Received" />
                <asp:LinkButton ID="btnMarkAllItemsReceived" CssClass="ROFloatLeft ROMarginTop ROMarginRight ROBlackLink" Text="Mark All Items Received"
                    runat="server" />
            </div>
            <div id="MarkAllNotReceivedArea" class="ROFloatLeft ROGreyBox ROGreyBackground" style="display: none;"
                runat="server">
                <img class="ROMarginLeft ROFloatLeft ROMarginRight" src="<%=GetMarkAllNotReceivedIconPath()%>"
                    alt="Mark All Not Received" />
                <asp:LinkButton ID="btnMarkAllItemsNotReceived" CssClass="ROFloatLeft ROMarginTop ROMarginRight ROBlackLink"
                    Text="Mark All Not Received" runat="server" />
            </div>
            <div class="ROFloatRight ROGreyBox">
                <table>
                    <tr>
                        <td>
                            <span class="ROInformativeText ROMarginRight">Shipping method:</span><asp:Label ID="ShippingMethod"
                                CssClass="ROInformativeText" runat="server" />
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <span class="ROInformativeText">Shipping to:</span>
                                    </td>
                                    <td>
                                        <asp:Label ID="ShipAddress" CssClass="ROInformativeText" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="ROMarginRight ROLabelText">PO Expires:</span><asp:Label ID="POExpirationDate"
                                CssClass="ROLabelText" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <table class="ROMarginLeft ROSectionMarginBottom">
                <tr>
                    <td>
                        <fb:FeedbackView ID="feedbackView" runat="server" FeedbackGOID="<%# PurchaseOrder.GOID %>"
                            GlobalObjectType="<%# EX.Data.Constants.StaffConstants.PO_HEADER %>" IsModalFeedback="<%# false %>"
                            AttachmentUseCde="<%# ROConstants.PO_PROCESS %>" AttachmentTypeCde="<%# ROConstants.PO_SUPPORT %>" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr> 
        <td class="ROPaddingLeft5">
            <span id="NotReceivedAreaHeader" runat="server" class="ROHeaderText">Not received</span>
        </td>
    </tr>
    <tr>
        <td class="ROPadding5">
            <div id="NotReceivedArea" runat="server" class="RORepeaterBorder">
                <table class="ROLayoutTable RORowPadding ROStretchWidth">
                    <asp:Repeater ID="rNotReceivedLineItems" OnItemCreated="rPOLineItems_ItemCreated"
                        OnItemDataBound="rNotReceived_ItemDataBound" runat="server">
                        <ItemTemplate>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td>
                                    <asp:ImageButton ID='reqLineItemFeedbackButton' ImageUrl='<%# DeriveItemFeedbackIcon(Eval("TransKeyLineNum"))%>'
                                        CommandArgument='<%# Eval("TransKeyLineNum") %>' CssClass="ROMarginLeft ROMarginRight ROFloatLeft"
                                        OnClick="feedbackButton_Click" runat="server" AlternateText='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                                <td class="ROActionWidth">
                                    <asp:CheckBox ID="chkReceivedOrder" runat="server" CssClass="RONoWrap ROMarginRight ROLabelText"
                                        Text="I received" />
                                    <asp:CheckBox ID="chkReturned" runat="server" CssClass="RONoWrap ROLabelText" Text="returned" />
                                </td>
                                <td class="ROStretchWidth">
                                      <asp:Label ID="RemainingItemCount" Text='<%# Eval("NotReceivedQuantityFormatted")%>'
                                          CssClass="ROFloatLeft ROMarginLeft ROMarginRight ROMarginTop" runat="server" />
                                          <span class="ROFloatLeft ROMarginRight ROMarginTop"><%# Eval("Inventory.Description")%></span>                                      
                                          <asp:Label ID="RemainingAmount" CssClass="ROFloatLeft ROInformativeText ROMarginLeft ROMarginRight ROMarginTop"
                                              Text='<%# Convert.ToDecimal(Eval("NotReceivedAmount")).ToString("C2")%>' runat="server" />
                                            <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">to</span>
                                            <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop"><%#Eval("AccountDesc") %></span>
                                            <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop"><%#Eval("FormattedAccountCode")%></span>
                                    <input type="hidden" id="hiddenNumberReceivedOrder" value="0" runat="server" />
                                    <input type="hidden" id="hiddenNumberReturned" value="0" runat="server" />
                                    <input type="hidden" id="hiddenTransKeyLineNum" value='<%#Eval("TransKeyLineNum")%>' runat="server" />
                                </td>
                                <td class="RONoWrap">
                                    <asp:LinkButton ID="reqLineItemSupportNeededButton" Text="Support Needed" CommandArgument='<%# Eval("TransKeyLineNum") %>'
                                        OnClick="supportNeededButton_Click" runat="server" CssClass='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td colspan="4">
                                    <div id="ActionAreaReceivedOrder" runat="server" style="display: none;" class="ROMarginLeft ROMarginBottom ROFloatLeft ROMarginRight">
                                        <asp:Label ID="YourActionReceived" Text="I received" CssClass="ROFloatLeft ROInformativeText ROMarginTop ROMarginRight"
                                            runat="server" />
                                        <asp:DropDownList ID="ddlNumberReceivedOrder" runat="server" CssClass="ROFloatLeft ROMarginRight" />
                                        <asp:TextBox ID="txtNumberReceivedOrder" runat="server" MaxLength="12" CssClass="ROFloatLeft ROMarginRight RORight" />                                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumberReceivedOrder" runat="server"
                                            Enabled="false" ControlToValidate="txtNumberReceivedOrder" ErrorMessage="*" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            Display="Dynamic" ValidationGroup="vgReceived" />
                                        <asp:RangeValidator ID="RangeNumberReceivedOrder" ControlToValidate="txtNumberReceivedOrder"
                                            MinimumValue="0.01" MaximumValue="999999999.99" Type="Double" Text="Invalid amount"
                                            CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop" Display="Dynamic"
                                            ValidationGroup="vgReceived" runat="server" />
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNumberReceived" runat="server"
                                            TargetControlID="txtNumberReceivedOrder" FilterType="Numbers, Custom" ValidChars="."
                                            FilterMode="ValidChars" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">of the</span>
                                        <asp:Label Text='<%#Eval("NotReceivedQuantityFormatted")%>' CssClass="ROFloatLeft ROLabelText ROMarginRight ROMarginTop"
                                            runat="server" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">left on the order.</span>
                                    </div>
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td colspan="4">
                                    <div id="ActionAreaReturned" runat="server" style="display: none;" class="ROMarginLeft ROMarginBottom ROFloatLeft ROMarginRight">
                                        <asp:Label ID="YourActionReturned" Text="I returned" CssClass="ROFloatLeft ROInformativeText ROMarginTop ROMarginRight"
                                            runat="server" />
                                        <asp:DropDownList ID="ddlNumberReturned" runat="server" CssClass="ROFloatLeft ROMarginRight" />
                                        <asp:TextBox ID="txtNumberReturned" runat="server" MaxLength="12" CssClass="ROFloatLeft ROMarginRight RORight" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumberReturned" runat="server"
                                            Enabled="false" ControlToValidate="txtNumberReturned" ErrorMessage="*" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            Display="Dynamic" ValidationGroup="vgReceived" />
                                        <asp:RangeValidator ID="RangeNumberReturned" ControlToValidate="txtNumberReturned"
                                            MinimumValue="0.01" MaximumValue="999999999.99" Type="Double" Text="Invalid amount"
                                            CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop" Display="Dynamic"
                                            ValidationGroup="vgReceived" runat="server" />
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNumberReturned" runat="server"
                                            TargetControlID="txtNumberReturned" FilterType="Numbers, Custom" ValidChars="."
                                            FilterMode="ValidChars" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">of the</span>
                                        <asp:Label Text='<%#Eval("NotReceivedQuantityFormatted")%>' CssClass="ROFloatLeft ROLabelText ROMarginRight ROMarginTop"
                                            runat="server" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginTop">(</span> 
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop"><%# Convert.ToDecimal(Eval("Inventory.UnitCost")).ToString("C2")%></span>                                    
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop"> each) left on the order.</span>
                                        <asp:CheckBox ID="chkReorder" Checked="true" runat="server" CssClass="ROFloatLeft ROMarginLeft RONoWrap ROInformativeText" Text="Expecting replacement" />
                                        <span class="ROMarginLeft ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">Why returned</span>
                                        <asp:TextBox ID="txtReturnReason" runat="server" class="ROFloatLeft ROMarginRight"
                                            MaxLength="255" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorReturnReason" runat="server"
                                            Enabled="false" ErrorMessage="*" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            ControlToValidate="txtReturnReason" Display="Dynamic" ValidationGroup="vgReceived" />
                                    </div>
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td colspan="4">
                                    <asp:TextBox Style="display: none;" ID="hiddenNumberReceivedReturnedIsValid" value="1"
                                        runat="server" />
                                    <asp:CustomValidator ID="CustomValidatorReceivedReturned" ControlToValidate="hiddenNumberReceivedReturnedIsValid"
                                        ClientValidationFunction="CheckSumReceivedReturned" Display="Dynamic" CssClass="ROErrorText ROMarginLeft ROMarginBottom ROMarginTop ROMarginRight"
                                        ErrorMessage="Sum of received and returned items cannot exceed the total number of items left on the order."
                                        ValidationGroup="vgReceived" runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>  
            </div>             
        </td>
    </tr>
    <tr>
        <td class="ROPaddingLeft5">
            <span id="ReorderedAreaHeader" runat="server" class="ROHeaderText">Returned, expecting replacement</span>
        </td>
    </tr>
    <tr>
        <td class="ROPadding5">
            <div id="ReorderedArea" runat="server" class="RORepeaterBorder">
                <table class="ROLayoutTable RORowPadding ROStretchWidth">
                    <asp:Repeater ID="rReorderedLineItems" OnItemCreated="rPOLineItems_ItemCreated" OnItemDataBound="rReordered_ItemDataBound"
                        runat="server">
                        <ItemTemplate>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td>
                                    <asp:ImageButton ID='reqLineItemFeedbackButton' ImageUrl='<%# DeriveItemFeedbackIcon(Eval("TransKeyLineNum"))%>'
                                        CommandArgument='<%# Eval("TransKeyLineNum") %>' CssClass="ROMarginLeft ROMarginRight ROFloatLeft"
                                        OnClick="feedbackButton_Click" runat="server" AlternateText='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                                <td class="ROActionWidth">
                                    <asp:CheckBox ID="chkReceivedReordered" runat="server" CssClass="RONoWrap ROMarginRight ROLabelText"
                                        Text="I received" />
                                    <asp:CheckBox ID="chkReturned" runat="server" CssClass="RONoWrap ROLabelText" Text="no longer need" />
                                </td>
                                <td class="ROStretchWidth">
                                    <asp:Label ID="RemainingItemCount" Text='<%# Eval("ReorderedQuantityFormatted")%>'
                                        CssClass="ROFloatLeft ROMarginLeft ROMarginRight ROMarginTop" runat="server" />
                                    <span class="ROFloatLeft ROMarginRight ROMarginTop">
                                        <%# Eval("Inventory.Description")%></span>
                                    <asp:Label ID="RemainingAmount" CssClass="ROFloatLeft ROInformativeText ROMarginLeft ROMarginRight ROMarginTop"
                                        Text='<%# Convert.ToDecimal(Eval("ReorderedAmount")).ToString("C2")%>' runat="server" />
                                    <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">to</span>
                                    <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                        <%#Eval("AccountDesc") %></span> <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                            <%#Eval("FormattedAccountCode")%></span>
                                    <input type="hidden" id="hiddenNumberReceivedReordered" value="0" runat="server" />
                                    <input type="hidden" id="hiddenNumberReturned" value="0" runat="server" />
                                    <input type="hidden" id="hiddenTransKeyLineNum" value='<%#Eval("TransKeyLineNum")%>'
                                        runat="server" />
                                </td>
                                <td class="RONoWrap">
                                    <asp:LinkButton ID="reqLineItemSupportNeededButton" Text="Support Needed" CommandArgument='<%# Eval("TransKeyLineNum") %>'
                                        OnClick="supportNeededButton_Click" runat="server" CssClass='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td colspan="4">
                                    <div id="ActionAreaReceivedReordered" runat="server" style="display: none;" class="ROMarginLeft ROMarginBottom ROFloatLeft ROMarginRight">
                                        <asp:Label ID="YourActionReceived" Text="I received" CssClass="ROFloatLeft ROInformativeText ROMarginTop ROMarginRight"
                                            runat="server" />
                                        <asp:DropDownList ID="ddlNumberReceivedReordered" runat="server" CssClass="ROFloatLeft ROMarginRight" />
                                        <asp:TextBox ID="txtNumberReceivedReordered" runat="server" MaxLength="12" CssClass="ROFloatLeft ROMarginRight RORight" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumberReceivedReordered" runat="server"
                                            Enabled="false" ControlToValidate="txtNumberReceivedReordered" ErrorMessage="*"
                                            CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop" Display="Dynamic"
                                            ValidationGroup="vgReceived" />
                                        <asp:RangeValidator ID="RangeNumberReceivedReordered" ControlToValidate="txtNumberReceivedReordered"
                                            MinimumValue="0.01" MaximumValue="999999999.99" Type="Double" Text="Invalid amount"
                                            CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop" Display="Dynamic"
                                            ValidationGroup="vgReceived" runat="server" />
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNumberReceived" runat="server"
                                            TargetControlID="txtNumberReceivedReordered" FilterType="Numbers, Custom" ValidChars="."
                                            FilterMode="ValidChars" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">of the</span>
                                        <asp:Label Text='<%#Eval("ReorderedQuantityFormatted")%>' CssClass="ROFloatLeft ROLabelText ROMarginRight ROMarginTop"
                                            runat="server" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">left on the order.</span>
                                    </div>
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td colspan="4">
                                    <div id="ActionAreaReturned" runat="server" style="display: none;" class="ROMarginLeft ROMarginBottom ROFloatLeft ROMarginRight">
                                        <asp:Label ID="YourActionReturned" Text="I no longer need" CssClass="ROFloatLeft ROInformativeText ROMarginTop ROMarginRight"
                                            runat="server" />
                                        <asp:DropDownList ID="ddlNumberReturned" runat="server" CssClass="ROFloatLeft ROMarginRight" />
                                        <asp:TextBox ID="txtNumberReturned" runat="server" MaxLength="12" CssClass="ROFloatLeft ROMarginRight RORight" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumberReturned" runat="server"
                                            Enabled="false" ControlToValidate="txtNumberReturned" ErrorMessage="*" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            Display="Dynamic" ValidationGroup="vgReceived" />
                                        <asp:RangeValidator ID="RangeNumberReturned" ControlToValidate="txtNumberReturned"
                                            MinimumValue="0.01" MaximumValue="999999999.99" Type="Double" Text="Invalid amount"
                                            CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop" Display="Dynamic"
                                            ValidationGroup="vgReceived" runat="server" />
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNumberReturned" runat="server"
                                            TargetControlID="txtNumberReturned" FilterType="Numbers, Custom" ValidChars="."
                                            FilterMode="ValidChars" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">of the</span>
                                        <asp:Label Text='<%#Eval("ReorderedQuantityFormatted")%>' CssClass="ROFloatLeft ROLabelText ROMarginRight ROMarginTop"
                                            runat="server" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginTop">(</span> 
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">
                                            <%# Convert.ToDecimal(Eval("Inventory.UnitCost")).ToString("C2")%></span> 
                                       <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">
                                                each) returned because of</span> 
                                       <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                                        <%# Eval("ReturnReason")%></span>                                   
                                    </div>
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td colspan="4">
                                    <asp:TextBox Style="display: none;" ID="hiddenNumberReceivedReturnedIsValid" value="1"
                                        runat="server" />
                                    <asp:CustomValidator ID="CustomValidatorReceivedReturned" ControlToValidate="hiddenNumberReceivedReturnedIsValid"
                                        ClientValidationFunction="CheckSumReceivedReturned" Display="Dynamic" CssClass="ROErrorText ROMarginLeft ROMarginBottom ROMarginTop ROMarginRight"
                                        ErrorMessage="Sum of received and no longer needed items cannot exceed the total number of items expecting replacement."
                                        ValidationGroup="vgReceived" runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </td>
    </tr>

    <tr>
        <td class="ROPaddingLeft5">
            <span id="ReturnedAreaHeader" runat="server" class="ROHeaderText">Returned, not needed</span>
        </td>
    </tr>
    <tr>
        <td class="ROPadding5">
            <div id="ReturnedArea" runat="server" class="RORepeaterBorder">
                <table class="ROLayoutTable RORowPadding ROStretchWidth">
                    <asp:Repeater ID="rReturnedLineItems" OnItemCreated="rPOLineItems_ItemCreated" OnItemDataBound="rReturnedLineItems_ItemDataBound"
                        runat="server">
                        <ItemTemplate>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td>
                                    <asp:ImageButton ID='reqLineItemFeedbackButton' ImageUrl='<%# DeriveItemFeedbackIcon(Eval("TransKeyLineNum"))%>'
                                        CommandArgument='<%# Eval("TransKeyLineNum") %>' CssClass="ROMarginLeft ROMarginRight ROFloatLeft"
                                        OnClick="feedbackButton_Click" runat="server" AlternateText='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                                <td class="ROActionWidth">
                                    <asp:CheckBox ID="chkReorder" runat="server" CssClass="RONoWrap ROLabelText"
                                        Text="I need replaced after all" />
                                </td>
                                <td class="ROStretchWidth">
                                    <asp:Label ID="ReturnedItemCount" Text='<%#Eval("ReturnedQuantityFormatted")%>' CssClass="ROFloatLeft ROMarginLeft ROMarginRight ROMarginTop"
                                        runat="server" />
                                    <span class="ROFloatLeft ROMarginRight ROMarginTop">
                                        <%# Eval("Inventory.Description")%></span>
                                    <asp:Label ID="ReturnedAmount" CssClass="ROFloatLeft ROInformativeText ROItalicText ROMarginLeft ROMarginRight ROMarginTop"
                                        Text='<%# Convert.ToDecimal(Eval("ReturnedAmount")).ToString("C2")%>' runat="server" />
                                    <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">to</span>
                                    <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                        <%#Eval("AccountDesc") %></span> <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                            <%#Eval("FormattedAccountCode")%></span>
                                    <input type="hidden" id="hiddenNumber" value="0" runat="server" />
                                    <input type="hidden" id="hiddenTransKeyLineNum" value='<%#Eval("TransKeyLineNum")%>'
                                        runat="server" />
                                </td>
                                <td class="RONoWrap">
                                    <asp:LinkButton ID="reqLineItemSupportNeededButton" Text="Support Needed" CommandArgument='<%# Eval("TransKeyLineNum") %>'
                                        OnClick="supportNeededButton_Click" runat="server" CssClass='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td colspan="4">
                                    <div id="ActionArea" runat="server" style="display: none;" class="ROMarginLeft ROMarginBottom ROFloatLeft ROMarginRight">
                                        <asp:Label ID="YourAction" Text="I need" CssClass="ROFloatLeft ROInformativeText ROMarginTop ROMarginRight"
                                            runat="server" />
                                        <asp:DropDownList ID="ddlNumber" runat="server" CssClass="ROFloatLeft ROMarginRight" />
                                        <asp:TextBox ID="txtNumber" runat="server" MaxLength="12" CssClass="ROFloatLeft ROMarginRight RORight" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumber" runat="server" ErrorMessage="*"
                                            Enabled="false" ControlToValidate="txtNumber" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            Display="Dynamic" ValidationGroup="vgReturned" />
                                        <asp:RangeValidator ID="RangeNumber" ControlToValidate="txtNumber" MinimumValue="0.01"
                                            MaximumValue="999999999.99" Type="Double" Text="Invalid amount" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            Display="Dynamic" ValidationGroup="vgReturned" runat="server" />
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNumber" runat="server"
                                            TargetControlID="txtNumber" FilterType="Numbers, Custom" ValidChars="." FilterMode="ValidChars" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">of the</span>
                                        <asp:Label ID="Returned" Text='<%#Eval("ReturnedQuantityFormatted")%>' CssClass="ROFloatLeft ROLabelText ROMarginRight ROMarginTop"
                                            runat="server" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginTop">(</span> <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">
                                            <%# Convert.ToDecimal(Eval("Inventory.UnitCost")).ToString("C2")%></span> <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">
                                                each) returned because of</span> 
                                        <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                            <%# Eval("ReturnReason")%></span>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </td>
    </tr>

    <tr>
        <td class="ROPaddingLeft5">
            <span id="ReceivedAreaHeader" runat="server" class="ROHeaderText">Received</span>
        </td>
    </tr>
    <tr>
        <td class="ROPadding5">
            <div id="ReceivedArea" runat="server" class="RORepeaterBorder">
                <table class="ROLayoutTable RORowPadding ROStretchWidth">
                    <asp:Repeater ID="rReceivedLineItems" OnItemCreated="rPOLineItems_ItemCreated" OnItemDataBound="rReceivedLineItems_ItemDataBound"
                        runat="server">
                        <ItemTemplate>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>
                                <td>
                                    <asp:ImageButton ID='reqLineItemFeedbackButton' ImageUrl='<%# DeriveItemFeedbackIcon(Eval("TransKeyLineNum"))%>'
                                        CommandArgument='<%# Eval("TransKeyLineNum") %>' CssClass="ROMarginLeft ROMarginRight ROFloatLeft"
                                        OnClick="feedbackButton_Click" runat="server" AlternateText='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                                <td class="ROActionWidth">
                                    <asp:CheckBox ID="chkNotReceived" runat="server" CssClass="RONoWrap ROLabelText" Text="I did not receive yet" />
                                </td>
                                <td class="ROStretchWidth">
                                    <asp:Label ID="ReceivedItemCount" Text='<%#Eval("ReceivedQuantityFormatted")%>' CssClass="ROFloatLeft ROMarginLeft ROMarginRight ROMarginTop"
                                        runat="server" />
                                    <span class="ROFloatLeft ROMarginRight ROMarginTop"><%# Eval("Inventory.Description")%></span>                              
                                    <asp:Label ID="ReceivedAmount" CssClass="ROFloatLeft ROInformativeText ROItalicText ROMarginLeft ROMarginRight ROMarginTop"
                                        Text='<%# Convert.ToDecimal(Eval("ReceivedAmount")).ToString("C2")%>' runat="server" />
                                    <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">to</span>
                                    <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                        <%#Eval("AccountDesc") %></span> <span class="ROFloatLeft ROInformativeText ROItalicText ROMarginRight ROMarginTop">
                                            <%#Eval("FormattedAccountCode")%></span>
                                    <input type="hidden" id="hiddenNumber" value="0" runat="server" />
                                    <input type="hidden" id="hiddenTransKeyLineNum" value='<%#Eval("TransKeyLineNum")%>'
                                        runat="server" />
                                </td>
                                <td class="RONoWrap">
                                    <asp:LinkButton ID="reqLineItemSupportNeededButton" Text="Support Needed" CommandArgument='<%# Eval("TransKeyLineNum") %>'
                                        OnClick="supportNeededButton_Click" runat="server" CssClass='<%# Eval("TransKeyLineNum") %>' />
                                </td>
                            </tr>
                            <tr class='<%# Container.ItemIndex % 2 == 0 ? "" : "ROAltRow" %>'>                           
                                <td colspan="4">
                                    <div id="ActionArea" runat="server" style="display: none;" class="ROMarginLeft ROMarginBottom ROFloatLeft ROMarginRight">
                                        <asp:Label ID="YourAction" Text="Mark" CssClass="ROFloatLeft ROInformativeText ROMarginTop ROMarginRight"
                                            runat="server" />
                                        <asp:DropDownList ID="ddlNumber" runat="server" CssClass="ROFloatLeft ROMarginRight" />
                                        <asp:TextBox ID="txtNumber" runat="server" MaxLength="12" CssClass="ROFloatLeft ROMarginRight RORight" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumber" runat="server" ErrorMessage="*" Enabled="false"
                                            ControlToValidate="txtNumber" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            Display="Dynamic" ValidationGroup="vgReceived" />
                                        <asp:RangeValidator ID="RangeNumber" ControlToValidate="txtNumber" MinimumValue="0.01"
                                            MaximumValue="999999999.99" Type="Double" Text="Invalid amount" CssClass="ROErrorText ROFloatLeft ROMarginRight ROMarginTop"
                                            Display="Dynamic" ValidationGroup="vgReceived" runat="server" />
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderNumber" runat="server"
                                            TargetControlID="txtNumber" FilterType="Numbers, Custom" ValidChars="." FilterMode="ValidChars" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">of the</span>  
                                        <asp:Label ID="Received" Text='<%#Eval("ReceivedQuantityFormatted")%>' CssClass="ROFloatLeft ROLabelText ROMarginRight ROMarginTop"
                                            runat="server" />
                                        <span class="ROFloatLeft ROInformativeText ROMarginRight ROMarginTop">marked received as not received.</span>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <span class="ROFloatRight ROErrorText">* Required, please fill these out.</span>
        </td>
    </tr>
    
    <tr>
        <td>
            <table class="ROMarginRight ROGreyButtonBox ROStretchWidth RONoMarginPadding">
                <tr class="RONoMarginPadding">
                    <td class="ROBlueButtonBox">
                        <asp:Button ID="btnDone" CssClass="ROFloatLeft ROMarginLeft  ROMarginTop ROVerticalAlignCenter "
                            Text="Save" OnClick="btnSave_Click" runat="server" ValidationGroup="vgReceived" />
                    </td>
                    <td class="ROPadding5 ROStretchWidth">
                        <asp:LinkButton ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" CssClass="ROMarginLeft"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>   
</table>

<asp:Button ID="btnShowPOItemFeedbackPopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="POItemFeedbackPopup" runat="server" TargetControlID="btnShowPOItemFeedbackPopup"
    PopupControlID="_divFeedbackModal" PopupDragHandleControlID="POItemFeedbackModalHeader"
    BackgroundCssClass="ROModalPopup" BehaviorID="POItemFeedbackPopupBehaviorID" />
<div id="_divFeedbackModal" runat="server" class="ROModalDiv ROFeedbackWidthHeight"
    style="display: none;">
    <div class="ROInnerModal">
        <div id="POItemFeedbackModalHeader" class="ROModalHeading">
            <asp:ImageButton ID="_imgFeedbackClose" CssClass="ROModalHeadingImg" runat="server" />
            <asp:UpdatePanel ID="upFeedbackModalHeader" ChildrenAsTriggers="false" UpdateMode="Conditional"
                runat="server">
                <ContentTemplate>
                    <asp:Label ID="_lblFeedbackName" CssClass="ROHeaderText ROBoldText" runat="server" />
                    <asp:Label ID="Label1" Text=" Comments" CssClass="ROHeaderText" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <fb:FeedbackView ID="modalFeedbackView" runat="server" GlobalObjectType="<%# EX.Data.Constants.StaffConstants.TRANS_HIST_EXT %>"
            IsModalFeedback="<%# true %>" AttachmentUseCde="<%# ROConstants.PO_PROCESS %>"
            AttachmentTypeCde="<%# ROConstants.PO_SUPPORT %>" />
    </div>
</div>

<asp:Button ID="btnShowReturnedItemInvoicedMessagePopup" runat="server" Style="display: none" />
<ajaxToolkit:ModalPopupExtender ID="ReturnedItemInvoicedMessagePopup" runat="server"
    TargetControlID="btnShowReturnedItemInvoicedMessagePopup" PopupControlID="_divReturnedItemInvoicedMessageModal"
    PopupDragHandleControlID="ReturnedItemInvoicedMessageModalHeader" BackgroundCssClass="ROModalPopup"
    BehaviorID="ReturnedItemInvoicedMessagePopupBehaviorID" />
<div id="_divReturnedItemInvoicedMessageModal" runat="server" class="ROModalDiv RAMessageWidthHeight"
    style="display: none;">
    <div class="ROInnerModal">
        <asp:UpdatePanel ID="upReturnedItemInvoicedMessage" ChildrenAsTriggers="false" UpdateMode="Conditional"
            runat="server">
            <ContentTemplate>
                <div id="ReturnedItemInvoicedMessageModalHeader" class="ROModalHeading">
                    <asp:Label ID="ReturnedItemInvoicedMessageHeaderText" Text="<%# PurchaseOrder.RefTextNum %>"
                        runat="server" CssClass="ROHeaderText" />
                    <asp:ImageButton runat="server" CssClass="ROModalHeadingImg" ImageUrl="<%# GetCloseIcon() %>"
                        OnClientClick="$find('ReturnedItemInvoicedMessagePopupBehaviorID').hide(); return false;" />
                </div>
                <table>
                    <tr>
                        <td>
                            <span class="ROLabelText ROMarginRight">The</span><asp:Label ID="ReturnedItemInvoicedMessageText"
                                CssClass="ROLabelText ROMarginRight" runat="server" /><span class="ROLabelText ROMarginRight">you
                                    have returned has already been invoiced. Please contact</span><asp:HyperLink ID="APClerkEmailIcon" CssClass="ROMarginRight"
                                        ImageUrl='<%# GetEmailIcon()%>' runat="server" /><asp:HyperLink ID="APClerkEmailLink" runat="server" Text='<%# GLConfig.APClerkEmail %>'
                                            CssClass="ROMarginRight" /><asp:Label ID="APClerkText" Text="the AP Clerk" CssClass="ROLabelText ROMarginRight" runat="server" /><span class="ROLabelText ROMarginRight">so a credit memo
                                                can be requested from this vendor. </span>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<input type="hidden" id="hiddenFeedbackTransKeyLineNum" runat="server" />
<input type="hidden" id="hiddenFeedbackButtonID" runat="server" />
<input type="hidden" id="hiddenSupportNeededButtonID" runat="server" />
<input type="hidden" id="hiddenGroupNum" runat="server" value="<%# PurchaseOrder.GroupNum %>" />
<input type="hidden" id="hiddenCommentAddIconSrc" runat="server" />
<input type="hidden" id="hiddenCommentNewIconSrc" runat="server" />
<input type="hidden" id="hiddenCommentIconSrc" runat="server" />
<script type="text/javascript">
    function format(elementID, amount, format) {
    
        $.ajax({
            type: "POST",
            data: '{ d: ' + amount + ', format: "' + format + '" }',
            dataType: "json",
            url: '<%# ResolveUrl("../WebService/UtilityWebService.asmx/Format") %>',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                document.getElementById(elementID).innerHTML = data.d;
            },
            error: function (jqX, status, err) { alert('Error: ' + err); }
        })
    }

    function SetFeedbackTransKeyLineNum(feedbackButton, supportNeededButtonClientID, transKeyLineNum)
    {
        document.getElementById("<%# hiddenFeedbackTransKeyLineNum.ClientID %>").value = transKeyLineNum;
        document.getElementById("<%# hiddenFeedbackButtonID.ClientID %>").value = feedbackButton.id;
        document.getElementById("<%# hiddenSupportNeededButtonID.ClientID %>").value = supportNeededButtonClientID;        
        
        feedbackButton.click();
    }

    function SupportNeeded(supportNeededButton, feedbackButtonClientID, transKeyLineNum)
    {
        document.getElementById("<%# hiddenFeedbackTransKeyLineNum.ClientID %>").value = transKeyLineNum;
        document.getElementById("<%# hiddenFeedbackButtonID.ClientID %>").value = feedbackButtonClientID;
        document.getElementById("<%# hiddenSupportNeededButtonID.ClientID %>").value = supportNeededButton.id;    

        supportNeededButton.click();
    }

    function RefreshFeedbackButton()
    {
        var transKeyLineNum = document.getElementById("<%# hiddenFeedbackTransKeyLineNum.ClientID %>").value;
        var hiddenFeedbackButtonID = document.getElementById("<%# hiddenFeedbackButtonID.ClientID %>").value;
        var supportNeededButtonID = document.getElementById("<%# hiddenSupportNeededButtonID.ClientID %>").value;
        var groupNum = document.getElementById("<%# hiddenGroupNum.ClientID %>").value;

        $.ajax({
            type: "POST",
            async: true,
            data: '{ groupNum: ' + groupNum + ', transKeyLineNum: ' + transKeyLineNum + ', sourceCode: "PO" }',
            dataType: "json",
            url: '<%# ResolveUrl("../WebService/FeedbackIconWebService.asmx/GetFeedbackIcon") %>',
            contentType: "application/json; charset=utf-8",
            success: function (data)
            {
                var icon = data.d;
                var source;

                switch (icon) {
                    case "<%# ROConstants.IconCommentAdd %>":
                        source = document.getElementById("<%# hiddenCommentAddIconSrc.ClientID %>").value;
                        break;
                    case "<%# ROConstants.IconCommentNew %>":
                        source = document.getElementById("<%# hiddenCommentNewIconSrc.ClientID %>").value;
                        break;
                    case "<%# ROConstants.IconComment %>":
                        source = document.getElementById("<%# hiddenCommentIconSrc.ClientID %>").value;
                        break;
                }

                $("[id*=reqLineItemFeedbackButton]").each(function ()
                {
                    var curReqLineItemFeedbackButton = this;
                    if (curReqLineItemFeedbackButton.alt == transKeyLineNum) {
                        //curReqLineItemFeedbackButton.src = source;
                        document.getElementById(curReqLineItemFeedbackButton.id).src = source;
                    }
                });
            },
            error: function (jqX, status, err)
            {
                //alert('Error: ' + jqX.responseText); 
            }
        });


        $.ajax({
            type: "POST",
            async: true,
            data: '{ groupNum: ' + groupNum + ', transKeyLineNum: ' + transKeyLineNum + ' }',
            dataType: "json",
            url: '<%# ResolveUrl("../WebService/SupportNeededWebService.asmx/IsSupportNeeded") %>',
            contentType: "application/json; charset=utf-8",
            success: function (data)
            {
                var isSupportNeeded = data.d;

                $("[id*=reqLineItemSupportNeededButton]").each(function ()
                {
                    var curReqLineItemSupportNeededButton = this;
                    if (curReqLineItemSupportNeededButton.className == transKeyLineNum) {

                        //curReqLineItemSupportNeededButton.style.display = isSupportNeeded ? "block" : "none";
                       document.getElementById(curReqLineItemSupportNeededButton.id).style.display = isSupportNeeded ? "block" : "none";
                    }
                });
            },
            error: function (jqX, status, err)
            {
                //alert('Error: ' + jqX.responseText); 
            }
        });

        $find('POItemFeedbackPopupBehaviorID').hide();
    }

    function ShowDetailDDL(show, ddlNumberID, ActionAreaID, hiddenNumberID, max)
    {
        var divActionArea = document.getElementById(ActionAreaID);
        var hiddenNumber = document.getElementById(hiddenNumberID);

        if (show) {

            divActionArea.style.display = 'block';

            if (document.getElementById(ddlNumberID) != null) {
                var ddlNumber = document.getElementById(ddlNumberID);

                max = parseFloat(max);

                ddlNumber.options.length = 0;
                if (max == 0) {
                    hiddenNumber.value = 0;

                    try {
                        ddlNumber.appendChild(new Option(max, max, null)); // standards compliant; doesn't work in IE
                    } catch (ex) {
                        ddlNumber.appendChild(new Option(max, max));    // IE only
                    }
                }
                else {
                    if (max < 1) {
                        hiddenNumber.value = max;
                    }
                    else {
                        hiddenNumber.value = 1;
                    }

                    var i;
                    for (i = 1; i <= max; i++) {
                        AddNumberToDropDown(ddlNumber, i);
                    }

                    if ((i - 1) < max) {
                        //max may not be a whole number.
                        AddNumberToDropDown(ddlNumber, max);
                    }
                }

                setSelectedIndex(ddlNumber, hiddenNumber.value);
            }
            else {
                hiddenNumber.value = 0;
            }
        }
        else {
            hiddenNumber.value = 0;
            divActionArea.style.display = 'none';

            return;
        }
    }

    function ShowDetailTXT(show, ActionAreaID)
    {
        var divActionArea = document.getElementById(ActionAreaID);

        if (show) {
            divActionArea.style.display = 'block';
        }
        else {
            divActionArea.style.display = 'none';

            return;
        }
    }

    function SetHiddenNumberReceivedReturnedIsValidDDL(ddlVal1ID, ddlVal2ID, hiddenNumberReceivedReturnedIsValidID, max)
    {
        var ddlVal1 = document.getElementById(ddlVal1ID);
        var ddlVal2 = document.getElementById(ddlVal2ID);
        var hiddenNumberReceivedReturnedIsValid = document.getElementById(hiddenNumberReceivedReturnedIsValidID);

        if ((ddlVal1 == null) || (ddlVal2 == null)) {
            hiddenNumberReceivedReturnedIsValid = 1;
            return;
        }
             
        var val1 = 0;
        var val2 = 0;

        if (ddlVal1.selectedIndex > -1) {
            val1 = ddlVal1.options[ddlVal1.selectedIndex].value;
        }

        if ((ddlVal2 != null) && (ddlVal2.selectedIndex > -1)) {
            val2 = ddlVal2.options[ddlVal2.selectedIndex].value;
        }

        if ((parseFloat(val1) + parseFloat(val2)) <= max) {
            hiddenNumberReceivedReturnedIsValid.value = 1;
        }
        else if ((parseFloat(val1) <= max) && (parseFloat(val2) <= max)) {
            //Individual fields are within limits, but not sum
            hiddenNumberReceivedReturnedIsValid.value = 0;
        }
        else {
            //Trigger individual field validation instead
            hiddenNumberReceivedReturnedIsValid.value = 1;
        }
    }

    function SetHiddenNumberReceivedReturnedIsValidTXT(txtVal1, txtVal2ID, hiddenNumberReceivedReturnedIsValidID, max)
    {
        var txtVal2 = document.getElementById(txtVal2ID);
        var hiddenNumberReceivedReturnedIsValid = document.getElementById(hiddenNumberReceivedReturnedIsValidID);

        var val1 = 0;
        var val2 = 0;

        if (txtVal1.value != '') {
            val1 = txtVal1.value;
        }

        if ((txtVal2 != null) && (txtVal2.value != '')) {
            val2 = txtVal2.value;
        }

        if ((parseFloat(val1) + parseFloat(val2)) <= max) {
            hiddenNumberReceivedReturnedIsValid.value = 1;
        }
        else if ((parseFloat(val1) <= max) && (parseFloat(val2) <= max)) {
            //Individual fields are within limits, but not sum
            hiddenNumberReceivedReturnedIsValid.value = 0;
        }
        else {
            //Trigger individual field validation instead
            hiddenNumberReceivedReturnedIsValid.value = 1;
        }
    }

    function CheckSumReceivedReturned(source, arguments)
    {
        if (arguments.Value == 1) {
            arguments.IsValid = true;
        } else {
            arguments.IsValid = false;
        }
    }

    function CustomValidatorReceivedReturnedEnableDisable(show, show2ID, reqValID)
    {
        var show2 = document.getElementById(show2ID);
        show = (show && show2.checked);

        var reqVal = document.getElementById(reqValID);

        ValidatorEnable(reqVal, show); //For Disabling
    }

    function ValidatorEnableDisable(show, reqValID)
    {
        var reqVal = document.getElementById(reqValID);

        ValidatorEnable(reqVal, show); //For Disabling
    }

    function AddNumberToDropDown(ddlNumber, i)
    {
        try {
            ddlNumber.appendChild(new Option(i, i, null)); // standards compliant; doesn't work in IE
        } catch (ex) {
            ddlNumber.appendChild(new Option(i, i));    // IE only
        }
    }
    
    function SetHiddenNumber(ddlNumber, hiddenNumberID)
    {
        var hiddenNumber = document.getElementById(hiddenNumberID);
        hiddenNumber.value = ddlNumber.options[ddlNumber.selectedIndex].value;
    }
    
    function MarkAll(show, MarkAllReceivedID, MarkAllNotReceivedID)
    {
        $("[id*=chkReceivedOrder]").each(function ()
        {
            var checkbox = this;

            if ($(checkbox).is(':checked') != show) {
                checkbox.click();
            }
        });

        if (show) {
            $("[id*=ddlNumberReceivedOrder]").each(function ()
            {
                var dll = this;
                dll.options[(dll.options.length - 1)].selected = true;
                dll.onchange();
            });
                        
            $("[id*=RangeNumberReceivedOrder]").each(function ()
            {
                var range = this;
                var txt = document.getElementById(range.controltovalidate);

                if (txt != null) {
                    txt.value = range.maximumvalue;
                }
            });
        }

        showHide(document.getElementById(MarkAllReceivedID));
        showHide(document.getElementById(MarkAllNotReceivedID));
    }

</script>