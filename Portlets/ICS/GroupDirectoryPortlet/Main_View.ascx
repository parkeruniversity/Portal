<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.GroupDirectoryPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Jenzabar.ICS" %>
<%@ Register TagPrefix="groupDirectory" assembly="Portlet.GroupDirectory" namespace="Jenzabar.ICS.Web.Portlets.GroupDirectoryPortlet" %>
<%@ Import Namespace="Jenzabar.Portal.Framework" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<script language="javascript" type="text/javascript">
function openMyInfoPopup(id){
	url = "<%= this.ResolveUrl("~/Portlets/ICS/MyInfoPortlet/MyInfoPopup.aspx") %>";
	UserInfoWin = window.open(url + '?UserID=' + id, 'UserInfoWin', 'height=500,width=550,toolbar=no,status=no,scrollbars=yes,location=no,menubar=no,resizable=yes,directories=no');
}
function openEmailWarning(){
     if (anyCheckedWithID("UserSelected"))
         return true;
     var emailWarning = new JCSL.ui.windows.MessageBox("Email Selected Members", "You must select at least one email address to continue");
     emailWarning.open(null);
     return false;
 }
</script>
<div class="pSection">
	<div class="hint"><asp:label id="lblInfo" Runat="server" />
		<div><asp:LinkButton ID="lnkImages" Runat="server" /></div>
	</div>
</div>
<span></span>
<groupDirectory:TableRepeater id="repUsers" Runat="server" OnItemCommand="repUsers_ItemCommand">
	<ItemTemplate>
		<span></span>
		<div ID="divItem" runat="Server" class='<%#"Info " + ((bool)(((DataRowView)Container.DataItem)[GDConstants.HIGHLIGHTED])? "Highlighted " : "") + ((bool)(((DataRowView)Container.DataItem)[GDConstants.IMAGE_VISIBLE])? "WithPhoto" : "WithNoPhoto")%>'>
			<div>
				<a href="javascript:openMyInfoPopup('<%#((DataRowView)Container.DataItem)[GDConstants.ID]%>');">
					<asp:Image ID="UserPhoto" class='<%#((bool)( UserPhoto.HasPhoto(((DataRowView)Container.DataItem)[GDConstants.ID].ToString()) ) ? "gPhotoImage" : "gPhotoNoImage")%>' Runat="server" ImageUrl='<%#((DataRowView)Container.DataItem)[GDConstants.IMAGE_PATH]%>' Visible='<%#((DataRowView)Container.DataItem)[GDConstants.IMAGE_VISIBLE]%>' /></a>
			</div>
			<div>
			<label for="UserSelected"><span class="accessibility"><%#((DataRowView)Container.DataItem)[GDConstants.NAME_DETAILS]%></span>
				<input id="UserSelected" runat="server" type="checkbox" class='<%#PortalUser.Current.IsGuest ? "hiddenText" : "" %>' name="<%#GDConstants.USER_SELECTED_CHECKBOX%>" value='<%#((DataRowView)Container.DataItem)[GDConstants.ID]%>'  />
				</label>&nbsp;
				<framework:MyInfoPopup id="MyInfoLink" NameFormat="LastNameFirstPreferred" runat="server" UserId="<%#((DataRowView)Container.DataItem)[GDConstants.ID]%>" />
			</div>
			<div>
				<div ID="UserGroupAll" class="RolesOn" Runat="server">
					<%#((DataRowView)Container.DataItem)[GDConstants.GROUPS]%>
				</div>
			</div>
		</div>
	</ItemTemplate>
</groupDirectory:TableRepeater>
<div class="pSection">
	<div id="divFooter" class="hint" runat="server" >
	  <table>
	    <tr>
	      <td>
	        <asp:PlaceHolder ID="plhOperations" Runat="server">
			<DIV>
				<asp:CheckBox id="SelectAll" Runat="server" /></DIV>
			<DIV>
				<asp:LinkButton id="lnkEmailSelected" Runat="server" OnClientClick="return openEmailWarning();" /></DIV>
			<DIV>
				<asp:LinkButton id="lnkViewRoster" Runat="server" /></DIV>
		</asp:PlaceHolder>
	      </td>
	      <td>
	        <asp:Label ID="lblPipeSeperator" runat="server" Text="|" />
	      </td>
	      <td>
	      <asp:Label ID="lblEmailAll" runat="server"/>
	      <asp:DropDownList ID="ddlContextRoles" runat="server" />
	      <asp:Button ID="btnEmailAllInGroup" runat="server" />
	      </td>
	    </tr>
	  </table>
	
		
	</div>
</div>
<div></div>
