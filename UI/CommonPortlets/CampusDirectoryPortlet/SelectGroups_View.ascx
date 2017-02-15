<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SelectGroups_View.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CampusDirectoryPortlet.SelectGroups_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>

<cmn:Subheader id="subHeader" runat="server"/>
<div class="pSection">
	<cmn:ErrorDisplay id="ctlError" runat=server />
	<cmn:Hint id="hint" runat="server" /><br>
	
	<fieldset>
	<div>
	<asp:ListBox SelectionMode="Multiple" ID="lbRoles" Rows="10" Runat="server"/>
	&nbsp;<asp:Button ID="btnSubmit" Runat="server"/>
	</div>
	
	</fieldset>
</div>
