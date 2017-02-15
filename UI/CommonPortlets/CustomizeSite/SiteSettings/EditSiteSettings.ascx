<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="EditSiteSettings.ascx.cs"
    Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.EditSiteSettings" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>

<%: Styles.Render("~/UI/Common/Styles/glyphicon-bundle.css") %>

<cmn:Subheader ID="hdrSiteSettings" runat="server" />
<div class="pSection edit-site-settings">
    <cmn:ErrorDisplay ID="ctlError" runat="server" Visible="false" />
    <cmn:ContentTabGroup ID="SiteSettingTabs" runat="server">
        <cmn:ContentTab ID="tabGeneral" runat="Server" Visible="true" Selected="true">
            <h5>
                <cmn:GlobalizedLabel ID="lblPortal" runat="server" TextKey="LBL_PORTAL"></cmn:GlobalizedLabel>
            </h5>
            <fieldset>
                <table cellpadding="5">
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblPortalName" runat="server" TextKey="LBL_PORTAL_NAME"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtPortalName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvPortalName" ControlToValidate="txtPortalName"
                                runat="server" SetFocusOnError="true" ValidationGroup="firstTab" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label for="<%=txtInstitutionName.ClientID %>">Institution Name:</label>
                        </th>
                        <td>
                            <asp:TextBox runat="server" ID="txtInstitutionName"/>
                            <asp:RequiredFieldValidator ID="rfvInstitutionName" ControlToValidate="txtInstitutionName" runat="server" SetFocusOnError="true" ValidationGroup="firstTab" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblPortalAddress" runat="server" TextKey="LBL_PORTAL_ADDRESS"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtPortalAddress" runat="server" Width="400" />
                            <asp:RequiredFieldValidator ID="rfvPortalAddress" Display="Dynamic" ControlToValidate="txtPortalAddress"
                                runat="server" SetFocusOnError="true" ValidationGroup="firstTab" />
                            <cmn:GlobalizedLabel ID="lblPortalAddressNote" runat="server" TextKey="TXT_PORTAL_ADDRESS_NOTE"></cmn:GlobalizedLabel>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblEmulation" runat="server" TextKey="TXT_EMULATION"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="rblEmulation" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="lblSearchBoxLocation" runat="server" />
                        </th>
                        <td>
                            <asp:RadioButton runat="server" ID="rbSearchLocationNone" GroupName="SearchBoxLocation" />
                            <asp:Label runat="server" ID="lblSearchLocationNone" />
                            <br />
                            <asp:RadioButton runat="server" ID="rbSearchLocationLoginBar" GroupName="SearchBoxLocation" />
                            <asp:Label runat="server" ID="lblSearchLocationLoginBar" />
                            <br />
                            <asp:RadioButton runat="server" ID="rbSearchLocationSideBar" GroupName="SearchBoxLocation" />
                            <asp:Label runat="server" ID="lblSearchLocationSidebar" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <h5>
                <cmn:GlobalizedLabel ID="lblFileCap" runat="server" TextKey="TXT_FILE_CAPS"></cmn:GlobalizedLabel>
            </h5>
            <fieldset>
                <table cellpadding="5">
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblNewsIndividual" runat="server" TextKey="LBL_SETTINGS_NEWS_INDIVIDUAL"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtNewsIndividualCap" MaxLength="6" runat="server" Width="30" />
                            MB
                            <asp:RequiredFieldValidator ID="rfvNewsIndividualCap" ControlToValidate="txtNewsIndividualCap"
                                runat="server" SetFocusOnError="true" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblForumBytes" runat="server" TextKey="LBL_SETTINGS_FORUM_BYTES"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtForumBytes" MaxLength="6" runat="server" Width="30" />
                            MB
                            <asp:RequiredFieldValidator ID="rfvForumBytes" ControlToValidate="txtForumBytes"
                                runat="server" SetFocusOnError="true" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblEmailMaxAttachmentSize" runat="server" TextKey="LBL_SETTINGS_EMAIL_MAX_ATTACHMENT_SIZE"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtEmailMaxAttachmentSize" MaxLength="6" runat="server" Width="30" />
                            MB
                            <asp:RequiredFieldValidator ID="rfvEMASize" ControlToValidate="txtEmailMaxAttachmentSize"
                                runat="server" SetFocusOnError="true" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <h5>
                <cmn:GlobalizedLabel ID="lblCampusDirectory" runat="server" TextKey="TXT_CAMPUS_DIRECTORY" />
            </h5>
            <fieldset>
                <table>
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:CheckBox ID="chkEnableCampusDirectory" runat="server" />
                        </td>
                        <td class="text">
                            <cmn:GlobalizedLabel ID="lblEnableCampusDirectory" class="fieldLabel" runat="server"
                                TextKey="TXT_ENABLE_CAMPUS_DIRECTORY" />
                            <br />
                            <cmn:GlobalizedLabel ID="lblEnableCampusDirectoryDetails" class="fieldNote" runat="server"
                                TextKey="TXT_ENABLE_CAMPUS_DIRECTORY_DETAILS" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <h5>
                <cmn:GlobalizedLabel ID="lblMoxieManager" runat="server" TextKey="TXT_MOXIE_MANAGER" />
            </h5>
            <fieldset>
                <table>
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:CheckBox ID="chkDisableMoxieManager" runat="server" />
                        </td>
                        <td class="text">
                            <cmn:GlobalizedLabel ID="lblDisableMoxieManager" class="fieldLabel" runat="server"
                                TextKey="TXT_DISABLE_MOXIE_MANAGER" />
                            <br />
                            <cmn:GlobalizedLabel ID="GlobalizedLabel4" class="fieldNote" runat="server"
                                TextKey="MSG_DISABLE_MOXIE_MANAGER" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </cmn:ContentTab>
        <cmn:ContentTab ID="tabPasswords" runat="Server" Visible="true" Text="Passwords">
            <h5>
                <cmn:GlobalizedLabel ID="lblForgotMyPassword" TextKey="TXT_FORGOT_PASSWORD_OPTIONS"
                    runat="server" /></h5>
            <br />
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkEnableForgotPassword" runat="server" AutoPostBack="True" />
                    </td>
                    <td>
                        <cmn:GlobalizedLabel ID="lblEnableForgotPassword" class="fieldLabel" runat="server"
                            TextKey="TXT_ENABLE_FORGOT_PASSWORD_LINK" />
                        <br />
                        <cmn:GlobalizedLabel ID="lblEnableForgotPasswordDetails" runat="server" TextKey="TXT_FORGOT_PASSWORD_DETAILS" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkRequireHint" runat="server" />
                                </td>
                                <td>
                                    <cmn:GlobalizedLabel ID="lblRequireHint" class="fieldLabel" runat="server" TextKey="TXT_REQUIRED_HINT" />
                                    <br />
                                    <cmn:GlobalizedLabel ID="lblRequireHintDetails" runat="server" TextKey="TXT_REQUIRED_HINT_DETAILS" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <h5>
                <cmn:GlobalizedLabel ID="lblPasswordFormat" runat="server" TextKey="TXT_PASSWORD_FORMAT" /></h5>
            <br />
            <cmn:GlobalizedLabel ID="lblPasswordFormatInfo" runat="server" TextKey="TXT_PASSWORD_FORMAT_INFO" />
            <br />
            <fieldset>
                <table cellpadding="5">
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblPasswordMinLength" runat="server" TextKey="LBL_MIN_LENGTH" />
                        </th>
                        <td>
                            <asp:TextBox ID="txtPasswordMinLength" runat="server" />
                            &nbsp;
                            <asp:RequiredFieldValidator ID="rfvMinPwdLen" ControlToValidate="txtPasswordMinLength"
                                runat="server" SetFocusOnError="true" />
                            <asp:CompareValidator ID="cvMinPwdLen" ControlToValidate="txtPasswordMinLength" runat="server"
                                ControlToCompare="txtPasswordMaxLength" Operator="LessThanEqual" Type="Integer"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblPasswordMaxLength" runat="server" TextKey="LBL_MAX_LENGTH" />
                        </th>
                        <td>
                            <asp:TextBox ID="txtPasswordMaxLength" runat="server" />
                            &nbsp;
                            <asp:RequiredFieldValidator ID="rfvMaxPwdLen" ControlToValidate="txtPasswordMaxLength"
                                runat="server" SetFocusOnError="true" />
                            <asp:CompareValidator ID="cvMaxPwdLen" ControlToValidate="txtPasswordMaxLength" runat="server"
                                ValueToCompare="32" Operator="LessThanEqual" Type="Integer"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblPasswordCharacters" runat="server" TextKey="LBL_CHARACTERS" />
                        </th>
                        <td>
                            <asp:CheckBoxList ID="cblPasswordCharacters" runat="server" />
                            <cmn:CheckBoxListValidator ID="PasswordCharactersValidator" ControlToValidate="cblPasswordCharacters"
                                Display="Dynamic" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <cmn:GlobalizedLabel ID="lblPasswordCase" runat="server" TextKey="LBL_CASE" />
                        </th>
                        <td>
                            <asp:RadioButtonList ID="rblPasswordCase" runat="server" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </cmn:ContentTab>
        <cmn:ContentTab ID="tabMyInfo" runat="Server" Visible="true" Text="My Info">
            <h5>
                <cmn:GlobalizedLabel ID="lblMyInfo" runat="server" TextKey="TXT_MYINFO_NOTIFICATION" /></h5>
            <br />
            <table>
                <tr>
                    <td colspan="3">
                        <strong>
                            <cmn:GlobalizedLabel ID="GlobalizedLabel1" runat="server" TextKey="TXT_NOTIFY_ON_UPDATE" /></strong><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <cmn:GlobalizedLabel ID="glEmailQuestion" runat="server" TextKey="TXT_NOTIFY_ON_UPDATE_QUESTION" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:RadioButton ID="rbMyInfoNotifyNo" runat="server" GroupName="MyInfoNotify" AutoPostBack="true" /><cmn:GlobalizedLabel
                            ID="lblMyInfoNotifyNo" runat="server" TextKey="TXT_MYINFO_NOTIFY_NO" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:RadioButton ID="rbMyInfoNotifyYes" runat="server" GroupName="MyInfoNotify" AutoPostBack="true" /><cmn:GlobalizedLabel
                            ID="lblMyInfoNotifyYes" runat="server" TextKey="TXT_MYINFO_NOTIFY_YES" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;
                    </td>
                    <td>&nbsp;
                    </td>
                    <td width="95%">
                        <table id="tblMyInfoNotification" width="100%" runat="server">
                            <tr>
                                <td valign="top" nowrap align="left" width="20%">
                                    <asp:Label ID="lblEMailTempName" runat="server"></asp:Label>
                                </td>
                                <td valign="top" nowrap align="left">
                                    <asp:DropDownList ID="ddlbTemplate" runat="server">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:ImageButton ID="imgCreateTemplate" runat="server"></asp:ImageButton>&nbsp;
                                    <asp:ImageButton ID="imgModifyTemplate" runat="server"></asp:ImageButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            <asp:Panel runat="server" visible="False">
            <h5>
                <%= Globalizer.GetString("LBL_PHONE_NUMBER_TYPES") %>
            </h5>
            <div class="manage-phone-number-types">
                
                        <div id="divNoPhoneNumberTypes" runat="server" visible="False" class="feedbackMessage no-phone-number-types">
                            <span><%=Globalizer.GetString("MSG_NO_PHONE_NUMBER_TYPES") %></span>
                        </div>
                        <asp:Repeater runat="server" ID="phoneNumberTypesRepeater">
                            <ItemTemplate>
                                <div class="entity-cards-container phone-number-types">
                                    <div id="divPhoneNumberTypeUpdateError" runat="server" class="feedbackError phone-number-type-error" visible="False">
                                    </div>
                                    <div class="entity-card-container phone-number-type" id="phoneNumberTypeEntityCard" runat="server" data-itemid='<%# DataBinder.Eval(Container.DataItem, "ID")%>'>
                                        <div class="entity-card buttonsContainer">
                                            <asp:LinkButton ID="lnkDeletePhoneNumberType" runat="server" CssClass="glyphicon glyphicon-minus-sign" CommandName="delete">
                                                <span class="screenReaderText">Delete</span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lnkEditPhoneNumberType" runat="server" CssClass="glyphicon glyphicon-pencil" CommandName="edit">
                                                <span class="screenReaderText">Edit</span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lnkCancelPhoneNumberTypeUpdate" runat="server" Visible="False" CssClass="glyphicon glyphicon-remove" CommandName="cancel">
                                                <span class="screenReaderText">Cancel</span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="lnkUpdatePhoneNumberType" runat="server" Visible="False" CssClass="glyphicon glyphicon-ok-sign" CommandName="update">
                                                <span class="screenReaderText">Save</span>
                                            </asp:LinkButton>

                                        </div>
                                        <div class="entity-card contentContainer phone-number-type">
                                            <div>
                                                <div class="phone-number-type-name">
                                                    <asp:Label class="boldText phone-number-type-name-label" runat="server" ID="lblPhoneNumberTypeName"><%# Eval("Name")%></asp:Label>
                                                    <asp:TextBox runat="server" ID="txtPhoneNumberTypeName" MaxLength="30" Visible="False" Placeholder="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' data-originalvalue='<%# DataBinder.Eval(Container.DataItem, "Name") %>' />
                                                    <label for='<%#Container.FindControl("txtPhoneNumberTypeName").ClientID %>' class="screenReaderText">
                                                        Name
                                                    </label>
                                                </div>
                                                <div class="phone-number-type-description">
                                                    <asp:Label runat="server" ID="lblPhoneNumberTypeDescription"><%# Eval("Description")%></asp:Label>
                                                    <jenz:TextEditorControl id="txtPhoneNumberTypeDescription" runat="server" MaxLength="1968" Content='<%# DataBinder.Eval(Container.DataItem, "Description") %>'  Visible="False" />
                                                    
                                                    <label for='<%#((TextEditorControl)Container.FindControl("txtPhoneNumberTypeDescription")).TextAreaClientId %>' class="screenReaderText">
                                                        Description
                                                    </label>
                                                </div>
                                                <div class="phone-number-type-allow-text">
                                                    <asp:CheckBox runat="server" ID="allowTextOptInCheckBox" Enabled="False" data-originalvalue='<%# DataBinder.Eval(Container.DataItem, "AllowOptInForTextMessaging") %>' />
                                                    <label for='<%# Container.FindControl("allowTextOptInCheckBox").ClientID %>'><%=Globalizer.GetString("MSG_ALLOW_OPT_IN_FOR_TEXT") %></label>

                                                </div>
                                                <div class="phone-number-type-allow-voice">
                                                    <asp:CheckBox runat="server" ID="allowVoiceOptInCheckBox" Enabled="False" data-originalvalue='<%# DataBinder.Eval(Container.DataItem, "AllowOptInForVoiceCalling") %>' />
                                                    <label for='<%# Container.FindControl("allowVoiceOptInCheckBox").ClientID %>'><%=Globalizer.GetString("MSG_ALLOW_OPT_IN_FOR_VOICE") %></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div id="divAddPhoneNumberTypeForm" runat="server" visible="False">
                            <div id="divPhoneNumberTypeError" runat="server" class="feedbackError phone-number-type-error" visible="False">
                            </div>
                            <div class="entity-card-container phone-number-type" id="phoneNumberTypeEntityCard" runat="server">
                                <div class="entity-card buttonsContainer">
                                    <asp:LinkButton ID="lnkCancelPhoneNumberTypeAdd" runat="server" CssClass="glyphicon glyphicon-remove" CommandName="cancel">
                                                <span class="screenReaderText">Cancel</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkSaveNewPhoneNumberType" runat="server" CssClass="glyphicon glyphicon-ok-sign" CommandName="update">
                                                <span class="screenReaderText">Save</span>
                                    </asp:LinkButton>
                                </div>
                                <div class="entity-card contentContainer phone-number-type">
                                    <div>
                                        <div class="phone-number-type-name">
                                            <asp:TextBox runat="server" ID="txtPhoneNumberTypeName" MaxLength="30" />
                                            <label for='<%= txtPhoneNumberTypeName.ClientID%>' class="screenReaderText">
                                                Name
                                            </label>
                                        </div>
                                        <div class="phone-number-type-description">
                                            <jenz:TextEditorControl id="txtPhoneNumberTypeDescription" runat="server" MaxLength="1968"  />
                                            <label for='<%= txtPhoneNumberTypeDescription.TextAreaClientId%>' class="screenReaderText">
                                                Description
                                            </label>
                                        </div>
                                        <div class="phone-number-type-allow-text">
                                            <asp:CheckBox runat="server" ID="allowTextOptInCheckBox" />
                                            <label for='<%= allowTextOptInCheckBox.ClientID%>'><%=Globalizer.GetString("MSG_ALLOW_OPT_IN_FOR_TEXT") %></label>
                                        </div>
                                        <div class="phone-number-type-allow-voice">
                                            <asp:CheckBox runat="server" ID="allowVoiceOptInCheckBox" />
                                            <label for='<%=allowVoiceOptInCheckBox.ClientID %>'><%=Globalizer.GetString("MSG_ALLOW_OPT_IN_FOR_VOICE") %></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <asp:LinkButton runat="server" ID="lnkShowAddPhoneNumberForm" CssClass="glyphicon glyphicon-plus-sign large">
                                <span class="screenReaderText"><%=Globalizer.GetString("MSG_ADD_NEW_PHONE_NUMBER_TYPE") %></span>
                            </asp:LinkButton>
                            <asp:Label runat="server" ID="lblAddPhoneNumberTypeDescription" class="entity-card-add-entity-description">
                                <%=Globalizer.GetString("MSG_ADD_NEW_PHONE_NUMBER_TYPE") %>
                            </asp:Label>
                        </div>
            </div>
                
            </asp:Panel>
        </cmn:ContentTab>
        <cmn:ContentTab ID="tabBookstore" runat="Server" Visible="true" Text="Bookstore">
            <h5>
                <cmn:GlobalizedLabel ID="lblBookstore" runat="server" Text="Bookstore Link" TextKey="TXT_BOOKSTORE" /></h5>
            <fieldset>
                <table>
                    <tr>
                        <td colspan="3">
                            <cmn:GlobalizedLabel ID="lblStudents" runat="server" Font-Bold="true" TextKey="TXT_STUDENT"></cmn:GlobalizedLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chkShowBookstoreStudentLink" runat="server" />
                        </td>
                        <td colspan="2">
                            <cmn:GlobalizedLabel ID="lblShowBookstoreStudentLink" runat="server" TextKey="TXT_BOOKSTORE_STUDENT_LINK" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <th>
                            <cmn:GlobalizedLabel ID="lblBookstoreStudentLink" runat="server" TextKey="LBL_BOOKSTORE_HOMEPAGE"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtBookstoreStudentLink" runat="server" Width="400" Text="http://"></asp:TextBox>
                            <cmn:GlobalizedLabel ID="lblBookstoreStudentLinkNote" runat="server" TextKey="TXT_BOOKSTORE_ADDRESS_NOTE"></cmn:GlobalizedLabel>
                            <asp:RegularExpressionValidator ID="vldBookstoreStudentLink" ControlToValidate="txtBookstoreStudentLink"
                                runat="server" SetFocusOnError="true" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <th>
                            <cmn:GlobalizedLabel ID="lbBookstoreStudentLinkText" runat="server" TextKey="LBL_LINK_TEXT"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtBookstoreStudentLinkText" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <cmn:GlobalizedLabel ID="lblBookstoreStudentLinkHint" runat="server" TextKey="MSG_BOOKSTORE_LINK_HINT"
                                Font-Italic="true"></cmn:GlobalizedLabel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <cmn:GlobalizedLabel ID="lblBookstoreStudentMessage" runat="server" class="fieldLabel"
                                TextKey="LBL_MESSAGE_TEXT_OPTIONAL"></cmn:GlobalizedLabel>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <txt:TextEditorControl ID="areaBookstoreStudentMessage" MaxLength="6000" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <cmn:GlobalizedLabel ID="lblFaculty" runat="server" Font-Bold="true" TextKey="TXT_FACULTY"></cmn:GlobalizedLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chkShowBookstoreFacultyLink" runat="server" />
                        </td>
                        <td colspan="2">
                            <cmn:GlobalizedLabel ID="lblShowBookstoreFacultyLink" runat="server" TextKey="TXT_BOOKSTORE_FACULTY_LINK" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <th>
                            <cmn:GlobalizedLabel ID="lblBookstoreFacultyLink" runat="server" TextKey="LBL_BOOKSTORE_HOMEPAGE"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtBookstoreFacultyLink" runat="server" Width="400" Text="http://"></asp:TextBox>
                            <cmn:GlobalizedLabel ID="lblBookstoreFacultyLinkNote" runat="server" TextKey="TXT_BOOKSTORE_ADDRESS_NOTE"></cmn:GlobalizedLabel>
                            <asp:RegularExpressionValidator ID="vldBookstoreFacultyLink" ControlToValidate="txtBookstoreFacultyLink"
                                runat="server" SetFocusOnError="true" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <th>
                            <cmn:GlobalizedLabel ID="lblBookstoreFacultyLinkText" runat="server" TextKey="LBL_LINK_TEXT"></cmn:GlobalizedLabel>
                        </th>
                        <td>
                            <asp:TextBox ID="txtBookstoreFacultyLinkText" runat="server" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <cmn:GlobalizedLabel ID="lblBookstoreFacultyMessage" runat="server" class="fieldLabel"
                                TextKey="LBL_MESSAGE_TEXT_OPTIONAL"></cmn:GlobalizedLabel>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <txt:TextEditorControl ID="areaBookstoreFacultyMessage" MaxLength="6000"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chkBookstoreDisableERP" runat="server" />
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblBookstoreDisableERP" runat="server" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </cmn:ContentTab>
    </cmn:ContentTabGroup>
    <div>
        <asp:Button ID="btnSaveSettings" runat="server" />
        &nbsp;
        <asp:Button ID="btnCancel" runat="server" />
    </div>
    <script type="text/javascript">
        function tabClick(o, i) {
            if (Page_ClientValidate()) {

            }
            var c = removeTextNodes(o.parentNode.parentNode.parentNode.childNodes);
            c[0].value = i - 1;
            for (x = 2; x < c.length; x++) {
                c[x].style.display = x - 1 == i ? 'block' : 'none';
            }
            c = removeTextNodes(c[1].childNodes);
            for (x = 0; x < c.length; x++) {
                c[x].className = '';
            }
            o.parentNode.className = 'selected';
        }
    </script>
</div>