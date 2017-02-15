<%@ Control Language="C#" AutoEventWireup="true" Inherits="Jenzabar.Portal.Framework.Web.UI.Controls.GradeInputBase,Jenzabar.Portal.Framework.Web" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="JICS" %>
<link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/UI/Controls/UserControls/Styles/GradeInput.css.aspx") %>?v=755" />

<script type="text/javascript" language="javascript">

    var origGrade<%= ClientID %>;

    $(document).ready(function () {
        origGrade<%= ClientID %> = "<%= CurrentGrade %>";
    });

    function clearGrade<%=ClientID %>() {
        $('#<%= TextBoxClientId %>').val(origGrade<%=ClientID %>);
        $('#<%= TextBoxClientId %>').removeClass();
        $('#<%= ErrTxtSpan %>').text("");
    }

    function ModalOpen<%=ClientID %>() {
        var modal = $find("<%=_modal.BehaviorId %>");
        if (modal != null)
            modal.add_shown(function () { var elem = $('#' + '<%=_modal.FindControl("_txtGrade").ClientID %>'); elem.focus(); var v = elem.val(); elem.val(""); elem.val(v); });
    }

    Sys.Application.add_load(ModalOpen<%=ClientID %>);
</script>
<asp:Panel ID="_panGradeInput" CssClass="gradeInput" runat="server">
	<asp:Label ID="_lblHeader" CssClass="gradeInputHeader" runat="server" />
	<asp:ImageButton ID="_ibtnFull" BorderWidth="1" CssClass="full" runat="server" OnClick="FullCredit_Click" />
	<asp:LinkButton ID="_lbtnFull" runat="server" CssClass="full" OnClick="FullCredit_Click" />
	<asp:ImageButton ID="_ibtnPartial" style="border-width:1px 2px;" CssClass="partial" runat="server" />
	<asp:LinkButton ID="_lbtnPartial" CssClass="gradeDivider partial" runat="server" />
	
	<asp:ImageButton ID="_ibtnZero" CssClass="zero" BorderWidth="1" runat="server" OnClick="ZeroCredit_Click" />
	<asp:LinkButton ID="_lbtnZero" runat="server" CssClass="gradeDivider zero" OnClick="ZeroCredit_Click" />
</asp:Panel>
<asp:Panel ID="_panNonGraded" CssClass="notGradedPanel fullGradeInput" Visible="False" runat="server">
    <div id="nonGradedContainer">
        <asp:Label ID="_lblNonGradedInfoTxt" runat="server" />
    </div>
</asp:Panel>
<JICS:Modal id="_modal" runat="server">
	<ContentArea>
		<div class="gradeInputEntry">
            <asp:Label ID="lblErrGrade" runat="server" CssClass="FormTxtErr" /><br />
			<asp:Label ID="_lblEnter" runat="server" /> <asp:TextBox ID="_txtGrade" Width="50px" runat="server" />
            <asp:Label ID="_lblInfo" CssClass="gradeInputInfo" runat="server"></asp:Label>
		</div>
	</ContentArea>
</JICS:Modal>

