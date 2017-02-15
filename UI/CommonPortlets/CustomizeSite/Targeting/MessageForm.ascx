<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MessageForm.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.MessageForm" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fwkControl" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="txt" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>

<script type="text/javascript">

	var Jenzabar$Portal$Web$UI$CommonPortlets$MessageForm = new function()
	{
		var controls = {};

		JCSL.element.ready(controls, ["<%=hntURLLink.ClientID%>", "MessageForm$ttd_make_file_link"], ["hntURLLink", "ttd_make_file_link"]);
		
		//
		// event handlers
		
		this.rbText__click = function(me)
		{
			JCSL.element.enable(controls.ttd_make_file_link);
			
			controls.hntURLLink.innerHTML = "<%=Globalizer.GetGlobalizedString("TXT_TARGETED_MSG_FILE_LINK_EXPLAINED")%>";
		}

		this.rbFile__click = function(me)
		{	
			if (JCSL.lang.array.get_last(document.getElementById("<%=UFile.ClientID%>").value.split(".")).toLowerCase() == "swf")
			{
				this.disable_linking();
			}
			else
			{
				this.rbText__click();
			}
		}
		
		this.UFile__change = function(me)
		{
			if (JCSL.lang.array.get_last(me.value.split(".")).toLowerCase() == "swf")
			{
				this.disable_linking();
			}
			else
			{
				this.rbText__click();
			}
		}
		
		//
		
		this.disable_linking = function()
		{
			JCSL.element.disable(controls.ttd_make_file_link, {color:"Gray", opacity:25});
			
			controls.hntURLLink.innerHTML = "<%=Globalizer.GetGlobalizedString("TXT_TARGETED_MSG_FILE_LINK_DISABLED_EXPLAINED")%>";
		}
	}
	
</script>

<table id="tblAddEditMessage" cellpadding="0" cellspacing="0">
	<tr>
		<th>
			<common:GlobalizedLiteral id="litLblSubject" runat="server" textKey="LBL_SUBJECT" /></th>
		<td><asp:TextBox Width="300px" ID="txtSubject" Runat="server" /></td>
	</tr>
	<tr>
		<th>
		</th>
		<td><common:Hint id="hntSubjectExplained" runat="server" textKey="TXT_TARGETED_MSG_SUBJECT_EXPLAINED" /></td>
	</tr>
	<tr>
		<th class="psTitleCell">
			<common:GlobalizedLiteral id="litLblShowTo" runat="server" textKey="LBL_SHOW_TO" /></th>
		<td class="psCell"><fwkControl:PrincipalSelector id="psShowTo" runat="server" /></td>
	</tr>
	<tr>
		<th>
			<common:GlobalizedLiteral id="litLblContent" runat="server" textKey="LBL_CONTENT" /></th>
		<td></td>
	</tr>
	<tr>
		<th>
		</th>
		<td><asp:RadioButton CssClass="radioButton" GroupName="grpContent" ID="rbText" Runat="server" /><common:GlobalizedLiteral id="litLblText" runat="server" textKey="LBL_TEXT" />&nbsp;</td>
	</tr>
	<tr>
		<th>
		</th>
		<td><txt:TextEditorControl id="txtContent" runat="server" /></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<th>
		</th>
		<td><asp:RadioButton GroupName="grpContent" ID="rbFile" Runat="server" /><common:GlobalizedLiteral id="litLblFile" runat="server" textKey="LBL_FILE" />&nbsp;<INPUT id="UFile" type="file" runat="server" NAME="UFile" />&nbsp;<b><asp:Label Runat="server" ID="lblFileName" /></b>&nbsp;<common:GlobalizedButton id="btnDeleteUploadedFile" runat="server" visible="false" textKey="TXT_DELETE" />
		</td>
	</tr>
	<tr>
		<th>
		</th>
		<td><common:Hint id="hntFileUploadExplained" runat="server" textKey="TXT_TARGETED_MESSAGE_FILE_TYPES" /></td>
	</tr>
	<tr>
		<th>
		</th>
		<td>
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td width="50"><common:GlobalizedLiteral id="litWidth" runat="server" textKey="LBL_WIDTH" /></td>
					<td><asp:TextBox ID="txtWidth" Runat="server" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>
		</th>
		<td>
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td width="50"><common:GlobalizedLiteral id="litHeight" runat="server" textKey="LBL_HEIGHT" /></td>
					<td><asp:TextBox ID="txtHeight" Runat="server" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>
		</th>
		<td><common:Hint id="hntHeightWidthExplained" runat="server" textKey="TXT_TARGETED_MESSAGE_FILE_DIMENTIONS" /></td>
	</tr>
	<tr>
		<th>
		</th>
		<td id="MessageForm$ttd_make_file_link"><asp:CheckBox ID="cbLink" Runat="server" /><common:GlobalizedLiteral ID="litLblLink" runat="server" textKey="LBL_MAKE_FILE_LINK_TO" />&nbsp;<asp:TextBox Columns="70" Rows="7" ID="txtLinkTo" Runat="server" /></td>
	</tr>
	<tr>
		<th>
		</th>
		<td><common:Hint id="hntURLLink" runat="server" textKey="TXT_TARGETED_MSG_FILE_LINK_EXPLAINED" /></td>
	</tr>
	<asp:placeholder ID="phMessageSpecific" Runat="server">
		<TR>
			<TH>
				<common:GlobalizedLiteral id="litLblDateRange" textKey="LBL_DATE_RANGE" runat="server"></common:GlobalizedLiteral></TH>
			<TD>
				<TABLE cellSpacing="0" cellPadding="0">
					<TR>
						<TD width="40">
							<common:GlobalizedLiteral id="litLblFrom" textKey="LBL_FROM" runat="server"></common:GlobalizedLiteral></TD>
						<TD>
							<common:DatePicker id="dateFrom" runat="server" TimeDisplayFormat="Long" DateDisplayFormat="Long"></common:DatePicker></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TH>
			</TH>
			<TD>
				<TABLE cellSpacing="0" cellPadding="0">
					<TR>
						<TD width="40">
							<common:GlobalizedLiteral id="litLblTo" textKey="LBL_TO" runat="server"></common:GlobalizedLiteral></TD>
						<TD>
							<common:DatePicker id="dateTo" runat="server" TimeDisplayFormat="Long" DateDisplayFormat="Long"></common:DatePicker></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TH>
			</TH>
			<TD>
				<common:Hint id="hntMessageDates" textKey="TXT_TARGETED_MSG_DATE_EXPLAINED" runat="server"></common:Hint></TD>
		</TR>
		<TR>
			<TH>
				<common:GlobalizedLiteral id="litLblTemplate" textKey="LBL_TEMPLATE" runat="server"></common:GlobalizedLiteral></TH>
			<TD>
				<asp:CheckBox id="cbTemplate" Runat="server" TextAlign="Right"></asp:CheckBox>
				<common:GlobalizedLiteral id="litTemplateExplained" textKey="MSG_TAREGTED_MSG_TEMPLATE_EXPLAINED" runat="server"></common:GlobalizedLiteral></TD>
		</TR>
	</asp:placeholder>
	<tr>
		<th>
		</th>
		<td><common:GlobalizedButton id="btnSave" runat="server" textKey="TXT_SAVE" />&nbsp;&nbsp;<common:GlobalizedButton id="btnCancel" runat="server" textKey="TXT_CANCEL" />
		</td>
	</tr>
</table>
