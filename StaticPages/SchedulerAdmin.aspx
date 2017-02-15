<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchedulerAdmin.aspx.cs" Inherits="Jenzabar.Portal.Web.StaticPages.SchedulerAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JICS Scheduler Admin</title>
</head>
<body>
    <form id="form" runat="server">
    <div>
        <asp:Button ID="installAllJobs" runat="server" onclick="InstallAllJobs_Click" Text="Install Jobs" />
        <asp:Button ID="resetAllJobs" runat="server" onclick="ResetAllJobs_Click" Text="Reset Jobs" />
    </div>
    <div>
        <asp:Literal ID="jobKeys" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
