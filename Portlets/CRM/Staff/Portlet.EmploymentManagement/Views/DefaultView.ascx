<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.DefaultView" %>
<%@ Register TagPrefix="uc" TagName="MainView" Src="~/Portlets/CRM/Staff/Portlet.EmploymentManagement/Views/MainView.ascx" %>

<%-- Javascript --%>
<script type="text/javascript"">

$(document).ready(function () {
    $(".EMMainPnlOptions").appendTo(".EMPage");
    $(".EMMainPnlCommittees").removeClass("EMMainPnlCommittees");
    $(".EMMainPnlOptions").removeClass("EMMainPnlOptions");
});

</script>

<uc:MainView runat="server" />
