<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.DSH.Web.Portlets.DashboardPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<asp:TextBox ID="txt" Runat="server" Columns="200" Rows ="10" TextMode="MultiLine" Visible="false" />
<div class="pSection">
	<table width="100%">
		<tr>
			<td>
				<asp:LinkButton ID="lnkBack" Runat="server" />
			</td>
			<td align="right">
				<a href="./staticpages/svgview.exe" target="blank">
					Download Adobe SVG Viewer
				</a>
			</td>
		</tr>
	</table>
	<table cellspacing="5" border="0" >
		<asp:Literal ID="litItems" Runat="server" />
	</table>
</div>
