<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdditionalStudentsListView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Views.AdditionalStudentsListView" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="..\Controls\Modal.ascx" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<link href="<%= ResolveUrl("~/Portlets/LMS/CourseworkPortlet/Style/CourseworkPortletStyle.aspx") %>" type="text/css" rel="stylesheet" />

<script language="javascript" src="UI/Common/Scripts/jquery.blockui.js"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#modalButtons input:first").click(function () {
            $.blockUI({
                message: $('#divBlock'),
                css: { border: 'none', background: 'transparent' },
                overlayCSS: { backgroundColor: '#fff', opacity: 0.8 }
            });
            $find('<%= AddModal.UniqueID %>').hide();
        });
    });
</script>    

<div id="additionalStudents">
    <div id="studentList">
        <asp:GridView ID="StudentList" AutoGenerateColumns="false" UseAccessibleHeader="true" CssClass="groupedGrid cwkTableDisplay itemHover" AlternatingRowStyle-CssClass="alt" runat="server">
            <Columns>
                <asp:TemplateField>
		            <HeaderTemplate><%= Globalizer.GetString("HDR_STUDENT") %></HeaderTemplate>
		            <ItemTemplate>
                        <span class="studentName">
                            <asp:Literal id="Name" runat="server" />
                        </span>
		            </ItemTemplate>
	            </asp:TemplateField>
                <asp:TemplateField>
		            <HeaderTemplate><%= Globalizer.GetString("HDR_STATUS") %></HeaderTemplate>
		            <ItemTemplate>
		                <asp:Literal id="Status" runat="server" />
		            </ItemTemplate>
	            </asp:TemplateField>
                <asp:TemplateField>
		            <HeaderTemplate><%= Globalizer.GetString("HDR_ACTION") %></HeaderTemplate>
		            <ItemTemplate>
                        <asp:LinkButton id="ActionLink" runat="server" />
		            </ItemTemplate>
	            </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div id="summary">
        <ul>
            <li>
                <asp:Literal ID="Summary" runat="server" />
            </li>            
            <li class="studentCount">
                <asp:Literal ID="RosterCount" runat="server" />
            </li>
            <li class="studentCount">
                <asp:Literal ID="NonrosterCount" runat="server" />
            </li>
            <li>
                <jics:ImageAndTextButton ID="AddNonrosterStudent" runat="server" TextKey="MSG_CWK_ADD_NONROSTER_STUDENT" ToolTipKey="MSG_CWK_ADD_NONROSTER_STUDENT" />
            </li>
            <li>
                <jics:ImageAndTextButton ID="AboutNonrosterStudents" runat="server" TextKey="MSG_CWK_ABOUT_NONROSTER_STUDENTS" ToolTipKey="MSG_CWK_ABOUT_NONROSTER_STUDENTS" />
            </li>
            <li>
                <br />
            </li>
            <li>
                <asp:LinkButton ID="BackLink" runat="server">
                    <%= Globalizer.GetString("MSG_BACK_TO_THE_PERMISSIONS_SCREEN") %>
                </asp:LinkButton>
            </li>
        </ul>
    </div>
    <lms:Modal id="AddModal" runat="server" TargetControlID="AddNonrosterStudent">
        <ContentArea>
            <div id="selector">
                <jics:PrincipalSelector id="Selector" runat="server" />
            </div>
        </ContentArea>
    </lms:Modal>
    <lms:Modal id="AboutModal" runat="server" TargetControlID="AboutNonrosterStudents">
        <ContentArea>
            <div class="pSection">
                <%= Globalizer.GetString("MSG_CWK_ABOUT_ADDITIONAL_STUDENTS")%>
            </div>
        </ContentArea>
    </lms:Modal>
</div>
<div class="pActions">
    <jics:GlobalizedButton id="ExitButton" runat="server" TextKey="TXT_EXIT" />
</div>
<div id="divBlock" style="display:none; z-index: 10000;" >
    <img src="<%=GetAJAXImageUrl()%>" />
</div>


