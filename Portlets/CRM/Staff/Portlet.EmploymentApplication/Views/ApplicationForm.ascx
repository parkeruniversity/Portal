<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicationForm.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet.ApplicationForm" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet" %>
<%@ Register TagPrefix="common" TagName="FileView" Src="~/Portlets/CRM/Common/Jenzabar.EX.Feedback/Controls/FileView.ascx" %>

<%@ Import Namespace="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet" %>

<div class="EmploymentApplication EAMarginAllTen">
    <p>
        <jenzabar:GlobalizedLabel id="lblApplicationForPosition" runat="server" CssClass="EAHeaderText" />
    </p>
    <br />
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_APPLICATION_RECEIVED" CssClass="EALightText" />
    </p>
    <br />
    <p>
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_YOUR_APPLICATION" CssClass="EABoldText" /><br />
        <jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_PLEASE_PROVIDE_INFORMATION" CssClass="EALightText" />
    </p>
    <br />
    
        <table id="tblAttachments" runat="server">
            <tr id="trLetter" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_YOUR_COVER_LETTER" /></td>
                <td><common:FileView ID="_fileUploaderCover" AttachmentGOID="<%# ParentGOID %>" AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>"
                        AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRCover %>" AddFileText="Upload your cover letter/statement of intent file"
                        AllowTextEntry="<%# true%>" runat="server" /></td>
            </tr>
            <tr id="trResume" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_YOUR_RESUME" /></td>
                <td><common:FileView ID="_fileUploaderResume" AttachmentGOID="<%# ParentGOID %>" AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>"
                        AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRResume %>" AddFileText="Upload your resume file"
                        AllowTextEntry="<%# true%>" runat="server" /></td>
            </tr>
            <tr id="trReferences" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_YOUR_REFERENCES" /></td>
                <td><common:FileView ID="_fileUploaderReferences" AttachmentGOID="<%# ParentGOID %>"
                        AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>" AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRRefer %>"
                        AddFileText="Upload your references file" AllowTextEntry="<%# true%>" runat="server" /></td>
            </tr>
            <tr id="trOther" runat="server">
                <td><jenzabar:GlobalizedLabel runat="server" TextKey="TXT_EA_ADDITIONAL_INFO" /></td>
                <td><common:FileView ID="_fileUploaderAdditionalInfo" AttachmentGOID="<%# ParentGOID %>"
                        AttachmentUseCde="<%# EAConstants.AttachmentUseHRHiring %>" AttachmentTypeCde="<%# EAConstants.AttachmentTypeHRHirExt %>"
                        AllowTextEntry="<%# true%>" runat="server" /></td>
            </tr>
        </table>
    <br />
    <p>
        <jenzabar:GlobalizedLinkButton runat="server" TextKey="TXT_EA_RETURN_TO_START" CommandName="Guid" OnCommand="glnkReturn_Command" />
    </p>
</div>