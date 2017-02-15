<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationInfoLoginView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CommunicationInfoLoginProvider.SmsLoginPageView" %>
<%@ Register TagPrefix="jenz" TagName="UserPhoneNumberInput" Src="~/UI/Controls/UserPhoneNumberInput.ascx" %>

<div class="CommunicationInfoLoginProviderPortlet pSection">
    <div class="continue-button-container">
        <asp:Button CssClass="continueButton" ID="btnSkip" runat="server"/>    
    </div>
    <div>
        <jenz:UserPhoneNumberInput ID="UserPhoneNumberInput" runat="server"/>    
    </div>
</div>