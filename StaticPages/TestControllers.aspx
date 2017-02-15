<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestControllers.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.TestControllers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Controllers</title>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <script type="text/javascript" language="javascript">
        function callController() {
            var form = document.forms[0];
            var bodyData = "";

            if (form["_tbBody"].value.length > 0) {
                bodyData = JSON.parse(form["_tbBody"].value);
            }
	        
            $.ajax({
                type: form["_ddlRequestType"].value,
                url: form["_tbUrl"].value,
                data: bodyData
            })
                .done(function(data) {
                    $("textarea#textarea").val(JSON.stringify(data));
                })
                .fail(function (error) {
                	var err = JSON.parse(error.responseText);
                	var errorMessage = err.exceptionMessage;
                	$("textarea#textarea").val("Error!: " + errorMessage);
                });

        }
    </script>
</head>
<body bgcolor="#d3d3d3">
<form name="thisForm" runat="server">
<asp:Label ID="_lblUserInfo" runat="server" />
    <table>
        <tr>
            <td>Request type:</td>
            <td>
                <asp:DropDownList ID="_ddlRequestType" runat="server">
                    <asp:ListItem Value="post" Text="Post" />
                    <asp:ListItem Value="get" Text="Get" />
                    <asp:ListItem Value="put" Text="Put" />
                    <asp:ListItem Value="delete" Text="Delete" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Url:</td>
            <td><asp:TextBox ID="_tbUrl" Width="400" runat="server" /></td>
        </tr>
        <tr>
            <td valign="top">post/put body (if any)</td>
            <td><asp:TextBox ID="_tbBody" TextMode="MultiLine" Rows="5" Width="400" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><button onclick="callController(); return false;">Submit</button></td>
        </tr>
    </table>
    Results:<br/>
    <textarea id="textarea" rows="10" cols="70"></textarea>
</form>
</body>
</html>
