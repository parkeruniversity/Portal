<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageLearningToolView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.Views.ManageLearningToolView" %>
<%@ Register TagPrefix="asp" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fwk" TagName="Modal" Src="~/UI/Controls/UserControls/Modal.ascx" %>
<%@ Register Src="Controls/AddEditCategory.ascx" TagName="AddEditCategory" TagPrefix="JICS" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<script language="javascript" type="text/javascript">
    function toggleAdvancedSetup() {
        $("#<%= AdvancedSetupContainer.ClientID %>").toggle('slow');

        if ($("#<%= ToggleAdvancedSetupLink.ClientID %>").text() == '<%= Globalizer.GetString("TXT_CLICK_TO_VIEW") %>') {
            $("#<%= ToggleAdvancedSetupLink.ClientID %>").text('<%= Globalizer.GetString("TXT_CLICK_TO_CLOSE") %>');

        }
        else {
            $("#<%= ToggleAdvancedSetupLink.ClientID %>").text('<%= Globalizer.GetString("TXT_CLICK_TO_VIEW") %>');
        }
    }

    function useDomainSecretClick() {
        document.getElementById('<%=_aCheckDomainLevelSecret.ClientID%>').click();
    }

    function useMySecretClick() {
        $("#<%= KeyTextBox.ClientID %>").removeAttr('readonly');
        $("#<%= SecretTextBox.ClientID %>").removeAttr('readonly');
    }

    function toggleCustomUrl(ele){
        if (ele.checked) {
            $("#<%= _cbCustomUrl.ClientID %>").prop('disabled', false);
            $("#<%= _cbCustomUrl.ClientID %>").closest('span').prop('disabled', false);
        }else{
            $("#<%= _cbCustomUrl.ClientID %>").prop('disabled', true);
            $("#<%= _cbCustomUrl.ClientID %>").prop('checked', false);
        }
    }

    $(document).ready(function() {
        $("#<%= LocationTextBox.ClientID %>").blur(checkDomainSecret);
    });

    function checkDomainSecret() {
        document.getElementById('<%=_aCheckDomainLevelSecret.ClientID%>').click();
    }
</script>
<div class="pSection">
    <div id="Introduction" class="learningToolScreenHeaderContainer">
        <div class="learningToolsIconContainer">
        </div>
        <div>
            <asp:Label ID="AddLearningToolLabel" runat="server" />
            <div>
                <asp:Label ID="AddLearningToolDescriptionLabel" runat="server" />
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
        <div id="Name" class="learningToolFormSubCategoryContainer">
            <div>
                <asp:Label ID="NameLabel" runat="server" CssClass="label" />
            </div>
            <div class="fieldAndDescriptionContatiner">
                <asp:TextBox ID="NameTextBox" runat="server" Width="350" MaxLength="120" /> 
                <asp:Label ID="_lblErrName" runat="server" CssClass="validationError" />
            </div>
        </div>
    </div>
    <div id="Category" class="learningToolFormSubCategoryContainer">
        <asp:Label ID="CategoryLabel" runat="server" CssClass="label" />
        <div class="fieldAndDescriptionContatiner">            
            <asp:UpdatePanel ID="_upAddCategory" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:DropDownList ID="CategoriesDropDownList" runat="server" /> &nbsp; 
                    <asp:HyperLink ID="_addCategoryLink" runat="server" CssClass="addLink" />
                    <fwk:Modal ID="_modalAddCategory" runat="server" TargetControlID="_addCategoryLink">
                        <ContentArea>
                            <JICS:AddEditCategory ID="_addEditCategoryView" runat="server" />
                        </ContentArea>
                    </fwk:Modal>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div id="Description" class="learningToolFormSubCategoryContainer">
        <asp:Label ID="DescriptionLabel" runat="server" CssClass="label" />
        <div>
            <asp:Label ID="ToolInstructionsDescriptionLabel" runat="server" CssClass="descriptiveText" />
        </div>
        <div class="textEditorPadding"></div>
        <div class="toolDescriptionTextBoxEditorContainer">
            <jics:TextEditor id="_textEditorDescription" runat="server" />
        </div>
    </div>
    <div id="_divSharing" class="learningToolFormSubCategoryContainer" runat="server">
        <asp:Label ID="SharingLabel" runat="server" CssClass="label" />
        <table>
            <tr id="_trShare" runat="server">
                <td rowspan="3" valign="top"><asp:CheckBox ID="ShareToolCheckBox" runat="server" /></td>
                <td><asp:Label ID="SharingToolLabel" runat="server" /><br /><asp:Label ID="SharingDescriptionLabel" runat="server" CssClass="descriptiveText" /></td>
            </tr>
            <tr id="_trFeature" runat="server">
                <td><asp:CheckBox ID="FeaturedToolCheckBox" runat="server" /> <asp:Label ID="FeaturedToolLabel" runat="server" /></td>
            </tr>
        </table>
    </div>
    <div id="ConnectionInformation" class="learningToolFormCategoryContainer">
        <asp:Label ID="ConnectionInformationLabel" runat="server" CssClass="headerText" />
        <div class="textContainer">
            <asp:Label ID="ConnectionInformationDescriptionLabel" runat="server" CssClass="descriptiveText" />
        </div>
        <div id="Location" class="learningToolFormSubCategoryContainer">
            <asp:Label ID="LocationLabel" runat="server" CssClass="label" />
            <div class="fieldAndDescriptionContatiner">
                <asp:TextBox ID="LocationTextBox" runat="server" Width="550" MaxLength="512" /> <asp:Label ID="_lblErrLocation" runat="server" CssClass="validationError" />
                <div class="textContainer">
                    <asp:Label ID="LocationDescriptionLabel" runat="server" CssClass="descriptiveText" />
                </div>
            </div>
        </div>
        <div id="Security" class="learningToolFormSubCategoryContainer">
            <div>
                <asp:Label ID="SecurityLabel" runat="server" CssClass="label" />
            </div>
            <div>
                <asp:UpdatePanel ID="_upKeySecret" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <table border="0" cellpadding="10">                    
                    <tr>
                        <td colspan="3">                            
                            <div id="_divDomainLevelSecretOptions" runat="server">
                                <br /><br />
                                <asp:RadioButton ID="_radUseDomainSecret" runat="server" GroupName="DomainSecretOptions" /> <asp:Label ID="_lblUseDomainSecret" runat="server" />
                                <br /><br />
                                <asp:RadioButton ID="_radUseMySecret" runat="server" GroupName="DomainSecretOptions" /> <asp:Label ID="_lblUseMySecret" runat="server" />                                
                            </div>
                            <a id="_aCheckDomainLevelSecret" runat="server" style="display:none;" />
                            <div id="_divNoDomainSecret" runat="server">
                                <asp:Label ID="_lblNoDomainSecret" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="KeyLabel" runat="server" /></td>
                        <td>
                            <asp:TextBox ID="KeyTextBox" runat="server" Width="250" MaxLength="256" /><br /><asp:Label ID="_lblErrKey" runat="server" CssClass="validationError" />
                            <asp:HiddenField ID="_hiddenFieldKey" runat="server" />
                        </td>
                        <td rowspan="2" valign="top"><asp:Label ID="SecurityNoteLabel" runat="server" CssClass="descriptiveText" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="SecretLabel" runat="server" /></td>
                        <td>
                            <asp:TextBox ID="SecretTextBox" runat="server" Width="250" MaxLength="256" /><br /><asp:Label ID="_lblErrSecret" runat="server" CssClass="validationError" />
                            <asp:HiddenField ID="_hiddenFieldSecret" runat="server" />
                        </td>
                    </tr>
                    <tr id="_trDomainLevelSettings" runat="server">
                        <td colspan="3">
                            <asp:CheckBox ID="_cbIsDomainLevelKeyAndSecret" runat="server" /> 
                            <asp:Label ID="_lblTpProvidesSecret" runat="server" /><br />
                            <asp:Label ID="_lblTpProvidesSecretInstrux" runat="server" CssClass="descriptiveText" /><br />
                            <div class="CustomUrl">
                                <asp:CheckBox ID="_cbCustomUrl" runat="server" Enabled="false" /> 
                                <asp:Label ID="_lblCustomUrlInstrux" runat="server" />
                            </div>
                        </td>
                    </tr>
                </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <div id="ToolDisplay" class="learningToolFormCategoryContainer">
        <div>
            <asp:Label ID="ToolDsiplayLabel" runat="server" CssClass="headerText" />
        </div>
        <div class="textContainer">
            <asp:Label ID="ToolDisplayDescriptionLabel" runat="server" CssClass="descriptiveText" />
        </div>
        <div class="inlineToolDisplayContainer">
            <div id="InlineDisplay">
                <div class="displayRadioButtonContainer">
                    <asp:RadioButton ID="InlineDisplayRadioButton" runat="server" GroupName="showInPopup" />
                </div>
                <div>
                    <div class="toolInlineDisplayIcon">
                    </div>
                    <asp:Label ID="InlineDisplayDescriptionLabel" runat="server" />
                </div>
            </div>
        </div>
        <div class="popupToolDisplayContainer">
            <div class="displayRadioButtonContainer">
                <asp:RadioButton ID="PopupDisplayRadioButton" runat="server" GroupName="showInPopup" />
            </div>
            <div class="popupToolDisplayContentContainer">
                <div>
                    <div>
                        <div class="toolPopupDisplayIcon"></div>
                        <asp:Label ID="PopupDisplayDescriptionLabel" runat="server" /> 
                        <div>
                            <asp:Label ID="_lblErrPopupDimens" runat="server" CssClass="validationError" />
                        </div>
                    </div>
                    <div class="popupHeightAndWidthInputContainer">
                        <div class="popupSizeInputContainer">
                            <asp:Label ID="WidthLabel" runat="server" CssClass="descriptiveText" />
                            <asp:TextBox ID="PopupWidthTextBox" runat="server" Width="80px" MaxLength="4" />
                        </div>
                        <div class="popupSizeInputContainer">
                            <asp:Label ID="HeightLabel" runat="server" CssClass="descriptiveText" />                            
                            <asp:TextBox ID="PopupHeightTextBox" runat="server" Width="80px" MaxLength="4" />
                        </div>
                        <div>
                            <asp:Label ID="SizesOptionalLabel" runat="server" CssClass="descriptiveText" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="AdvancedSetup" runat="server">
        <asp:Label ID="AdvancedSetupLabel" runat="server" CssClass="headerText" />
        <div class="optionalClickToView">
            <asp:Label ID="OptionalLabel" runat="server" />
            <asp:HyperLink ID="ToggleAdvancedSetupLink" runat="server" onclick="toggleAdvancedSetup()" />
        </div>
        <div id="AdvancedSetupContainer" runat="server" class="advancedSetupContainerClosed">
            <div id="SharedInformation" class="learningToolFormCategoryContainer">
                <asp:Label ID="SharedInformationLabel" runat="server" CssClass="headerText" />
                <div class="textContainer">
                    <asp:Label ID="SharedInformationDescriptionLabel" runat="server" CssClass="descriptiveText" />
                </div>
                <div class="formRow">
                    <asp:CheckBox ID="SendFirstAndLastNameCheckBox" runat="server" />
                    <asp:Label ID="SendFirstAndLastNameLabel" runat="server" />
                </div>
                <div class="formRow">
                    <asp:CheckBox ID="SendEmailAddressCheckBox" runat="server" />
                    <asp:Label ID="SendEmailAddressLabel" runat="server" />
                </div>
                <div class="formRow">
                    <asp:CheckBox ID="SendRolesCheckBox" runat="server" />
                    <asp:Label ID="SendRolesLabel" runat="server" />
                </div>
            </div>
            <div id="AdditionalToolParameters" class="learningToolFormCategoryContainer">
                <asp:Label ID="AdditionalToolParametersLabel" runat="server" CssClass="headerText" />
                <div class="formRow">
                    <asp:Label ID="DefaultLocaleLabel" runat="server" CssClass="label" />
                    <asp:TextBox ID="DefaultLocaleTextBox" runat="server" Width="250px" MaxLength="50" />
                </div>                
                <div class="formRow">
                    <asp:Label ID="ContactEmailLabel" runat="server" CssClass="label" />
                    <asp:TextBox ID="ContactEmailTextBox" runat="server" Width="250px" MaxLength="255" />
                </div>
                <div class="textContainer">
                    <asp:Label ID="AdditionalToolParametersDescriptionLabel" runat="server" CssClass="descriptiveText" />
                </div>
                <div>
                    <div class="formRow">
                        <asp:Label ID="CustomParametersLabel" runat="server" />
                    </div>
                    <div class="customParametersTextBoxContainer">
                        <asp:TextBox ID="CustomParametersTextBox" runat="server" TextMode="MultiLine" Height="100px" Width="250px" />
                    </div>
                    <div class="customParametersDirectionsContainer">
                        <asp:Label ID="CustomParametersDirectionsLabel" runat="server" CssClass="descriptiveText" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="Buttons" class="saveCancelButtonContainer">
        <div class="saveButtonContainer">
            <asp:Button ID="SaveButton" runat="server" />
        </div>
        <div class="cancelButtonContainer">
            <asp:Button ID="CancelButton" runat="server" />
        </div>
    </div>
    <div id="BackToToolList">
        <asp:HyperLink ID="BackToToolsListLink" runat="server" CssClass="backLink" />
    </div>
</div>