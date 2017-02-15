<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.DataImportTransactionsPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jnz" assembly="Jenzabar.Portal.Framework.Web" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.ICS" %>


<div class="pSection">
	<jenzabar:groupedgrid id="CurrentFiles" runat="server" RenderGroupHeaders="true">
		<TABLEHEADERTEMPLATE>Current File</TABLEHEADERTEMPLATE>
		<SUBGROUPHEADERTEMPLATE>
			<%#((bool)Container.DataItem) ? null : "Inactive" %>
		</SUBGROUPHEADERTEMPLATE>
		<GROUPHEADERCOLUMNS>
			<JENZABAR:EXPANDCOLLAPSEGROUPEDGRIDCOLUMN separatorbefore="true"></JENZABAR:EXPANDCOLLAPSEGROUPEDGRIDCOLUMN>
		</GROUPHEADERCOLUMNS>
		<EMPTYTABLETEMPLATE>No Current File</EMPTYTABLETEMPLATE>
		<COLUMNS>
			<ASP:TEMPLATECOLUMN HeaderText="Sequence Number">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "SequenceNumber" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Current Record">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "CurrentRecord" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Total Records">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "TotalRecords" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Errors">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "ErrorCount" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Status">
				<ITEMTEMPLATE>
					<%# GetStatusFromCode(DataBinder.Eval( Container.DataItem, "Status" )) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
	</jenzabar:groupedgrid>
</div>

<div class="pSection">
	<jenzabar:groupedgrid id="DITransactions" runat="server" RenderGroupHeaders="true">
		<TABLEHEADERTEMPLATE>Completed Files</TABLEHEADERTEMPLATE>
		<SUBGROUPHEADERTEMPLATE>
			<%#((bool)Container.DataItem) ? null : "Inactive" %>
		</SUBGROUPHEADERTEMPLATE>
		<GROUPHEADERCOLUMNS>
			<JENZABAR:EXPANDCOLLAPSEGROUPEDGRIDCOLUMN separatorbefore="true"></JENZABAR:EXPANDCOLLAPSEGROUPEDGRIDCOLUMN>
		</GROUPHEADERCOLUMNS>
		<COLUMNS>
			<ASP:TEMPLATECOLUMN HeaderText="Sequence Number">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "SequenceNumber" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Start Time">
				<ITEMTEMPLATE>
					<%# (DateTime)DataBinder.Eval( Container.DataItem, "StartTime" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="End Time">
				<ITEMTEMPLATE>
					<%# GetEndTime((Jenzabar.ICS.ImportLog)Container.DataItem) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Total Records">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "TotalRecords" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Errors">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "ErrorCount" ) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Status">
				<ITEMTEMPLATE>
					<%# GetStatusFromCode(DataBinder.Eval( Container.DataItem, "Status" )) %>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Data">
				<ITEMTEMPLATE>
					<jnz:PopupBase runat="server" InnerText='<%#Globalizer.GetGlobalizedString("TXT_DATA")%>' PopupWindowName='Data' PortletUrl='<%#JCUtilities.ResolveUrl("~/Portlets/ICS/Portlet.DataImportTransactions/ViewDISFile.aspx")%>' PortletParameters='<%#"id=" + ((Jenzabar.ICS.ImportLog)Container.DataItem).ID.AsGuid.ToString()+"&ext=dat&folder=" + ((int)((Jenzabar.ICS.ImportLog)Container.DataItem).Status).ToString()%>' ID="btnData" NAME="btnData"/>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Log">
				<ITEMTEMPLATE>
					<jnz:PopupBase runat="server" InnerText='<%#Globalizer.GetGlobalizedString("TXT_LOG")%>' PopupWindowName='Log' PortletUrl='<%#JCUtilities.ResolveUrl("~/Portlets/ICS/Portlet.DataImportTransactions/ViewDISFile.aspx")%>' PortletParameters='<%#"id=" + ((Jenzabar.ICS.ImportLog)Container.DataItem).ID.AsGuid.ToString()+"&ext=log&folder=-1"%>' ID="Popupbase1" NAME="btnData"/>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>			
		</COLUMNS>
	</jenzabar:groupedgrid>
</div>
