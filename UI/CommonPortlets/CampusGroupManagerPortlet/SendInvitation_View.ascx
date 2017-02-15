<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SendInvitation_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CampusGroupManagerPortlet.SendInvitation_View" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>

<common:Subheader ID="InviteHeader" runat="server" />
<div class="pSection">
	<asp:ValidationSummary ID="Summary" DisplayMode="List" Runat="server" />
	<common:Hint id="InviteIntroText" runat="server" />
	<framework:PrincipalSelector id="InvitedUsers" runat="server" />
	<asp:Repeater ID="ReinvitedUsers" Runat="server">
	    <HeaderTemplate>
	        <p><common:GlobalizedLabel ID="ReinviteHead" TextKey="TXT_REINVITE" runat="server"  Font-Bold="true" />:</p>
		    <ul>
	    </HeaderTemplate>
	    <ItemTemplate>
			    <li class="fieldLabel"><asp:Literal ID="UserName" Runat="server" /></li>
   				<asp:Literal ID="UserID" Visible="False" Runat="server" />
	    </ItemTemplate>
	    <FooterTemplate>
		    </ul>
	    </FooterTemplate>
    </asp:Repeater>
	<h5><common:FormLabel id="EmailLabel" ForControl="EmailMessage" runat="server" /></h5>
	<asp:Label ID="EmailLabelNote" CssClass="fieldNote" Runat="server" />
	<txt:TextEditorControl ID="EmailMessage" runat="server" />
</div>
<div class="buttonBar">
	<asp:Button ID="InviteButton" Runat="server" />
	<asp:Button ID="CancelButton" runat="server" />
</div>
