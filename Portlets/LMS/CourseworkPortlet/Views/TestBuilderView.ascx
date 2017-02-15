<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestBuilderView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.TestBuilderView" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register src="Controls/TestBuilderHeader.ascx" tagname="Header" tagprefix="cwk" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register src="Controls/QuestionGroupDisplay.ascx" tagname="QuestionGroup" tagprefix="cwk" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel ID="_updatePanelHeader" runat="server">
<ContentTemplate>
	<cwk:Header id="_header" runat="server" />
</ContentTemplate>
</asp:UpdatePanel>


<div class="pSection testBuilder">
    <div style="width:680px;">
        <div class="tbImport" runat="server" id="_divImport">
            <asp:HyperLink runat="server" ID="_hypImport"></asp:HyperLink>   
            <br/>
            <asp:Label runat="server" ID="_lblImport"></asp:Label>
         </div>
	    <div class="tbTopLinks tbPreview">
		    <framework:PortalImageAndHyperLink ID="_phiPreview" ImageCategory="PortletIcon"  runat="server" />
	    </div>
	    <div class="tbTopLinks tbAddSection">
		    <framework:PortalImageAndHyperLink ID="_phiAddSection" ImageCategory="PortletIcon"  runat="server" />
	    </div>
    </div>

	<asp:UpdatePanel ID="_updatePanel" runat="server">
	<ContentTemplate>
		<ajax:ReorderList ID="_reorderGroups" EnableViewState="false" CssClass="reorderList" AllowReorder="true" DragHandleAlignment="Right" PostBackOnReorder="true" runat="server">
			<ItemTemplate>
				<cwk:QuestionGroup id="_qGroup"  runat="server" />
			</ItemTemplate>
			<DragHandleTemplate>
				<div class="dragHandle" id="_divDrag" runat="server">
					&nbsp;
				</div>
			</DragHandleTemplate>
			<ReorderTemplate>
				<div class="dragReorder"></div>
			</ReorderTemplate>
		</ajax:ReorderList>
	</ContentTemplate>
	</asp:UpdatePanel>
</div>

<div class="cwkBorderButtonBar bottom">
	<div class="detailHeaderNav" id="_divNextPrev" runat="server">
		<framework:PortalImageAndHyperLink ID="_phiPrevious" ImageCategory="PortletIcon"  runat="server" />
		<div style="display:inline;font-style:italic;margin:0px 10px 0px 10px;">other online tests</div>
		<framework:PortalImageAndHyperLink ID="_phiNext" ImageCategory="PortletIcon" runat="server" />
	</div>
		<framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon"  runat="server" />
</div>