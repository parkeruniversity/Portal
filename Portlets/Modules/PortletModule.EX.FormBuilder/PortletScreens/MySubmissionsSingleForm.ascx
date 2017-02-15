<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MySubmissionsSingleForm.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.MySubmissionsSingleForm" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register src="UserControls/User_Submissions.ascx" tagname="User_Submissions" tagprefix="JICS" %>
<h4><asp:Literal ID="litPTitle" runat="server" /></h4>
<div class="FormBuilder">
	<div class="pSection">
        <JICS:User_Submissions ID="_user_Submissions" Runat="server"  />
        <a id="aViewAll" runat="server"><%=Globalizer.GetGlobalizedString("TXT_VIEW_SUBMISSIONS_FOR_ALL_FORMS")%></a><br />
        <a id="aBack" runat="server"><%=Globalizer.GetGlobalizedString("FB_BACKMAINSCREEN_TXT")%></a>
    </div>
</div>