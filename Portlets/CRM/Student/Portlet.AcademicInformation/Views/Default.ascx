<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AcademicInformationPortlet.Default" %>
<%@ Register TagPrefix="jenzabar" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<div id="divMain" visible="true" class="pSection" runat="server">
	<table width="100%" border="0">
		<tr>
			<td colspan="2">
				<asp:Label id="lblError" CssClass="PortletError" Runat="server" />
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
		<asp:Repeater id="rptPackage" runat="server">
	    	<ItemTemplate>
			   	<tr>
			      	<td colspan="2" >
					    <h5><asp:Label ID="lblDivision" Runat="server">&nbsp;<%#DataBinder.Eval(Container.DataItem, "DivisionDesc")%>
					    </asp:Label></h5>
				    </td>
				</tr>
				<tr>
					<td>
	            		<TABLE id="SectionHeading" cellSpacing="0" cellPadding="0">
                             <tr><td colspan="4"><asp:Label ID="lblAdvisorError" runat="server" Visible=false></asp:Label></td></tr>
  				       	    <TR>
           				        <TD valign=top><jenzabar:globalizedlabel id="lblAdvisor" runat="server" TextKey="TXT_STUDENT_ACADEMIC_INFORMATION_PORTLET_FACULTY_ADVISORS" Visible='<%# DataBinder.Eval(Container.DataItem, "AdvisorInfo.Advisor") != null %>'></jenzabar:globalizedlabel></TD>
                             	<td>&nbsp</td>
                             	<td>&nbsp</td>
                             	<td>
                             	<table id="tblRptAdvisor" cellSpacing="0" cellPadding="0">
                             	<tr>
                             	<asp:Repeater id="rptAdvisor" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "AdvisorInfo.Advisor")%>'>
	    	                        <ItemTemplate>
	    	                             <td><asp:label id="lblAdvisorInfo" runat="server"><%#DataBinder.Eval(Container.DataItem, "AdvisorName")%></asp:label></td>
                		            </ItemTemplate>
                               		<SeparatorTemplate>
                                        <tr>
                                            <td></td>
                                        </tr>
                                 </SeparatorTemplate>
                                </asp:Repeater>
                                </tr>
                                </table>
                                </td>
                            </TR>
                            <tr><td colspan="4"><asp:Label ID="lblMajorError" runat="server" Visible=false></asp:Label></td></tr>
			                <TR>
					           <TD valign=top><jenzabar:globalizedlabel id="lblMajor" runat="server" TextKey="TXT_STUDENT_ACADEMIC_INFORMATION_PORTLET_INTENDED_MAJOR" Visible='<%# DataBinder.Eval(Container.DataItem, "MajorInfo.Major") != null %>'></jenzabar:globalizedlabel></TD>
		                       <td>&nbsp</td>
		                       <td>&nbsp</td>
		                       <td>
		                       <table id="tblRptMajor" cellSpacing="0" cellPadding="0">     
		                            <asp:Repeater id="rptMajor" runat="server" DataSource='<%#DataBinder.Eval(Container.DataItem, "MajorInfo.Major")%>'>
            	            	        <ItemTemplate>
            	            	            <TD><asp:label id="lblMajorInfo" runat="server"><%#DataBinder.Eval(Container.DataItem, "MajorDesc")%></asp:label></TD>
					                    </ItemTemplate>
					                    <SeparatorTemplate>
                                        <tr>
                                            <td></td>
                                         </tr>
                                        </SeparatorTemplate>
                               	   </asp:Repeater>
                              </table>
                              </td>
                            </TR>
                       </TABLE>
			        </td>
		        </tr>
		   	</ItemTemplate>
   			<SeparatorTemplate>
                <tr>
                   <td></td>
                </tr>
           </SeparatorTemplate>
        </asp:Repeater>
	</table>
</div>
