<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Import Namespace="Jenzabar.Portal.Framework.Facade" %>

<script runat="server">
    protected string CleanUpGuestMyPages()
    {
        var context = GetGuestMyPagesContext();

        if (context == null) return "No Guest My Pages exists in ADLDS.";

        context.Delete();

        return "Guest My Pages successfully deleted.";
    }


    protected PortalContext GetGuestMyPagesContext()
    {
        var service = ObjectFactoryWrapper.GetInstance<IPortalContextFacade>();
        return service.FindByDN("CN=guest,CN=My Pages,CN=Portal,O=Jenzabar,C=US");
    }
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Clean Up Utility</title>
</head>
<body>
    <form id="form1" runat="server">
    <h1>Data Clean Up Utility</h1>
    <h2>Guest My Pages</h2>
    <div>
        <%= CleanUpGuestMyPages() %>
    </div>
    </form>
    
    <%
        
         %>
</body>
</html>
