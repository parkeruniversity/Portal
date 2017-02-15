<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImportQuestionGroup.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.FileCabinet.ImportQuestionGroup" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../../../Common/Controls/Modal.ascx" %>
<LMS:Modal Id="_modalImport" runat="server">
    <ContentArea>
        <div style="margin:10px;">
            <asp:Label id="_lblInfo" runat="server" />
            <div style="text-align:center;">
                <asp:DropDownList ID="_ddlImportGroup" runat="server" />
            </div>
        </div>
    </ContentArea>
</LMS:Modal>