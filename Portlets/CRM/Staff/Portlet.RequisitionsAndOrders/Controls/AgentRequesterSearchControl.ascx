<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AgentRequesterSearchControl.ascx.cs" Inherits="Portlet.RequisitionsAndOrders.Controls.AgentRequesterSearchControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<script type="text/javascript">

    Sys.Application.add_load(agentRequesterSearchControlLoad);    

    function agentRequesterSearchControlLoad() {
        $("#" + "<%# btnOk.ClientID %>").attr("disabled", "disabled");

        $("#" + "<%# lbNames.ClientID %>").change(function () {
            $("#" + "<%# btnOk.ClientID %>").removeAttr("disabled");
        });

        $("#ROAgentRequesterSearchControlSearch input").keypress(function (event) {
            if (event.which == 13) {
                event.preventDefault();
            }
        });

        $find('<%# ModalBehaviorID %>').add_showing(function () {
            setTimeout(function () {
                $("#<%# txtEmployeeName.ClientID %>").focus();
            }, 100);             
        });

        $find('<%# ModalBehaviorID %>').add_hiding(function () {
            $("#<%# txtEmployeeName.ClientID %>").val("");
            $("#<%# txtName.ClientID %>").val("");
        });        

        $("#" + "<%# lbNames.ClientID %>").keypress(function (event) {
            if (event.which == 13) {
                $("#" + "<%# btnOk.ClientID %>").click();
                event.preventDefault();
            }
        });
    }

    function updateAgentRequester<%= lbNames.ClientID %>(agentRequesterID)
    {
        var selected = $("#" + "<%# lbNames.ClientID %>" + " option:selected");
        var idNum = selected.val();
        if (idNum !== null) {
            var name = selected[0].innerHTML;
            $("#<%# AgentRequesterID %>").val(idNum);
            $("#<%# AgentRequesterName %>").html(name);
        }

        if(document.getElementById("<%# ValidatorID %>") != null)
        {
            ValidatorEnable(document.getElementById("<%# ValidatorID %>"), true); //For Disabling
        }
    }

</script>

<style type="text/css">
#ROAgentRequesterSearchControlResults
{
    padding-top: 10px;
}

#ROAgentRequesterSearchControlResults > div > div
{
    margin-bottom: 10px;
}

#ROAgentRequesterSearchControlResults select
{
    width: 440px;
    height: 200px;
}

#ROAgentRequesterSearchControlFooter
{
    text-align: center;
    padding-bottom: 20px;
}

#ROAgentRequesterSearchControlFooter input
{
    margin-right: 20px;
}

</style>

<div id="ROAgentRequesterSearchControl">
    <div class="ROMarginPadding">
        <div>
            <span class="ROHeaderText RONoWrap">Just start typing the name of the colleague</span>
            <asp:TextBox ID="txtEmployeeName" CssClass="RONameSearch" runat="server" MaxLength="255" />
            <ajaxToolkit:FilteredTextBoxExtender ID="EmployeeNameFilter" runat="server" TargetControlID="txtEmployeeName"
                FilterType="UppercaseLetters, LowercaseLetters, Custom" ValidChars="-'" FilterMode="ValidChars" />
        </div>
        <div class="ROFloatLeft">
            <table>
                <tr>
                    <td>
                        <img id="Img1" src="<%# GetLookHereIcon() %>" runat="server" alt="Search further" />
                    </td>
                    <td>
                        <span class="ROHeaderText RONoWrap">Perform a broader, more expansive search</span><br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <span class="ROInformativeText ROWrapText">This search takes longer, but provides more
                            comprehensive results. TIP: These results may include people not officially designated
                            as employees; review your selection carefully.</span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="txtName" CssClass="RONameSearch" runat="server" MaxLength="255" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="NameFilter" runat="server" TargetControlID="txtName"
                            FilterType="UppercaseLetters, LowercaseLetters, Custom" ValidChars="-'" FilterMode="ValidChars" />                    
                        <asp:Button ID="btnSearchFurther" CausesValidation="false" Text="Search further"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="ROMarginPadding">        
        <div id="ROAgentRequesterSearchControlResults">
            <asp:UpdatePanel ID="upResult" runat="server" UpdateMode="Conditional" OnLoad="upResult_Load">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtName" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearchFurther" />
                </Triggers>
                <ContentTemplate>
                    <asp:Panel ID="pnlItemsFound" runat="server" CssClass="ROInformativeText" Visible="false">Search Results - click to choose one</asp:Panel>
                    <asp:Panel ID="pnlItemsNone" runat="server" CssClass="ROInformativeText" ForeColor="Red" Visible="false">No matching records found.  You may search again or cancel.</asp:Panel>
                    <asp:ListBox ID="lbNames" runat="server" DataTextField="Name" DataValueField="IDNum"  />
                </ContentTemplate>
            </asp:UpdatePanel>        
        </div>
    </div>
    <div id="ROAgentRequesterSearchControlFooter">
        <asp:Button ID="btnOk" runat="server" Text="OK" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
    </div>
</div>