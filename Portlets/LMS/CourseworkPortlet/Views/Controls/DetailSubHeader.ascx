<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailSubHeader.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.DetailSubHeader" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Src="../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="LMS" %>
<%@ Register Src="More.ascx" TagName="More" TagPrefix="JICS" %>
<%@ Register Src="ClassWideBonus.ascx" TagName="Bonus" TagPrefix="JICS" %>
<script type="text/javascript" language="javascript">
function ClearDefaultGrade<%=ClientID %>(){
    $('#<%= TxtGrade %>').val("");
    $('#<%= TxtGrade %>').removeClass();
    $('#<%= GradeErrMsg %>').text("");
}
</script>
<div class="detailSubHeader">
	<ul>
		<li class="due"><img src="<%=GetDueImgUrl()%>" /> <asp:Literal ID="_litDueDate" runat="server" /></li>
		<li><common:ImageAndTextButton id="_itbEditAll" runat="server" OnClick="EditAll_Click" /> <framework:PortalImageAndHyperLink id="_pihMain"  runat="server" /> </li>
		<li><framework:PortalImageAndHyperLink id="_pihDefault" runat="server" />
			<LMS:Modal id="_modal" runat="server">
				<ContentArea>
					<div class="gradeInputEntry">
                        <asp:Label ID="_lblErrDefaultGrade" runat="server" CssClass="FormTxtErr" />
						<div>
							<asp:Literal ID="_litInfo" runat="server" />
						</div>
						<div>
							<asp:Literal ID="_litScore" runat="server" />
						</div>
						<div>
							<asp:Label ID="_lblInput" runat="server" />
							<asp:TextBox ID="_txtGrade" Width="40px" runat="server" />
							<br />
							<asp:RadioButtonList ID="_radCred" runat="server" RepeatLayout="Flow" RepeatDirection="Vertical" />
						</div>		
					</div>
				</ContentArea>
			</LMS:Modal>
			<framework:PortalImageAndHyperLink id="_pihSecond"  runat="server" /> 
			<common:ImageAndTextButton id="_itbEditSecond" runat="server" OnClick="EditAll_Click" />
		</li>
		<li class="moreLink">
			<JICS:More id="_more" runat="server" />
		</li>
	</ul>
    <JICS:Bonus id="_bonus" runat="server" />
	<asp:HiddenField ID="_hidden" runat="server" />
</div>