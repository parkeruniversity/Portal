<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfigurationView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ConfigurationView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="LMS" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        SetStudentCommentsDisable();
    });
    function SetDisableNotify(disable) {
        if (disable) {
            $('#<%= _cbSendEmailStudentComments.ClientID%>').attr('disabled', 'disabled');
            $('#<%= _cbSendEmailStudentComments.ClientID%>').removeAttr('checked');
        }else{
            $('#<%= _cbSendEmailStudentComments.ClientID%>').removeAttr('disabled');
        }
    }
    function SetStudentCommentsDisable() {
        if (!$("'.cssChkBox1 input[type=checkbox]'").is(':checked')) {
            $('#<%= _cbSendEmailStudentComments.ClientID%>').attr('disabled', 'disabled');
        }
    }
    function HighlightStuCommentSaved() {
        $("#_spanStuCommentSaved").show();
        $("#_spanStuCommentSaved").effect("highlight", {mode: "hide"}, 3000);
    }
</script>

<div class="cwkBorderButtonBar top">
	<framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon"  runat="server" />
</div>

<div class="pSection">
	<div>
		<asp:Label ID="_lblSetup" CssClass="cwkHeader" runat="server" />
		<div class="cwkText">
			<asp:Literal ID="_litSetup" runat="server" />
		</div>
	</div>
	<asp:UpdatePanel ID="UpdatePanel" UpdateMode="Conditional" runat="server">
	<ContentTemplate>
		<div>
			<asp:Label ID="_lblOrganization" CssClass="cwkHeader" runat="server" />
			<div class="cwkText">
				<asp:Literal ID="_litOrgInfo" runat="server" />
			</div>
			<div>
				<div class="organizationContainer">
					<asp:Image ID="_imgGrouping" CssClass="orgImg" runat="server" />
					<div class="orgContainerInfo">
						<asp:Label id="_lblAssignGroup" runat="server" />
						<asp:Label ID="_lblGrouping" CssClass="orgMesgValue" runat="server" />
					</div>

				</div>
				<div class="orgGrouping">
					<asp:LinkButton ID="_lbtnGrouping" runat="server" OnClick="Grouping_Click" />
				</div>
			</div>
			<div class="organizationContainer">
				<asp:Image ID="_imgOrdering" CssClass="orgImg" runat="server" />
				<div class="orgContainerInfo"  style="">
					<asp:Label ID="_lblAssignOrder" runat="server" />
					<asp:Label id="_lblOrdering"  CssClass="orgMesgValue" runat="server" />
					<div class="changeOrder">
						<asp:HyperLink ID="_hypManual" runat="server" />
					</div>
					<div class="changeOrder">
						<asp:HyperLink ID="_hypOrder" CssClass="link" runat="server" />
						<LMS:Modal id="_modal" runat="server">
							<ContentArea>
								<asp:Repeater id="_rptLinks" runat="server">
									<ItemTemplate>
										<div class="orderingLink">
											<asp:LinkButton id="_lbtnLink" runat="server" />
										</div>
									</ItemTemplate>
								</asp:Repeater>
							</ContentArea>
						</LMS:Modal>
					</div>
				</div>
			</div>
        </div>
    </ContentTemplate>
	</asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
        <div>
            <div class="studentCommentsContainer">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td><asp:Label ID="_lblStudentComments" CssClass="cwkHeader" runat="server" /></td>
                        <td valign="bottom"><span id="_spanStuCommentSaved" class="cwkStuCommentsSaved">Saved</span></td>
                    </tr>
                </table>                                               
                <div class="cwkTextStuComment">
                    <div>
                        <asp:CheckBox ID="_cbStudentsMakeComments" CssClass="cssChkBox1" runat="server" /> <asp:Literal ID="_litStudentsMakeComments" runat="server" />
                    </div>
                    <div>
                        <asp:CheckBox ID="_cbSendEmailStudentComments" runat="server" /> <asp:Literal ID="_litSendEmailStudentComments" runat="server" />
                    </div>
                </div>
            </div>
		</div>
        </ContentTemplate>
	</asp:UpdatePanel>
</div>
<div class="cwkBorderButtonBar bottom">
	<common:Mirror Id="_mirror" ControlID="_pihBack" runat="server" />
</div>