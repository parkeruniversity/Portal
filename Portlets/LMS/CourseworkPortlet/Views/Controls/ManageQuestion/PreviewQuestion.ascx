<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PreviewQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.PreviewQuestion" %>
<%@ Register Src="../../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<%@ Register TagPrefix="cwk" TagName="QuestionDisplay" Src="../QuestionDisplay/QuestionDisplay.ascx" %>

<style>
    #lightbox { z-index: 90000;}
</style>
<div class="previewContainer">
    <asp:LinkButton ID="_lbtnPreview" runat="server" CssClass="previewQuestion" />
    <lms:Modal id="_modal" runat="server">
	    <ContentArea>
            <cwk:QuestionDisplay id="_questionDisplay" runat="server" />
        </ContentArea>
    </lms:Modal>
</div>