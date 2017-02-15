<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SiteSideBarLinksView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.SiteSideBarLinksView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cust" tagname="Links" src="~/UI/CommonPortlets/CommonControls/SideBarLinks.ascx" %>


<cmn:subheader id=subHeader runat="server"></cmn:Subheader>
<div class=pSection>
<P>
<cmn:hint id="hntLinks" runat="server"></cmn:hint> 
</P>
<cust:links id=ctlSideBarLinks runat="server"></cust:Links>
</DIV>
