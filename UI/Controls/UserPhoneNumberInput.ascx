<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserPhoneNumberInput.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.Controls.UserPhoneNumberInput" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Telephony" %>

<%: Styles.Render("~/UI/Common/Styles/glyphicon-bundle.css") %>

<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="user-phone-number-input">
            <div class="feedbackMessage no-user-phone-numbers" id="divNoUserPhoneNumbers" runat="server" visible="False">
                <%=Globalizer.GetString("MSG_NO_USER_PHONE_NUMBERS") %>
            </div>
            <div class="feedbackMessage no-user-phone-numbers" id="divNoPhoneNumberTypes" runat="server" visible="False">
                <%=Globalizer.GetString("MSG_USER_PHONE_NUMBER_NO_TYPES") %>
            </div>
            <asp:Repeater runat="server" ID="phoneNumbersRepeater">
                <ItemTemplate>
                    <div class="entity-cards-container phone-number">
                        <div id="divPhoneNumberUpdateError" runat="server" class="feedbackError phone-number-error" visible="False">
                        </div>
                        <div class="entity-card-container phone-number" id="phoneNumberEntityCard" runat="server" data-itemid='<%# DataBinder.Eval(Container.DataItem, "ID")%>'>
                            <div class="entity-card buttonsContainer">
                                <asp:LinkButton ID="lnkDeletePhoneNumber" runat="server" CssClass="glyphicon glyphicon-minus-sign" CommandName="delete">
                                                <span class="screenReaderText">Delete</span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkEditPhoneNumber" runat="server" CssClass="glyphicon glyphicon-pencil" CommandName="edit">
                                                <span class="screenReaderText">Edit</span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkCancelPhoneNumberUpdate" runat="server" Visible="False" CssClass="glyphicon glyphicon-remove" CommandName="cancel">
                                                <span class="screenReaderText">Cancel</span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkUpdatePhoneNumber" runat="server" Visible="False" CssClass="glyphicon glyphicon-ok-sign" CommandName="update">
                                                <span class="screenReaderText">Save</span>
                                </asp:LinkButton>
                            </div>
                            <div class="entity-card contentContainer phone-number">
                                <div class="user-phone-number-details">

                                    <div class="phone-number-display" id="phoneNumberDisplayContainer" runat="server">
                                        <asp:Label runat="server" ID="phoneNumberDisplayLabel"></asp:Label>
                                        <div>
                                            <asp:Label runat="server" CssClass="phone-number-type-description" ID="phoneNumberTypeDescriptionLabel" Text="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.PhoneNumberType.Description %>">
                                                
                                            </asp:Label>
                                        </div>
                                    </div>
                                    <div class="phone-number-entry-fields" id="phoneNumberEntryFieldsContainer" runat="server" visible="False">
                                        <div class="phone-number-type">
                                            <asp:DropDownList runat="server" ID="phoneNumberTypesDropDownList" CssClass="edit-phone-number-type" AutoPostBack="True" />
                                            <label for="<%#Container.FindControl("phoneNumberTypesDropDownList").ClientID %>" class="screenReaderText">
                                                <%=Globalizer.GetString("LBL_PHONE_NUMBER_TYPE") %>
                                            </label>
                                        </div>
                                        <div>
                                            <span class="edit-phone-number-country-code header">
                                                <label for="<%# Container.FindControl("txtCountryCode").ClientID %>"><%=Globalizer.GetString("LBL_COUNTRY_CODE") %></label>
                                            </span>
                                            <span class="edit-phone-number-area-code header">
                                                <label for="<%# Container.FindControl("txtAreaCode").ClientID %>">
                                                    <%=Globalizer.GetString("LBL_AREA_CODE") %>
                                                </label>
                                                <label for="<%# Container.FindControl("txtExchangeNumber").ClientID %>" class="screenReaderText">
                                                    <%=Globalizer.GetString("LBL_EXCHANGE_NUMBER") %>
                                                </label>
                                                <label for="<%# Container.FindControl("txtLineNumber").ClientID %>" class="screenReaderText">
                                                    <%=Globalizer.GetString("LBL_LINE_NUMBER") %>
                                                </label>
                                            </span>
                                            <span class="edit-phone-number-extension header">
                                                <label for="<%# Container.FindControl("txtExtension").ClientID %>"><%=Globalizer.GetString("TXT_EXTENSION") %></label>
                                            </span>
                                        </div>
                                        <div>
                                            <span class="edit-phone-number-country-code fieldset">
                                                <asp:TextBox runat="server" ID="txtCountryCode" Width="1.5em" CssClass="country-code-textbox" Enabled="False" Text="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.CountryCode %>" />
                                                <span>+</span>
                                            </span>
                                            <span class="edit-phone-number-area-code fieldset">
                                                <span class="area-code-paren">(</span>
                                                <asp:TextBox runat="server" ID="txtAreaCode" Width="3em" MaxLength="3" Text="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.AreaCode %>" data-originalvalue="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.AreaCode %>" />
                                                <span class="area-code-paren">)</span>
                                                <asp:TextBox runat="server" ID="txtExchangeNumber" Width="3em" MaxLength="3" Text="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.SubscriberNumber.Substring(0, 3) %>" data-originalvalue="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.SubscriberNumber.Substring(0, 3) %>" />
                                                <span>-</span>
                                                <asp:TextBox runat="server" ID="txtLineNumber" Width="3em" MaxLength="4" Text="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.SubscriberNumber.Substring(3, 4) %>" data-originalvalue="<%# ((UserPhoneNumber)Container.DataItem).PhoneNumber.SubscriberNumber.Substring(3, 4) %>" />
                                            </span>
                                            <span class="edit-phone-number-extension fieldset">
                                                <asp:TextBox runat="server" ID="txtExtension" Width="3em" Text="<%#((UserPhoneNumber)Container.DataItem).PhoneNumber.Extension %>" data-originalvalue="<%#((UserPhoneNumber)Container.DataItem).PhoneNumber.Extension %>" />
                                            </span>
                                        </div>
                                        <div>
                                            <span class="edit-phone-number-country-code footer"></span>
                                            <span class="edit-phone-number-area-code footer"></span>
                                            <span class="edit-phone-number-extension footer">
                                                <span>* <%=Globalizer.GetString("TXT_OPTIONAL").ToLower(CultureInfo.CurrentCulture) %></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="phone-number-allow-text" id="allowTextsContainer" runat="server">
                                        <asp:CheckBox runat="server" ID="canSendTextsCheckBox" Enabled="False" Checked="<%# ((UserPhoneNumber)Container.DataItem).UseForTextMessaging %>" data-originalvalue="<%# ((UserPhoneNumber)Container.DataItem).UseForTextMessaging %>" />
                                        <label for='<%# Container.FindControl("canSendTextsCheckBox").ClientID %>'><%=AllowTextMessagesDisplayText %></label>
                                    </div>
                                    <div class="phone-number-allow-voice" id="allowCallsContainer" runat="server">
                                        <asp:CheckBox runat="server" ID="canCallCheckBox" Enabled="False" Checked="<%# ((UserPhoneNumber)Container.DataItem).UseForVoiceCalling %>" data-originalvalue="<%# ((UserPhoneNumber)Container.DataItem).UseForVoiceCalling %>" />
                                        <label for='<%# Container.FindControl("canCallCheckBox").ClientID %>'><%=AllowVoiceCallsDisplayText %></label>
                                    </div>
                                    <div>
                                        <asp:CheckBox runat="server" ID="isPreferredPhoneNumberCheckBox" Enabled="False" Checked="<%# ((UserPhoneNumber)Container.DataItem).IsPreferredPhoneNumber%>" data-originalvalue="<%# ((UserPhoneNumber)Container.DataItem).IsPreferredPhoneNumber%>" />
                                        <label for='<%# Container.FindControl("isPreferredPhoneNumberCheckBox").ClientID %>' runat="server" id="isPreferredPhoneNumberLabel"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div id="divAddPhoneNumberForm" runat="server" visible="False">
                <div id="divAddPhoneNumberError" runat="server" class="feedbackError phone-number-error" visible="False">
                </div>
                <div class="entity-cards-container phone-number">
                    <div class="entity-card-container phone-number" id="phoneNumberEntityCard" runat="server">
                        <div class="entity-card buttonsContainer">
                            <asp:LinkButton ID="lnkCancelPhoneNumberAdd" runat="server" CssClass="glyphicon glyphicon-remove" CommandName="cancel">
                    <span class="screenReaderText">Cancel</span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkSaveNewPhoneNumber" runat="server" CssClass="glyphicon glyphicon-ok-sign" CommandName="update">
                    <span class="screenReaderText">Save</span>
                            </asp:LinkButton>
                        </div>
                        <div class="entity-card contentContainer phone-number-type">
                            <div class="user-phone-number-details">
                                <div class="phone-number-type">
                                    <asp:DropDownList runat="server" ID="phoneNumberTypesDropDownList" AutoPostBack="true" CssClass="edit-phone-number-type" />
                                    <label for="<%=phoneNumberTypesDropDownList.ClientID %>" class="screenReaderText">
                                        <%=Globalizer.GetString("LBL_PHONE_NUMBER_TYPE") %>
                                    </label>
                                </div>
                                <div class="phone-number-display">
                                </div>
                                <div class="phone-number-entry-fields">
                                    <div>
                                        <span class="edit-phone-number-country-code header">
                                            <label for="<%=txtCountryCode.ClientID%>"><%=Globalizer.GetString("LBL_COUNTRY_CODE") %></label>
                                        </span>
                                        <span class="edit-phone-number-area-code header">
                                            <label for="<%=txtAreaCode.ClientID%>"><%=Globalizer.GetString("LBL_AREA_CODE") %></label>
                                            <label for="<%=txtExchangeNumber.ClientID%>" class="screenReaderText"><%=Globalizer.GetString("LBL_EXCHANGE_NUMBER") %></label>
                                            <label for="<%=txtLineNumber.ClientID%>" class="screenReaderText"><%=Globalizer.GetString("LBL_LINE_NUMBER") %></label>
                                        </span>
                                        <span class="edit-phone-number-extension header">
                                            <label for="<%=txtExtension.ClientID%>"><%=Globalizer.GetString("TXT_EXTENSION") %></label>
                                        </span>
                                    </div>
                                    <div>
                                        <span class="edit-phone-number-country-code fieldset">
                                            <asp:TextBox runat="server" ID="txtCountryCode" Width="1.5em" CssClass="country-code-textbox" Enabled="False" />
                                            <span>+</span>
                                        </span>
                                        <span class="edit-phone-number-area-code fieldset">
                                            <span class="area-code-paren">(</span>
                                            <asp:TextBox runat="server" ID="txtAreaCode" Width="3em" MaxLength="3" />
                                            <span class="area-code-paren">)</span>
                                            <asp:TextBox runat="server" ID="txtExchangeNumber" Width="3em" MaxLength="3" />
                                            <span>-</span>
                                            <asp:TextBox runat="server" ID="txtLineNumber" Width="4em" MaxLength="4" />
                                        </span>
                                        <span class="edit-phone-number-extension fieldset">
                                            <asp:TextBox runat="server" ID="txtExtension" Width="4em" />
                                        </span>
                                    </div>
                                    <div>
                                        <span class="edit-phone-number-country-code footer"></span>
                                        <span class="edit-phone-number-area-code footer"></span>
                                        <span class="edit-phone-number-extension footer">
                                            <span>*optional</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="phone-number-allow-text" id="allowTextsContainer" runat="server">
                                    <asp:CheckBox runat="server" ID="canSendTextsCheckBox" />
                                    <label for='<%= canSendTextsCheckBox.ClientID %>'><%=AllowTextMessagesDisplayText %></label>
                                </div>
                                <div class="phone-number-allow-voice" id="allowCallsContainer" runat="server">
                                    <asp:CheckBox runat="server" ID="canCallCheckBox" />
                                    <label for='<%=canCallCheckBox.ClientID %>'><%=AllowVoiceCallsDisplayText %></label>
                                </div>
                                <div id="isPreferredContainer" runat="server">
                                    <asp:CheckBox runat="server" ID="isPreferredPhoneNumberCheckBox" />
                                    <label for='<%=isPreferredPhoneNumberCheckBox.ClientID %>'>
                                        <%= IsPreferredTypePhoneNumberText%>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="add-phone-number-button-continer">
                <asp:LinkButton runat="server" ID="lnkShowAddPhoneNumberForm" CssClass="glyphicon glyphicon-plus-sign large">
                                <span class="screenReaderText"><%=Globalizer.GetString("MSG_ADD_NEW_PHONE_NUMBER") %></span>
                </asp:LinkButton>
                <asp:Label runat="server" ID="lblAddPhoneNumberDescription" class="entity-card-add-entity-description"><%=Globalizer.GetString("MSG_ADD_NEW_PHONE_NUMBER") %></asp:Label>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>