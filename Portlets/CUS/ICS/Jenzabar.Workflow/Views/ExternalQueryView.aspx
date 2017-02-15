<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExternalQueryView.aspx.cs" Inherits="Jenzabar.Workflow.Views.ExternalQueryView" %>
<%@ Register Assembly="Jenzabar.Workflow" Namespace="Jenzabar.Workflow.Controls" TagPrefix="cf" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
        .SCFRowTemplate
        {
            width:100%;
        }
        .reqIndicator 
        {
            color: Red;
            float:left;
            margin-right:5px;
        }
        .CSSTableGenerator table{
	        width:100%;
	        height:100%;
	        margin:0px;padding:0px;
            border-spacing:0px;
        }.CSSTableGenerator tr:last-child td:last-child {
	        -moz-border-radius-bottomright:0px;
	        -webkit-border-bottom-right-radius:0px;
	        border-bottom-right-radius:0px;
        }
        .CSSTableGenerator table tr:first-child td:first-child {
	        -moz-border-radius-topleft:0px;
	        -webkit-border-top-left-radius:0px;
	        border-top-left-radius:0px;
        }
        .CSSTableGenerator table tr:first-child td:last-child {
	        -moz-border-radius-topright:0px;
	        -webkit-border-top-right-radius:0px;
	        border-top-right-radius:0px;
        }.CSSTableGenerator tr:last-child td:first-child{
	        -moz-border-radius-bottomleft:0px;
	        -webkit-border-bottom-left-radius:0px;
	        border-bottom-left-radius:0px;
        }.CSSTableGenerator tr:hover td{
	
        }
        .CSSTableGenerator tr:nth-child(odd){ background-color:#e5e5e5; }
        .CSSTableGenerator tr:nth-child(even)    { background-color:#ffffff; }.CSSTableGenerator td{
	        vertical-align:middle;
	
	
	        border:1px solid #000000;
	        border-width:0px 1px 1px 0px;
	        text-align:left;
	        padding:7px;
	        font-size:10px;
	        font-family:Arial;
	        font-weight:normal;
	        color:#000000;
        }.CSSTableGenerator tr:last-child td{
	        border-width:0px 1px 0px 0px;
        }.CSSTableGenerator tr td:last-child{
	        border-width:0px 0px 1px 0px;
        }.CSSTableGenerator tr:last-child td:last-child{
	        border-width:0px 0px 0px 0px;
        }
        .CSSTableGenerator tr:first-child td{
		        background:-o-linear-gradient(bottom, #30576e 5%, #3e698c 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #30576e), color-stop(1, #3e698c) );
	        background:-moz-linear-gradient( center top, #30576e 5%, #3e698c 100% );
	        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#30576e", endColorstr="#3e698c");	background: -o-linear-gradient(top,#30576e,3e698c);

	        background-color:#30576e;
	        border:0px solid #000000;
	        text-align:left;
	        border-width:0px 0px 1px 1px;
	        font-size:11px;
	        font-family:Arial;
	        color:#ffffff;
        }
        .CSSTableGenerator tr:first-child:hover td{
	        background:-o-linear-gradient(bottom, #30576e 5%, #3e698c 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #30576e), color-stop(1, #3e698c) );
	        background:-moz-linear-gradient( center top, #30576e 5%, #3e698c 100% );
	        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#30576e", endColorstr="#3e698c");	background: -o-linear-gradient(top,#30576e,3e698c);

	        background-color:#30576e;
        }
        .CSSTableGenerator tr:first-child td:first-child{
	        border-width:0px 0px 1px 0px;
        }
        .CSSTableGenerator tr:first-child td:last-child{
	        border-width:0px 0px 1px 1px;
        }
        .questionRow label
        {
            font-weight:bold;
            display:inline-block;
            width:250px;
        }
        .questionRow
        {
            padding:8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="queryView">
        <cf:DocAdminControls runat="server" ID="docAdminControls" />
        <asp:Repeater runat="server" ID="rptQuestionList">
            <ItemTemplate>
                <div class="questionRow" id='<%# ((Jenzabar.Workflow.Stubs.QueryItemStub)Container.DataItem).Label.Replace(" ","") %>'>
                    <label><%# ((Jenzabar.Workflow.Stubs.QueryItemStub)Container.DataItem).Label %></label>
                    <span><%# ((Jenzabar.Workflow.Stubs.QueryItemStub)Container.DataItem).Value %></span>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Panel ID="_pnlReport" runat="server"></asp:Panel>
    </div>
    </form>
</body>
</html>
