<%@ Control Language="c#" CodeBehind="CourseworkQuestionSearchView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseworkQuestionSearchView" AutoEventWireup="True" %>
<%@ Register src="Controls/QuestionSearch.ascx" tagname="QuestionSearch" tagprefix="FC" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<FC:QuestionSearch ID="_questionSearch" runat="server" />
<asp:UpdatePanel id="_up" runat="server" >
    <ContentTemplate>
        <div class="cwkSaveButtonBar" id="_divDelete" runat="server">
            <asp:Button runat="server" ID="_btnDelete"/>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>