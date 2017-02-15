<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BalanceCalculator.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.BalanceCalculator" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" TagPrefix="cc1" %>
<script>
    function addChar(item)
    {
        jQuery('[id*=tbxBalEqu]').val(jQuery('[id*=tbxBalEqu]').val() + jQuery(item).html());
    }
    function removeLastChar()
    {
        var val = jQuery('[id*=tbxBalEqu]').val();
        jQuery('[id*=tbxBalEqu]').val(val.substring(0, val.length -1));
    }
    function addQuestion()
    {
        jQuery('[id*=tbxBalEqu]').val(jQuery('[id*=tbxBalEqu]').val() + "##" + jQuery('[id*=drpQuestions]').val());
    }
</script>
<style>
    .calcPad
    {
        width:100%;
    }
    .caclPad input[type=text]
    {
        width:100%;
    }
    .balanceEqu
    {
        width:300px;
    }
    .jcf-calc-formula
    {
        width:100%;
    }
</style>
<table class="calcPad">
    <tr>
        <td>
            <cc1:Hint runat="server" ID="hntCG">
                Collection grid balances are calculated row-by-row and are added together to come up with a cumulative total for the grid.
                The grid can then be referenced in the Final Blanace formula. If you do not need to use the collection grid in the final balance,
                set the grid formula to 0.00.
            </cc1:Hint>
        </td>
    </tr>
    <asp:Repeater runat="server" ID="rptCollBal">
        <ItemTemplate>
            <tr>
                <td>
                    <%# ((Jenzabar.ContainedForm.Entities.FormItem)Container.DataItem).PlainLabel %><br />
                    <asp:TextBox runat="server" 
                        ID="tbxColBalEqu" 
                        CssClass="jcf-all-tags jcf-calc-formula"
                        data-itemid='<%# ((Jenzabar.ContainedForm.Entities.FormItem)Container.DataItem).ID %>'
                        Text='<%# ((Jenzabar.ContainedForm.Entities.FormItem)Container.DataItem).BalanceFormula ?? "0.00" %>'
                        ></asp:TextBox>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr>
        <td>
            <cc1:Hint runat="server" ID="hntFinalBal">
                The final balance formula will be executed after all grid formulas have been executed and will determine the final balance for the form.
                To use values from a question, wrap the question's unique ID in curly brackets. (i.e. {NumberAttending})
            </cc1:Hint>
        </td>
    </tr>
    <tr>
        <td>
            Final Balance:<br />
            <asp:TextBox runat="server" ID="tbxBalEqu" CssClass="jcf-calc-tags jcf-calc-formula"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
            </center>
        </td>
    </tr>
</table>

<center><asp:Button runat="server" ID="btnDone" onclick="btnDone_Click"
        Text="Done"/></center>