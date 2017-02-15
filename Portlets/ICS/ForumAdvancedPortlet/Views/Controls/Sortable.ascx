<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sortable.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.Controls.Sortable" %>
	<script type="text/javascript">
	    $(function () { BindSortable<%=UniqueID %>(); });

	    function BindSortable<%=UniqueID %>() {
	        $('#' + '<%=_hOrder.ClientID %>').val(""); //clear out hidden field
	        var ids = "";
	        $(".<%=ConnectedListCssClass%>").each(function () { ids += '#' + $(this).attr('id') + ','; });
	        ids = ids.substring(0, ids.length - 1);

	        $(ids).sortable({
	            tolerance: 'touch',
	            connectWith: ".<%=ConnectedListCssClass%>",
	            placeholder: "<%=PlaceholderCssClass %>",
	            handle: "<%=GetHandleCss() %>",
	            update: function (event, ui) {
	                var hiddenOrder = $('#' + '<%=_hOrder.ClientID %>');
	                var content = hiddenOrder.val();
	                if (content.length > 0)
	                    content += "|";
	                content += $(this).attr('id') + ":";
	                content += $(this).sortable('toArray').join(',');
	                hiddenOrder.val(content);
	            },
	            stop: function (event, ui) { if ($('#' + '<%=_hOrder.ClientID %>').val().length > 0) $('#' + "<%= _btnSync.ClientID %>").click(); }
	        }).disableSelection();
	    }
	</script>
    <asp:HiddenField ID="_hOrder" runat="server" />
    <asp:Button ID="_btnSync" runat="server" style="display:none;" OnClick="_btnSync_Click" />