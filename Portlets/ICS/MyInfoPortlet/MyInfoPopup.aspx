<%@ Page language="c#" Codebehind="MyInfoPopup.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.MyInfoPopup" %>
<%@ register TagPrefix="MyInfo" TagName="DefaultView" Src="Default_View.ascx" %>
<HTML>
	<HEAD>
		<title id="PageTitle" runat="server"><asp:Literal id="litPersonalInfoTitle" runat=Server></asp:Literal></title>

		<link href="<%= this.ResolveUrl("~/UI/Common/Styles/siteStyle.css") %>" type="text/css" rel="stylesheet">
		<link href="<%= this.ResolveUrl("~/Portlets/ICS/MyInfoPortlet/MyInfo.css") %>" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/Utility.js") %>"></script>
		<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
		<!-- Overrides the gridTog in Jenz.js -->
		<script language=javascript>
		<!--
    function gridTog(o) {
        var x = o.parentNode.parentNode.parentNode.parentNode.parentNode;
        while (x = x.nextSibling) {
            if (x.className == 'gfoot' || x.className == 'ghead') {
                break;
            }
            if (x.style.display == 'none') {
                o.src = '<%= this.ResolveUrl("~/") %>UI/Common/Images/collapse.gif';
				    x.style.display = '';
				    o.alt = o.HideText;
				}
				else {
				    o.src = '<%= this.ResolveUrl("~/") %>UI/Common/Images/expand.gif';
				    x.style.display = 'none';
				    o.alt = o.ShowText;
				}
            }
        }
        //-->
		</script>
	</HEAD>
	<body onload="window.focus();">
	    <p class="feedbackMessage" id="pEmailSentMSG" runat="server">Your email has been sent.</p>
		<form id="Form1" runat=server>
		<MyInfo:DefaultView id="MyInfoDefaultView" runat="server" />
            <asp:Panel runat="server" ID="pnlExtras"></asp:Panel>
		</form>
	</body>
</HTML>
