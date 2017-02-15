<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.HandoutPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.HandoutPortlet" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="web" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<div class="pSection">
		<jenzabar:groupedgrid id=HandoutGrid runat="server" DataKeyField="ID">
		<GroupHeaderTemplate>
			<%# DataBinder.Eval( Container.DataItem, "Name" )%><br>
		</GroupHeaderTemplate>
		<GroupSubHeaderTemplate>
			<%# DataBinder.Eval( Container.DataItem, "Description" )%>
		</GroupSubHeaderTemplate>		
		<GroupHeaderColumns>
			<jenzabar:ExpandCollapseGroupedGridColumn separatorbefore="true"></jenzabar:ExpandCollapseGroupedGridColumn>
		</GroupHeaderColumns>
		<SubGroupHeaderTemplate>
			<%= "Inactive" %>
		</SubGroupHeaderTemplate>
		<EmptyTableTemplate>
			<%=Globalizer.GetGlobalizedString("MSG_NO_HANDOUTS_FOR_PORTLET") %>
		</EmptyTableTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="link">
				<ItemTemplate>
   				    <span id="spanProtectedItemLink" runat="server">
    					<a href="<%#Jenzabar.Common.JCUtilities.ResolveUrl("~/Portlets/ICS/Handoutportlet/viewhandler.ashx?handout_id=" + DataBinder.Eval(Container.DataItem, "Id").ToString())%>" target="_blank">
	        				<%# DataBinder.Eval( Container.DataItem, "Name" )%>
			    		</a>
					</span>
					<web:LockedContent ID="lockedContent" runat="server" Visible="false"/>
					(<%# DataBinder.Eval( Container.DataItem, "File.Type" ) %>, <%# DataBinder.Eval( Container.DataItem, "File.Size" ) %><asp:label id="lblDownloaded" Runat="server" />)
					<br>
					<%# DataBinder.Eval( Container.DataItem, "Description" )%>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>


	</jenzabar:groupedgrid>
</div>
<a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">
<span class="accessibility">Adobe Acrobat Reader is required to view and print PDF files.</span>
</a>
