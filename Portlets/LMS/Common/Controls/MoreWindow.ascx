<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MoreWindow.ascx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Controls.MoreWindow" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>

<script language="javascript">
	$(document).ready(function (){
		InitializeMoreWindow('<%= this.ClientID %>', <%= TopWindowOffset %>, <%= LeftWindowOffset %>);
	});
</script>

<div id="<%= this.ClientID %>" class="moreWindowControl">

	<common:GlobalizedLabel ID="MoreButton" TextKey="TXT_MORE" CssClass="moreButton" runat="server" />

	<div class="moreWindow">
		<div>
			<asp:PlaceHolder ID="WindowContent" runat="server" />
			<common:GlobalizedHyperLink ID="CloseButton" TextKey="TXT_CLOSE" CssClass="closeButton" NavigateUrl="javascript:" runat="server" />
		</div>
	</div>

</div>
