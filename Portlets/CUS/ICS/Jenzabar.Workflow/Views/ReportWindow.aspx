<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportWindow.aspx.cs" Inherits="Jenzabar.Workflow.Views.ReportWindow" %>
<%@ Register Assembly="Jenzabar.Workflow" Namespace="Jenzabar.Workflow.Controls" TagPrefix="cf" %>
<%@ Register Src="./Controls/DocumentVersionView.ascx" TagPrefix="uc1" TagName="DocumentVersionView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script type="text/javascript" src='<%= ResolveUrl("~/UI/Common/Scripts/bundle_siteJS") %>'></script>
</head>
<body runat="server" id="body" class="pt_JenzContainedForm reportView">
    <link rel="stylesheet" type="text/css" href='<%= ResolveUrl("~/UI/Common/Styles/jQuery/jquery-ui.custom.css") %>'/>
    <link type="text/css" rel="stylesheet" href='<%= ResolveUrl("~/Portlets/CUS/ICS/Jenzabar.ContainedForm/Styles/ContainedFormStyles.css") %>' />
    <link type="text/css" rel="stylesheet" href='<%= ResolveUrl("~/ClientConfig/HtmlContent/custom.css") %>' />
    <form id="form1" runat="server">
    <div>
        <cf:DocAdminControls runat="server" ID="docAdminControls" />
        <div class="jcf-report-form-view">
            <uc1:DocumentVersionView runat="server" id="DocumentVersionView" />
            <asp:Panel ID="_pnlReport" runat="server"></asp:Panel>
        </div>
    </div>
    </form>
</body>
</html>
