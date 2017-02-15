<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WeightingSetupView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.GradebookPortlet.Views.WeightingSetupView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register TagPrefix="lms" TagName="Modal" Src="../../Common/Controls/Modal.ascx" %>
<%@ Register TagPrefix="portlet" TagName="NavBar" Src="Controls/NavigationBar.ascx" %>

<portlet:NavBar ID="NavBar" runat="server" />

<div class="portletScreen weightingSetupScreen">
    <div class="title">
		<div class="headerText">
			<common:GlobalizedLabel LabelKey="HDR_FINAL_GRADE_WEIGHTING" runat="server" />
			<common:GlobalizedLabel TextKey="HDR_WEIGHTING_METHOD" runat="server" />
		</div>
	    <common:GlobalizedLabel TextKey="MSG_GBK_FINALGRADEWEIGHTING_DESCRIPTION" CssClass="desc" runat="server" />
    </div>
    <div class="options">
        <p>
	        <framework:PortalImageAndHyperLink ID="HelpButton" TextKey="MSG_GBK_WHAT_IS_A_FINAL_GRADE_WEIGHTING_METHOD"
			        ImageCategory="PortletIcon" ImageUrl="16/help.png" runat="server" />
	        <lms:Modal ID="HelpPopup" TargetControlID="HelpButton" runat="server">
		        <ContentArea>
			        <common:EmbeddedHyperLink ID="HelpTextWithLink" OuterTextKey="MSG_FORMAT_GBK_WEIGHTINGMETHOD_HELPPOPUP" 
					        TextKey="MSG_FORMAT_GBK_WEIGHTINGMETHOD_HELPPOPUP_WEIGHTINGSCREEN" CssClass="helpMessage" runat="server" />
		        </ContentArea>
	        </lms:Modal>
        </p>
        <p>
	        <common:GlobalizedLabel LabelKey="TXT_FOR_THIS_COURSE_ID_LIKE_TO_USE" runat="server" />
        </p>

        <table cellspacing="0" cellpadding="0" class="weightingList">
	        <asp:Repeater ID="WeightingMethodList" runat="server">
	        <ItemTemplate>
		        <tr id="optionItemContainer" runat="server">
			        <td valign="top" class="optionItemFirstElement">
                        <framework:PortalImageButton ID="CheckBoxImage" ImageCategory="PortletIcon" CommandName="Select" runat="server" />
                    </td>
			        <td valign="top" class="optionItemElement">
				        <div class="optionLink"><asp:LinkButton ID="MethodName" CommandName="Select" runat="server" /></div>
				        <div><asp:Label ID="MethodDescription" runat="server" /></div>

				        <div id="CustomizeBox" visible="false" runat="server">
					        <p>
						        <common:GlobalizedLabel LabelKey="TXT_CURRENTLY" runat="server" />
						        <strong><asp:Label ID="DescriptiveName" runat="server" /></strong>
					        </p>
					        <framework:PortalImageAndHyperLink ID="ConfigureButton" TextKey="TXT_CONFIGURE_YOUR_CUSTOM_METHOD"
							        ImageCategory="PortletIcon" ImageUrl="16/chart_pie_edit.png" runat="server" />
				        </div>
			        </td>
		        </tr>
	        </ItemTemplate>
	        </asp:Repeater>
        </table>
    </div>

    <common:GlobalizedHyperLink ID="GradeWeightingLink" TextKey="TXT_BACK_TO_THE_FINAL_GRADE_WEIGHTING_SCREEN" CssClass="backButton" runat="server" />

    <div class="screenFooter"></div>
</div>
