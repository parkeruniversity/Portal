<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SideBarLinks.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.SideBarLinks" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<fieldset>
<table>
<tr>
<th><%=Globalizer.GetGlobalizedString("LBL_CURRENT_LINKS")%></th>
<td>
	<cmn:GroupedGrid id="ggLinks" DataKeyField="ID" runat="server">
	<COLUMNS>
		<ASP:TEMPLATECOLUMN HeaderText="Name">
		<ItemTemplate>
		<%# DataBinder.Eval(Container.DataItem, "Name") %>  (<a href='<%# DataBinder.Eval(Container.DataItem, "URL") %>'>
									<%# DataBinder.Eval(Container.DataItem, "URL") %>
								</a>)
		</ItemTemplate>
	</ASP:TEMPLATECOLUMN>
	<CMN:EDITBUTTONCOLUMN />
	<CMN:DELETEBUTTONCOLUMN />
	</COLUMNS>
					<EmptyTableTemplate>
						<%=Globalizer.GetGlobalizedString("MSG_NO_ITEMS_TO_DISPLAY")%>
					</EmptyTableTemplate>
	</cmn:GroupedGrid>
</td>
</tr>
<tr>
			<th>
			</th>
<td>
<asp:ValidationSummary id="valSummary" runat="server" CssClass="PortletError"/>
</td>
</tr>
<tr>
			<th>
			</th>
<td>
				<asp:LinkButton id="lnkCustomize" CausesValidation="false" runat="server">
					<img src="UI/Common/Images/PortletImages/Icons/page_edit.gif" alt="" />
					<cmn:GlobalizedLinkButton id="lnkReorder" CausesValidation="false" runat="server" TextKey="TXT_QUICK_LINK_REORDER" />
				</asp:LinkButton>
	<P></P>
</td>
</tr>
<tr>
			<th>
				<cmn:FormLabel id="lblAction" runat="server" forcontrol="txtUrl"></cmn:FormLabel></th>
<td>
	<table>
		<tr>
			<th>
				<cmn:FormLabel id="lblUrl" forcontrol="txtUrl"><%=Globalizer.GetGlobalizedString("LBL_URL")%></cmn:FormLabel>
			</th>
			<td>
				<asp:TextBox id="txtUrl" runat="server" MaxLength="250"/>
				<asp:RequiredFieldValidator id="vldURL" ControlToValidate="txtUrl" runat="server"/>
				<asp:RegularExpressionValidator id="vldURL2" ControlToValidate="txtUrl" Runat="server"/>
			</td>
		</tr>
		<tr>
			<th>
				<cmn:FormLabel id="lblText" forcontrol="txtText"><%=Globalizer.GetGlobalizedString("LBL_LABEL")%></cmn:FormLabel>
			</th>
			<td>
				<asp:TextBox id="txtText" runat="server" MaxLength="50" />
			</td>
		</tr>
		<tr>
			<th>
				<cmn:FormLabel id="lblDesc" forcontrol="txtDesc"><%=Globalizer.GetGlobalizedString("LBL_DESCRIPTION")%></cmn:FormLabel>
			</th>
			<td>
				<asp:TextBox id="txtDesc" runat="server" textmode="MultiLine" MaxLength="2000" />
			</td>
		</tr>
		<tr>
		  <td>		    	  
		  </td>
		  <td>
		    <asp:CheckBox ID="cbTarget" Runat="server" />
		    &nbsp;
		    <asp:Label ID="lblTarget" Runat="server" />
		  </td>
		</tr>
        <tr>
		  <th><%= Globalizer.GetGlobalizedString("LBL_SHOW_TO") %></th>
		  <td><jics:PrincipalSelector id="psShowTo" runat="server" /></td>
		</tr>
		<tr>
		  <td><br /></td>
		  <td><br /></td>
		</tr>
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<asp:Button id="btnAdd" runat="server" text="Add"/>
				<asp:Button id="btnEdit" runat="server" text="Save" />&nbsp;
				<asp:Button id="btnCancel" runat="server" text="Cancel" CausesValidation="False" visible="True" />
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</fieldset> 

