<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportView.ascx.cs" Inherits="Jenzabar.ContainedForm.Views.ReviewView" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<div class="pSection">
<script type="text/javascript" src='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Scripts/jquery.dataTables.min.js") %>'></script>
<script>
    jQuery(document).ready(function () {
        jQuery('.SummaryTable').dataTable({
            "bSort": false,
            "processing": true,
            "serverSide": true,
            "ajax": {
                "type": "POST",
                "url": urlUtil.getAppRoot() + "Portlets/CUS/ICS/Jenzabar.ContainedForm/Services/FileService.asmx/Reports?form=" + jQuery('[id*=_drpPortletForms]').val()
            }
        });
    });
    var submissionId;
    var portletId;
    function showMappingModal(subId, pId)
    {
        submissionId = subId;
        portletId = pId;
        jQuery('.executeMappingModal').dialog({ width: 500 });
    }
    function deleteSubmission(subId)
    {
        ajaxUtil.callWebService(webServicePath + webService + "DeleteSubmission",
            { submissionId: subId },
            function (data) {
                if(data.d.isError)
                {
                    alert(data.d.Message);
                }
                else
                {
                    jQuery('.SummaryTable').DataTable()
                        .row(jQuery('a[onclick*=\'deleteSubmission("' + subId + '\']').parents('tr'))
                        .remove()
                        .draw();
                }
            });
    }
    function submitExecute()
    {
        ajaxUtil.callWebService(webServicePath + webService + 'ExecuteStatements',
        { portletId: portletId, submissionId: submissionId, save: jQuery('#saveMapping').is(':checked'), submit: jQuery('#submitMapping').is(':checked') },
        function (data) {
            jQuery('.saveCount').html(data.d.DSList['SaveCount']);
            jQuery('.submitCount').html(data.d.DSList['SubmitCount']);
            jQuery('.saveFailed').html(data.d.DSList['SaveFailed']);
            jQuery('.submitFailed').html(data.d.DSList['SubmitFailed']);
        });
    }
    ///////////////////////////////////////////////////////////////////////////////
    // ajaxUtil
    ///////////////////////////////////////////////////////////////////////////////
    var webServicePath = urlUtil.getAppRoot() + 'Portlets/CUS/ICS/Jenzabar.ContainedForm/Services/';
    var webService = 'FormBuildWebService.asmx/';

    (function (au, $) {
        au.callWebService = function (webService, data, callback) {
            $.ajax({
                type: 'POST',
                url: webService,
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data),
                dataType: 'json',
                success: callback
            });
        };
    }(window.ajaxUtil = window.ajaxUtil || {}, jQuery));
</script>
<div class="executeMappingModal">
    <cc1:Hint runat="server">
        As a form administrator, you can re-execute the mapped statements and stored procedures associated with this form.
        Check the box beside the events you would like to execute and click the "Execute" button below. The number of successfully
        executed statements will be returned to the screen upon completion.
    </cc1:Hint>
    <table width="100%">
        <tr>
            <th>Event</th>
            <th>Success</th>
            <th>Failed</th>
        </tr>
        <tr>
            <td><input type="checkbox" id="saveMapping"/>Execute "Save" Mapping</td>
            <td class="saveCount"></td>
            <td class="saveFailed"></td>
        </tr>
        <tr>
            <td><input type="checkbox" id="submitMapping"/>Execute "Submit" Mapping</td>
            <td class="submitCount"></td>
            <td class="submitFailed"></td>
        </tr>
        <tr>
            <td colspan="3">
                <button onclick="submitExecute();">Execute</button>
            </td>
        </tr>
    </table>
</div>
<table>
    <tr>
        <td>Forms in this portlet:</td>
        <td><asp:DropDownList ID="drpPortletForms" runat="server" AutoPostBack="True" 
                onselectedindexchanged="drpPortletForms_SelectedIndexChanged"></asp:DropDownList></td>
        <td><asp:LinkButton runat="server" ID="lnkExportCSV" onclick="lnkExportCSV_Click">Export to CSV</asp:LinkButton>&nbsp;<asp:Image runat="server" ID="imgExcel"/></td>
        <td><asp:Button runat="server" ID="btnDeleteAllSubmissions" 
                OnClientClick="if (!confirm('Are you sure you want to delete all submissions? (This cannot be undone)')){return false;}" 
                Text="Delete All" onclick="btnDeleteAllSubmissions_Click"/></td>
    </tr>
</table>
<asp:HiddenField runat="server" ID="hdnNumSubmissions" />
<asp:PlaceHolder ID="plFormSubmissions" runat="server"></asp:PlaceHolder>
</div>