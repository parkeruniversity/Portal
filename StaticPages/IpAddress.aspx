
<%@ Import Namespace="Jenzabar.Common.ApplicationBlocks.ExceptionManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <script runat="server">

            protected string WriteIpAddressToScreen()
            {
                try
                {
                    var stringBuilder = new StringBuilder();
                    var clientIpAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                    if (string.IsNullOrEmpty(clientIpAddress))
                    {
                        stringBuilder.Append("No value for HTTP_X_FORWARDED_FOR.  Using REMOTE_ADDR");
                        stringBuilder.Append("<br/>");
                        stringBuilder.Append(HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]);
                        
                        return stringBuilder.ToString();
                    }
                    else
                    {
                        stringBuilder.Append("Using HTTP_X_FORWARDED_FOR.");
                        stringBuilder.Append("<br/>");
                        var ipAddresses = clientIpAddress.Split(',');
                        
                        foreach (var ipAddress in ipAddresses)
                        {
                            stringBuilder.Append(ipAddress);
                            stringBuilder.Append("<br/>");
                        }
                        return stringBuilder.ToString();
                    }
                }
                catch (Exception e)
                {
                    ExceptionManager.Publish(e);
                }
                return "Unknown";
            }
        </script>
        
        <%= WriteIpAddressToScreen() %>
        
        
        

    </div>
    </form>
</body>
</html>
