<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewingMySubs.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Controls.ViewingMySubs" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls"%>
<div class="viewMySubs blogFontSize">
    <cmn:GlobalizedLabel ID="_glblViewingMySubs" runat="server" />
    <asp:LinkButton ID="_lbtnViewOriginal" runat="server" OnClick="_lbtnViewOriginal_Click" />
</div>
