<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AdminERP_OtherAddresses_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.AdminERP_OtherAddresses_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.ICS" %>
<common:subheader id="shOtherAddresses" runat="server"></common:subheader>
    <table width="100%" >
     	<p id="editTop" runat="server" visible="false">
 			<tr>
                <td colspan="2" ><div class="dashedline">&nbsp;</div></td>
    	    </tr>
    		<tr>
				<td colspan="2" ><jenzabar:hint id="lblAddressHint" Visible="True" runat="server"></jenzabar:hint></td>
			</tr>
			<tr>
				<td width="15%" ><strong><asp:label id="lblAddressType" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:dropdownlist id="ddlAddressType" Runat="server" visible="false" AutoPostBack="true" ></asp:dropdownlist>
				<asp:label id="lblCurrentAddressType" runat="server"></asp:label> <input id="addressId" type=hidden runat="server" ></td>
			</tr>
    	</p>
     	<p id="editAddress" runat="server" visible="false">
      		<tr>
				<td><strong><asp:label id="lblAddress" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:textbox id="txtAddress1" runat="server"></asp:textbox></td>
			</tr>
			<tr>
			    <td></td>
				<td align="left" ><asp:textbox id="txtAddress2" runat="server"></asp:textbox></td>
			</tr>
			<tr>
			    <td></td>
				<td align="left" ><asp:textbox id="txtAddress3" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<td><strong><asp:label id="lblCityStateZip" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:textbox id="txtCity" runat="server"></asp:textbox>&nbsp;&nbsp;
					<asp:dropdownlist id="ddlState" Runat="server"></asp:dropdownlist>&nbsp;&nbsp;
					<asp:textbox id="txtZip" runat="server"></asp:textbox>
					<asp:regularexpressionvalidator id="valZipFormat" runat="server" ControlToValidate="txtZip" ValidationExpression="(^[^|]{1,10}$)"></asp:regularexpressionvalidator>
				</td>
			</tr>
			<tr>
				<td ><strong><asp:label id="lblCountry" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:dropdownlist id="ddlCountry" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<td><strong><asp:label id="lblCounty" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:dropdownlist id="ddlCounty" Runat="server"></asp:dropdownlist></td>
			</tr>
			<tr>
				<td><strong><asp:label id="lblLocality" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:dropdownlist id="ddlLocality" Runat="server"></asp:dropdownlist></td>
			</tr>
    	</p>
    	<p id="editPhone" runat="server" visible="false">
			<tr>
				<td><strong><asp:label id="lblPhone" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:textbox id="txtPhone" runat="server"></asp:textbox>&nbsp;
				    <span class="fieldHint"><asp:label id="lblPhoneFormat" runat="server" /></span>&nbsp;&nbsp;
				    <strong><asp:label id="lblExt" runat="server"></asp:label></strong>&nbsp;&nbsp;
					<asp:textbox id="txtExtention" runat="server" Columns="40" Width="40"></asp:textbox>
				</td>
			</tr>
    	</p>
    	<p id="editEmail" runat="server" visible="false">
			<tr>
				<td><strong><asp:label id="lblEmailAddress" runat="server"></asp:label></strong></td>
				<td align="left" ><asp:textbox id="txtEmailAddress" runat="server"></asp:textbox></td>
			</tr>
		</p>
		<p id="editDates" runat="server" visible="false" >
			<tr>
				<td><strong><asp:label id="lblActiveDates" runat="server"></asp:label></strong></td>
				<td align="left" ><jenzabar:datepicker id="dpStartDate" runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short" Size="12"></jenzabar:datepicker>
		        &nbsp;to&nbsp;<jenzabar:datepicker id="dpEndDate" runat="server" TimeDisplayFormat="None" DateDisplayFormat="Short" Size="12"></jenzabar:datepicker></td>
			</tr>
		</p>
	    	<tr>
				<td colspan="2" align="center"><asp:button id="btnSubmit" runat="server" Visible = "false"></asp:button>&nbsp;&nbsp;
				<asp:button id="btnCancel" runat="server" CausesValidation="False" Visible = "false"></asp:button></td>
			</tr>
     </table>
	<table width="100%" cellSpacing="5" cellPadding="0" >
        <tr>
    		<td colspan=2><common:ImageAndTextButton TextKey="TXT_ADD_CONTACT_INFO" ID="lnkAddAddressTop" CommandName="AddAddress" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" Runat="server" /></td>
    		<td align=right><common:GlobalizedLinkButton TextKey="TXT_RETURN_TO_BIOGRAPHICAL_INFO" ID="lnkBiographicalTop" CommandName="ReturnToBiographical" Runat="server" /></td>
        </tr>    
		<tr>
            <td colspan="3" ><div class="dashedline">&nbsp;</div></td>
		</tr>
		<asp:repeater id="rptOtherAddresses" OnItemCommand="rptOtherAddresses_ItemCommand" Runat="server">
		    <ItemTemplate>
    			<tr style="MARGIN-TOP:5px;MARGIN-BOTTOM:10px;MARGIN-LEFT:0px;MARGIN-RIGHT:0px;">
					<td valign="top" width="20%">
    					<strong><asp:Label ID="lblAddressType" Runat="server"></asp:Label></strong>
    				</td>
    				<td valign="top" >
	    				<asp:Literal id="litOtherAddress" runat="server"></asp:Literal>
		    			<asp:Label id="lblOtherPhone" runat="server"></asp:Label>
		    			<asp:Label id="lblActiveDates" runat="server"></asp:Label>
		    		</td>
		    		<td valign="top" align=right >
						<asp:ImageButton ID="EditLink" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "AddressKey")%>' CommandName="EditAddress" ImageUrl="~/UI/Common/Images/PortletImages/Icons/edit.gif" Runat="server" />
		    		</td>
    			</tr>
			</ItemTemplate>
			<SeparatorTemplate> 
				<tr>
                   <td colspan="3" ><div class="dashedline">&nbsp;</div></td>
		        </tr>
            </SeparatorTemplate>
		</asp:repeater>
        <tr>
    		<td colspan=2>
    		    <common:ImageAndTextButton TextKey="TXT_ADD_CONTACT_INFO" ID="lnkAddAddressBottom" CommandName="AddAddress" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add.gif" Runat="server" />
    		</td>
     		<td align=right><common:GlobalizedLinkButton TextKey="TXT_RETURN_TO_BIOGRAPHICAL_INFO" ID="lnkBiographicalBottom" CommandName="ReturnToBiographical" Runat="server" /></td>
       </tr>    
    </table>
