<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WeightingAdminPanel.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.Controls.WeightingAdminPanel" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<div class="weightingAdmin">
    <div id="SelectPanel" class="selectPanel" style="" runat="server">
	    <asp:Label ID="WeightingAdminDescription" runat="server"/>
	    <ul>
		    <asp:Repeater ID="OptionRepeater" runat="server">
			    <ItemTemplate>
				    <li style="padding: 10px; clear: both;">
					    <asp:LinkButton ID="OptionButton" CssClass="roundedTextButton" runat="server" />
					    <asp:Label ID="OptionNote" CssClass="optionNote" runat="server"/>
				    </li>
			    </ItemTemplate>
		    </asp:Repeater>
	    </ul>
    </div>
    <div id="InactivePanel" class="inactivePanel" runat="server">
	    <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="status-inactive.png" runat="server" />
	    <em><asp:Label ID="InactiveTextLabel" runat="server" /></em>
    </div>
    <div id="DisplayPanel" class="displayPanel"  runat="server">
	    <framework:PortalImage ImageCategory="PortletIcon" ImageUrl="16/tick.png" runat="server" />
	    <asp:Label ID="DisplayTextLabel" CssClass="answer" runat="server" />
	    <framework:PortalImageAndTextButton ID="DisplayEditTextButton" ImageCategory="PortletIcon" ImageUrl="edit.gif" runat="server" />
    </div>
    <div class="summaryPanel">
	    <div><asp:Label ID="WeightingAdminHeaderText" runat="server"/></div>
	    <div><strong><asp:Label ID="WeightingAdminName" runat="server"/></strong></div>
    </div>
    <div style="clear: both" ></div>

</div>