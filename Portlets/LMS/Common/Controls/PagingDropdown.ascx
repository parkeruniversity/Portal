<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PagingDropdown.ascx.cs" Inherits="Jenzabar.LMS.Portlets.Common.Controls.PagingDropdown" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="lms" TagName="More" Src="../../Common/Controls/MoreWindow.ascx" %>

<ul class="pagingDropdown">
	<li><common:GlobalizedHyperLink ID="PreviousButton" TextKey="TXT_PREVIOUS" CssClass="previousLink" runat="server" /></li>
	<li>
		<lms:More ID="MoreWindow" LeftWindowOffset="-20" IsCloseButtonVisible="false" runat="server">
			<ContentArea>
				<asp:Repeater ID="PageItemRepeater" runat="server">
					<ItemTemplate>
						<div class="pageItem"><asp:HyperLink ID="PageItem" runat="server" /></div>
					</ItemTemplate>
				</asp:Repeater>
			</ContentArea>
		</lms:More>
	</li>
	<li><common:GlobalizedHyperLink ID="NextButton" TextKey="TXT_NEXT" CssClass="nextLink" runat="server" /></li>
</ul>
