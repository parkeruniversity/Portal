<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustomInformation.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.CustomInformation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>

<div class="contentBox">
	<common:groupedgrid id="UserInfoGrid" runat="server" DataKeyField="ID" GroupKeyField="ID">
		<GROUPHEADERTEMPLATE>
			<%# DataBinder.Eval(Container.DataItem, "Name") %>
		</GROUPHEADERTEMPLATE>
		<COLUMNS>
			<ASP:TEMPLATECOLUMN>
				<ITEMTEMPLATE>
					<B><%# DataBinder.Eval(Container.DataItem, "Name") %>:</B>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN>
				<ITEMTEMPLATE>
					<%# DataBinder.Eval(Container.DataItem, "Info") %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
		<GROUPHEADERCOLUMNS>
			<common:ExpandCollapseGroupedGridColumn SeparatorBefore="True" SeparatorAfter="False" />
		</GROUPHEADERCOLUMNS>
	</common:groupedgrid>
</div>