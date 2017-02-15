<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeleteOrgHeaderPopup.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.DeleteOrgHeaderPopup" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../../Common/Controls/Modal.ascx" %>

<LMS:Modal ID="ModalWindow" runat="server">
<ContentArea>
	<div class="deleteOrgHeaderModal">

	<div id="DeleteOrgHeaderMessage" runat="server"></div>
	<ul>
		<li id="MovePanel" runat="server">
			<asp:RadioButton ID="MoveRadio" GroupName="AssignmentOptions" Checked="true" runat="server" />
			<common:GlobalizedLabel LabelKey="TXT_CONVERT_THEM_TO" AssociatedControlID="MoveRadio" runat="server" />
			<asp:DropDownList ID="MoveToDropDown" runat="server"/>
		</li>
		<li>
			<asp:RadioButton ID="DeleteRadio" GroupName="AssignmentOptions" runat="server" />
			<common:GlobalizedLabel TextKey="TXT_DELETE_THE_ASSIGNMENTS" AssociatedControlID="DeleteRadio" runat="server" />
		</li>
	</ul>

	</div>
</ContentArea>
</LMS:Modal>
