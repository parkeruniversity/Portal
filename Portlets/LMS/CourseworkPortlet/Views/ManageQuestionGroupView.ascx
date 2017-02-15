<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageQuestionGroupView.ascx.cs"
	Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.ManageQuestionGroupView" %>
	<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="JICS" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register Src="Controls/RichTextEditor.ascx" TagName="RichText" TagPrefix="cwk" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<script type="text/javascript">
    function handleTypeChange(element, doHighlight) {
        var value = $("input[name='" + element.name + "']:checked").val();
        if (value == "<%=rdbRegularType.ID%>") {
            $("#<%=txtNumberOfQuestionsToGive.ClientID%>").val("");
		    $("#<%=txtPointValueForEachQuestion.ClientID%>").val("");
		    $("#<%=divPoolTypeOptions.ClientID %>").hide();
            if(doHighlight){
                $("#<%=_trOrder.ClientID %>").effect("highlight", {}, 1000);
            }
        }
        else {
            if (doHighlight) {
                $("#<%=divPoolTypeOptions.ClientID %>").effect("highlight", {}, 1000);
            } else {
                $("#<%=divPoolTypeOptions.ClientID %>").show();
            }
			$("#<%=_trOrder.ClientID %>").hide();
		}
	}
</script>
<div class="cwkBorderButtonBar top">
	<framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon"  runat="server" />
</div>
<div class="pSection">
	<table cellspacing="10" width="100%">
		<tr>
			<td valign="top" align="right" style="width: 15%;">
				<asp:Label ID="lblName" runat="server" />
			</td>
			<td>
				<asp:TextBox ID="txtName" runat="server" Width="300px" MaxLength="100" /> <asp:Label ID="lblErrName" runat="server" />
			</td>
		</tr>
		<tr>
			<td valign="top" align="right">
				<asp:Label ID="lblInstructions" runat="server" />
			</td>
			<td>
				<asp:UpdatePanel runat="server" ID="rteInstructionsUpdatePanel">
					<ContentTemplate>
						<cwk:RichText ID="rteInstructions" runat="server" />
					</ContentTemplate>
				</asp:UpdatePanel>
			</td>
		</tr>
		<tr>
			<td valign="top" align="right">
				<asp:Label ID="lblType" runat="server" />
			</td>
			<td>
				<table>
					<tr>
						<td>
							<asp:RadioButton ID="rdbRegularType" runat="server" GroupName="groupType" onclick="handleTypeChange(this, true)"/>
							<asp:Label ID="lblRegularType" runat="server" AssociatedControlID="rdbRegularType" />
						</td>
						<td>
							<asp:Label ID="lblRegularTypeDescription" runat="server" CssClass="descriptiveText" />
						</td>
					</tr>
					<tr>
						<td>
							<asp:RadioButton ID="rdbPoolType" runat="server" GroupName="groupType" onclick="handleTypeChange(this, true)" />
							<asp:Label ID="lblPoolType" runat="server" AssociatedControlID="rdbPoolType" />
						</td>
						<td>
							<asp:Label ID="lblPoolTypeDescription" runat="server" CssClass="descriptiveText" />
						</td>
					</tr>
				</table>
				<div id="divPoolTypeOptions" runat="server" class="indentedDiv">
					<table>
						<tr>
							<td>
								<asp:Label ID="lblNumberOfQuestionsToGive" runat="server" AssociatedControlID="txtNumberOfQuestionsToGive" />
							</td>
							<td>
								<asp:TextBox ID="txtNumberOfQuestionsToGive" runat="server" MaxLength="5" /> 
                                <asp:Label ID="lblErrPoolQuestionCount" runat="server" />
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label ID="lblPointValueForEachQuestion" runat="server" AssociatedControlID="txtPointValueForEachQuestion" />
							</td>
							<td>
								<asp:TextBox ID="txtPointValueForEachQuestion" runat="server" /> 
                                <asp:Label ID="lblErrPoolQuestionValue" runat="server" />
							</td>
						</tr>
					</table>
					<asp:Label ID="lblPointValueDescription" runat="server" CssClass="descriptiveText" /><br /><br />
				</div>
			</td>
		</tr>
		<tr id="_trOrder" runat="server">
			<td valign="top" align="right">
				<asp:Label ID="lblQuestionOrder" runat="server" />
			</td>
			<td>
				<table>
					<tr>
						<td>
							<asp:RadioButton ID="rdbStaticOrder" runat="server" GroupName="orderType"  />
							<asp:Label ID="lblStatic" runat="server" AssociatedControlID="rdbStaticOrder" />
						</td>
						<td>
							<asp:Label ID="lblStaticOrderDescription" runat="server" CssClass="descriptiveText" />
						</td>
					</tr>
					<tr>
						<td>
							<asp:RadioButton ID="rdbRandomOrder" runat="server" GroupName="orderType"  />
							<asp:Label ID="lblRandom" runat="server" AssociatedControlID="rdbRandomOrder" />
						</td>
						<td>
							<asp:Label ID="lblRandomOrderDescription" runat="server" CssClass="descriptiveText" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top" align="right">
				<asp:Label ID="lblTimeLimit" runat="server" AssociatedControlID="txtTimeLimit" />
			</td>
			<td>
				<asp:TextBox ID="txtTimeLimit" runat="server" Width="50px" MaxLength="5" />
				<asp:Label ID="lblMinutes" runat="server" />
				<asp:Label ID="lblTimeLimitDescription" runat="server" CssClass="descriptiveText" />
			</td>
		</tr>
		<tr>
			<td valign="top" align="right">
				<asp:Label ID="lblExtraCredit" runat="server" />
			</td>
			<td>
				<asp:CheckBox ID="chkExtraCredit" runat="server" />
				<asp:Label ID="lblMakeExtraCredit" runat="server" />
				<br />
				<asp:Label ID="lblExtraCreditDescription" runat="server" CssClass="descriptiveText" />
			</td>
		</tr>
	</table>
</div>
<div>
	<div class="cwkCancelButtonBar">
		<asp:Button ID="btnCancel" runat="server" />
	</div>
	<div class="cwkSaveButtonBar">
		<asp:Button ID="btnSaveQuestionOrder" runat="server" />
	</div>
</div>
