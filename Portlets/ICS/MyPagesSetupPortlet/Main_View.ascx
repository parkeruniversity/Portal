<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyPagesSetupPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>

<h4><%= this.CurrentStep.Title %></h4>
<div class="pSection">

<%= this.CurrentStep.Body %>

<div  style="margin:0 5em">
<common:ContentBox runat="server">
<table style="width:100%;text-align:center; margin: .5em 2em">
<tr>
<td width="50%"><common:GlobalizedLinkButtonWithIcon id="previousStepLink" IconSrc="UI/Common/Images/PortletImages/Icons/lf_arrow.gif" IconLocation="BeforeText" runat="server"/></td>
<td width="50%"><common:GlobalizedLinkButtonWithIcon id="nextStepLink" IconSrc="UI/Common/Images/PortletImages/Icons/rt_arrow.gif" IconLocation="AfterText" runat="server"/></td>
</tr>
<tr>
<td colspan="2">
<hr>
<common:GlobalizedLinkButton id="gotoMyPagesLink" TextKey="TXT_MYPAGES_SETUP_GO_DIRECTLY_TO_MYPAGES" runat="server" style="color:#000" />
</td>
</tr>
</table>
</common:ContentBox>
</div>

</div>