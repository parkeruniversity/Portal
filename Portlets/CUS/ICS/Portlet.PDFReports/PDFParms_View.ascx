<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PDFParms_View.ascx.cs" Inherits="Jenzabar.CUS.ICS.Web.Portlets.PDFReportsPortlet.PDFParms" %>
<div class="pSection">
	<div class="hint">Enter or select values for each parameter then click submit. Every 
		parameter is required.
	</div>
	<asp:PlaceHolder ID="phStuff" runat="server" />
	<table width="100%">
		<tr>
			<td>&nbsp;</td>
			<td>
				<asp:Button ID="btnViewReport" Runat="server" Text="Generate Report" />&nbsp;&nbsp;
				<asp:Button ID="btnCancel" Runat="server" Text="Cancel" />
			</td>
		</tr>
	</table>
</div>
