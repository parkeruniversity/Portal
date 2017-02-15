<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewSubmission.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.PortletScreens.ViewSubmission" %>
<%@ Import namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register src="UserControls/SubmissionStatus.ascx" tagname="SubmissionStatus" tagprefix="JICS" %>
<%@ Register src="UserControls/SubmissionResponses.ascx" tagname="SubmissionResponse" tagprefix="JICS" %>

<h4><asp:Literal ID="litPTitle" runat="server" /></h4>
<div class="FormBuilder">
	<div class="pSection">	
        <JICS:SubmissionStatus ID="_submissionStatus" runat="server" />		
		<asp:Repeater ID="_submissionResponseRepeater" runat="server">
		    <ItemTemplate>
		        <asp:Literal ID="litSName" runat="server" />
		        <JICS:SubmissionResponse ID="_showSubmissionQuestionResponses" runat="server"/>
		    </ItemTemplate>
		</asp:Repeater>
		<asp:HyperLink ID="_goBackLink" runat="server" />		
	</div>
</div>