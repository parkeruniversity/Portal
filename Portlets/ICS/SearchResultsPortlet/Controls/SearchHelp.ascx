<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchHelp.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.SearchResultsPortlet.Controls.SearchHelp" %>
<script language="javascript">
    jQuery(document).ready(function () {
        jQuery(".searchHelpLink").click(function () {
            jQuery(this).next(".searchHelpContentHolder").slideToggle(400);
            var selected = $('#<%= lblShowHide.ClientID %>').text();
            $('#<%= lblShowHide.ClientID %>').text(selected == "Show" ? 'Hide' : 'Show');
        });
    });

</script>
<div class="searchHelpLayer">
<div class="searchHelpLink"><asp:Label ID="lblShowHide" runat="server" Text="Show"></asp:Label> search tips</div>
<div class="searchHelpContentHolder">
            <div class="grayTopWedge">
        </div>
    <div class="searchHelpContent">
    <asp:Literal ID="litSearchHelpText" runat="server" /></div>
</div>

</div>