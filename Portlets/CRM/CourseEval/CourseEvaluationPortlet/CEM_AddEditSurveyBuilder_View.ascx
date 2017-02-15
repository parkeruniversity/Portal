<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CEM_AddEditSurveyBuilder_View.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationPortlet.CEM_AddEditSurveyBuilder_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<input type="hidden" value="0" id="nameChangeFlag" name="nameChanged" runat="server">
<table width="100%" class="ceSurveyBuilderTable">
	<tr>
		<td width="600">
			<b>
				<asp:Label ID="txtSurveyName" Runat="server" /></b>
		</td>
		<td>
			<asp:LinkButton ID="lnkEditThisSurvey" Runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<b>
				<common:GlobalizedLabel TextKey="LBL_DESCRIPTION" Runat="server" ID="Globalizedlabel2" />&nbsp;</b>
			<asp:Label ID="txtSurveyDesc" Runat="server" />
		</td>
	</tr>
	<tr>
		<td id="Category" runat="server">
			<b>
				<common:GlobalizedLabel TextKey="LBL_CATEGORY" CssClass="cwkHeader" Runat="server" ID="gblCategory" />&nbsp;</b>
			<asp:Label ID="txtCategory" Runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<b>
				<common:GlobalizedLabel TextKey="LBL_TOTAL_QUESTIONS" CssClass="cwkHeader" Runat="server" ID="Globalizedlabel4" />&nbsp;</b>
			<asp:Label ID="txtTotalQuestions" Runat="server" />
		</td>
	</tr>
</table>
<div class="pSection">
	<b>
		<common:FormLabel TextKey="LBL_ADD_QUESTIONS" CssClass="cwkHeader" Runat="server" ID="Globalizedlabel1" />
	</b>
</div>
<div class="pSection">
	<table>
		<TR>
			<TD align="left" colSpan="2">
				<asp:Label id="lblMissingQuestions" Visible="False" runat="server"></asp:Label></TD>
		</TR>
		<TR>
			<TD align="left" colSpan="2">&nbsp;</TD>
		</TR>
		<tr>
			<td align="right">
				<common:FormLabel ID="AddQuestionsTypeLabel" ForControl="ddlQuestionType" TextKey="LBL_QUESTION_TYPE"
					Runat="server" />&nbsp;
			</td>
			<td>
				<asp:DropDownList ID="ddlQuestionType" Runat="server" />
			</td>
		</tr>
		<tr>
			<!--ForControl="ddlQuestionsNumber"-->
			<td align="right">
				<common:FormLabel ID="AddQuestionsNumberLabel" TextKey="LBL_NUMBER_OF_QUESTIONS" Runat="server" />&nbsp;
			</td>
			<td>
				<asp:DropDownList ID="ddlQuestionsNumber" Width="4em" Runat="server">
					<asp:ListItem Value="1" Selected="True">1</asp:ListItem>
					<asp:ListItem Value="2">2</asp:ListItem>
					<asp:ListItem Value="3">3</asp:ListItem>
					<asp:ListItem Value="4">4</asp:ListItem>
					<asp:ListItem Value="5">5</asp:ListItem>
				</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<!--ForControl="ddlQuestionsSection"-->
			<td align="right">
				<common:FormLabel ID="AddQuestionsSectionLabel" TextKey="LBL_ADD_TO_SECTION" Runat="server" />&nbsp;
			</td>
			<td>
				<asp:DropDownList ID="ddlQuestionsSection" DataValueField="ID" DataTextField="Name" Runat="server" />
			</td>
			<td>
				<asp:LinkButton ID="lnkAddSection1" Runat="server" />
			</td>
		</tr>
		<tr>
			<TD></TD>
			<TD></TD>
			<td>
				<asp:LinkButton id="lnkDelSelSection" Runat="server" Visible="False"></asp:LinkButton>
			</td>
		</tr>
		<tr>
			<th>
			</th>
			<td>
				<common:GlobalizedButton ID="AddQuestionsButton" TextKey="TXT_ADD" CausesValidation="False" runat="server" />&nbsp;&nbsp;
				<common:GlobalizedButton ID="AddQUestionsPoolButton" TextKey="CUS_ADD_QUESTION_FROM_POOL" CausesValidation="False"
					runat="server" />&nbsp;&nbsp;
				<asp:Button ID="btnCancel" Runat="server" />
			</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<th>
			</th>
			<td align="center">
				<asp:Button ID="btnFinish" Runat="server" />
			</td>
		</tr>
		<TR>
			<TD></TD>
			<TD align="center"></TD>
		</TR>
	</table>
	<br>
	<br>
	<br>
	<table>
		<tr>
			<td>
				<asp:LinkButton ID="lnkAddSection2" Runat="server" />&nbsp;&nbsp;
			</td>
			<td>
				<asp:LinkButton ID="lnkReorder" Runat="server" />
			</td>
			<td>
				<asp:LinkButton ID="lnkReorderQuestions2" Runat="server" />
			</td>
		</tr>
		<tr>
			<common:GroupedGrid ID="grdQuestions" Runat="server" GroupKeyField="ID" DataKeyField="ID" RenderGroupHeaders="true">
				<GroupHeaderTemplate>
					<%# DataBinder.Eval(Container.DataItem,"Name") %>
				</GroupHeaderTemplate>
				<GroupSubHeaderTemplate>
					<table class="ceEditSectionTable">
						<tr>
							<td width="600">
								<b>Number of Choices:</b>&nbsp;<%# DataBinder.Eval(Container.DataItem,"NumberOfChoices") %>&nbsp;
								<%# DataBinder.Eval(Container.DataItem,"Label") %>
							</td>
							<td>
								<table>
									<tr>
										<td>
											<common:GlobalizedLinkButton ID="lnkEditSection" Runat="server" CommandName="EditSection">
												<img src="ui/common/images/PortletImages/Icons/folder_edit.gif" alt="">
												<common:GlobalizedLiteral TextKey="TXT_EDIT_SECTION" runat="server" ID="Globalizedliteral1" />
											</common:GlobalizedLinkButton>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<common:GlobalizedLinkButton ID="lnkDeleteSection" Runat="server" CommandName="DeleteSection">
												<img src="ui/common/images/PortletImages/Icons/folder_delete.gif" alt="">
												<common:GlobalizedLiteral TextKey="TXT_DELETE_SECTION" runat="server" ID="Globalizedliteral2" />
											</common:GlobalizedLinkButton>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<common:GlobalizedLinkButton ID="lnkImportQuestions" Runat="server" CommandName="ImportQuestions">
												<img src="ui/common/images/PortletImages/Icons/import_fc.gif" alt="">
												<common:GlobalizedLiteral TextKey="TXT_FILE_CABINET_IMPORT_QUESTIONS" Runat="server" ID="Globalizedliternal3" />
											</common:GlobalizedLinkButton>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<common:GlobalizedLinkButton ID="lnkReorderQuestions" Runat="server" CommandName="ReorderQuestions">
												<img src="ui/common/images/PortletImages/Icons/folder_reorder.gif" alt="">
												<common:GlobalizedLiteral TextKey="TXT_REORDER_QUESTIONS" Runat="server" ID="Globalizedliteral4" />
											</common:GlobalizedLinkButton>
										</td>
									</tr>
									<tr>
										<td valign="top">
											<common:GlobalizedLinkButton ID="lnkAddQuestToPool" Runat="server" CommandName="AddToQuestPool">
												<img src="ui/common/images/PortletImages/Icons/add.gif" alt="">
												<common:GlobalizedLiteral Text="Add Selected Question to Pool" Runat="server" ID="Globalizedliteral5" />
											</common:GlobalizedLinkButton>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="600" valign="top">
								<b>Instructions:</b>&nbsp;<%# DataBinder.Eval(Container.DataItem,"Instructions") %>
							</td>
						</tr>
					</table>
				</GroupSubHeaderTemplate>
				<EmptyTableTemplate>
					<%=base.strQuestionStatus%>
				</EmptyTableTemplate>
				<Columns>
					<asp:TemplateColumn HeaderText="">
						<ItemTemplate>
							<asp:CheckBox name="chkSelected" ID="chkSelected" Runat="server" Visible="True" />
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Order">
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem,"Order") %>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Questions">
						<ItemTemplate>
							<asp:Label ID="QuestText" Runat=server Text='<%# DataBinder.Eval(Container.DataItem,"Question") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Required">
						<ItemTemplate>
							<asp:Label ID="QuestReq" Runat=server Text='<%# DataBinder.Eval(Container.DataItem,"Required") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="" visible=false>
						<ItemTemplate>
						<asp:Label ID="QuestType" Runat=server Text='<%# DataBinder.Eval(Container.DataItem,"QuestionType") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<common:DeleteButtonColumn />
					<common:EditButtonColumn />
				</Columns>
				<GroupFooterTemplate>
					<br>
					<br>
				</GroupFooterTemplate>
			</common:GroupedGrid>
		</tr>
	</table>
</div>
