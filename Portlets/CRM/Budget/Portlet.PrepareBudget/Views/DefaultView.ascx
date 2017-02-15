<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Budget.Web.Portlets.PrepareBudgetPortlet.DefaultView" %>
<%@ Import Namespace="Jenzabar.CRM.Budget.Web.Portlets.PrepareBudgetPortlet" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.50731.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<script language="javascript" type="text/javascript">    function initIETOC() { }; function resizeTheDiv() { }</script>
<div class="pSection" id="divHint" visible="False" runat="server">
    <cmn:Hint ID="lblHint" runat="server" />
</div>
<br /> 
<div id="divContent" class="pSection" runat="server" visible="true">
    
    <%-- Next Year Links --%>
    <div class="PBBoldText PBHeader1Text">Budget to Prepare for Next Year</div>
    <br/>
    <asp:LinkButton ID="SearchByLineItemFutureLink" runat="server"
        OnClick="PrepareLineItemSearchLink_Click" CssClass="PBHeaderLinkDefault">Search by Line Item</asp:LinkButton>
    <br /> <br />
    <asp:LinkButton ID="SearchByWorksheetFutureLink" runat="server"
        OnClick="PrepareWorksheetSearchLink_Click" CssClass="PBHeaderLinkDefault">Search by Worksheet</asp:LinkButton>
    <br />  <br />
    <asp:LinkButton ID="MainViewFutureAllWorksheetsLink" runat="server"
        OnClick="MainViewFutureAllWorksheets_Click" CssClass="PBHeaderLinkDefault">View All Available Worksheets</asp:LinkButton>
    <br /> <br /> <br />
    
    <%-- Current Year Links --%>
    <div class="PBBoldText PBHeader1Text">This Year's Active Budget</div>
    <br/>   
    <asp:LinkButton ID="SearchByLineItemCurrentLink" runat="server"
        OnClick="MonitorLineItemSearchLink_Click" CssClass="PBHeaderLinkDefault">Search by Line Item</asp:LinkButton>
    <br /> <br />
    <asp:LinkButton ID="SearchByWorksheetCurrentLink" runat="server"
        OnClick="MonitorWorksheetSearchLink_Click" CssClass="PBHeaderLinkDefault">Search by Worksheet</asp:LinkButton>
    <br />  <br />
    <asp:LinkButton ID="MainViewCurrentAllWorksheetsLink" runat="server"
        OnClick="MainViewCurrentAllWorksheets_Click" CssClass="PBHeaderLinkDefault">View All Available Worksheets</asp:LinkButton>
    <br /> <br />
</div>

<ajaxToolkit:ModalPopupExtender ID="ConfirmRetrieveAllCurrentWorksheetPopup" runat="server"
    TargetControlID="MainViewCurrentAllWorksheetsLink" PopupControlID="ConfirmRetrieveAllCurrentWorksheetModal"
    PopupDragHandleControlID="ConfirmRetrieveAllCurrentWorksheetModalHeader" BackgroundCssClass="BUModalPopup"
    BehaviorID="ConfirmRetrieveAllCurrentWorksheetPopupBehaviorID" />
<div id="ConfirmRetrieveAllCurrentWorksheetModal" runat="server" class="BUModalDiv BUMessageWidthHeight" style="display: none">
    <div class="BUInnerModal">
        <div id="ConfirmRetrieveAllCurrentWorksheetModalHeader" class="BUModalHeading">
            <asp:Label runat="server" CssClass="BUHeaderText" Text="This Year's Active Budget - View All Available Worksheets?" />
            <asp:ImageButton ID="_imgWarningClose" runat="server" CssClass="BUModalHeadingImg" 
                OnClientClick="$find('ConfirmRetrieveAllCurrentWorksheetPopupBehaviorID').hide(); return false;" />
        </div>
        <br/>
        <asp:Label ID="ConfirmRetrieveText" Text="Viewing All Available Worksheets may take a while, depending on the number of items. Would you still like to continue?"
            runat="server" />
        <br />
        <br/>
        <div>
            <asp:Button ID="btnRetrieveAllCurrentWorksheetContinue" Text="Continue" runat="server" OnClick="btnRetrieveAllCurrentWorksheetContinue_OnClick" OnClientClick="$find('ConfirmRetrieveAllCurrentWorksheetPopupBehaviorID').hide();"/>
            <asp:Button ID="btnRetrieveAllCurrentWorksheetCancel" Text="Cancel" runat="server" OnClientClick="$find('ConfirmRetrieveAllCurrentWorksheetPopupBehaviorID').hide(); return false;" />
        </div>
    </div>
</div>




