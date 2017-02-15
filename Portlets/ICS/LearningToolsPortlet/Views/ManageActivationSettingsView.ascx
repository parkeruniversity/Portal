<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageActivationSettingsView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.ManageActivationSettingsView" %>
<%@ Register TagPrefix="asp" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<script language="javascript" type="text/javascript">
    function toggleAdvancedSetup() {
        $("#<%= _divAdvancedSetupContainer.ClientID %>").toggle('slow');

        if ($("#<%= _hyplnkToggleAdvancedSetupLink.ClientID %>").text() == '<%= Globalizer.GetString("TXT_CLICK_TO_VIEW") %>') {
            $("#<%= _hyplnkToggleAdvancedSetupLink.ClientID %>").text('<%= Globalizer.GetString("TXT_CLICK_TO_CLOSE") %>');
        }
        else {
            $("#<%= _hyplnkToggleAdvancedSetupLink.ClientID %>").text('<%= Globalizer.GetString("TXT_CLICK_TO_VIEW") %>');
        }
    }
</script>
<div class="pSection">
    <div id="Introduction" class="learningToolScreenHeaderContainer">
        <div class="learningToolsIconContainer">
        </div>
        <div>
            <asp:Label ID="LearningToolsActivationLabel" runat="server" />
            <div>
                <asp:Label ID="LearningToolsActivationDescriptionLabel" runat="server" />
            </div>
        </div>
    </div>
    <div>
        <asp:Label ID="_lblErrMsg" runat="server" CssClass="validationError" />
    </div>
    <div id="BasicToolInfo" class="learningToolFormCategoryContainer">
        <asp:Label ID="BasicToolInfoLabel" runat="server" CssClass="headerText" />
        <div class="textContainer">
            <asp:Label ID="BasicToolInfoDescriptionLabel" runat="server" CssClass="descriptiveText" />
        </div>
        <div id="Name" class="formRow">
            <div>
                <asp:Label ID="ToolNameLabel" runat="server" CssClass="label" />
            </div>
            <div class="fieldAndDescriptionContatiner">
                <asp:TextBox ID="ToolNameTextBox" runat="server" Width="350" MaxLength="120" />
            </div>
        </div>
        <div id="Description" class="learningToolFormSubCategoryContainer">
            <asp:Label ID="DescriptionLabel" runat="server" CssClass="label" />
            <div>
                <asp:Label ID="ToolInstructionsDescriptionLabel" runat="server" CssClass="descriptiveText" />
            </div>
            <div class="textEditorPadding">
            </div>
            <div class="toolDescriptionTextBoxEditorContainer">
                <jics:TextEditor id="_textEditorDescription" runat="server" />
            </div>
        </div>
        <div id="LaunchLink" class="formRow">
            <asp:Label ID="LaunchLinkLabel" runat="server" CssClass="label" />
            <div class="fieldAndDescriptionContatiner">
                <asp:TextBox ID="LaunchLinkTextBox" runat="server" MaxLength="200" />
                <div class="fieldDescriptionContainer">
                    <asp:Label ID="LaunchLinkDescriptionLabel" runat="server" CssClass="descriptiveText" />
                </div>
            </div>
        </div>        
        <div id="_divToolDisplay" class="learningToolFormCategoryContainer">
            <div>
                <asp:Label ID="_lblToolDisplay" runat="server" CssClass="headerText" />
            </div>
            <div class="textContainer">
                <asp:Label ID="_lblToolDisplayDescription" runat="server" CssClass="descriptiveText" />
            </div>
            <div>
                <asp:Label ID="_lblErrPopupDimens" runat="server" CssClass="validationError" />
            </div>
            <div class="inlineToolDisplayContainer">
                <div id="InlineDisplay">
                    <div class="displayRadioButtonContainer">
                        <asp:RadioButton ID="_radbtnInlineDisplay" runat="server" GroupName="showInPopup" />
                    </div>
                    <div>
                        <div class="toolInlineDisplayIcon"></div>
                        <asp:Label ID="_lblInlineDisplayDescription" runat="server" />
                    </div>
                </div>
            </div>
            <div class="popupToolDisplayContainer">
                <div class="displayRadioButtonContainer">
                    <asp:RadioButton ID="_radbtnPopupDisplay" runat="server" GroupName="showInPopup" />
                </div>
                <div class="popupToolDisplayContentContainer">
                    <div>
                        <div>
                            <div class="toolPopupDisplayIcon"></div>
                            <asp:Label ID="_lblPopupDisplayDescription" runat="server" />
                        </div>
                        <div class="popupHeightAndWidthInputContainer">
                            <div class="popupSizeInputContainer">
                                <asp:Label ID="_lblWidth" runat="server" CssClass="descriptiveText" />
                                <asp:TextBox ID="_tbPopupWidth" runat="server" Width="80px" MaxLength="4" />
                            </div>
                            <div class="popupSizeInputContainer">
                                <asp:Label ID="_lblHeight" runat="server" CssClass="descriptiveText" />                            
                                <asp:TextBox ID="_tbPopupHeight" runat="server" Width="80px" MaxLength="4" />
                            </div>
                            <div>
                                <asp:Label ID="_lblSizesOptional" runat="server" CssClass="descriptiveText" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="LearningOutcomes" class="learningToolFormCategoryContainer" runat="server">
        <asp:Label ID="LearningOutcomesLabel" runat="server" CssClass="headerText" />
        <div class="textContainer">
            <asp:Label ID="_lblOutcomesDescription" runat="server" CssClass="descriptiveText" />
        </div>
    </div>
    <div id="_divAdvancedSetup" runat="server">
        <asp:Label ID="_lblAdvancedSetup" runat="server" CssClass="headerText" />
        <div class="optionalClickToView">
            <asp:Label ID="_lblOptional" runat="server" />
            <asp:HyperLink ID="_hyplnkToggleAdvancedSetupLink" runat="server" onclick="toggleAdvancedSetup()" />
        </div>
        <div id="_divAdvancedSetupContainer" runat="server" class="advancedSetupContainerClosed">
            <div id="_divSharedInformation" class="learningToolFormCategoryContainer">
                <asp:Label ID="_lblSharedInformation" runat="server" CssClass="headerText" />
                <div class="textContainer">
                    <asp:Label ID="_lblSharedInformationInstrux" runat="server" CssClass="descriptiveText" />
                </div>
                <table>
                    <tr>
                        <td><asp:CheckBox ID="_cbSendFirstAndLastName" runat="server" /> <asp:Label ID="_lblSendFirstAndLastName" runat="server" /></td>
                    </tr>
                    <tr>
                        <td><asp:CheckBox ID="_cbSendEmailAddress" runat="server" /> <asp:Label ID="_lblSendEmailAddress" runat="server" /></td>
                    </tr>
                    <tr>
                        <td><asp:CheckBox ID="_cbSendRoles" runat="server" /> <asp:Label ID="_lblSendRoles" runat="server" /></td>
                    </tr>
                </table>
            </div>
            <div id="_divPageInformation" class="learningToolFormCategoryContainer">
               <asp:Label ID="AdditionalToolParametersLabel" runat="server" CssClass="headerText" />
                <table>
                    <tr>
                        <td><asp:Label ID="_lblDefaultLocale" runat="server" /></td>
                        <td><asp:TextBox ID="_tbDefaultLocale" runat="server" Width="250px" MaxLength="50" /></td>
                    </tr>
                </table>                                
            </div>            
            <div>
                <div class="textContainer">
                    <asp:Label ID="AdditionalToolParametersDescriptionLabel" runat="server" CssClass="descriptiveText" />
                </div>
                <div class="formRow">
                    <asp:Label ID="CustomParametersLabel" runat="server" />
                </div>
                <div class="customParametersTextBoxContainer">
                    <asp:TextBox ID="CustomParametersTextBox" runat="server" TextMode="MultiLine" Height="100px"
                        Width="250px" />
                </div>
                <div class="customParametersDirectionsContainer">
                    <asp:Label ID="CustomParametersDirectionsLabel" runat="server" CssClass="descriptiveText" />
                </div>
            </div>
        </div>
    </div>
    <div class="detailAction">
     <div class="buttons">
        <asp:Button ID="SaveButton" runat="server" />
     </div>
    <div class="detailActionAlert">
       <asp:Button ID="CancelButton" runat="server" />
    </div>
    </div>
</div>