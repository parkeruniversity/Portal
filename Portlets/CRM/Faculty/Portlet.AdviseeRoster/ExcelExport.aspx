<%@ Register TagPrefix="fwk" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Page language="c#" Codebehind="ExcelExport.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.AdviseeRosterPortlet.ExcelExport" %>
<HTML>
	<HEAD>
		<title>Excel Export</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<div>
				<jenzabar:groupedgrid id="dgResults" runat="server" DataKeyField="AdviseeID" RenderTableHeaders="true"
					ShowHeader="true" Style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">
					<TableHeaderTemplate>
		<%#base._name%>&nbsp;<%#base._studentcount%>
		</TableHeaderTemplate>
					<EmptyTableTemplate>
						<jenzabar:GlobalizedLiteral id="glitNoRecords" runat="server" TextKey="TXT_CS_NO_MATCHING_RECORDS"></jenzabar:GlobalizedLiteral>
					</EmptyTableTemplate>
					<Columns>
						<jenzabar:GlobalizedBoundColumn DataField="FERPARestriction" HeaderTextKey="TXT_FCC_FERPA_RESTRICT" ItemStyle-HorizontalAlign="Left"
							ItemStyle-VerticalAlign="Top" Visible="true" />
						<jenzabar:GlobalizedBoundColumn DataField="AdviseeID" HeaderTextKey="TXT_STUDENT_ID" ItemStyle-HorizontalAlign="Left"
							ItemStyle-VerticalAlign="Top" Visible="true" />
						<jenzabar:GlobalizedBoundColumn DataField="AdviseeName" HeaderTextKey="TXT_NAME" ItemStyle-HorizontalAlign="Left"
							ItemStyle-VerticalAlign="Top" Visible="true" />
						<jenzabar:GlobalizedBoundColumn DataField="NeedsToRegister" HeaderTextKey="TXT_AR_NEEDS_TO_REGISTER" ItemStyle-HorizontalAlign="Left"
							ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
						<jenzabar:GlobalizedBoundColumn DataField="RegistrationClearance" HeaderTextKey="TXT_AR_REGISTRATION_CLEARANCE"
							ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
					</Columns>
				</jenzabar:groupedgrid>
			</div>
		</form>
	</body>
</HTML>
