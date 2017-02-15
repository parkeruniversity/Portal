<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.DataImportTransactionsPortlet.Default_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
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
		<TABLEHEADERTEMPLATE>Recent Files</TABLEHEADERTEMPLATE>
		<SUBGROUPHEADERTEMPLATE>
			<%#((bool)Container.DataItem) ? null : "Inactive" %>
		</SUBGROUPHEADERTEMPLATE>
		<GROUPHEADERCOLUMNS>
			<JENZABAR:EXPANDCOLLAPSEGROUPEDGRIDCOLUMN separatorbefore="true"></JENZABAR:EXPANDCOLLAPSEGROUPEDGRIDCOLUMN>
		</GROUPHEADERCOLUMNS>
		<EMPTYTABLETEMPLATE></EMPTYTABLETEMPLATE>
		<COLUMNS>
			<ASP:TEMPLATECOLUMN HeaderText="Sequence Number">
				<ITEMTEMPLATE>
					<%# DataBinder.Eval( Container.DataItem, "SequenceNumber" ) %>
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
		</COLUMNS>
	</jenzabar:groupedgrid>
</div>

<div class="buttonBar"><asp:linkbutton id="lnkShowMain" runat="server"></asp:linkbutton>
</div>
