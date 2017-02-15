<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminCommunicationPreferences_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminCommunicationPreferences_View" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jenz" TagName="UserPhoneNumberInput" Src="~/UI/Controls/UserPhoneNumberInput.ascx" %>


<div class="communication-preferences">


    <cmn:Subheader ID="shEmail" runat="server"></cmn:Subheader>

    <asp:ValidationSummary ID="Summary" DisplayMode="List" runat="server" CssClass="feedbackError" />
    <!-- Email -->

    <div class="email-field-set">
        <div class="email-field" style="float: right;">
            <asp:Literal ID="litEmail" runat="server" Visible="false" />
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="500" Columns="30" />
            <asp:RequiredFieldValidator ID="EmailRequired" ControlToValidate="txtEmail" Text="*" runat="server" />
            <asp:RegularExpressionValidator ID="EmailFormatValidator" ControlToValidate="txtEmail" Text="*" runat="server" />
        </div>
        <div class="email-label">
            <label id="EmailLabel" class="boldText" runat="server"></label>
        </div>
    </div>
    <div class="clearBoth"></div>
    
    <asp:Panel runat="server" Visible="False">
    <cmn:Subheader ID="shPhoneNumbers" runat="server"></cmn:Subheader>

    <div>
        <jenz:UserPhoneNumberInput ID="UserPhoneNumberInput" runat="server" />
    </div>
    </asp:Panel>

    <div class="save-cancel-buttons-container">
        <div class="button-container">
            <asp:Button ID="SaveButton" runat="server" />
        </div>
        <div class="button-container">
            <asp:Button ID="CancelButton" runat="server" CausesValidation="False" />
        </div>
    </div>
</div>