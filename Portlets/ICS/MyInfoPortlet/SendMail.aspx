<%@ Page language="c#" Codebehind="SendMail.aspx.cs" AutoEventWireup="false" Inherits="MyInfoPortlet.SendMail" ValidateRequest="false" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Send Email</title>
<asp:Literal ID="BasePath" runat="Server" />
<asp:Literal ID="litHtmlHeadElements" runat="server" />
<link href="<%= this.ResolveUrl("~/UI/Common/Styles/siteStyle.css") %>" type="text/css" rel="stylesheet">
<link href="<%= this.ResolveUrl("~/Portlets/ICS/MyInfoPortlet/MyInfo.css") %>" type="text/css" rel="stylesheet">
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/Utility.js") %>"></script>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/framework.js") %>"></script>
<asp:Literal ID="litAfterFrameworkHtmlHeadElements" runat="server" />
<script type="text/javascript">

	/*
	The below JS implementation is intended to handle bogus text in the input field (MFUfiles of type "File") using IE. A future implementation
	should skip much of the code depending on the browser. Upon release, the JCSFL will provide the necessary functionality to create a more
	"light-weight" cross browser solution.
	*/

	function btnSend_click()
	{
		var file_input;  //DOMElement;
		
		//
		
		file_input = document.getElementById(document.getElementById("<%= this.FindControl("MFUfiles").ClientID %>").getAttribute("InputFileID"));
		
		if (file_input.value.length > 0)
		{
			if (confirm("<%= Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_FILE_NOT_ATTACHED") %>") == true)
			{
				//the below block is required for IE because it allowes the user to enter a bogus file path which is posted with 'Send' even if there was no intention to attach a file
				
				try
				{
					<%=Page.GetPostBackEventReference(btnSend,string.Empty) %>
				}
				catch (exception)
				{
					if (exception.message.indexOf("Access is denied.") == 0) //A bogus filepath was entered so IE throws this exception
					{
						alert("<%= Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_PLEASE_ENTER_VALID_PATH") %>");
						file_input.select();
					}
					else
					{
						return false;
					}
				}
				return false;
			}else{
			    return false;
			}
		}
		else
		{
			<%=Page.GetPostBackEventReference(btnSend,string.Empty) %>
		}
	}
</script>
<style>
table {font-size: 12px;}
.fontDefaultColor{color: #000000;}
.fontErrorColor{color: Red;}
</style>
</head>

<body>
<form runat="server" action="Portlets/ICS/MyInfoPortlet/SendMail.aspx">
<h4>Send Email</h4>
<table cellSpacing="0" cellPadding="10" border="0" width="100%" id="tableSendFields" runat="server">
	<tr id="trErr" runat="server">
		<td colspan="2" class="fontErrorColor"><asp:Literal ID="litErr" Runat="server" /></td>
	</tr>
	<tr>
		<td valign="top" align="right"><b>To:</b></td>
		<td>
			<%=UserName%> (<%=EmailAddress%>)<br/>
			<asp:CheckBox ID="copyToYourSelf" Runat="server" /> Send a copy to myself
		</td>
	</tr>
	<tr>
		<td nowrap align="right" id="tdSubject" runat="server"><b>Subject:</b></td>
		<td><asp:TextBox ID="tbSubject" Runat="server" Width="300" /></td>
	</tr>
	<tr>
		<td colspan="2" id="tdMSG" runat="server"><b>Message:</b></td>
	</tr>
	<tr>
		<td colspan="2"><cmn:TextEditorControl id="txtMessage" runat="server" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" align="right"><b>File:</b></td>
		<td><cmn:MultiFileUpload id="MFUfiles" runat="server"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<br/>
			<asp:Button ID="btnSend" Runat="server" Text="Send" /> &nbsp; 
			<input type="button" value="Cancel" onclick="location='Portlets/ICS/MyInfoPortlet/MyInfoPopup.aspx?UserID=<%=UserID%>';" />
		</td>
	</tr>
</table>
<input type="hidden" name="UserID" value="<%=UserID%>" />
<input type="hidden" name="EmailAddress" value="<%=EmailAddress%>" />
<input type="hidden" name="UserName" value="<%=UserName%>" />
</form>
</body>
</html>