<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register src="../Controls/DynamicPrepopInstrux.ascx" TagName="DynPrepopInstrux" TagPrefix="dynPrepopInstrux" %>
<%@ Register src="../Controls/DynamicSQLInstrux.ascx" TagName="SQLInstrux" TagPrefix="JICS" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditQuestion_View.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Questions.AddEditQuestion_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Import namespace="Jenzabar.Common.Web.UI.Controls"%>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<%@ Import Namespace="Jenzabar.FRM.EX" %>
<script language="javascript">

	function DisplayDynamicOptions(divStaticOptionsID, divDynamicOptionsID, hypAddOptionsID, glnkbtnAddOptionsID, rbStatic)
	{
		var divStaticOptions = document.getElementById(divStaticOptionsID);
		divStaticOptions.style.display = 'none';
		var divDynamicOptions = document.getElementById(divDynamicOptionsID);
		divDynamicOptions.style.display = 'inline';
		var divAddOptions = document.getElementById('divAddOptions');
		divAddOptions.style.display = 'none';
		var hypAddOptions = document.getElementById(hypAddOptionsID);
		hypAddOptions.style.display = 'none'
		var glnkbtnAddOptions = document.getElementById(glnkbtnAddOptionsID);
		glnkbtnAddOptions.style.display = 'none';
		var rbStatic = document.getElementById(rbStatic);
		rbStatic.checked = true;
	}
	
	function DisplayStaticOptions(divStaticOptionsID, divDynamicOptionsID, hypAddOptionsID, glnkbtnAddOptionsID, rbDynamic)
	{
		var divStaticOptions = document.getElementById(divStaticOptionsID);
		divStaticOptions.style.display = 'inline';
		var divDynamicOptions = document.getElementById(divDynamicOptionsID);
		divDynamicOptions.style.display = 'none';
		var divAddOptions = document.getElementById('divAddOptions');
		divAddOptions.style.display = 'inline';
		var hypAddOptions = document.getElementById(hypAddOptionsID);
		hypAddOptions.style.display = 'inline'
		var glnkbtnAddOptions = document.getElementById(glnkbtnAddOptionsID);
		glnkbtnAddOptions.style.display = 'inline';
		var rbDynamic = document.getElementById(rbDynamic);
		rbDynamic.checked = true;
	}

	function openWin(){
		openWindow('<%= this.ResolveUrl("~/Portlets/Modules/PortletModule.EX.FormBuilder/Questions/Instructions.htm") %>','instrux',450,450,1,0);
	}
	function openWindow(page,name,width,height,scroll,resize){
	window.open(page,name,"toolbar=0,location=0,status=1,menubar=0,scrollbars=" + scroll + ",resizable=" + resize + ",top=0,left=0,width=" + width + ",height=" + height)
	}
	
	function hideShowReadOnly(i, val){
	    isSelectOne = (val == '<%=Globalizer.GetGlobalizedString("TXT_NONE")%>');
	    isDashes = (document.getElementById("<%=this.ddlPrepopulate.ClientID%>").options[i].text == '<%=Globalizer.GetGlobalizedString("FB_STATIC_DASHES")%>');
	    isNone = (isSelectOne || isDashes);
	    isStatic = (val == '<%=Globalizer.GetGlobalizedString("FB_TXT_STATIC")%>');
	    isDyn = (val == '<%=FRMConstants.PrepopDynamicSqlOption%>');
	    ele = document.getElementById("<%=this.divReadOnly.ClientID%>");
		if(ele != null){
			disp = (isNone)? "none" : "block";
			ele.style.display = disp;
			cb = document.getElementById("<%=this.cbReadOnly.ClientID%>");
			if(cb != null){
				if(isNone){
					cb.checked = false;
				}
			}
			if(isDashes){
				document.getElementById("<%=this.ddlPrepopulate.ClientID%>").selectedIndex = 0;
				setIsReqCB();
			}
			disp = (isStatic) ? "block" : "none";
			document.getElementById("<%=this.divStatic.ClientID%>").style.display = disp;

			disp = (isDyn) ? "block" : "none";
			if (document.getElementById("<%=this.divDynamicSqlTextBox.ClientID%>") != null) {
			    document.getElementById("<%=this.divDynamicSqlTextBox.ClientID%>").style.display = disp;
			}
		}
		isReqCB = "<%=cbRequired.ClientID%>";
		if(document.getElementById(isReqCB) != null){
			if(isSelectOne){
				setIsReqCB();
			}
		}
	}
	function setIsReqCB(){
		document.getElementById(isReqCB).disabled = false;
		document.getElementById("divROMSG").style.display = "none";
	}
	function setRequiredFromReadOnly(ele){
		isReqCB = "<%=cbRequired.ClientID%>";
		if(document.getElementById(isReqCB) != null){
			if(ele.checked){
				document.getElementById(isReqCB).checked = false;
				document.getElementById(isReqCB).disabled = true;
				document.getElementById("divROMSG").style.display = "block";
			}else{
				document.getElementById(isReqCB).disabled = false;
				document.getElementById("divROMSG").style.display = "none";
			}
		}
	}
	
</script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i>&nbsp;<asp:Literal ID="litFormName" Runat="server" /></h4>
	</div>
	<div class="pSection">
		<common:SuperBreadcrumbs ID="brdCrumbs" runat="server" />
		<h5>
			<strong>
				<asp:Literal Runat="server" id="litQuestionType" />
			</strong>
		</h5>
		<p style="PADDING-RIGHT:0px;PADDING-LEFT:0px;PADDING-BOTTOM:0px;MARGIN:0px;PADDING-TOP:0px"
			id="pTypeDescription" runat="server"><common:Hint id="hntIntro" runat="server" /></p>
		<fieldset>
			<div class="FormBuilder"><div class="ErrorMsg"><p><asp:literal id="litErrorMsg" Runat="server" Visible="False" /></p>
				</div>
			</div>
			<table cellSpacing="0" id="tblNewQuestion" cellPadding="0" class="GridStyle GridStyleFullWidth">
				<thead>
					<tr>
						<td colspan="2">
							<asp:Literal ID="litQuestion" Runat="server" />
						</td>
					</tr>
				</thead>
				<TBODY>
					<asp:TableRow id="trQuestionLabel" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_QUESTION_LABEL") %>
						</asp:TableCell>
						<asp:TableCell class="RightTableCell" id="tdQuestionLabel" runat="server">
							<asp:TextBox ID="tbQuestionLabel" Width="300px" Runat="server" />&nbsp;
							<asp:RequiredFieldValidator ID="rfvQuestionLabel" ControlToValidate="tbQuestionLabel" Runat="server" CssClass="ErrorMsg" />
							<br /><br />
							<i>
								<common:GlobalizedLiteral TextKey="TXT_QUESTION_LABEL_TIP" runat="server" /></i>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trQuestionText" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_QUESTION_TEXT") %>
						</asp:TableCell>
						<asp:TableCell class="RightTableCell" id="tdQuestionText" runat="server">
							<asp:Label ID="_lblErrQuestionTxt" runat="server" CssClass="ErrorMsg" />
							<jics:TextEditor id="_textEditortbeQuestionText" MaxLength="6000" Columns="19" runat="server" />
							<i>
								<common:GlobalizedLiteral TextKey="TXT_QUESTION_TEXT_TIP" runat="server" /></i>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trValidation" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_VALIDATION") %>
						</asp:TableCell>
						<asp:TableCell VerticalAlign="Bottom" class="RightTableCell" id="tdValidation" runat="server">
							<div style="display: none;" id="spnDBValidation" runat="server">
								<asp:Literal ID="litDBValidation" Runat="server" />
							</div>
							<asp:DropDownList ID="ddlValidation" Runat="server" />
							<br />
							<br />
							<i>
								<common:GlobalizedLiteral TextKey="TXT_VALIDATION_TIP" runat="server" /></i>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trRequired" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_REQUIRED") %>
						</asp:TableCell>
						<asp:TableCell class="RightTableCell" id="tdRequired" runat="server">
							<div style="display: none;" id="spnDBRequired" runat="server">
								<asp:Literal ID="litDBRequired" Runat="server" />
							</div>
							<asp:CheckBox id="cbRequired" runat="server" CssClass="cbAlign" />
							<span>
								<common:GlobalizedLiteral TextKey="TXT_REQUIRED_TEXT" runat="server" />&nbsp;
								<i><common:GlobalizedLiteral TextKey="TXT_REQUIRED_TIP" runat="server" /></i>
							</span>
							<div id="divROMSG" class="hiddenErr"><%=Globalizer.GetGlobalizedString("FB_READONLY_CANNOT_BE_REQUIRED")%></div>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trTemplates" runat="server" Visible="false">
					    <asp:TableCell class="alt">
					        <%= Globalizer.GetGlobalizedString("TXT_TEMPLATES")%>
					    </asp:TableCell>
					    <asp:TableCell class="RightTableCell">
					        <%= Globalizer.GetGlobalizedString("TXT_TEMPLATES_FU")%>
					        <br /><br />
		                    <input type="file" id="FileInput" runat="server" NAME="FileInput" /> &nbsp; 
		                    <common:GlobalizedButton ID="UploadButton" TextKey="FORMBUILDER_FORM_SETTINGS_BASIC_ADDFILE_TXT" CausesValidation="true" Runat="server" />
		                    <br /><br />
					        <asp:Repeater ID="SavedFiles" Runat="server">
							    <ItemTemplate>
								    <div style="padding: 4px 0px 4px 10px;">
									    <asp:Literal ID="SavedFileID" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Visible="false" runat="server" />
									    <asp:HyperLink ID="FileLink" 
											    NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Path") %>' 
											    Target="_blank" Runat="server">
										    <%# DataBinder.Eval(Container.DataItem, "Name") %>
									    </asp:HyperLink> 
									    (<%# DataBinder.Eval(Container.DataItem, "Size") %>) 
									    <asp:LinkButton ID="DeleteButton" CommandName="Delete" CausesValidation="false" runat="server">
										    <asp:Image id="imgDeleteButton" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/delete.gif" AlternateText='<%# Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_DELETE") %>' />
									    </asp:LinkButton>
								    </div>
							    </ItemTemplate>
						    </asp:Repeater>
                        </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trFileLimit" runat="server" Visible="false">
					    <asp:TableCell class="alt">
					        <%= Globalizer.GetGlobalizedString("TXT_FILE_LIMIT")%>
					    </asp:TableCell>
					    <asp:TableCell class="RightTableCell" ID="tdFileLimit" runat="server">
					        <%= Globalizer.GetGlobalizedString("TXT_FB_FILE_LIMIT_HOW_MANY")%>
					        <br /><br />
					        <%= Globalizer.GetGlobalizedString("TXT_FB_UP_TO")%> &nbsp; 
					        <asp:DropDownList ID="ddlFileLimit" runat="server">
					            <asp:ListItem Value="1" Text="1" />
					            <asp:ListItem Value="2" Text="2" />
					            <asp:ListItem Value="3" Text="3" />
					            <asp:ListItem Value="4" Text="4" />
					            <asp:ListItem Value="5" Text="5" />
					            <asp:ListItem Value="6" Text="6" />
					        </asp:DropDownList>
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trResponseType" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_RESPONSE_TYPE") %>
						</asp:TableCell>
						<asp:TableCell class="RightTableCell" id="tdResponseType" runat="server">
							<asp:RadioButton id="rbRadioButtons" GroupName="gnResponseType" Checked="True" runat="server" CssClass="cbAlign" />
							<span>
								<common:GlobalizedLiteral TextKey="TXT_RESPONSE_TYPE_RADIO" runat="server" /></span><br />
							<asp:RadioButton id="rbCheckBoxes" GroupName="gnResponseType" runat="server" CssClass="cbAlign" />
							<span>
								<common:GlobalizedLiteral TextKey="TXT_RESPONSE_TYPE_CHECKBOX" runat="server" /></span>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trPrepopulate" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_PREPOPULATE") %>
						</asp:TableCell>
						<asp:TableCell class="RightTableCell" id="tdPrepopulate" runat="server">
							<div class="fbFloatLeft"><asp:DropDownList ID="ddlPrepopulate" Runat="server" DataTextField="Text" DataValueField="Value" /> &nbsp; </div>
							<div>
								<div id="divReadOnly" runat="server">
									<asp:CheckBox ID="cbReadOnly" Runat="server" /> <%=Globalizer.GetGlobalizedString("FB_READONLY_CHECKBOX_TXT")%>
								</div>
							</div>
							<div id="divStatic" runat="server">
								<br/><%=Globalizer.GetGlobalizedString("FB_STATIC_VALUE_TXT")%> <asp:TextBox ID="tbStatic" Runat="server" MaxLength="100" /> &nbsp;<%=Globalizer.GetGlobalizedString("FB_STATIC_HINT_TXT")%>
							</div>
							<div id="divDynamicSqlTextBox" runat="server" visible="false">
							    <br /><asp:Literal ID="litDynamicIntroTB" Runat="server" />&nbsp;
							    <dynPrepopInstrux:DynPrepopInstrux ID="_dynPrepopInstruxTB" runat="server" />
							    <br />
							    <br /><%=Globalizer.GetGlobalizedString("TXT_ENTER_YOUR_SQL_STATEMENT")%><br />
							    <asp:TextBox ID="tbDynamicSqlTB" runat="server" TextMode="MultiLine" Height="50" Width="100%" Wrap="True" />
							</div>
							<div style="clear:both;"><br /><i><common:GlobalizedLiteral ID="glitPrePopTip" TextKey="TXT_PREPOPULATE_TIP" runat="server" /></i></div>
						</asp:TableCell>
					</asp:TableRow>
					
					<asp:TableRow id="trLookup" runat="server">
						<asp:TableCell class="alt">Lookup</asp:TableCell>
						<asp:TableCell class="RightTableCell">
							<i><%= Globalizer.GetGlobalizedString("FB_LOOKUP_HINT") %></i>
							<br/><br/>
							<asp:DropDownList ID="ddlLookup" Runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					
					<asp:TableRow id="trOrientation" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_ORIENTATION") %>
						</asp:TableCell>
						<asp:TableCell class="RightTableCell" id="tdOrientation" runat="server">
							<asp:RadioButton GroupName="gnOrientation" id="rbHorizontal" Checked="True" runat="server" CssClass="cbAlign" />
							<span>
								<common:GlobalizedLiteral TextKey="TXT_ORIENTATION_HORIZONTAL" runat="server" />&nbsp;
								<i>
									<common:GlobalizedLiteral TextKey="TXT_ORIENTATION_HORIZONTAL_TIP" runat="server" /></i></span><br />
							<asp:RadioButton GroupName="gnOrientation" id="rbVertical" runat="server" CssClass="cbAlign" />
							<span>
								<common:GlobalizedLiteral TextKey="TXT_ORIENTATION_VERTICAL" runat="server" />&nbsp;
								<i>
									<common:GlobalizedLiteral TextKey="TXT_ORIENTATION_VERTICAL_TIP" runat="server" /></i></span>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trOptionType" runat="server">
						<asp:TableCell class="alt">
							<%= Globalizer.GetGlobalizedString("TXT_OPTION_TYPE") %>
						</asp:TableCell>
						<asp:TableCell class="RightTableCell" id="tdOptionType" runat="server">
							<asp:RadioButton GroupName="gnOptionType" id="rbStatic" runat="server" CssClass="cbAlign" />
							<span>
								<common:GlobalizedLiteral TextKey="TXT_OPTION_TYPE_STATIC" runat="server" /></span><br />
							<asp:RadioButton GroupName="gnOptionType" id="rbDynamic" runat="server" CssClass="cbAlign" />
							<span>
								<common:GlobalizedLiteral TextKey="TXT_OPTION_TYPE_DYNAMIC" runat="server" /></span>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trOptions" runat="server">
						<asp:TableCell class="RightTableCell alt OptionCell" id="tdOptions" colspan="2" runat="server">
							<div style="font-size: 100%;">
								<div id="divStaticOptions" runat="server">
									<table cellSpacing="0" id="tblStaticOptions" cellPadding="0" class="GridStyle GridStyleFullWidth">
										<thead>
											<tr>
												<td colspan="2">
													<common:GlobalizedLiteral TextKey="TXT_STATIC_OPTIONS" runat="server" id="glitStaticOptions" />
												</td>
											</tr>
											<tr>
												<th style="text-align: left; border-left: 0px; white-space:normal;" colspan="2">
													<common:GlobalizedLiteral TextKey="TXT_STATIC_OPTIONS_INTRO" runat="server" />
												</th>
											</tr>
										</thead>
										<asp:Repeater ID="rptAddOptions" Runat="server">
											<HeaderTemplate>
												<tr>
													<th style="width:30%; text-align: left; border-left:0px;">
														<%= Globalizer.GetGlobalizedString("TXT_DATABASE_VALUE") %>
													</th>
													<th style="text-align: left;">
														<%= Globalizer.GetGlobalizedString("TXT_DISPLAY_TEXT") %>
													</th>
												</tr>
											</HeaderTemplate>
											<ItemTemplate>
												<tr id="trRow" runat="server">
													<td id="tcDBValue" runat="server" style="border-left:0px;">
														<asp:TextBox Width="80%" id="tbDBValue" Runat="server" MaxLength="100" />
													</td>
													<td id="tcDisplayValue" runat="server">
														<asp:TextBox Width="70%" ID="tbDisplayText" Runat="server" MaxLength="100" />
													</td>
													<td style="display:none;">
														<asp:Literal ID="litQuestionValueID" Runat="server" />
													</td>
												</tr>
											</ItemTemplate>
										</asp:Repeater>
									</table>
								</div>
								<div id="divDynamicOptions" runat="server">
									<table cellSpacing="0" id="tblDynamicOptions" cellPadding="0" class="GridStyle GridStyleFullWidth">
										<thead>
											<tr>
												<td colspan="2">
													<common:GlobalizedLiteral TextKey="TXT_DYNAMIC_OPTIONS" runat="server" ID="glitDynamicOptions" />
												</td>
											</tr>
											<tr>
												<th style="text-align: left; border-left: 0px; white-space:normal;" colspan="2">
													<asp:Literal ID="litDynamicIntro" Runat="server" />&nbsp;
													<JICS:SQLInstrux ID="_sqlInstruxMulti" runat="server" />
												</th>
											</tr>
										</thead>
										<tr>
											<td style="text-align: left;border-left:0px;" colspan="2" align="center">
												<div style="padding-bottom:5px;">
													<common:GlobalizedLiteral TextKey="TXT_ENTER_YOUR_SQL_STATEMENT" runat="server" /><br />
												</div>
												<asp:TextBox id="tbSQLStatement" Height="50" Width="100%" Wrap="True" TextMode="MultiLine" Runat="server" /><br />
												<asp:CheckBox ID="cbSelectAuto" Visible="False" Runat="server" /><!-- If only one result is returned, it should be selected automatically<br/-->
												<div style="text-align: center; font-size: 115%; padding-top:5px;">
													<common:GlobalizedButton CausesValidation="False" TextKey="TXT_TEST_THIS_SQL" id="gbtnTestSql" runat="server" />
												</div>
											</td>
										</tr>
										<tr style="border-left:0px;">
											<td style="padding:0px;margin:0px;border-left:0px;" class="alt" width="60%">
												<table style="margin:0px;" width="100%" height="100%" cellpadding="0" border="0" cellspacing="0">
													<tr align="center">
														<td style="text-align:right; border-style:none; width:50%;">
															<common:GlobalizedLiteral TextKey="TXT_DATABASE_VALUE_COLUMN" runat="server" />
														</td>
														<td style="text-align:left; border-style:none;">
															&nbsp;<i>
																<asp:Literal ID="litDBColumn" Runat="server" /></i>
														</td>
													</tr>
													<tr align="center">
														<td style="text-align:right; border-style:none; width:50%;">
															<common:GlobalizedLiteral TextKey="TXT_DISPLAY_VALUE_COLUMN" runat="server" />
														</td>
														<td style="text-align:left; border-style:none;">
															&nbsp;<i>
																<asp:Literal ID="litDisplayColumn" Runat="server" /></i>
														</td>
													</tr>
												</table>
											</td>
											<td class="alt" width="40%">
												<common:GlobalizedLiteral TextKey="TXT_SAMPLE_RESULTS" id="glitSampleResults" runat="server" />
												<i>
													<asp:Literal ID="litSampleResults" Runat="server" /></i>
												<asp:DropDownList ID="ddlSampleResults" Visible="False" Runat="server" />
												<p>
													<common:GlobalizedLiteral TextKey="TXT_ERRORS" id="glitSQLErrors" runat="server" />
												</p>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</asp:TableCell>
					</asp:TableRow>
				</TBODY>
				<tfoot>
					<asp:TableRow>
						<asp:TableCell class="FooterBar" colspan="2" runat="server">
							<div id="divAddOptions" class="LeftAlign">
								<asp:HyperLink id="hypAddOptions" Runat="server"></asp:HyperLink>&nbsp;
								<common:GlobalizedLinkButton id="glnkbtnAddOptions" CausesValidation="false" TextKey="TXT_ADD_MORE_OPTIONS" runat="server" />
							</div>
							<div class="RightAlign">
								<common:GlobalizedLinkButton id="glnkbtnPreviewQuestion" TextKey="TXT_PREVIEW_THIS_QUESTION" runat="server" />
							</div>
						</asp:TableCell>
					</asp:TableRow>
				</tfoot>
			</table>
			<input type="text" style="VISIBILITY:hidden">
			<common:GlobalizedButton id="gbtnSave" TextKey="TXT_SAVE" runat="server" />&nbsp;
			<common:GlobalizedButton id="gbtnCancel" CausesValidation="false" TextKey="TXT_CANCEL" runat="server" />
			<asp:LinkButton ID="lbClearSession" Runat="server" />
			&nbsp; <a id="aChooseType" runat="server"></a>
		</fieldset>
	</div>
</div>
<script language="javascript" type="text/javascript">
ele = document.getElementById("<%=this.ddlPrepopulate.ClientID%>");
if(ele != null){
	hideShowReadOnly(ele.selectedIndex, ele.value);
	cb = document.getElementById("<%=this.cbReadOnly.ClientID%>");
	if(cb != null){
		setRequiredFromReadOnly(cb);
	}
}
</script>

