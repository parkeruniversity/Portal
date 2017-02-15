<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CourseTemplatePreviewGrid.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.CourseTemplatePreviewGrid" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<h5><%# ((Jenzabar.Portal.Framework.FileCabinetItem)this.ParentGridView.DataItem).Properties["displayName"] %> <%# Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_TEMPLATE") %></h5>
<dl class="roleList"><dt><b><cmn:GlobalizedLiteral id="l1" runat="server" TextKey="LBL_ROLES" /></b></dt><dd><%# this.GetGroupsInContext( this.ParentGridView.DataItem ) %></dd></dl>
<%# ((Jenzabar.Portal.Framework.FileCabinetItem)this.ParentGridView.DataItem).Properties["preview"] %>
<cmn:GroupedGrid id="ggMain" runat="server" rendertableheaders="true" visible="false">

</cmn:GroupedGrid>
