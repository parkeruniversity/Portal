<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditFilePopup.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.EditFilePopup" %>
<script language="javascript" type="text/javascript">
    function cancelEditFilePopup<%=ClientID %>() {
        $('#<%= txtFileLabel.ClientID%>').val('<%=CurrentLabel.Replace("'",@"\'") %>');
        $('#<%= txtFileDescription.ClientID%>').val('<%=CurrentDescription.Replace("'",@"\'") %>');
    }
</script>
 <div>
    <div class="uploadFilePanelHeader">
      <div class="closeIcon">
        <asp:Image ID="imgClose" runat="server" onclick="modalCloseClick()" />
      </div>
      <div>
        <asp:Label ID="lblEditFile" runat="server" CssClass="headerText" />
      </div>
    </div>
    <table>       
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblFileLabel" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtFileLabel" runat="server" Width="210" />
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="lblFileDescription" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtFileDescription" runat="server" TextMode="MultiLine" Height="40px"
                    Width="210px" />
            </td>
        </tr>
        <tr>
            <td>
              <asp:HiddenField ID="hdnFileID" runat="server" />
            </td>
            <td>
                <div>
                    <asp:Button ID="btnSave" runat="server" />
                    <asp:Button ID="btnCancel" runat="server" />
                </div>
            </td>
        </tr>
    </table>
</div>