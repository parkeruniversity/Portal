<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main_View.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.EthnicityAndRacePortlet.Main_View" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection"  id="earForm">
    <asp:Literal ID="litIntro" runat="server" />
    <asp:Literal ID="litForm" runat="server" />
    <asp:Literal ID="litTest" runat="server" />
    <cmn:ImageAndTextButton ID="lnkEdit" runat="server" TextKey="TXT_ETH_RACE_EDIT_THIS_INFORMATION" 
        ImageUrl="~/UI/Common/Images/PortletImages/Icons/edit.gif" Visible="false" />
    <p runat="server" id="pSubmit" class="hint" align="center">
        <cmn:GlobalizedButton ID="btnSubmit" OnClientClick="return earValidateSubmit();" runat="server" TextKey="TXT_SUBMIT" />
        &nbsp;&nbsp;
        <cmn:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_CANCEL" Visible="false" />
    </p>
</div>