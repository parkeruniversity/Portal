<%@ Control Language="c#" AutoEventWireup="True" Codebehind="BalanceTransactionDetail.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.GLAccountLookupPortlet.BalanceTransactionDetail" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<table id="Table1" cellspacing="3" cellpadding="3" width="100%" border="0">
	<tr>
		<td width="30%"><asp:label id="lblAcctNumLabel" runat="server" Font-Bold="True"></asp:label></td>
		<td width="70%"><asp:label id="lblAcctNum" runat="server"></asp:label></td>
    </tr>
	<tr>
		<td width="30%"><asp:label id="lblAcctDescLabel" runat="server" Font-Bold="True"></asp:label></td>
		<td width="70%"><asp:label id="lblAcctDesc" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td width="30%"><asp:label id="lblBegPosBalLabel" runat="server" Font-Bold="True"></asp:label></td>
		<td width="70%"><asp:label id="lblBegPosBal" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td width="30%"><asp:label id="lblEndBalLabel" runat="server" Font-Bold="True"></asp:label></td>
		<td width="70%"><asp:label id="lblEndBal" runat="server"></asp:label></td>
	</tr>
</table>
<table id="Table2" cellspacing="3" cellpadding="3" width="100%" border="0">
	<tr>
		<td align="center"><asp:label id="lblPeriod" runat="server" Font-Bold="True"></asp:label></td>
	</tr>
	<tr>
		<td><asp:GridView ID="dgBalanceTranDetail" runat="server" ShowFooter="True"
                CellPadding="4" GridLines="None" CssClass="GLGridView" Width="100%" AutoGenerateColumns="False"
                AlternatingRowStyle-CssClass="alt" AllowSorting="true">
                <HeaderStyle CssClass="GLGridViewHeader" />
                <Columns>
                     <asp:BoundField DataField="GLAcctNumber" SortExpression="GLAcctNumber" HeaderText="GL Account Number">
                        <HeaderStyle Wrap="true" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SourceCode" SortExpression="SourceCode" HeaderText="Source Code">
                        <HeaderStyle Wrap="true" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GroupNum" SortExpression="GroupNum" HeaderText="Group Number">
                        <HeaderStyle Wrap="true" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LineNum" SortExpression="LineNum" HeaderText="Line Number">
                        <HeaderStyle Wrap="true" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" SortExpression="Date" HeaderText="Date">
                        <HeaderStyle Wrap="false" HorizontalAlign="center" />
                        <ItemStyle Wrap="False" HorizontalAlign="center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" SortExpression="Description" HeaderText="Description">
                        <HeaderStyle Wrap="false" HorizontalAlign="center" />
                        <ItemStyle Wrap="true" HorizontalAlign="left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Amount" SortExpression="Amount" HeaderText="Amount">
                        <HeaderStyle Wrap="false" HorizontalAlign="right" />
                        <ItemStyle Wrap="false" HorizontalAlign="right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Status" SortExpression="Status" HeaderText="Status">
                        <HeaderStyle Wrap="false"  />
                        <ItemStyle Wrap="false" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Highlight" SortExpression="Highlight" HeaderText="Highlight" Visible="false">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Other Transaction Information">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkOtherTranInfo" runat="server" Text='View' 
                            OnClientClick='<%# "javascript:ViewOtherTranInfo(\"" + Eval("SourceCode") + "\"," + Eval("GroupNum") + "," + Eval("LineNum") + ");return false;" %>' />
                                                   
                        </ItemTemplate>
                        <HeaderStyle Wrap="true" HorizontalAlign="left" />
                        <ItemStyle Wrap="false" HorizontalAlign="left" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="GLGridViewFooter" />
            </asp:GridView>
        </td>
	</tr>
	<tr>
		<td>
			<table cellspacing="5" cellpadding="3">
				<tr>
					<td><asp:button id="btnBack" runat="server" Width="100px" onclick="btnBack_Click"></asp:button></td>
					<td align="right"><asp:button id="btnCancel" runat="server" onclick="btnCancel_Click"></asp:button></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><asp:label id="lblError" runat="server"></asp:label></td>
	</tr>
</table>

<script language="javascript" type="text/javascript">

    function ViewOtherTranInfo(SourceCode, GroupNum, LineNum)
    {       
        if (document.all)
        {
            var xMax = screen.width, yMax = screen.height;
        }
        else 
        {
            if (document.layers)
            {
                var xMax = window.outerWidth, yMax = window.outerHeight;
            }
            else
            {
                var xMax = 640, yMax=480;
            }
        }

        var xOffset = (xMax - 200)/2, yOffset = (yMax - 200)/2;

        var url = '<%= Request.ApplicationPath %>/Portlets/<%= ParentPortlet.PortletDisplay.PortletTemplate.Application.BasePath %>/Staff/Portlet.GLAccountLookup/Controls/ViewOtherInfo.aspx';
    
	    var transKey = "<OtherTranInfo>";
	    transKey += "<Key><KeyValue>"+ SourceCode +"</KeyValue></Key>";
        transKey += "<Key><KeyValue>" + GroupNum + "</KeyValue></Key>";
        transKey += "<Key><KeyValue>" + LineNum + "</KeyValue></Key>";
	    transKey += "</OtherTranInfo>";

        url += '?TransKey=' + transKey;

        mywindow = open(url, "<%=ParentPortlet.PortletDisplay.Name.Replace(" ","_").Replace("-","_") %>", config='height=300, width=350, location=no, menubar=no, status=no, toolbar=no, scrollbars=yes, resizable=yes' + ',screenX='+xOffset+',screenY='+yOffset+',top='+yOffset+',left='+xOffset+'');
 
        if (mywindow.opener == null) 
        {
            mywindow.opener = self; 
        }

        return false;
    }
</script>