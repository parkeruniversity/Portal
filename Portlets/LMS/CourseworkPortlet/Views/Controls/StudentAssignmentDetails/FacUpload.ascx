<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FacUpload.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.FacUpload" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<div>
	<asp:Literal ID="_litFileInfo" runat="server" />
	<br />
	<asp:Panel ID="_panAssignmentOpen" CssClass="uploadOpen" runat="server">
		<asp:Label ID="_lblUserOpen" runat="server" />
		<asp:Literal ID="_lblOpenInfo" runat="server" />
	</asp:Panel>
	<asp:Panel ID="_panFiles" CssClass="fileContainer" runat="server">
		<asp:Repeater ID="_rptFiles" runat="server">
			<ItemTemplate>
				<div  class="fileDisplay">
					<asp:HyperLink ID="_hyp" runat="server" /> (<asp:Literal ID="_lit" runat="server" /> <asp:Label ID="_lblDate" runat="server" />)
					<div>
						<asp:Literal ID="_litDescrip" runat="server" />
					</div>
				</div>
			</ItemTemplate>
		</asp:Repeater>
		<div class="downloadAll">
			<framework:PortalImageAndHyperLink id="_phiAll"  runat="server" />
		</div>
	</asp:Panel>
	<asp:Panel ID="_panFileInfo" CssClass="uploadInfo" runat="server" />
</div>