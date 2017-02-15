<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseworkQuestionSearch.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseworkQuestionSearch" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fwk" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<fieldset class="searchForm">
	<div><asp:textbox id="txtSearchString" MaxLength="100" runat="server" />
	    <asp:DropDownList id="ddlQuestionType" runat="server" />
    </div>
	<div>
	    <asp:RadioButtonList id="rblSearchAnswersToo" runat="server" RepeatLayout="Flow" />
    </div>
	<div class="executeSearch">
	    <cmn:GlobalizedButton id="btnSearch" runat="server" TextKey="TXT_SEARCH" />
    </div>
</fieldset>
<asp:PlaceHolder id="resultsInfo" runat="server" />
<cmn:GroupedGrid id="ggResults" runat="server" RenderTableHeaders="true" DataKeyField="ID">
    <columns>
        <cmn:checkboxcolumn />
        <cmn:GlobalizedTemplateColumn headertextkey="TXT_QUESTION">
            <itemtemplate><%# this.GetQuestionLinkHTML(Container.DataItem) %></itemtemplate>
        </cmn:GlobalizedTemplateColumn>
        <cmn:GlobalizedTemplateColumn headertextkey="TXT_TYPE">
            <itemtemplate><%# this.GetQuestionType(Container.DataItem) %></itemtemplate>
        </cmn:GlobalizedTemplateColumn>
    </columns>
    <SubItemTemplate><%# this.GetQuestionLocationBreadcrumbsHTML(Container.DataItem) %></SubItemTemplate>
</cmn:GroupedGrid>