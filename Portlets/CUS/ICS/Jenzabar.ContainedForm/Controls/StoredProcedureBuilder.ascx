<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StoredProcedureBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.StoredProcedureBuilder" %>
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
<cc1:ErrorDisplay ID="ErrorDisplay1" runat="server">
</cc1:ErrorDisplay>
<cc1:Hint ID="Hint1" runat="server">
    Stored procedures are used to process form submissions and insert or update data in the ERP database tables. Currently the EX & CX ERPs are supported (However Informix (CX) does not support Text or Byte parameters in SPL.  As such storing the submission as a PDF/PNG is not supported for CX). Procedures are executed at the time of submission unless specified to be executed on approval. If executed on approval, the Document Approval portlet will control the time of execution.
</cc1:Hint><br/>
<b>Procedures:</b>
<asp:GridView ID="QueriesGrid" runat="server" 
    CellPadding="4" EnableModelValidation="True" ForeColor="#333333" AutoGenerateColumns="False"
    GridLines="None" Width="100%">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="_lnkEdit" OnClick="_lnkEdit_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"StoredProcID") %>'>Edit</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="_lnkDelete" OnClick="_lnkDelete_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"StoredProcID") %>'>Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="OrderNum">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem,"OrderNum") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem,"Name") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CheckBoxField DataField="ExecuteOnApprove" HeaderText="ExecuteOnApprove"/>
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    
</asp:GridView>
<br/>
<asp:LinkButton runat="server" ID="_lnkAddProcedure" 
    onclick="_lnkAddProcedure_Click">New Procedure</asp:LinkButton><br/>
<asp:DropDownList runat="server" ID="drpTriggerItem"/><asp:LinkButton runat="server" ID="lnkAddForEach" OnClick="lnkAddForEach_OnClick" Text="New Multi-Response Procedure"></asp:LinkButton>
<asp:Panel runat="server" ID="pnlDefinition" Visible="False" CssClass="MappingPanel">
    <strong>Database: </strong><asp:DropDownList runat="server" ID="drpDatabase" AutoPostBack="True" OnSelectedIndexChanged="drpDatabase_SelectedIndexChanged"></asp:DropDownList><br />
    This procedure should be executed on: <asp:DropDownList runat="server" ID="executeEvent">
                                            <asp:ListItem Value="Submit" Text="Submit"></asp:ListItem>
                                            <asp:ListItem Value="Save" Text="Save"></asp:ListItem>
                                            <asp:ListItem Value="Workflow" Text="Workflow"></asp:ListItem>
                                          </asp:DropDownList><br/>

    <strong>Procedure: </strong>
    <asp:DropDownList ID="_drpProcedures" runat="server" AutoPostBack="True" 
        onselectedindexchanged="_drpProcedures_SelectedIndexChanged">
    </asp:DropDownList>
     <br />
    <asp:PlaceHolder ID="params_container" runat="server"></asp:PlaceHolder>
    <center><asp:Button runat="server" ID="_btnSave" Text="Save" 
            onclick="_btnSave_Click"></asp:Button><asp:Button runat="server" 
            ID="_btnCancel" Text="Cancel" onclick="_btnCancel_Click"/></center>
</asp:Panel>
<center><asp:Button runat="server" ID="_btnDone" Text="Done" 
        onclick="_btnDone_Click"/></center>