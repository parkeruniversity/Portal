<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mapping.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.Mapping" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
<style>
    .MappingPanel select {
        width:600px;
    }
</style>
<script type="text/javascript">
    function CheckForQuery(clientid) {
        var x = jQuery('#' + clientid).val();
        if (x.charAt(0) == "@") {
            if (jQuery('#' + clientid).attr("oldlength") == null) {
                jQuery('#' + clientid).attr("oldlength", jQuery('#' + clientid).attr("maxlength"));
            }
            jQuery('#' + clientid).attr("maxlength", "255");
        }
        else if (jQuery('#' + clientid).attr("oldlength") != null) {
            jQuery('#' + clientid).attr("maxlength", jQuery('#' + clientid).attr("oldlength"));
        }
    }
</script>
<asp:HiddenField ID="hdn_editType" runat="server" Value="INSERT" />

<cc1:ErrorDisplay ID="ErrorDisplay1" runat="server">
</cc1:ErrorDisplay>
<cc1:Hint runat="server">
    Mapped statements are used to map question answers to the ERP database tables. Currently EX and CX ERPs are supported. Statements are executed at the time of submission unless specified to be executed on approval. If executed on approval, the Document Approval portlet will control the time of execution.
</cc1:Hint><br/>
<b>Statements:</b>
<asp:GridView ID="QueriesGrid" runat="server" 
    CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
    GridLines="None" Width="100%" OnRowDataBound="QueriesGrid_RowDataBound">
    <AlternatingRowStyle BackColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkEdit" Text="Edit" OnClick="lnkEdit_Click"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkDelete" Text="Delete" OnClick="lnkDelete_Click"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<p>
    <b>On Submit:</b>&nbsp;&nbsp;
    <asp:LinkButton ID="lnk_Create" runat="server" onclick="lnk_Create_Click">Create a Single Row</asp:LinkButton><br />
    <b>Or For Each </b><asp:DropDownList runat="server" ID="drpMultiQuestions"></asp:DropDownList><asp:LinkButton ID="lnk_Create_Each" runat="server" OnClick="lnk_Create_Each_Click">Create Row</asp:LinkButton>&nbsp;&nbsp;
    <asp:LinkButton ID="lnk_Update" runat="server" Visible="False">Update a Row</asp:LinkButton>
</p>


<asp:Panel ID="pnl_Definition" runat="server" Visible="false" CssClass="MappingPanel">
    This statement should be executed on: <asp:DropDownList runat="server" ID="executeEvent">
                                            <asp:ListItem Value="Submit" Text="Submit"></asp:ListItem>
                                            <asp:ListItem Value="Save" Text="Save"></asp:ListItem>
                                            <asp:ListItem Value="Workflow" Text="Workflow"></asp:ListItem>
                                          </asp:DropDownList><br/>
    <strong>Database: </strong> <asp:DropDownList runat="server" ID="drpDatabase" AutoPostBack="true" OnSelectedIndexChanged="drpDatabase_SelectedIndexChanged"></asp:DropDownList><br />
    <strong>Table: </strong>
    <asp:DropDownList ID="drp_Table" runat="server" AutoPostBack="True" 
        onselectedindexchanged="drp_Table_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <asp:Label ID="lbl_foreign_key" runat="server" ForeColor="#CC0000" 
        Text="*This table has a foreign key constraint and your query may not execute correctly if the parent tables do not contain the required records." Visible="false"></asp:Label>
    <br />
    <asp:PlaceHolder ID="fields_container" runat="server"></asp:PlaceHolder>
    <br />
    <center><asp:Button ID="btn_SaveImport" runat="server" Text="Save" 
            onclick="btn_SaveImport_Click" />
        <asp:Button ID="btn_cancel" runat="server" onclick="btn_cancel_Click" 
            Text="Cancel" />
    </center>
    <br />
</asp:Panel>

<center><asp:Button runat="server" ID="btnDone" Text="Done" OnClick="btnDone_Click"/></center>

