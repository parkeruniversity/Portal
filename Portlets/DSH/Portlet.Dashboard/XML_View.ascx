<%@ Control Language="c#" AutoEventWireup="false" Codebehind="XML_View.ascx.cs" Inherits="Jenzabar.DSH.Web.Portlets.DashboardPortlet.XML_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
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
	<asp:TextBox ID="txt" Runat="server" Columns="200" Rows ="50" TextMode="MultiLine" Visible="true" />
</div>
