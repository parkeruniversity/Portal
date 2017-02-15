<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RichTextEditor.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.RichTextEditor" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>

<div class="richTextContainer">
	<cmn:TextBoxEditor id="_editor" height="150px" runat="server" />
	<asp:Panel ID="_panItems" runat="server">
		<div >
			<asp:PlaceHolder ID="_phImages" runat="server" />
		</div>
		<div>
			 <framework:PortalImageAndHyperLink ID="_piAddEquation" ImageCategory="PortletIcon"  runat="server" />
			<asp:PlaceHolder ID="_phEditorJS" runat="server" />
			<asp:Button ID="_btnHidden" style="display:none" runat="server" />

			<asp:Repeater ID="_rptEquations" runat="server">
				<ItemTemplate>
					<div class="editEquation">
						<asp:PlaceHolder id="_phEqDisplay" runat="server" />
						<asp:HyperLink ID="_hypEdit" runat="server" />
						<asp:ImageButton ID="_ibtnDelete" runat="server" />
					</div>
				</ItemTemplate>
			</asp:Repeater>
		</div>
	</asp:Panel>
</div>