<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Options.ascx.cs" Inherits="Jenzabar.ContainedForm.Controls.Options" EnableViewState="true" %>
<%@ Register Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls"
    TagPrefix="cc1" %>
<asp:RadioButton ID="rdo_Static" runat="server" Checked="True" 
    GroupName="itmOptionsType" Text="Static Options" onclick="javascript:ShowPanels();" />
    <asp:HiddenField ID="_hdnOptionQuestionType" runat="server" />
&nbsp;<asp:RadioButton ID="rdo_Dynamic" runat="server" GroupName="itmOptionsType" 
    Text="Dynamic Options" onclick="javascript:ShowPanels();" Checked="true"/>
<span id="randomizeOpts"><asp:CheckBox ID="itmRandomize" runat="server" Text="Randomize Options" /></span>
<asp:Panel ID="SPanel" runat="server">
    *Each value must be unique from other values and each text must be unique from other texts.<br/>
        <cc1:ImageAndTextButton ID="ImageAndTextButton1" 
            runat="server" ImageUrl="Images/add.gif" OnClientClick="Jcf.ui.addOptionDef();return false;">Add Option</cc1:ImageAndTextButton>
        <asp:Panel ID="optionsPanel" runat="server"></asp:Panel>
</asp:Panel>
        <asp:Panel ID="DPanel" runat="server">
            <div class="jcf-div">
                Options Source: <asp:DropDownList ID="itmDataSource" runat="server" onchange="Jcf.ui.updateOptionParams();"></asp:DropDownList>
            </div>
            <ul>
                <asp:Repeater runat="server" ID="rptParams" OnItemDataBound="rptParams_ItemDataBound">
                    <ItemTemplate>
                        <li>
                            <asp:Label runat="server" ID="lblParam" Text='<%# ((Jenzabar.ContainedForm.Entities.DTO.ParamStub)Container.DataItem).Name %>'></asp:Label>
                            <asp:DropDownList runat="server" ID="drpQuestions"></asp:DropDownList>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </asp:Panel>

<script type="text/javascript">
    ShowPanels();
</script>