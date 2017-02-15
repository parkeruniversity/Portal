<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CustPageLayout.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Controls.CustPageLayout" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Import namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cust" tagname="ListBoxEx" src="~/UI/CommonPortlets/CustomizePage/LAyout/ListBoxEx.ascx" %>
<asp:PlaceHolder ID="plhReadOnly" Runat="server">
<div class="pSection">
<cmn:GlobalizedLiteral ID=litReadOnly textkey="MSG_PAGE_READONLY_NO_MODIFICATION" runat="server"/>
</div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="plhMain" Runat="server">
<div class="pSection">
<div>
<cmn:Subheader id="subHeader1"  runat="server"></cmn:Subheader>
<cmn:Hint id="hntLayouts" runat="server"></cmn:Hint>
<table width="90%">
<tr>
	<td width="30%" align="center">
		<div><asp:ImageButton ID="img_1_Even" Runat="server"></asp:ImageButton></div>
		<div><asp:RadioButton ID="rb_1_Even" GroupName="NOfColumns" Runat="server" AutoPostBack="True" Visible="True"></asp:RadioButton></div>
	</td>
	<td width="30%" align="center">	
		<div><asp:ImageButton ID="img_2_Even" Runat="server"></asp:ImageButton></div>
		<div><asp:RadioButton ID="rb_2_Even" GroupName="NOfColumns" Runat="server" AutoPostBack="True" Visible="True"></asp:RadioButton></div>
	</td>
	<td  width="30%" align="center">
		<div><asp:ImageButton ID="img_2_WideLeft" Runat="server"></asp:ImageButton></div>
		<div><asp:RadioButton ID="rb_2_WideLeft" GroupName="NOfColumns" Runat="server" AutoPostBack="True" Visible="True"></asp:RadioButton></div>
	</td>
</tr>
<tr>
<td colspan="3">
<br>
</td>
</tr>
<tr>
	<td align="center">	
		<div><asp:ImageButton ID="img_3_Even" Runat="server"></asp:ImageButton></div>
		<div><asp:RadioButton ID="rb_3_Even" GroupName="NOfColumns" Runat="server" AutoPostBack="True" Visible="True"></asp:RadioButton></div>
	</td>
	<td align="center">	
		<div><asp:ImageButton ID="img_3_WideLeft" Runat="server"></asp:ImageButton></div>
		<div><asp:RadioButton ID="rb_3_WideLeft" GroupName="NOfColumns" Runat="server" AutoPostBack="True" Visible="True"></asp:RadioButton></div>
	</td>
	<td align="center">	
		<div><asp:ImageButton ID="img_3_WideCenter" Runat="server"></asp:ImageButton></div>
		<div><asp:RadioButton ID="rb_3_WideCenter" GroupName="NOfColumns" Runat="server" AutoPostBack="True" Visible="True"></asp:RadioButton></div>
	</td>	
</tr>
<tr>
<td colspan="3">
<br>
</td>
</tr>
<tr id="trCustomLayout" runat="server" visible="false">
    <td align="center" colspan="3">
        <asp:RadioButton ID="rbCustomLayout" GroupName="NOfColumns" Runat="server" AutoPostBack="True" Visible="True" />
        <span><%= Globalizer.GetString("LBL_CUSTOM_LAYOUT_CSS") %></span>
        <span><asp:TextBox ID="txtCustomLayout" runat="server" /></span>
    </td>
</tr>
</table>	
</div>
<div>
<script language="JavaScript" src="UI/Common/Scripts/PortletUtils.js"></script>
<cmn:Subheader id="subHeader"  runat="server"></cmn:Subheader>
<cmn:Hint id="hntSelect" runat="server"></cmn:Hint>

<table width="100%" cellpadding="4">
<tr>
	<td width="33%" align="center">
		<div><asp:ImageButton ID="imbColumnsLeft" Runat="server" CssClass="linkBorder" BorderWidth="3"  Visible="True" /></div>
		<br>
		<div><cust:ListBoxEx ID="lbColumnLeft" runat="server" /></div>
	</td>	
	<asp:PlaceHolder ID="plhCenter" Runat="server">
    <TD id="tdCenter" align=center width=*>
      <DIV><ASP:IMAGEBUTTON id="imbColumnsCenter" Visible="True" Runat="server" BorderWidth="3" CssClass="linkBorder" /></DIV><BR>
      <DIV><CUST:LISTBOXEX id="lbColumnCenter" runat="server" /></DIV></TD>
	</asp:PlaceHolder>
	<td id="tdRight" width="33%" align="center">
	<asp:PlaceHolder ID="plhRight" Runat="server">
      <DIV><ASP:IMAGEBUTTON id="imbColumnsRight" Visible="True" Runat="server" BorderWidth="3" CssClass="linkBorder" /></DIV><BR>
      <DIV><cust:ListBoxEx id="lbColumnRight" runat="server" /></DIV>
	</asp:PlaceHolder>
	</td>		
</tr>	
</table>
</div>
<input type="hidden" runat="server" id="ctlJSFlag" name="ctlJSFlag" value="">
<div class="pActionsTransp"><asp:Button id="btnSave" runat="server" Visible="True" /></div>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></div>
</asp:PlaceHolder>
