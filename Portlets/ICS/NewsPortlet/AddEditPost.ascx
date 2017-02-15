<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddEditPost.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.AddEditPost" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register src="Controls/Content.ascx" tagname="Content" tagprefix="JICS" %>
<%@ Register src="Controls/Options.ascx" tagname="Options" tagprefix="JICS" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<cmn:SubHeader id="_hdrPost" runat="server" ></cmn:SubHeader>
<div class="pSection">
<cmn:contenttabgroup id="_newsContentTabs" runat="server">
		<cmn:ContentTab id="_tabContent" runat="Server">
		    <JICS:Content id="_content" runat="server"></JICS:Content>
		</cmn:ContentTab>
		<cmn:ContentTab ID="_tabOption">
		    <JICS:Options id="_options" runat="server"></JICS:Options>
		</cmn:ContentTab>
</cmn:contenttabgroup>
<table class="newsAction newsActionBorderSideBottom" cellspacing="0"  cellpadding="6" >
			<tr>
				<td class="newsActionSave" >
					<asp:Button ID="_btnPreview" Runat="server" OnClick="_btnPreview_Click" ></asp:Button>
				</td>
				<td>
					<asp:Button id="_btnSave" Runat="server" OnClick="_btnSave_Click"></asp:Button>&nbsp;&nbsp;<asp:Button id="_btnCancel" Runat="server" OnClick="_btnCancel_Click"></asp:Button>
				</td>
			</tr>
</table>
</div>