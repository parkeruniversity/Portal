<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EmailAccountsView.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MessageCenterPortlet.EmailAccountsView" %>
<%@ Import Namespace="Jenzabar.ICS" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Configuration" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div xmlns:cmn="http://schemas.jenzabar.com/JICS/CommonControls">

<cmn:Subheader id="hdrEmail" runat="server" textkey="TXT_EMAIL_ACCOUNTS" />
<cmn:GlobalizedLabel id="lblEmptyRepeater" Visible="false" textKey="MSG_NO_EMAIL_ACCOUNTS_CONFIGURED" runat="server" />
<div class="pSection">
<ul>
<asp:Repeater id="rptAccounts" runat="server">
<ItemTemplate>
<li>
<label for="<%# Container.ClientID %>"><input type="radio" name='<%# this.UniqueID %>' value='<%# ((UserEmailAccount)Container.DataItem).ID.AsGuid %>' id="<%# Container.ClientID %>" <%# ((UserEmailAccount)Container.DataItem).SingleSignOnEnabled ? "checked=\"checked\"" : "" %> />[<%# ((UserEmailAccount)Container.DataItem).Provider.Name %>] <%# ((UserEmailAccount)Container.DataItem).UserName %></label>
<asp:ImageButton id="b1" commandname="EDIT" commandargument='<%# ((UserEmailAccount)Container.DataItem).ID.AsGuid %>' imageurl='<%# Settings.Current.Location.PortletIconImagesPath + "edit.gif"%>' alternatetext='<%# Globalizer.GetGlobalizedString("TXT_EDIT") %>' runat="server" />
<asp:ImageButton id="b2" commandname="DELETE" commandargument='<%# ((UserEmailAccount)Container.DataItem).ID.AsGuid %>' imageurl='<%# Settings.Current.Location.PortletIconImagesPath + "delete.gif"%>' alternatetext='<%# Globalizer.GetGlobalizedString("TXT_DELETE") %>' runat="server" />
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
<div class="pSction">
<p><cmn:AddImageAndTextButton id="lnkAddAccount" textkey="TXT_ADD_A_NEW_ACCOUNT" tooltipkey="MSG_ADD_A_NEW_ACCOUNT_TOOLTIP" runat="server" /></p>
<p>
<cmn:GlobalizedButton textkey="TXT_SAVE" id="btnSave" runat="server" />
<cmn:GlobalizedButton textkey="TXT_CANCEL" id="btnCancel" causesvalidation="false" runat="server" />
</p>
</div>

</div>