<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewSubmission.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet.ViewSubmission" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet" %>
<%@ Register src="~/Portlets/Modules/PortletModule.EX.FormBuilder/PortletScreens/UserControls/SubmissionStatus.ascx" tagname="SubmissionStatus" tagprefix="JICS" %>
<%@ Register src="~/Portlets/Modules/PortletModule.EX.FormBuilder/PortletScreens/UserControls/SubmissionResponses.ascx" tagname="SubmissionResponses" tagprefix="JICS" %>
<%@ Register TagPrefix="common" TagName="FileView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FileView.ascx" %>

<h4><asp:Literal ID="litPTitle" runat="server" /></h4>
<div class="FormBuilder">
	<div class="pSection">
        <JICS:SubmissionStatus ID="_submissionStatus" runat="server" visible="false" />	
		<asp:Repeater ID="_submissionResponseRepeater" runat="server">
		    <ItemTemplate>
		        <asp:Literal ID="litSName" runat="server" />
		        <JICS:SubmissionResponses ID="_showSubmissionQuestionResponses" runat="server"/>
		    </ItemTemplate>
		</asp:Repeater>

        <table id="tblAttachments" runat="server">
            <tr id="trLetter" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_YOUR_COVER_LETTER" /></td>
                <td><common:FileView ID="_fileUploaderCover" AttachmentGOID="<%# ParentGOID %>" AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>"
                        AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRCover %>" AddFileText="Upload your cover letter/statement of intent file"
                        AllowTextEntry="<%# false%>" DisplayOnly="<%# true%>" runat="server" /></td>
            </tr>
            <tr id="trResume" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_YOUR_RESUME" /></td>
                <td><common:FileView ID="_fileUploaderResume" AttachmentGOID="<%# ParentGOID %>" AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>"
                        AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRResume %>" AddFileText="Upload your resume file"
                        AllowTextEntry="<%# false%>" DisplayOnly="<%# true%>" runat="server" /></td>
            </tr>
            <tr id="trReferences" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_YOUR_REFERENCES" /></td>
                <td><common:FileView ID="_fileUploaderReferences" AttachmentGOID="<%# ParentGOID %>"
                        AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>" AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRRefer %>"
                        AddFileText="Upload your references file" AllowTextEntry="<%# false%>" DisplayOnly="<%# true%>" runat="server" /></td>
            </tr>
            <tr id="trOther" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_ADDITIONAL_INFO" /></td>
                <td><common:FileView ID="_fileUploaderAdditionalInfo" AttachmentGOID="<%# ParentGOID %>"
                        AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>" AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRHirExt %>"
                        AllowTextEntry="<%# false%>" DisplayOnly="<%# true%>" runat="server" /></td>
            </tr>
        </table>
		<jenzabar:GlobalizedLinkButton TextKey="TXT_EA_RETURN_TO_PREVIOUS_SCREEN" ID="lnkPositionDetail" runat="server" OnCommand="lbPosition_Command" CommandName="PositionID"  /><br />	
	</div>
</div>