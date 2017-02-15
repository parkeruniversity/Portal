<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="USReportOptions.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.UsageStatisticsPortlet.USReportOptions" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls"
    Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls"
    Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<script language="javascript" type="text/javascript">
    var dw;

    function validateDates() {
        
        var fromDate = new Date($('#<%= dpFrom.GetDateTextBoxClientID() %>').val());
        var toDate = new Date($('#<%= dpTo.GetDateTextBoxClientID() %>').val());
            
        if (fromDate > toDate) {
            alert("The 'From' date cannot be later than the 'To' date");
            return false;
        }
        else return true;
    }

    function showReportOptions() {
        var inputs = document.getElementsByTagName('div');
        for (var i = 0; i < inputs.length; i++) {
            var include = inputs[i].id.indexOf('divReportOptionsPopup');
            if (include != -1) {
                dw = new JCSL.ui.windows.DialogWindow(inputs[i], 'Report Options'); 
            }
        }
        dw.can_postback = true;
        dw.open(null);
    }

    function hideReportOptions() {
        clearFields();
        dw.close();
    }
    
    function clearFields() {
        $("#<%= dpFrom.GetDateTextBoxClientID() %>").val("");
        $("#<%= dpTo.GetDateTextBoxClientID() %>").val("");
    }

</script>

<asp:Image ID="imgMainOption" runat="server" />
<asp:HyperLink ID="hlMainOption" runat="server">
    <asp:Literal ID="litMainOption" runat="server" /></asp:HyperLink>
<div id="divReportOptionsPopup" style="display: none">
    <table width="100%">
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="lblShow" runat="server" />
            </td>
            <td>
                <asp:RadioButtonList ID="rblShow" runat="server" RepeatDirection="Vertical">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="lblSort" runat="server" />
            </td>
            <td>
                <asp:RadioButtonList ID="rblSort" runat="server" RepeatDirection="Vertical">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="lblDisplay" runat="server" />
            </td>
            <td>
                <asp:RadioButtonList ID="rblDisplay" runat="server" RepeatDirection="Vertical">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="lblDates" runat="server" />
            </td>
            <td valign="top">
              <table>
                <tr>
                  <td valign="top" align="left">
                    <asp:Label ID="lblFrom" runat="server" />
                  </td>
                  <td>
                    <jenzabar:DatePicker ID="dpFrom" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td valign="top" align="left">
                    <asp:Label ID="lblTo" runat="server" />
                  </td>
                  <td>
                  <jenzabar:DatePicker ID="dpTo" runat="server" />
                  </td>
                </tr>
              </table>
            </td>
        </tr>
       
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnSaveReportOptions" runat="server" Text="Save" OnClientClick="return validateDates()" />
                <asp:Button ID="btnCancel" runat="server" OnClientClick="hideReportOptions()" />
            </td>
        </tr>
    </table>
</div>
