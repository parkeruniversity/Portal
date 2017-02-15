<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TruncateText.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.TruncateText" %>
<asp:PlaceHolder ID="_phApplyTruncate" runat="server">
<script type="text/javascript" src="UI/Common/Scripts/jquery.jtruncate.js"></script>

    <script language="javascript" type="text/javascript">
        function ApplyTruncate(ctrID) {
            if (ctrID == '') return;

            $('#' + ctrID).jTruncate(
                {
                    length: 120,
                    moreText: "MORE",
                    lessText: "LESS",
                    moreAni: "normal",
                    lessAni: "normal"
                });
        }
    </script>
</asp:PlaceHolder>


<script language="javascript" type="text/javascript">
    $().ready(function() { ApplyTruncate('<%=Ctr.ClientID%>'); });

</script>

