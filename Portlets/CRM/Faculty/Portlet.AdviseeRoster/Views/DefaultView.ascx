<%@ Import namespace="Jenzabar.Portal.Framework" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fwk" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="DefaultView.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.AdviseeRosterPortlet.DefaultView" %>

<div class="pSection" id="divMessage" visible="False" runat="server">
    <table class="IndentMargin">
        <tr>
            <td>
                <asp:Label ID="litMessage" Visible="false" runat="server" />
            </td>
        </tr>
    </table>
</div>

<div id="divMain" runat="server">
	<h4><jenzabar:GlobalizedLabel id="lblSearch" TextKey="TXT_AR_SEARCH_ADVISEE" runat="server"></jenzabar:GlobalizedLabel></h4>
	<div class="pSection">
		<div id="criteriaSection" runat="server">
			<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
			<jenzabar:Hint id="hntInstr" runat="server"></jenzabar:Hint>
			<table cellpadding="2" cellspacing="2" border="0" width="100%">
				<tr>
					<th align="right" width="15%" nowrap>
						<jenzabar:GlobalizedLabel id="lblStatus" TextKey="TXT_AR_ADVISEE_STATUS" runat="server"></jenzabar:GlobalizedLabel>:</th>
					<td width="85%"><asp:DropDownList ID="ddlStatus" Runat="server"></asp:DropDownList></td>
				</tr>
				<tr>
					<th align="right" nowrap>
						<jenzabar:GlobalizedLabel id="lblID" TextKey="TXT_ID" runat="server"></jenzabar:GlobalizedLabel>:</th>
					<td><asp:TextBox ID="txtID" Runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<th align="right" nowrap>
						<jenzabar:GlobalizedLabel id="lblLName" TextKey="TXT_LAST_NAME" runat="server"></jenzabar:GlobalizedLabel>:</th>
					<td><asp:TextBox ID="txtLName" Runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<th align="right" nowrap>
						<jenzabar:GlobalizedLabel id="lblDivision" runat="server"></jenzabar:GlobalizedLabel>:</th>
					<td><asp:DropDownList ID="ddlDivision" Runat="server"></asp:DropDownList></td>
				</tr>
				<tr>
					<th align="right" nowrap>
						<div id="termLabelDiv" runat="server"><jenzabar:GlobalizedLiteral id="lblTerm" TextKey="TXT_TERM" runat="server"></jenzabar:GlobalizedLiteral>:</div>
					</th>
					<td><div id="termDiv" runat="server"><asp:DropDownList ID="ddlTerm" Runat="server"></asp:DropDownList></div>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<jenzabar:GlobalizedButton id="btnSearch" runat="server" TextKey="TXT_SEARCH"></jenzabar:GlobalizedButton>&nbsp;
						<jenzabar:GlobalizedLinkButton id="lnkAdvancedSearch" runat="server" TextKey="TXT_ADVANCED_SEARCH"></jenzabar:GlobalizedLinkButton>
					</td>
				</tr>
			</table>
			<br>
		</div>
        <div class="pSection" id="divError" visible="false" runat="server"><jenzabar:errordisplay id="ctlError" RunAt="server"></jenzabar:errordisplay></div>
		<div id="resultsSection" runat="server" visible="false">
			<div id="resultsHeader" runat="server" visible="False">
				<table cellpadding="2" cellspacing="2" border="0" width="100%">
					<tr>
						<td colspan="3">
							<jenzabar:GlobalizedLabel id="lblMissingEmailMsg" TextKey="MSG_AR_MISSING_EMAIL_ADDRESSES" runat="server"
								Visible="False" cssClass="PortletError" />&nbsp;
					    </td>
					</tr>
					<tr>
						<td height="13">
							<asp:ImageButton id="imgExcelExport" runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/excel.gif"></asp:ImageButton>
							<asp:LinkButton id="lnkExportToExcel2" runat="server"></asp:LinkButton>
							<jenzabar:imageandtextbutton id="lnkExport" Runat="server" visible="false" TextKey="TXT_EXPORT_TO_EXCEL" ImageUrl="~/UI/Common/Images/PortletImages/Icons/excel.gif"></jenzabar:imageandtextbutton>
						</td>
						<td><asp:LinkButton id="EmailAll" runat="server" Visible="true" OnCommand="EmailAll_Click"></asp:LinkButton></td>
					    <td>
                			<asp:linkbutton id="EmailSelected" Runat="server" Visible="true" OnCommand="EmailSelected_Click" ></asp:linkbutton>
					    </td>
					</tr>
					<tr>
						<td align="right" colspan="3">
							<jenzabar:LetterNavigator id="ltrNav" AutoBind="False" runat="server" />
						</td>
					</tr>
				</table>
			</div>
			<jenzabar:groupedgrid id="dgResults" runat="server" DataKeyField="AdviseeID" RenderTableHeaders="true"
				ShowHeader="true" AllowSorting="true">
				<TableHeaderTemplate>
					<%#base._name%>&nbsp;<%#base._studentcount%>
				</TableHeaderTemplate>
				<EmptyTableTemplate>
					<jenzabar:GlobalizedLiteral id="glitNoRecords" runat="server" TextKey="TXT_CS_NO_MATCHING_RECORDS"></jenzabar:GlobalizedLiteral>
				</EmptyTableTemplate>
				<Columns>
					<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_AR_FERPA_RESTRICT" SortExpression="FERPARestriction">
						<ItemTemplate>
							<asp:Label ID="lblRestrict" Runat="server">
								<%# getImage(DataBinder.Eval(Container.DataItem, "FERPARestriction").ToString())%>
							</asp:Label>
						</ItemTemplate>
					</jenzabar:GlobalizedTemplateColumn>
					<jenzabar:GlobalizedBoundColumn DataField="FERPARestriction" HeaderTextKey="TXT_FCC_FERPA_RESTRICT" Visible="False" />
				    <jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_EMAIL" >
					    <HeaderTemplate>
						    <input id="SelectAll" runat="server" type="checkbox" onclick="checkAllCheckboxesWithName(this.checked, 'EmailStudent')" NAME="SelectAll" /><asp:Label ID="lblStuEmail" Runat="server" Text="Email" /> 
    					</HeaderTemplate>
	    				<ItemTemplate>
	    				    <asp:Label ID="lblAdviseeEmail" Runat="server" Visible='<% # DataBinder.Eval(Container.DataItem, "AdviseeEmail", "{0}") != "" %>'>
		    				    <input id="EmailAdvisee" runat="server" type="checkbox" name="EmailAdvisee" checked='<% # DataBinder.Eval(Container.DataItem, "EmailAdvisee") %>' value='<%# DataBinder.Eval(Container.DataItem, "RowID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "AdviseeID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "AdviseeName") + ";" + DataBinder.Eval( Container.DataItem, "AdviseeEmail")%>'>
		    				    <asp:ImageButton id="imgEmail" runat="server" OnCommand="Email_Click" imageurl="~/UI/Common/Images/PortletImages/Icons/email.gif" ToolTip='<%# DataBinder.Eval(Container.DataItem, "AdviseeEmail")%>' CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RowID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "AdviseeID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "AdviseeName") + ";" + DataBinder.Eval( Container.DataItem, "AdviseeEmail")%>' />
		    				</asp:Label>
			    		</ItemTemplate>
				    </jenzabar:GlobalizedTemplateColumn>
					<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_NAME" SortExpression="AdviseeName">
						<ItemTemplate>
							<fwk:MyInfoPopup id="ppMyInfo" NameFormat="LastNameFirst" ERPDisplayName='<%# DataBinder.Eval(Container.DataItem, "AdviseeName")%>' User='<%#PortalUser.FindByHostID( DataBinder.Eval(Container.DataItem, "AdviseeID").ToString() )%>' CommandName="AdviseeDetails" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "AdviseeID")%>' ClickableName="true" runat="server">
							</fwk:MyInfoPopup>
						</ItemTemplate>
					</jenzabar:GlobalizedTemplateColumn>
					<jenzabar:GlobalizedBoundColumn DataField="AdviseeID" HeaderTextKey="TXT_STUDENT_ID" SortExpression="AdviseeID" Visible="true" />
					<jenzabar:GlobalizedBoundColumn DataField="AdviseeName" HeaderTextKey="TXT_NAME" Visible="False" />
					<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_AR_NEEDS_TO_REGISTER" DataField="NeedsToRegister" SortExpression="NeedsToRegister" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
					<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_AR_REGISTRATION_CLEARANCE" SortExpression="RegistrationClearance">
						<ItemTemplate>
                            <asp:LinkButton id="btnRemove" CommandName="REMOVE" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "RegistrationClearance").ToString() == "G"%>' />
                            <asp:LinkButton id="btnGrant" CommandName="GRANT" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "RegistrationClearance").ToString() == "R"%>' />
							
							<jenzabar:GlobalizedLiteral id="ltNotApplicable" TextKey="TXT_NOT_APPLICABLE" visible='<%# DataBinder.Eval(Container.DataItem, "RegistrationClearance").ToString() == "N"%>' Runat="server">
							</jenzabar:GlobalizedLiteral>
							<jenzabar:GlobalizedLiteral id="ltExpired" TextKey="TXT_TERM_EXPIRED" visible='<%# DataBinder.Eval(Container.DataItem, "RegistrationClearance").ToString() == "E"%>' Runat="server">
							</jenzabar:GlobalizedLiteral>
						</ItemTemplate>
					</jenzabar:GlobalizedTemplateColumn>
					<jenzabar:GlobalizedBoundColumn DataField="RegistrationClearance" HeaderTextKey="TXT_AR_REGISTRATION_CLEARANCE"
						Visible="False" />
					<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_ADVISORS" SortExpression="AdvisorName" >
						<ItemTemplate>
		                    <asp:Repeater id="rptAdvisor" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "Advisor")%>'>
	    	                    <ItemTemplate>
	                		        <asp:Label id="ltAdvisorName" Text='<%# DataBinder.Eval(Container.DataItem, "AdvisorName")%>' runat="server"/>
		    			            <asp:Label ID="lblEmailAdvisor" Runat="server" Visible='<%# DataBinder.Eval(Container.DataItem, "AdvisorEmail", "{0}") != "" %>'>
   					                    <asp:ImageButton id="imEmailAdvisor" runat="server" OnCommand="Email_Click" imageurl="~/UI/Common/Images/PortletImages/Icons/email.gif" ToolTip='<%# DataBinder.Eval(Container.DataItem, "AdvisorEmail")%>' CommandArgument='<%# ";" + DataBinder.Eval(Container.DataItem, "AdvisorID").ToString() + ";" + DataBinder.Eval(Container.DataItem, "AdvisorName") + ";" + DataBinder.Eval( Container.DataItem, "AdvisorEmail")%>' />
  					                 </asp:Label>
                 		         </ItemTemplate>
                               	 <SeparatorTemplate>
                                   <br />
                                </SeparatorTemplate>
                            </asp:Repeater>
						</ItemTemplate>
	    		    </jenzabar:GlobalizedTemplateColumn>
					<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_ADVISORS" SortExpression="AdvisorName" >
						<ItemTemplate>
		                    <asp:Repeater id="RepeaExcelAdvisors" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "Advisor")%>'>
	    	                    <ItemTemplate>
	                		        <asp:Label id="ltAdvisorName" Text='<%# DataBinder.Eval(Container.DataItem, "AdvisorName")%>' runat="server"/>
                   		         </ItemTemplate>
                               	 <SeparatorTemplate>; </SeparatorTemplate>
                            </asp:Repeater>
						</ItemTemplate>
	    		    </jenzabar:GlobalizedTemplateColumn>
				</Columns>
			</jenzabar:groupedgrid>
		</div>
	</div>
</div>
<script language="javascript">
//	function showHideTerm(){
//		if(document.MAINFORM.<%=this.ddlStatus.ClientID%> != null){
//			var status = document.MAINFORM.<%=this.ddlStatus.ClientID%>.options[document.MAINFORM.<%=this.ddlStatus.ClientID%>.selectedIndex].value;
//			if (status == 'ACT' || status == 'INACT' || status == 'ALL')
//			{
//				hidediv('<%=this.termLabelDiv.ClientID%>');
//				hidediv('<%=this.termDiv.ClientID%>');			 
//			}
//			else
//			{
//				showdiv('<%=this.termLabelDiv.ClientID%>');
//				showdiv('<%=this.termDiv.ClientID%>');
//				
//			}
//		}
//			 
//		return;
//	}
//	
//	function hidediv(id) {
//		//safe function to hide an element with a specified id
//		if (document.getElementById) { // DOM3 = IE5, NS6
//			document.getElementById(id).style.display = 'none';
//		}
//		else {
//			if (document.layers) { // Netscape 4
//				document.id.display = 'none';
//			}
//			else { // IE 4
//				document.all.id.style.display = 'none';
//			}
//		}
//	}

//	function showdiv(id) {
//		//safe function to show an element with a specified id
//			  
//		if (document.getElementById) { // DOM3 = IE5, NS6
//			document.getElementById(id).style.display = 'block';
//		}
//		else {
//			if (document.layers) { // Netscape 4
//				document.id.display = 'block';
//			}
//			else { // IE 4
//				document.all.id.style.display = 'block';
//			}
//		}
//	}
//	
</script>
