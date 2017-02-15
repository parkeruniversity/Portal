<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClassWideBonus.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ClassWideBonus" %>
<%@ Register Src="../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="LMS" %>
<script type="text/javascript" language="javascript">
    function clearBonus<%=ClientID %>(){
        $('#<%= TextBoxClientId %>').val("");
    }
</script>
<lms:Modal id="_modalBonus" runat="server" CssClass="bonusModal">
	<ContentArea>
		<div class="bonusModalContainer">
			<div>
				<asp:Literal ID="_litBonusInfo" runat="server" />
			</div>
            <asp:Label ID="_lblError" runat="server" CssClass="FormTxtErr" />
			<div>
				<asp:Literal ID="_litBonusAction" runat="server" /> <asp:TextBox ID="_txtBonus" runat="server" /> <asp:Literal ID="_litBonusPoints" runat="server" />
			</div>
		</div>
	</ContentArea>
</lms:Modal>