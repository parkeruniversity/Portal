<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Default_View.ascx.cs" Inherits="Jenzabar.CRM.Student.Web.Portlets.StudentRequest.Default_View" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<script language="javascript" type="text/javascript">function initIETOC(){};function resizeTheDiv(){}</script>
<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><IMG title="" src="UI/Common/Images/PortletImages/Icons/portlet_admin_icon.gif"  >&nbsp; <a id="aAdminPortlet" runat="server" /></td>
		</tr>
	</table>
</div>
<div class="pSection">
    <table cellSpacing="0" cellPadding="0" width="100%" border="0">
		<tr>
			<td colspan="3"><jenzabar:complexcontentdisplay id="ccdMain" runat="server" /></td>
		</tr>
		<tr id="trCcdMainSpacer" runat="server">
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr id="trNoActive" runat="server">
			<td colspan="3" align="center">
				<table class="GrayBordered" width="50%" align="center" cellpadding="3" border="0">
					<tr>
						<td align="center"><jenzabar:GlobalizedLiteral ID="gLitNoActive" Runat="server" TextKey="TXT_AO_NO_APPS" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<asp:Repeater ID="rptMainGrid" Runat="server">
			<HeaderTemplate />
			<ItemTemplate>
				<tr>
					<td colspan="3"><h5><b><%#DataBinder.Eval(Container.DataItem, "Name")%></b></h5></td>
				</tr>
				<tr id="trCatDesc" runat="server">
					<td width="3%">&nbsp;</td>
					<td colspan="2"><%#DataBinder.Eval(Container.DataItem, "Description")%></td>
				</tr>
				<tr id="trCatDescSpacer" runat="server" class="fbSpacer10">
					<td colspan="3"></td>
				</tr>
				<asp:Repeater id="rptFormLevel" DataSource=<%#DataBinder.Eval(Container.DataItem, "FormCategories")%> Runat="server">
					<HeaderTemplate>
					    <tr>
					    <td></td>
					    <td>
					    <asp:Literal ID="litTableHead" runat="server" />
					</HeaderTemplate>
					<ItemTemplate>
					    <tr id="trFormContainer" runat="server"><td><table border="0" id="tableItem" runat="server">
					    <tr>
					        <td colspan="2"><a id="aFormLink" runat="server" ><%#DataBinder.Eval(Container.DataItem, "Form.Name")%></a><asp:Literal ID="litAlreadySubmitted" runat="server" Visible="false" /></td>
					    </tr>
					    <tr id="trAdminLinks" runat="server">
							<td>&nbsp; &nbsp;</td>
							<td><asp:Image ID="imgMySubs" runat="server" Visible="false" /><a id="aMySubs" runat="server" /> <asp:Image ID="imgReviewSubs" runat="server" Visible="false" /> <a ID="lbReviewSubs" runat="server"></a><asp:Literal ID="litNoSubs" runat="server" Visible="false" /> &nbsp; <asp:Label ID=lblHasSubmission Runat=server><span style="FONT-WEIGHT: bold; COLOR: #1d9f13">(In Progress)</span></asp:Label></td>
						</tr>
						<tr id="trFormDesc" runat="server">
							<td></td>
							<td><asp:Literal ID="litExplain1Sub" runat="server" Visible="false" /><%#DataBinder.Eval(Container.DataItem, "Form.Description")%></td>
						</tr>
						<tr id="trFormDescSpacer" runat="server">
							<td colspan="2"></td>
						</tr>
                        </table></td></tr>						                       						
					</ItemTemplate>
					<FooterTemplate>
					    </table>
                        </td>
                    </tr> 
					</FooterTemplate>
				</asp:Repeater>
			</ItemTemplate>
			<FooterTemplate />
		</asp:Repeater>
    </table>		
</div>