<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DataImport.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.DataImport" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import Namespace="Jenzabar.Common.Configuration" %>
<tr><td>
    <h5><%=Globalizer.GetGlobalizedString("TXT_ADD_COURSE_SECTION_BEHAVIOR")%></h5>
    <div class="pSection">
        <%=Globalizer.GetGlobalizedString("MSG_FSC_DIS_ACSB")%>
        <%= Jenzabar.Portal.Framework.Configuration.Settings.ADD_COURSE_SECTION_BEHAVIOR%>:
	    <asp:DropDownList ID="ddlACSB" Runat="server">			
			<asp:ListItem Value="xmlTemplate" Selected="True">xmlTemplate</asp:ListItem>
			<asp:ListItem Value="sameFaculty">sameFaculty</asp:ListItem> 
		</asp:DropDownList>
    </div>
    <div id="_divLmsElements" runat="server">
        <h5><%=Globalizer.GetGlobalizedString("TXT_PURGE_OLD_COURSES")%></h5>
        <div class="pSection">
            <p><%=Globalizer.Format("MSG_PURGE_OLD_COURSES_INSTRUCTIONS", ConfigSettings.PurgeOldCoursesAfterNumDaysMinimumDays)%></p>
            <%=Globalizer.GetGlobalizedString("TXT_PURGE_OLD_COURSES_AFTER")%> <asp:TextBox ID="_tbPurgeAfterNumberDays" runat="server" MaxLength="5" Columns="5" /> <%=Globalizer.GetGlobalizedString("TXT_DAYS").ToLower()%>
            <asp:Label ID="_lblErrPurgeNum" runat="server" CssClass="ValidationError" />
        </div>
    </div>
</td></tr>