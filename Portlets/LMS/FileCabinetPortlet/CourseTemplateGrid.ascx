<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseTemplateGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseTemplateGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fc" Namespace="Jenzabar.LMS.Portlets.FileCabinetPortlet" Assembly="Portlet.FileCabinet" %>
<cmn:GroupedGrid id="ggMain" runat="server" rendertableheaders="true">
<columns>
<fc:CheckboxColumn />
<cmn:GlobalizedTemplateColumn headertextkey="TXT_TEMPLATE"><itemtemplate><%# this.GetFolderOrItemMarkup( Container.DataItem ) %></itemtemplate></cmn:GlobalizedTemplateColumn>
<cmn:GlobalizedTemplateColumn headertextkey="TXT_EDIT"><itemtemplate><%# this.GetEditMarkup( Container.DataItem )  %></itemtemplate></cmn:GlobalizedTemplateColumn>
<cmn:GlobalizedTemplateColumn headertextkey="TXT_DELETE"><itemtemplate><%# this.GetDeleteMarkup( Container.DataItem ) %></itemtemplate></cmn:GlobalizedTemplateColumn>
</columns>
</cmn:GroupedGrid>
