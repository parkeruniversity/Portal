<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Default.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.AcademicInformationPortlet.Default" %>
<div id="divMain" visible="true" class="pSection" runat="server">
	<table>
		<tr>
			<td colspan="2">
				<asp:Label id="lblError" CssClass="PortletError" Runat="server" />
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
		<td colspan="2">
		<table>
		    <tr>
			    <td valign="top">
				    <asp:Label id="lblFacultyAdvisors" Runat="server" Font-Bold="True" />
			    </td>
			    <td>
				    <asp:Label id="lblFacAdvData" Runat="server" />
			    </td>
			</tr>
		</table>
		</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
		    <td colspan="2">
		        <table>
		            <tr>
		                <td valign="top">
				            <asp:Label id="lblIntendedMajors" Runat="server" Font-Bold="True" />
			            </td>
			            <td valign="top">
				            <asp:Label id="lblIntMajData" Runat="server" />
			            </td>
			        </tr>		    
			    </table>
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:PlaceHolder ID="plhExternalLinks" Runat="server" />
			</td>
		</tr>
	</table>
</div>
