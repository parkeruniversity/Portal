<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositionRequestFormView.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet.PositionRequestFormView" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentManagementPortlet" %>\
<%@ Import Namespace="EX.Data.Constants" %>
<%@ Register TagPrefix="asp" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="ajaxToolkit" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>
<%@ Register TagPrefix="au" TagName="AttachmentUploader" Src="~/Portlets/CRM/Common/Jenzabar.EX.Common/Controls/AttachmentUploaderControl.ascx" %>

<%-- Javascript --%>
<script type="text/javascript">

function ChangeCompetencies(ddl) {
	var category = $(ddl).find("option:selected").attr("value");
	$(ddl).siblings("p").hide();
	$(ddl).siblings("p").find("span[placeholder*='" + category + "']").parent().show();
}

$(document).ready(function() {	

	ChangeCompetencies($("select[id*='ddlReqComps']"));
    ChangeCompetencies($("select[id*='ddlDesComps']"));
    
    $("select[id*='ddlReqComps']").change(function () {
		ChangeCompetencies(this);
	});

    $("select[id*='ddlDesComps']").change(function () {
		ChangeCompetencies(this);
	});
});

</script>

<div class="EMPage">

<%-- Header --%>
<div class="EMOverflowHidden">
    <ul>
        <li class="EMFloatLeft"><asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconPaper()) %>' /></li>
        <li class="EMFloatLeft">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_HEADER" CssClass="EMHeader3Text EMBoldText" />            
            <br />
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_INFO" CssClass="EMLightText" />
        </li>        
    </ul>
</div>

<%-- Existing Position --%>
<asp:Panel ID="pnlExistingPosition" runat="server" CssClass="EMClearLeft EMMarginTopTen" Visible="<%# !Position.IsNewPosition %>">

    <%-- Position Title --%>
    <ul class="EMOverflowHidden">
        <li class="EMFloatLeft">
            <asp:Label ID="lblPositionName" runat="server" CssClass="EMHeader3Text EMBoldText" Text='<%# Position.Title %>' />
        </li>
        <li class="EMFloatLeft" style="margin-left: 200px;">
            <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_BACK_SEARCH" OnClick="glbBack_Click" />
        </li>
    </ul>

    <%-- Position Details --%>
    <div id="dPositionDetails" runat="server" class="EMBackgroundGray EMBorderTopBottomGray EMMarginTopFive EMClearLeft">
        <p class="EMMarginAllTen">
            <jenzabar:GlobalizedLinkButton ID="glbPositionDetails" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_LINK" OnClick="glbPositionDetails_Click" />
            <asp:Label ID="lblPositionDetails1" runat="server" />
            <asp:Label ID="lblPositionDetails2" runat="server" />
            <asp:Label ID="lblPositionDetails3" runat="server" />
        </p>
    </div>

    <%-- Position Details Expanded --%>
    <div id="dPositionDetailsExpanded" runat="server" class="EMBackgroundGray EMBorderTopBottomGray EMMarginTopFive EMClearLeft" visible="false">
        <div id="dPositionDetailsExpandedText" runat="server" class="EMMarginAllTen EMOverflowHidden"></div>        
    </div>

    <%-- New Listing --%>
    <p class="EMMarginTopTen"><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_SUB_HEADER" CssClass="EMHeader3Text EMBoldText EMMarginTopTen" />    </p>
    <p><asp:Label ID="lblListingParagraph" runat="server" CssClass="EMLightText"></asp:Label></p>
    <table class="EMMarginTopTwenty">
        <tr>
            <td>
                <asp:Literal ID="lTargetText" runat="server" />
            </td>
            <td>
                <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DOLLAR" />
                <asp:TextBox ID="txtTargetSalary" runat="server" />
                <asp:Literal ID="lTargetInfo" runat="server" />          
                <%--<asp:RegularExpressionValidator runat="server" ControlToValidate="txtTargetSalary" ValidationGroup="ValidateExistingForm" ValidationExpression="^(\d{1,3},(\d{3},)*\d{3}|\d+)(\.\d{2})?$" Display="Dynamic" Text="*" SetFocusOnError="true" />--%>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTargetSalary" ValidationGroup="ValidateExistingForm" CssClass="EMErrorText" Display="Dynamic" Text="*" SetFocusOnError="true" />
                <asp:RangeValidator ID="vTargetSalary" runat="server" ControlToValidate="txtTargetSalary" ValidationGroup="ValidateExistingForm" CssClass="EMErrorText" MinimumValue="0" MaximumValue="999999999.99" Type="Currency" Display="Dynamic" Text="*" SetFocusOnError="true" />
            </td>
        </tr>
        <tr>
            <td style="min-width: 200px;">
                <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_NEW_HIRE_DATE" />
            </td>
            <td>
                <jenzabar:DatePicker ID="dpHireDate" runat="server" TextBoxCssClass="EMMarginRightThree" />
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_LEAVE_BLANK" CssClass="EMLightText" />                
            </td>
        </tr>
    </table>

    <%-- Documents --%>
    <p class="EMMarginTopTwenty">
       <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_DOCUMENTS" />
    </p>
    <div class="EMMarginLeftFive EMMarginTopThree">
        <au:AttachmentUploader ID="auExistingFiles" runat="server" AttachmentUploaderType="MultiUpload"
            AttachmentUseCode='<%# StaffConstants.AttachmentUseHRProcess %>' AttachmentTypeCode='<%# StaffConstants.AttachmentTypeHRSupport %>' />
    </div>
</asp:Panel>

<%-- New Position --%>
<asp:Panel ID="pnlNewPosition" runat="server" CssClass="EMClearLeft EMMarginTopTen" Visible="<%# Position.IsNewPosition %>">    
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_HEADER" CssClass="EMHeader3Text EMBoldText" />
        <span style="margin-left: 300px;">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_OR" CssClass="EMLightText" />
            <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_LINK" OnClick="glbSearch_Click" />
        </span>
    </p>
    <p>
         <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_PARAGRAPH" CssClass="EMLightText" />
    </p>
    <table cellpadding="5" cellspacing="5">
        <%-- Position Title --%>
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_POSITION_TITLE" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPositionTitle" ValidationGroup="ValidateNewForm" CssClass="EMErrorText" Display="Dynamic" Text="*" SetFocusOnError="true" />
            </td>
            <td>
                <asp:TextBox ID="txtPositionTitle" runat="server" />
            </td>
        </tr>
        <%-- Short Description --%>
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_SHORT_DESC" />
            </td>
            <td>
                <asp:TextBox ID="txtShortDesc" runat="server" />
            </td>
        </tr>
        <%-- Location --%>
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_LOCATION" />
            </td>
            <td>
                <asp:DropDownList ID="ddlLocation" runat="server" />
            </td>
        </tr>
        <%-- Categorization --%>
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_CATEGORIZATION" />
            </td>
            <td>
                <p>
                    <asp:DropDownList ID="ddlDepartment" runat="server" />
                    <asp:DropDownList ID="ddlClassifcation" runat="server" CssClass="EMMarginLeftFive" />
                </p>
                <p class="EMMarginTopFive">
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_OPTIONAL" CssClass="EMLightText" />
                    <asp:DropDownList ID="ddlCategory" runat="server" />
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="EMMarginLeftFive" />
                </p>
            </td>
        </tr>
        <%-- Work Type --%>
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_WORK_TYPE" />
            </td>
            <td>
                <p>
                    <asp:DropDownList ID="ddlWorkType" runat="server" OnSelectedIndexChanged="ddlWorkType_SelectedIndexChanged" AutoPostBack="true" />
                    <asp:DropDownList ID="ddlWorkShift" runat="server" CssClass="EMMarginLeftFive" />
                </p>
                <p id="pPartTimeDetails" runat="server" class="EMMarginTopFive">
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_HOW_MUCH_WORK" CssClass="EMLightText" />
                    <asp:TextBox ID="txtStandardHours" runat="server" Width="60px" />
                    <%--<asp:RegularExpressionValidator runat="server" ControlToValidate="txtStandardHours" ValidationGroup="ValidateNewForm" ValidationExpression="^\d+(\.\d{2})?$" Display="Dynamic" Text="*" SetFocusOnError="true" />--%>
                    <asp:RangeValidator runat="server" ControlToValidate="txtStandardHours" ValidationGroup="ValidateNewForm" CssClass="EMErrorText" MinimumValue="0" MaximumValue="2080" Type="Currency" Display="Dynamic" Text="*" SetFocusOnError="true" />
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_STANDARD_ANNUAL_HOURS" CssClass="EMLightText" />
                </p>
            </td>
        </tr>
        <%-- Pay Type --%>
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_PAY_TYPE" />
            </td>
            <td>
                <asp:DropDownList ID="ddlPayType" runat="server" OnSelectedIndexChanged="ddlPayType_SelectedIndexChanged" AutoPostBack="true" />
                <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DOLLAR" />
                <asp:TextBox ID="txtTargetSalaryNew" runat="server" />
                <asp:Literal ID="lPayType" runat="server" />
                <%--<asp:RegularExpressionValidator runat="server" ControlToValidate="txtTargetSalaryNew" ValidationGroup="ValidateNewForm" ValidationExpression="^(\d{1,3},(\d{3},)*\d{3}|\d+)(\.\d{2})?$" Display="Dynamic" Text="*" SetFocusOnError="true" />--%>                           
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTargetSalaryNew" ValidationGroup="ValidateNewForm" CssClass="EMErrorText" Display="Dynamic" Text="*" SetFocusOnError="true" />
                <asp:RangeValidator ID="vTargetSalaryNew" runat="server" ControlToValidate="txtTargetSalaryNew" ValidationGroup="ValidateNewForm" CssClass="EMErrorText" MinimumValue="0" MaximumValue="999999999.99" Type="Currency" Display="Dynamic" Text="*" SetFocusOnError="true" />
            </td>
        </tr>
        <%-- Competencies --%>
        <tr>
            <td class="EMVAlignTop">
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_COMPETENCIES" />
            </td>
            <td>
                <p>
                    <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_REQUIRED" />
                </p>
                <p>
                    <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconAddSmall()) %>' CssClass="EMMarginLeftFive EMMarginTopThree EMVAlignMiddle" />
                    <jenzabar:GlobalizedLinkButton ID="glbAddRequired" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_REQUIRED_COMPETENCY" CssClass="EMVAlignMiddle" />
                </p>
                <p class="EMPaddingTopTen">
                    <jenzabar:GlobalizedLiteral runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_DESIRED" />
                </p>
                <p>
                    <asp:Image runat="server" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconAddSmall()) %>' CssClass="EMMarginLeftFive EMMarginTopThree EMVAlignMiddle" />
                    <jenzabar:GlobalizedLinkButton ID="glbAddDesired" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_DESIRED_COMPETENCY" CssClass="EMVAlignMiddle" />
                </p>
                <div id="dComps" runat="server" class="EMBackgroundGray EMBorderTopBottomGray EMMarginTopTen EMMarginBottomTwenty EMDisplayInlineBlock" visible="false">
                    <div id="dCompsText" runat="server" class="EMMarginAllTen EMOverflowHidden" style="margin-top:-10px;"></div>        
                </div>
            </td>
        </tr>
        <%-- Documents --%>
        <tr>
            <td class="EMVAlignTop">
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_DOCUMENTS" />
            </td>
            <td>
                <p>
                    <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_INTERNAL_USE" CssClass="EMLightText" />
                </p>
                <div class="EMMarginLeftFive EMMarginTopThree">
                    <au:AttachmentUploader ID="auInernalFiles" runat="server" AttachmentUploaderType="MultiUpload"
                        AttachmentUseCode='<%# StaffConstants.AttachmentUseHRProcess %>' AttachmentTypeCode='<%# StaffConstants.AttachmentTypeHRSupport %>' />
                </div>
                <div runat="server" visible="false">
                    <p class="EMPaddingTopTen">
                        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_PUBLIC_USE" CssClass="EMLightText" />
                    </p>
                    <div class="EMMarginLeftFive EMMarginTopThree">
                        <au:AttachmentUploader ID="auPublicFiles" runat="server" AttachmentUploaderType="MultiUpload"
                            AttachmentUseCode='<%# StaffConstants.AttachmentUseHRProcess %>' AttachmentTypeCode='<%# StaffConstants.AttachmentTypeHRPosExt %>' />
                    </div>
                </div>
            </td>
        </tr>
        <%-- New Hire Date --%>
        <tr>
            <td>
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_NEW_HIRE_DATE" />
            </td>
            <td>
                <jenzabar:DatePicker ID="dpHireDateNew" runat="server" TextBoxCssClass="EMMarginRightThree" />
                <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_LEAVE_BLANK" CssClass="EMLightText" />
            </td>
        </tr>
    </table>
</asp:Panel>

<%-- Justification & Special Instructions --%>
<div class="EMClearLeft EMMarginTopTwenty">
    <p>
        <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_JUSTIFICATION" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtJustification" ValidationGroup="ValidateExistingForm" CssClass="EMErrorText" Display="Dynamic" Text="*" SetFocusOnError="true" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtJustification" ValidationGroup="ValidateNewForm" CssClass="EMErrorText" Display="Dynamic" Text="*" SetFocusOnError="true" />
    </p>
    <p class="EMMarginTopFive">
        <asp:TextBox ID="txtJustification" runat="server" TextMode="MultiLine" Width="500" Height="100" />
    </p>
    <p class="EMMarginTopTwenty">
        <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_INSTRUCTIONS" />
    </p>
    <p class="EMMarginTopFive">
        <asp:TextBox ID="txtInstructions" runat="server" TextMode="MultiLine" Width="500" Height="100" />
    </p>
</div>

<%-- Footer --%>
<div class="EMBackgroundGray EMBorderAllGray EMMarginTopTwenty EMOverflowHidden">
    <ul>
        <li class="EMFloatLeft EMBackgroundBlue EMBorderAllBlue">
            <jenzabar:GlobalizedButton ID="gbtnRequest" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_R_REQUEST" CssClass="EMButton" OnClick="gbtnRequest_Click" CausesValidation="true" />
        </li>
        <li class="EMFloatLeft" style="margin: 1px;">
            <jenzabar:GlobalizedButton ID="gbtnCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CANCEL" CssClass="EMButton" OnClick="gbtnCancel_Click" />
        </li>
        <li class="EMFloatLeft" style="margin-left: 50px">
            <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_BACK_SEARCH" CssClass="EMLinkButton" OnClick="glbBack_Click" Visible="<%# !Position.IsNewPosition %>"  />
            <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_LINK" CssClass="EMLinkButton" OnClick="glbSearch_Click" Visible="<%# Position.IsNewPosition %>" />
        </li>
    </ul>
</div>

<%-- Required Competency Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalReqComps" runat="server" TargetControlID="glbAddRequired" PopupControlID="pnlReqComps" PopupDragHandleControlID="pnlReqCompsHeader" CancelControlID="glbReqCompsCancel" BackgroundCssClass="EMModalBackground" />
<asp:Panel ID="pnlReqComps" runat="server" CssClass="EMModalPopup" Visible="<%# Position.IsNewPosition %>">
    <div class="EMModalInner">
        <asp:Panel ID="pnlReqCompsHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_REQUIRED_COMPETENCY" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_COMPETENCIES" />
            <asp:DropDownList ID="ddlReqComps" runat="server" CssClass="EMMarginBottomTen" />            
            <asp:Repeater ID="rReqComps" runat="server" OnItemDataBound="rReqComps_ItemDataBound">
                <ItemTemplate>
                    <p class="EMMarginTopFive EMMarginLeftFive"><asp:CheckBox ID="chkReqComps" runat="server" TextAlign="Right" Text='<%# Eval("DisplayDescription") %>' /></p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="EMModalButtons">
            <jenzabar:GlobalizedLinkButton ID="glbReqCompsAdd" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_ADD_SELECTED_COMPS" OnClick="glbReqCompsAdd_Click" />
            <jenzabar:GlobalizedLinkButton ID="glbReqCompsCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CANCEL" />
        </div>
    </div>
</asp:Panel>

<%-- Desired Competency Modal Popup --%>
<ajaxToolkit:ModalPopupExtender ID="modalDesComps" runat="server" TargetControlID="glbAddDesired" PopupControlID="pnlDesComps" PopupDragHandleControlID="pnlDesCompsHeader" CancelControlID="glbDesCompsCancel" BackgroundCssClass="EMModalBackground" />
<asp:Panel ID="pnlDesComps" runat="server" CssClass="EMModalPopup" Visible="<%# Position.IsNewPosition %>">
    <div class="EMModalInner">
        <asp:Panel ID="pnlDesCompsHeader" runat="server" CssClass="EMModalHeader">
            <jenzabar:globalizedliteral Runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_DESIRED_COMPETENCY" />
            <asp:ImageButton runat="server" CssClass="EMModalHeaderImg" ImageUrl='<%# Page.ResolveUrl(EMConstants.GetIconClose()) %>' />         
        </asp:Panel>
        <div class="EMMarginAllTwenty">
            <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_COMPETENCIES" />
            <asp:DropDownList ID="ddlDesComps" runat="server" CssClass="EMMarginBottomTen" />            
            <asp:Repeater ID="rDesComps" runat="server" OnItemDataBound="rDesComps_ItemDataBound">
                <ItemTemplate>
                    <p class="EMMarginTopFive EMMarginLeftFive"><asp:CheckBox ID="chkDesComps" runat="server" TextAlign="Right" Text='<%# Eval("DisplayDescription") %>' /></p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="EMModalButtons">
            <jenzabar:GlobalizedLinkButton ID="glbDesCompsAdd" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_PRF_N_ADD_SELECTED_COMPS" OnClick="glbDesCompsAdd_Click" />
            <jenzabar:GlobalizedLinkButton ID="glbDesCompsCancel" runat="server" TextKey="TXT_STAFF_EMPLOYMENT_MANAGEMENT_COMMON_CANCEL" />
        </div>
    </div>
</asp:Panel>

</div>