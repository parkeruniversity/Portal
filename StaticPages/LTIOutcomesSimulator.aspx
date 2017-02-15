<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LTIOutcomesSimulator.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.LTIOutcomesSimulator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LTI Outcomes Simulator</title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td colspan="2"><b>LTI Outcomes Simulator</b></td>
        </tr>
        <tr>
            <td colspan="2">(get querystring values from StudentAssignmentFacultyView)</td>
        </tr>
        <tr>
            <td colspan="2" style="color:red;"><asp:Label ID="_lblMsg" runat="server"/></td>
        </tr>
        <tr>
            <td>PortalUserId (s=):</td>
            <td><asp:TextBox ID="_tbUserId" runat="server" /></td>
        </tr>
        <tr>
            <td>AssignmentId (id=):</td>
            <td><asp:TextBox ID="_tbAssignmentId" runat="server"/></td>
        </tr>
        <tr>
            <td>Whole number percent grade (77):</td>
            <td><asp:TextBox ID="_tbGrade" MaxLength="3" Width="25" runat="server"/> %</td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="_btnSubmit" Text="Submit" runat="server"/></td>
        </tr>
    </table>
    </form>
</body>
</html>
