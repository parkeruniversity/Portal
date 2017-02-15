<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageOrgHeaderView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ManageOrgHeaderView" %>
<%@ Register TagPrefix="asp" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Assembly="System.Web.Extensions" Namespace="System.Web.UI" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>
<%@ Register TagPrefix="cwk" TagName="AddOrganizationalUnitPopup" Src="Controls/AddOrganizationalUnitPopup.ascx" %>
<%@ Register TagPrefix="cwk" TagName="DeleteOrgHeaderModal" Src="Controls/DeleteOrgHeaderPopup.ascx" %>
<%@ Register TagPrefix="cwk" TagName="AddOrganizationalTypePopup" Src="Controls/AddOrganizationalTypePopup.ascx" %>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls.TemplateFields" Assembly="Jenzabar.Common" %>

<div class="cwkBorderButtonBar top">
	<framework:PortalImageAndHyperLink ID="BackLink" TextKey="TXT_BACK_TO_MAIN_SCREEN" ImageCategory="PortletIcon" ImageUrl="back-arrow.gif" runat="server" />
</div>
<common:GlobalizedLabel TextKey="HDR_UNITS" CssClass="cwkHeader" runat="server" />
<common:GlobalizedLabel TextKey="MSG_CWK_UNIT_DESCRIPTION" CssClass="cwkText" runat="server" />

<div id="OrgUnitError" class="feedbackError" visible="false" enableviewstate="false" runat="server" />

<ul class="cwkSimpleButtonBar">
	<li><framework:PortalImageAndHyperLink ID="AddUnitButton" ImageCategory="PortletIcon" TextKey="TXT_ADD_A_UNIT" runat="server" /></li>
	<li><framework:PortalImageAndHyperLink ID="OrderUnitsButton" ImageCategory="PortletIcon" TextKey="TXT_UNIT_ORDERING" runat="server" /></li>
	<li><framework:PortalImageAndTextButton ID="EditUnitRangesButton" ImageCategory="PortletIcon" TextKey="TXT_EDIT_DATE_RANGES" runat="server" /></li>
</ul>

<div class="cwkText">
    <asp:Label ID="lblDateRangeErr" Runat="server" CssClass="FormTxtErr" />
</div>
<div class="pSection">
    <common:StyledGridView ID="OrgUnitGrid" DataKeyNames="Id" CssClass="assignmentGrid itemHover" runat="server">
	    <Columns>
		    <asp:BoundField DataField="Name" HeaderText="Name" />
		    <common:GlobalizedTemplateField HeaderTextKey="HDR_DATE_RANGE">
			    <ItemTemplate>
                    <asp:Literal ID="litDateRangeIntro" Runat="server" />
				    <common:ToggleDatePicker ID="StartDate" StaticTextDateFormat="d" Size="10" runat="server" />
				    <span><common:GlobalizedLiteral ID="litDateRangeMid" TextKey="MSG_TO" runat="server" /></span>
				    <common:ToggleDatePicker ID="EndDate" StaticTextDateFormat="d" Size="10" runat="server" />
			    </ItemTemplate>
		    </common:GlobalizedTemplateField>
		    <common:GlobalizedTemplateField HeaderTextKey="HDR_EDIT/DELETE">
			    <ItemTemplate>
				    <framework:PortalImageButton ID="EditUnitButton" ImageCategory="PortletIcon" ImageUrl="folder_edit.gif" runat="server" />
				    <framework:PortalImageButton ID="DeleteUnitButton" ImageCategory="PortletIcon" ImageUrl="folder_delete.gif" CommandName="DeleteUnit" runat="server" />

				    <cwk:DeleteOrgHeaderModal ID="DeleteOrgUnitModal" DisplayType="Units" TargetControlID="DeleteUnitButton" runat="server" />
			    </ItemTemplate>
		    </common:GlobalizedTemplateField>
	    </Columns>
	    <EmptyDataTemplate><common:GlobalizedLabel TextKey="MSG_CWK_NO_UNITS" runat="server" /></EmptyDataTemplate>
    </common:StyledGridView>
</div>

<LMS:Modal ID="OrgUnitAdminPopup" CssClass="orgUnitModal" runat="server">
	<ContentArea>
		<cwk:AddOrganizationalUnitPopup ID="OrgUnitAdmin" HideHeader="true" HideButtons="true" AddCancelClientClick="false" runat="server" />
		<asp:HiddenField ID="OrgUnitEditId" runat="server" />
	</ContentArea>
</LMS:Modal>

<ul id="OrgUnitButtonBar" visible="false" class="cwkSimpleButtonBar cwkButtonFooter" runat="server">
	<li><common:GlobalizedButton ID="SaveUnitRangesButton" TextKey="TXT_SAVE_CHANGES" runat="server" /></li>
	<li><common:GlobalizedButton ID="CancelUnitRangesButton" TextKey="TXT_CANCEL" runat="server" /></li>
</ul>

<common:GlobalizedLabel TextKey="HDR_TYPES" CssClass="cwkHeader" runat="server" />
<common:GlobalizedLabel TextKey="MSG_CWK_TYPE_DESCRIPTION" CssClass="cwkText" runat="server" />
<asp:UpdatePanel runat="server">
<ContentTemplate>
	<div id="OrgTypeError" class="feedbackError" visible="false" enableviewstate="false" runat="server" />
	<ul class="cwkSimpleButtonBar">
		<li><framework:PortalImageAndHyperLink ID="AddTypeButton" ImageCategory="PortletIcon" TextKey="TXT_ADD_A_TYPE" runat="server" /></li>
		<li><framework:PortalImageAndHyperLink ID="OrderTypesButton" ImageCategory="PortletIcon" TextKey="TXT_TYPE_ORDERING" runat="server" /></li>
	</ul>
	<LMS:Modal ID="AddTypePopup" TargetControlID="AddTypeButton" runat="server">
		<ContentArea>
			<cwk:AddOrganizationalTypePopup ID="AddTypePopupContents" HideHeader="true" HideButtons="true" runat="server" />
		</ContentArea>
	</LMS:Modal>
    <div class="pSection">
	    <common:StyledGridView ID="OrgTypeGrid" ShowHeader="false" CssClass="assignmentGrid itemHover" runat="server">
		    <Columns>
			    <asp:BoundField DataField="Name" />
			    <asp:TemplateField>
				    <ItemTemplate>

					    <framework:PortalImageButton ID="EditTypeButton" ImageCategory="PortletIcon" ImageUrl="edit.gif" runat="server" />
					    <framework:PortalImageButton ID="DeleteTypeButton" ImageCategory="PortletIcon" ImageUrl="delete.gif" CommandName="DeleteType" runat="server" />

					    <LMS:Modal ID="EditTypePopup" TargetControlID="EditTypeButton" runat="server">
						    <ContentArea>
							    <cwk:AddOrganizationalTypePopup ID="EditTypePopupContents" HideHeader="true" HideButtons="true" runat="server" />
						    </ContentArea>
					    </LMS:Modal>
					    <cwk:DeleteOrgHeaderModal ID="DeleteOrgTypeModal" DisplayType="Types" TargetControlID="DeleteTypeButton" runat="server" />

				    </ItemTemplate>
			    </asp:TemplateField>
		    </Columns>
		    <EmptyDataTemplate><common:GlobalizedLabel TextKey="MSG_CWK_NO_TYPES" runat="server" /></EmptyDataTemplate>
	    </common:StyledGridView>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
<div class="cwkBorderButtonBar bottom">
	<common:Mirror ControlID="BackLink" runat="server" />
</div>

<script type="text/javascript">

$(document).ready(function() {
    WireUpEditWindow(
        '<%= AddUnitButton.ClientID %>',
        null, null, null, null, null,
        '<%= AddOrgUnitHeaderText %>', '<%= AddOrgUnitSaveButtonText %>'
		);

    <asp:Repeater id="WireUpMethodCalls" runat="server">
	<ItemTemplate>
		WireUpEditWindow(
			<%# ((WireUpMethodCallParameterList)Container.DataItem).ToClientSideParameterList() %>,
	        '<%= EditOrgUnitHeaderText %>', '<%= EditOrgUnitSaveButtonText %>'
			);
	</ItemTemplate>
</asp:Repeater>
});

function WireUpEditWindow(editButtonId, name, description, startDate, endDate, id, headerText, submitText) {
	$('#' + editButtonId).click(function() {
	    $('#<%= OrgUnitAdmin.Control.NameClientID %>').val(name);
	    $('#<%= OrgUnitAdmin.Control.StartDateClientID %>').val(startDate);
	    $('#<%= OrgUnitAdmin.Control.EndDateClientID %>').val(endDate);
		PopulateTextBoxEditor('<%= OrgUnitAdmin.Control.DescriptionClientID %>', description, FocusName);
	    $('#<%= OrgUnitEditId.Control.ClientID %>').val(id != null ? id : '');

	    $('#<%= OrgUnitAdminPopup.HeaderTextClientID %>').text(headerText);
	    $('#<%= OrgUnitAdminPopup.OkButtonClientID %>').val(submitText);
	    $('#<%= OrgUnitAdmin.Control.ValidationClientID %>').text('');

	    FocusName();
	});
}

function FocusName() {
    $('#<%= OrgUnitAdmin.Control.NameClientID %>').focus();
}

</script>
