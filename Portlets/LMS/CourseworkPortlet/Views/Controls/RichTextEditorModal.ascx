<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RichTextEditorModal.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.RichTextEditorModal" %>
<%@ Register Src="../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<%@ Register Src="RichTextEditor.ascx" TagName="RichText" TagPrefix="cwk" %>
<lms:Modal id="_modal" runat="server">
	<ContentArea>
		<cwk:RichText id="_richText" runat="server" />
		<div class="clearOption">
			<asp:LinkButton ID="_lbtnClear" runat="server" />
		</div>
	</ContentArea>
</lms:Modal>
