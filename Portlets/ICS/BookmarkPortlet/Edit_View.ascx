<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Edit_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.BookmarkPortlet.Edit_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.BookmarkPortlet" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>

<div class="pSection">
	<jenzabar:groupedgrid id="BookmarkGrid" runat="server" CellPadding="0" DataKeyField="ID" GroupKeyField="ID">
		<GroupHeaderTemplate>
			<jenzabar:GlobalizedCheckBox id="chkSelectAllHeaders" runat="server"></jenzabar:GlobalizedCheckBox>
			<jenzabar:GlobalizedLabel id=lblForSelectAll runat=server AssociatedControlID="chkSelectAllHeaders" TextKey="TXT_SELECT_ALL" class="accessibility"></jenzabar:GlobalizedLabel>
			<%# DataBinder.Eval( Container.DataItem, "Name" )%>
			<asp:ImageButton ID="AddBookmarkLink" CommandName="AddBookmark" Runat="server" />
			<asp:ImageButton ID="EditHeaderLink" CommandName="EditHeader" Runat="server" />
			<asp:ImageButton ID="DeleteHeaderLink" CommandName="DeleteHeader" Runat="server" />
		</GroupHeaderTemplate>
		<GroupSubHeaderTemplate>
			<%# DataBinder.Eval( Container.DataItem, "Description" )%>
		</GroupSubHeaderTemplate>
		<SubGroupHeaderTemplate>
			<%= "Inactive" %>
		</SubGroupHeaderTemplate>
		<GroupHeaderColumns>
			<jenzabar:ExpandCollapseGroupedGridColumn separatorbefore="true"></jenzabar:ExpandCollapseGroupedGridColumn>
		</GroupHeaderColumns>
		<EmptyTableTemplate>
			<%=Globalizer.GetGlobalizedString("MSG_NO_BOOKMARKS_FOR_PORTLET")%>
		</EmptyTableTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="link">
				<ItemTemplate>
				<asp:Label id="lblForcbLink" runat="server" CssClass="accessibility" AssociatedControlID="cbLink" text='<%# DataBinder.Eval( Container.DataItem, "Name" )%>'></asp:Label>
					<asp:CheckBox ID="cbLink" Runat="server" />
							
					<a href='Portlets/ICS/bookmarkportlet/viewhandler.ashx?id=<%# Server.UrlEncode(DataBinder.Eval( Container.DataItem, "Id" ).ToString()) %>' target="_blank">
						<%# DataBinder.Eval( Container.DataItem, "Name" )%>
					</a>
					<asp:Label ID="lblViews" Runat="server">
								(<%= Globalizer.GetGlobalizedString("LBL_VIEWED") %> <%# DataBinder.Eval( Container.DataItem, "Views" ) %> times)
							</asp:Label>
					<br>
					<%# DataBinder.Eval( Container.DataItem, "Description" )%>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<div style="white-space: nowrap">
						<asp:ImageButton ID="EditLink" CommandName="EditBookmark" Runat="server" />
						<asp:ImageButton ID="DeleteLink" CommandName="DeleteBookmark" Runat="server" />
					</div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</jenzabar:groupedgrid>
</div>
<div class="pSection">
	<TABLE cellpadding="5">
		<asp:PlaceHolder ID="phTools" Runat="server">
			<TR>
				<TD>
					<jenzabar:MoveCopyDelete ID="MultipleSelect" GridToValidate="BookmarkGrid" ShowFileCabinetSave="True" runat="server" />
				</TD>
				<TD>&nbsp;&nbsp;&nbsp;
				</TD>
				<TD>
					<asp:ImageButton id="AddNewBookmark" Runat="server" CommandName="AddItem"></asp:ImageButton>&nbsp;<secured:slinkbutton id="lnkAddNewBookmark" runat="server" CausesValidation="False" IsSecured="True" AccessCheckType="Union" OperationNames="CanManageBookmarks"></secured:slinkbutton>
				</TD>
			</tr>
		</asp:PlaceHolder>
		<tr>
			<td>
				<jenzabar:GlobalizedLinkButton id="lnkImport" runat="server" TextKey="TXT_IMPORT_BOOKMARKS_FILE_CABINET" />
			</td>
			<TD>&nbsp;&nbsp;&nbsp;
			</TD>
			<TD>
				<asp:ImageButton id="AddNewSet" Runat="server" CommandName="AddSet"></asp:ImageButton>&nbsp;<secured:slinkbutton id="lnkAddNewSet" runat="server" CausesValidation="False" IsSecured="True" AccessCheckType="Union"	OperationNames="CanManageSets"></secured:slinkbutton>
			</TD>
		</TR>
	</TABLE>
</div>

<a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">
<span class="accessibility">Adobe Acrobat Reader is required to view and print PDF files.</span>
</a>

<script type="text/javascript">

	var chkSah_array = new Array();  //Sah =meaning 'Select all headers'
	
	function fncInitMCD(objMCD)
	{
		var checkbox_elements;	//Array
		
		var element1;			//DOMElement:checkbox
		var	element2;			//DOMElement:checkbox
		
		var i;					//Number
		var ii;					//Number
		
		var chkSah;				//DOMElement:checkbox
		var chkBookmark;			//DOMElement:checkbox
		
		//
		
		if (objMCD != null)
		{
			AddEvent(objMCD, "change", fncMCDchange);
		}
		
		//
		
		checkbox_elements = get_checkbox_input_elements();
		
		//
		
		for (i=0; i<checkbox_elements.length; i++)
		{
			chkSah = checkbox_elements[i];
			
			//
			
			if ((chkSah.id === null) || (chkSah.id.search("chkSelectAllHeaders") === -1))
			{
				continue;
			}
			
			//
						
			AddEvent(chkSah, "click", fncSahClick);
			
			chkSah.childs = new Array();
			
			for (ii=0; ii<checkbox_elements.length; ii++)
			{
				chkBookmark = checkbox_elements[ii];
				
				if ((chkBookmark.id === null) || (chkBookmark.id.substring(chkBookmark.id.length - 6) !== "cbLink")) {continue;}
				
				if (fncGetSec(chkBookmark.id) != (fncGetSec(chkSah.id) + 2)) {continue;}
					
				chkBookmark.parent = chkSah;
				
				AddEvent(chkBookmark, "click", fncItemSelect);
				
				chkSah.childs[chkSah.childs.length] = chkBookmark;
			}
			
			chkSah_array[chkSah_array.length] = chkSah;
		}
				
		//
		//show or hide the header checkboxes

		fncMCDchange({target: objMCD});

		/*/
		*/
		
		function get_checkbox_input_elements()
		{
			var elements;		//DOMCollection
			var element;		//DOMElement
			
			var checkbox_elements;	//Array
			
			//
			
			checkbox_elements = new Array();
			
			//
			
			elements = document.getElementsByTagName("input");
			
			for (element in elements)
			{
				if ((elements[element].type !== undefined) && (elements[element].type === "checkbox"))
				{
					checkbox_elements[checkbox_elements.length] = elements[element]
				}
			}
			
			//
			
			return checkbox_elements;
		}
		
		function fncGetSec(id)
		{
			return parseInt(id.split("_")[3].replace("sec", ""));
		}
	}
	
	function fncItemSelect(event)
	{
		var chkItem;	//DOMElement:checkbox
		
		//
		
		chkItem = GetEventTarget(event);
		
		if (chkItem.checked === false)
		{
			chkItem.parent.checked = false;
		}
	}
	
	function fncSahClick(event)
	{
		var chkSah;	//DOMElement:checkbox
		
		//
		
		chkSah = GetEventTarget(event);
		
		for (i=0; i<chkSah.childs.length; i++)
		{
			chkSah.childs[i].checked = chkSah.checked;
		}
	}

	function fncMCDchange(event)
	{
		var i; //Number
		
		//

		for (i=0; i<chkSah_array.length; i++)
		{
			if ((GetEventTarget(event) != null) &&  (GetEventTarget(event).value == "s"))
			{
				chkSah_array[i].style.display = "inline";
			}
			else
			{
				chkSah_array[i].style.display = "none";
			}
			
			chkSah_array[i].checked = false;
		}
	}
	
	///
	///
		
	function AddEvent(object_handle, event_name, function_name)
	{
		if (object_handle.attachEvent)
		{
			object_handle.attachEvent(("on" + event_name), function_name);
		}
		else if (object_handle.addEventListener)
		{
			object_handle.addEventListener(event_name, function_name, false);
		}
	}
	
	function GetEventTarget(event_data_pointer)
	{
		if (event_data_pointer.target != null)
		{
			return event_data_pointer.target;
		}
		else
		{
			return event_data_pointer.srcElement;
		}
	}
	
</script>
