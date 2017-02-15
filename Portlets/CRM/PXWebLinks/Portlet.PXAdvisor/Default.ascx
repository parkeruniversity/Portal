<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.PXWebLinks.Web.Portlets.PXAdvisorPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<div class="pSection" id="divMain" runat="server">
	<div class="pSection" id="divError" runat="server" Visible="False"><jenzabar:errordisplay id="errDisplay" RunAt="server"></jenzabar:errordisplay></div>
	<div class="pSection" id="divWarning" runat="server" visible="False">&nbsp;&nbsp;&nbsp;
		<asp:label id="lblWarning" Runat="server" CssClass="PortletError"></asp:label></div>
	<div class="pSection" id="divMessage" runat="server" visible="False">&nbsp;&nbsp;&nbsp;
		<asp:label id="lblMessage" Runat="server"></asp:label></div>
	<div class="pSection" id="divResults" runat="server" Visible="False"><jenzabar:subheader id="hdrSearch" runat="server" Visible="False"></jenzabar:subheader><asp:table id="tblMain" Runat="server" Width="100%">
			<asp:TableRow>
				<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left">
					<asp:table id="tblPxAdvSelect" Visible="False" Runat="server">
						<asp:TableRow>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left">
								<asp:Label ID="lblPXadvisee">Student: </asp:Label>
							</asp:TableCell>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left">
								<asp:dropdownlist id="ddlPXAdvisees" runat="server" DataTextField="FullName" DataValueField="AdviseeID"></asp:dropdownlist>
							</asp:TableCell>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left">
								<asp:Button Text="Select" id="btnPXSelect" OnClick="btnPXSelect_Click" runat="server"></asp:Button>
							</asp:TableCell>
						</asp:TableRow>
					</asp:table>
					<asp:table id="tblPxADVlookup" Visible="False" runat="server">
						<asp:TableRow>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left">
								<asp:label id="lbltbPXadvisee" runat="server" />
							</asp:TableCell>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left">
								<asp:TextBox ID="tbPXAdviseeFnd" columns="30" runat="server"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left">
								<asp:button id="btnPXLookup" OnClick="btnPXLookup_Click" runat="server"></asp:button>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left"></asp:TableCell>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Center">
								<jenzabar:hint id="hntStdFind" runat="server"></jenzabar:hint>
							</asp:TableCell>
							<asp:TableCell VerticalAlign="Middle" HorizontalAlign="Left"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow>
							<asp:TableCell ColumnSpan="3" VerticalAlign="Bottom" HorizontalAlign="Left">
							<asp:Label ID="lblSrchError" CssClass="PortletError" Runat="server"></asp:Label>
							</asp:TableCell>
						</asp:TableRow>
					</asp:table>
				</asp:TableCell>
			</asp:TableRow>
		</asp:table></div>
</div>
