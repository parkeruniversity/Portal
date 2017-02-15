<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustomizeContext.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeContext" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cust" tagname="ContextPropertiesView" src="~/UI/CommonPortlets/CustomizeContext/ContextPropertiesView.ascx" %>
<%@ Register TagPrefix="cust" tagname="ContextPagesView" src="~/UI/CommonPortlets/CustomizeContext/ContextPagesView.ascx" %>
<%@ Register TagPrefix="cust" tagname="ContextSectionsView" src="~/UI/CommonPortlets/CustomizeContext/ContextSectionsView.ascx" %>
<%@ Register TagPrefix="cust" tagname="ContextSecurity" src="~/UI/CommonPortlets/CustomizeContext/ContextSecurity.ascx" %>
<%@ Register TagPrefix="cust" TagName="CourseExport" Src="~/UI/CommonPortlets/CustomizeContext/CourseContentExport.ascx" %>

<cmn:ErrorDisplay id="oops" runat=server />

<cmn:TabGroup id="tabs" runat="server">



<cmn:Tab id="tabProperties" runat="server" text="Properties">
<cust:ContextPropertiesView id="ctlContextPropertiesView" runat="server" Visible="True" />	
</cmn:Tab>

<cmn:Tab id="tabPages" runat="server" text="Pages">
<cust:ContextPagesView id="ctlContextPagesView" runat="server" Visible="True" />	
</cmn:Tab>

<cmn:Tab id="tabSections" runat="server" text="Sub-Sections">
<cust:ContextSectionsView id="ctlContextSectionsView" runat="server" Visible="True" />	
</cmn:Tab>

<cmn:Tab id="tabPermissions" runat="server" text="Permissions">
<cust:ContextSecurity id="ctlContextSecurity" runat="server" visible="True" />	
</cmn:Tab>

<cmn:Tab ID="tabExport" runat="server" Text="Export">
  <cust:CourseExport ID="ctrlCourseExport" runat="server" Visible="true"/>
</cmn:Tab>

</cmn:TabGroup>

<div class="pActions">
<asp:Button id="btnCancel" runat="server" CausesValidation="False" text="Exit" />
</div>
