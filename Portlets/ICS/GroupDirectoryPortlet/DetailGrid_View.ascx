<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<%@ Import Namespace="Jenzabar.ICS.Web.Portlets.GroupDirectoryPortlet" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DetailGrid_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.GroupDirectoryPortlet.DetailGrid_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<div class="pSection">
<jenzabar:groupedgrid id="ItemsGrid" runat="server" DataKeyField="ID" GroupKeyField="ID" rendertableheaders="True" HideTableHeadersWhenGridIsEmpty="True" allowsorting="true">
	<Columns>
		<asp:TemplateColumn HeaderText="" SortExpression="">
			<HeaderTemplate>
				<input id="SelectAll" runat="server" type="checkbox" onclick="checkAllCheckboxes(this.checked)" NAME="SelectAll">
			</HeaderTemplate>
			<ItemTemplate>
				<input id="UserSelected" runat="server" type="checkbox" name="<%#GDConstants.USER_SELECTED_CHECKBOX%>" value='<%#((PortalUser)Container.DataItem).ID.AsGuid.ToString()%>' >
			</ItemTemplate>
			<ItemStyle  Width="30px"/>
		</asp:TemplateColumn>
		
		<asp:TemplateColumn HeaderText="ID#">
			<ItemTemplate>
			<%# ((PortalUser)Container.DataItem).HostID %>
			</ItemTemplate>
		</asp:TemplateColumn>
		
		<asp:TemplateColumn HeaderText="Name" SortExpression="NameDetails" >
			<ItemTemplate>
				<framework:MyInfoPopup id="MyInfoLink" NameFormat="LastNameFirst" runat="server" UserId="<%#((PortalUser)Container.DataItem).ID.AsGuid.ToString()%>"><%#((PortalUser)Container.DataItem).NameDetails.ToLastFirstNameString() %></framework:MyInfoPopup>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<EmptyTableTemplate><%=Globalizer.GetGlobalizedString("MSG_NO_COURSE_STUDENT_TO_DISPLAY")%></EmptyTableTemplate>
</jenzabar:groupedgrid>
<p>


<div class="hint"><asp:linkbutton id="EmailAll" Runat="server"></asp:linkbutton></div>
</div>