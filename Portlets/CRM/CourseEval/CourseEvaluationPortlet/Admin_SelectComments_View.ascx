<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Admin_SelectComments_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.Admin_SelectComments_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>

<style>
	.ceButtonBar
	{
		text-align: center;
	}

	.ceButtonBar input
	{
		margin: 10px;
	}
</style>

<common:Subheader ID="PageHeader" Text="Grant Permissions" runat="server" />

<div class="pSection">
	<p id="IntroText" runat="server" />

	<framework:PSTwo ID="ViewerSelector" runat="server" />
	
	<div class="ceButtonBar">
		<asp:Button ID="SaveButton" Text="Save" runat="server" />
		<asp:Button ID="CancelButton" Text="Cancel" runat="server" />
	</div>
</div>
