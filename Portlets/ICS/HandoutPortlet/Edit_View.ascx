<%@ Register TagPrefix="secured" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls.Secured" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS.Web.Portlets.HandoutPortlet" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Edit_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.HandoutPortlet.Edit_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<div class="pSection">
	<jenzabar:groupedgrid id="HandoutGrid" runat="server" DataKeyField="ID" GroupKeyField="ID">
		<GroupHeaderTemplate>
			<jenzabar:GlobalizedLabel id=lblForSelectall runat=server TextKey="TXT_SELECT_ALL" AssociatedControlID="chkSelectAllHeaders" class="accessibility"></jenzabar:GlobalizedLabel>
			<jenzabar:GlobalizedCheckBox id="chkSelectAllHeaders" runat="server"></jenzabar:GlobalizedCheckBox>
			<%# DataBinder.Eval( Container.DataItem, "Name" )%>
			<asp:ImageButton ID="AddHandoutLink" CommandName="AddHandout" Runat="server" />
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
			<%=Globalizer.GetGlobalizedString("MSG_NO_HANDOUTS_FOR_PORTLET")%>
		</EmptyTableTemplate>
		<Columns>
			<asp:TemplateColumn HeaderText="link">
				<ItemTemplate>
				<div>
					<asp:CheckBox ID="cbLink" Runat="server" />
					<asp:Label ID=lblCbLink AssociatedControlID="cbLink" CssClass="accessibility" Runat="server"><%# DataBinder.Eval( Container.DataItem, "Name" )%></asp:Label>
					<a href="<%#Jenzabar.Common.JCUtilities.ResolveUrl("~/Portlets/ICS/Handoutportlet/viewhandler.ashx?handout_id=" + DataBinder.Eval(Container.DataItem, "Id").ToString())%>" target="_blank">
					<%# DataBinder.Eval( Container.DataItem, "Name" )%>
					</a>
					(<%# DataBinder.Eval( Container.DataItem, "File.Type" ) %>, <%# DataBinder.Eval( Container.DataItem, "File.Size" ) %><asp:label id="lblDownloaded" Runat="server" />)
					</div>
					<div>
					<%# DataBinder.Eval( Container.DataItem, "Description" )%>
					</div>
				
	</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<div style="white-space: nowrap">
						<asp:ImageButton ID="EditLink" CommandName="EditHandout" Runat="server" />
						<asp:ImageButton ID="DeleteLink" CommandName="DeleteHandout" Runat="server" />
					</div>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>

	</jenzabar:groupedgrid>
</div>
<div class="pSection">
	<TABLE cellpadding="5">
		<TR>
			<TD>
				<jenzabar:MoveCopyDelete ID="MultipleSelect" GridToValidate="HandoutGrid" ShowFileCabinetSave="True" runat="server" />
			</TD>
			<TD>&nbsp;&nbsp;&nbsp;
			</TD>
			<TD>
				<asp:ImageButton id="AddNewHandout" Runat="server" CommandName="AddItem" AlternateText="Add New Handout" ></asp:ImageButton>&nbsp;<secured:slinkbutton id="lnkAddNewHandout" runat="server" CausesValidation="False" IsSecured="True" AccessCheckType="Union" OperationNames="CanManageHandouts"></secured:slinkbutton>
			</TD>
		</tr>
		<tr>
			<td>
				<jenzabar:GlobalizedLinkButton id="lnkImport" runat="server" TextKey="TXT_IMPORT_HANDOUT_FILE_CABINET" />
			</td>
			<TD>&nbsp;&nbsp;&nbsp;
			</TD>
			<TD>
				<asp:ImageButton id="AddNewSet" Runat="server" CommandName="AddSet" AlternateText="Add New Set"></asp:ImageButton>&nbsp;<secured:slinkbutton id="lnkAddNewSet" runat="server" CausesValidation="False" IsSecured="True" AccessCheckType="Union"	OperationNames="CanManageSets"></secured:slinkbutton>
			</TD>
		</TR>
	</TABLE>
	
	<a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">
<span class="accessibility">Adobe Acrobat Reader is required to view and print PDF files.</span>
</a>
</div>



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
		var chkHandout;			//DOMElement:checkbox
		
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
				chkHandout = checkbox_elements[ii];
				
				if ((chkHandout.id === null) || (chkHandout.id.substring(chkHandout.id.length - 6) !== "cbLink")) {continue;}
				
				if (fncGetSec(chkHandout.id) != (fncGetSec(chkSah.id) + 2)) {continue;}
					
				chkHandout.parent = chkSah;
				
				AddEvent(chkHandout, "click", fncItemSelect);
				
				chkSah.childs[chkSah.childs.length] = chkHandout;
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

