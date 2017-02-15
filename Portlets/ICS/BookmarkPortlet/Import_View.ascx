<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Import_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BookmarkPortlet.Import_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="Common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>

<%@ Register TagPrefix="BookmarkPortlet" tagname="BookmarkGrid" src="~/Portlets/ICS/BookmarkPortlet/FileCabinet/BookmarkGrid.ascx" %>

<h4>
	<table width="100%" cellpadding="0px" cellspacing="0px" border="0px">
		<tr>
			<td align="left">
				<Common:GlobalizedLinkButton id="lnkGoToEdit" runat="server" textkey="TXT_EDIT" />
				&gt;
				<asp:PlaceHolder ID="phBreadcrumb" Runat="server" />
				<asp:Literal ID="litTitle" Runat="server" />
			</td>
			<td align="right">
				<Common:GlobalizedLinkButtonWithIcon id="lnkUp" runat="server" TextKey="TXT_UP_ONE_LEVEL" />
			</td>
		</tr>
	</table>
</h4>
<div class="pSection">
    <BookmarkPortlet:BookmarkGrid ID="bookmark_grid" runat="server" />
</div>
<div class="pSection" align="center">
	<Common:GlobalizedButton ID="lnkSave" TextKey="TXT_IMPORT_SELECTED" Runat="server" EnableViewState="false" />
	&nbsp;
	<Common:GlobalizedButton ID="lnkCancel" TextKey="TXT_CANCEL" Runat="server" />
</div>