<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PayProfileBuilder.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.PayProfileBuilder" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
</asp:ScriptManagerProxy>
<cc1:Hint runat="server">
    Payment profiles provide information needed to accept payments in a form submission. Provide a valid transaction code so that payments will be processed to the EX Receipt Entry screen.
</cc1:Hint>
<br/>
<asp:UpdateProgress runat="server" id="PageUpdateProgress" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        Loading...
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <cc1:ImageAndTextButton runat="server" ID="_btnAddProfile" Text="Add Profile" 
            onclick="_btnAddProfile_Click"></cc1:ImageAndTextButton>
        <cc1:GroupedGrid runat="server" ID="_grdPayProfiles" DataKeyField="ConfigID">
            <EmptyTableTemplate>
                There are no payment profiles in this portlet.
            </EmptyTableTemplate>
            <TableHeaderTemplate>
                Payment Profiles
            </TableHeaderTemplate>
            <Columns>
                <asp:TemplateColumn HeaderText="Fee Description">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "FeeDescription") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Default Amount">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "FeeAmount") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="_imgEditBtn" ImageUrl='<%# Jenzabar.ContainedForm.Helpers.FormResources.GetImageIconUrl("edit.gif") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ConfigID") %>' OnClick="_imgEditBtn_Click" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="_imgDeleteBtn" ImageUrl='<%# Jenzabar.ContainedForm.Helpers.FormResources.GetImageIconUrl("delete.gif") %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ConfigID") %>' OnClick="_imgDeleteBtn_Click"/>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </cc1:GroupedGrid>
        <asp:Panel runat="server" ID="_pnlProfileForm" Visible="False">
            <table width="100%">
                <tr>
                    <td></td>
                    <td>Allow E-check:</td>
                    <td><asp:CheckBox runat="server" ID="_cbxAllowEcheck" onclick="Jcf.events.onPaymentFieldBlur();"/></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>Show fee description:</td>
                    <td><asp:TextBox runat="server" ID="_tbxFeeDescription" MaxLength="40" onblur="Jcf.events.onPaymentFieldBlur();"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>Transaction code:</td>
                    <td><asp:TextBox runat="server" ID="_tbxTransactionCode" MaxLength="10" onblur="Jcf.events.onPaymentFieldBlur();"></asp:TextBox></td>
                </tr>
                <tr runat="server" id="trFeeAmount">
                    <td>*</td>
                    <td>Default Fee amount:</td>
                    <td><asp:TextBox runat="server" ID="_tbxFeeAmount" onblur="Jcf.events.onPaymentFieldBlur();"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>Email address to notify on failed payment:</td>
                    <td><asp:TextBox runat="server" ID="_tbxFailedEmail" onblur="Jcf.events.onPaymentFieldBlur();"></asp:TextBox></td>
                </tr>
            </table>
            <center><asp:Button runat="server" ID="_btnSaveProfile" 
                    onclick="_btnSaveProfile_Click" Text="Save Profile" disabled="disabled"/>
                    <asp:Button runat="server" ID="btnCancel"
                    OnClick="btnCancel_OnClick" Text="Cancel"/>
            </center>
        </asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>
<center><asp:Button runat="server" ID="_btnDone" Text="Done" 
        onclick="_btnDone_Click"></asp:Button></center>