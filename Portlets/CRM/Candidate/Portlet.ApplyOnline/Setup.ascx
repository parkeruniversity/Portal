<%@ Import namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Setup.ascx.cs" Inherits="Jenzabar.CRM.Candidate.Web.Portlets.ApplyOnline.Setup" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<jenzabar:errordisplay id="error" Runat="server" />
<h4><jenzabar:globalizedliteral id="litSetup" runat="server" textkey="TXT_AO_ADMIN_SCREEN" /></h4>
<div class="pSection" id="divMain" runat="server" visible="true">
	<div id="divHeader" runat="server" visible="True">
		<h5><b><jenzabar:globalizedliteral id="lblHeader" runat="server" TextKey="TXT_AO_APPLICATIONS_IN_THIS_PORLET" /></b></h5>
		<table cellSpacing="3" cellPadding="3" width="100%" border="0" style="margin-left:3px;" class="AdminScreen">
			<tr>
				<td width="66%" colspan="2" style="padding:0px 0px 7px 0px;">&nbsp; 
					<IMG title="" src="UI/Common/Images/PortletImages/Icons/fb_folder_add.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkAddCategory" runat="server" TextKey="TXT_AO_ADD_A_CATEGORY" /> &nbsp; 
					<asp:Image ID="imgReorderCategories" Runat="server" />&nbsp;<jenzabar:globalizedlinkbutton id="glnkReorderCategories" runat="server" TextKey="TXT_AO_REORDER_CATEGORIES" />
				</td>
				<td width="34%" align="right" style="padding:0px 10px 7px 0px;">
					<IMG title="" src="UI/Common/Images/PortletImages/Icons/edit.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkEditIntro" runat="server" TextKey="TXT_AO_EDIT_INTRO" />
				</td>
			</tr>
			<tr>
				<td colspan=3>
					<asp:Repeater ID="rptMainGrid" Runat="server">
						<HeaderTemplate>
							<table border="0" width="100%" cellSpacing="0" cellPadding="0">
						</HeaderTemplate>
						<ItemTemplate>
							<tr>
								<td colspan=6 class="BorderTopLeftBottomRight" style="padding:3px;"><span class="Activate"><IMG title=""  src="UI/Common/Images/PortletImages/Icons/folder.gif">&nbsp;<b><%#DataBinder.Eval(Container.DataItem, "Name")%></b></span></td>
							</tr>
							<tr>
								<td colspan=2 rowspan=2 class="BorderLeftSU" style="padding:3px;">
									<table border="0" style="margin-top:8px;">
										<tr>
											<td>&nbsp;<asp:LinkButton ID="lbActivate" Runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>' CommandName="ActivateApplication"><img src="UI/Common/Images/PortletImages/Icons/fb_big_add.gif" /></asp:LinkButton></td>
											<td class="Activate">&nbsp;<jenzabar:GlobalizedLinkButton ID="globLB" Runat="server" TextKey="TXT_AO_ACTIVATE_AN_APPLICATION" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>' CommandName="ActivateApplication" /></td>
										</tr>
									</table>
								</td>
								<td class="BorderLeftIN" style="padding:6px;"><IMG title=""  src="UI/Common/Images/PortletImages/Icons/fb_folder_edit.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkEditCategory" runat="server" TextKey="TXT_AO_EDIT_THIS_CATEGORY" CommandName="EditCategory" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>' /></td>
								<td colspan="3" class="BorderLeftRightIN" style="padding:6px;">Security: <asp:Image ID=imgPermission Runat=server /><jenzabar:globalizedliteral id="glitPermission" runat=server /></td>				
							</tr>
							<tr>
								<td class="BorderLeftBottomIN" style="padding:6px;"><IMG title=""  src="UI/Common/Images/PortletImages/Icons/fb_folder_delete.gif" >&nbsp;<jenzabar:globalizedlinkbutton id="glnkDeleteCategory" runat="server" TextKey="TXT_AO_DELETE_THIS_CATEGORY" CommandName="DeleteCategory" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ID")%>' /></td>
								<td colspan="3" class="BorderLeftRightBottomIN" style="padding:6px;"><asp:Image ID="imgReorder" Runat=server />&nbsp;<jenzabar:GlobalizedHyperLink id="glnkReorderApplications" runat="server" TextKey="TXT_AO_REORDER_APPLICATIONS" /></td>
							</tr>
							<tr>
								<td colspan="6" style="padding-bottom:6px;">
									<asp:Repeater id="rptFormLevel" Runat="server">
										<HeaderTemplate>
											<table border="0" width="100%" cellSpacing="0" cellPadding="5">
												<tr>
													<td class="BorderLeftBottomINALT" width=5%>&nbsp;</td>
													<td colspan="2" class="BorderLeftBottomINALT"><%=Globalizer.GetGlobalizedString("TXT_AO_APPLICATION")%></td>
													<td class="BorderLeftBottomINALT" width="20%"><%=Globalizer.GetGlobalizedString("TXT_AO_ACTIVE_FROM_CAP")%></td>
													<td class="BorderLeftBottomINALT" width="20%"><%=Globalizer.GetGlobalizedString("TXT_AO_ACTIVE_TO_CAP")%></td>
													<td class="BorderLeftRightBottomINALT" width="5%">&nbsp;</td>
												</tr>
										</HeaderTemplate>
										<ItemTemplate>
											<tr>
												<td class="BorderLeftBottom"><%#DataBinder.Eval(Container.DataItem, "Order")%></td>
												<td colspan=2 class="BorderLeftBottom"><a id="aFormLink" runat="server"></a><asp:Literal ID="litName" Runat="server" Visible="False" /><span id="spanActivateLink" runat="server"> (<i><a id="aActivateLink" runat="server" href='<%# this.ParentPortlet.GetNextScreenURL("Activate Form//" + DataBinder.Eval(Container.DataItem, "ID"))%>'></a></i>)</span></td>
												<td class="BorderLeftBottom"><asp:Literal ID="litStart" Runat="server" /></td>
												<td class="BorderLeftBottom"><asp:Literal ID="litEnd" Runat="server" /></td>
												<td class="BorderLeftRightBottom"><a href="<%# this.ParentPortlet.GetNextScreenURL("Activate Form//" + DataBinder.Eval(Container.DataItem, "ID"))%>"><IMG title=""  src="UI/Common/Images/PortletImages/Icons/edit.gif" alt="*"></a>&nbsp;<a href='<%# this.ParentPortlet.GetNextScreenURL("Setup//" + DataBinder.Eval(Container.DataItem, "ID"))%>' id="aDeactivateApp" runat="server"><IMG title=""  src="UI/Common/Images/PortletImages/Icons/delete.gif" alt="*"></a></td>	
											</tr>							
										</ItemTemplate>
										<AlternatingItemTemplate>
											<tr>
												<td class="BorderLeftBottomIN"><%#DataBinder.Eval(Container.DataItem, "Order")%></td>
												<td colspan="2" class="BorderLeftBottomIN"><a id="aFormLink" runat="server"></a><asp:Literal ID="litName" Runat="server" Visible="False" /><span id="spanActivateLink" runat="server"> (<i><a id="aActivateLink" runat="server" href='<%# this.ParentPortlet.GetNextScreenURL("Activate Form//" + DataBinder.Eval(Container.DataItem, "ID"))%>'></a></i>)</span></td>
												<td class="BorderLeftBottomIN"><asp:Literal ID="litStart" Runat="server" /></td>
												<td class="BorderLeftBottomIN"><asp:Literal ID="litEnd" Runat="server" /></td>
												<td class="BorderLeftRightBottom"><a href="<%# this.ParentPortlet.GetNextScreenURL("Activate Form//" + DataBinder.Eval(Container.DataItem, "ID"))%>"><IMG title=""  src="UI/Common/Images/PortletImages/Icons/edit.gif" alt="*"></a>&nbsp;<a href='<%# this.ParentPortlet.GetNextScreenURL("Setup//" + DataBinder.Eval(Container.DataItem, "ID"))%>' id="aDeactivateApp" runat="server"><IMG title=""  src="UI/Common/Images/PortletImages/Icons/delete.gif" alt="*"></a></td>	
											</tr>
										</AlternatingItemTemplate>
										<FooterTemplate></table></FooterTemplate>
									</asp:Repeater>
								</td>
							</tr>
						</ItemTemplate>
						<FooterTemplate>
							</table>					
						</FooterTemplate>
					</asp:Repeater>
				</td>
			</tr>
		</table>
		<div id=divConditionalSpacer runat=server visible="false">
			<br>
		</div>
		<div id="divGlobal" runat="server" visible="false" style="margin-top:-45px;* >margin-top:-30px;">
			<h5><b><jenzabar:globalizedliteral id="Globalizedliteral3" runat="server" TextKey="TXT_AO_GLOBAL_APPLICATION_MANAGEMENT" /></b></h5>
			<span class="AdminScreen">&nbsp; &nbsp;<a href=<%=this.ParentPortlet.GetNextScreenURL(@"FormBuilder//Main_View")%>><IMG title="" src="UI/Common/Images/PortletImages/Icons/add.gif">&nbsp;<jenzabar:globalizedliteral id="glitAddNewApp" runat="server" TextKey="TXT_AO_ADD_A_NEW_APPLICATION" /></a> &nbsp; &nbsp; 
			<IMG title="" src="UI/Common/Images/PortletImages/Icons/edit.gif">&nbsp;<jenzabar:globalizedlinkbutton id="glnkManageAllApps" runat="server" TextKey="TXT_AO_MANAGE_ALL_APPLICATIONS" /></span>
		</div>
	</div>
</div>
