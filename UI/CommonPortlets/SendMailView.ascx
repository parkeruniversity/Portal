<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register tagPrefix="tb" namespace="Jenzabar.Portal.Framework.Web.TextEditor" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Inherits="Jenzabar.Portal.Framework.Web.UI.Views.SendMailView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<h4>Recipients</h4>
<div id="divRecipientsList" runat="server" class="pSection" visible="false">
	<span ID="spanEmail" Runat="server" visible=false />
	<span ID="spanRecipients" Runat="server" />
		
</div>
<fieldset id="fldAddr" runat="server">
<table>
	<tr>
	
		<th>
			<asp:Label ID = "lbladdr" Runat ="server"></asp:Label>
		</th>
	
		<td>
			<div>
				<asp:RadioButton ID = "rbPublic"  Runat = "server" GroupName ="MakeingPublicOrPrivate"></asp:RadioButton>
			</div>
			<div>
				<table>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><asp:CheckBox ID = "copyToYourSelf"  Runat = "server" ></asp:CheckBox>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<asp:RadioButton ID = "rbPrivate"  Runat = "server" GroupName = "MakeingPublicOrPrivate"></asp:RadioButton>
				
			</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i><asp:Label ID = "lblautomaticCopy" Runat = "server"></asp:Label></i></div>
		</td>
	</tr>
</table>
</fieldset>
<div id="divRecipientsInput" runat="server" class="pSection">
    <fieldset style="DISPLAY:none">
		<p class="hint">Enter the email addresses that you wish to send this message to 
			separated by a comma(,) if you wish to sent the message to more than one 
			address.</p>
		<table>
			<tr>
				<th>
					<label id="lblTo" for="txtTo">To:</label>
				</th>
				<td>
					<input id="txtTo" accesskey="t" tabindex="10" type="text" name="txtTo" style="WIDTH:100%" runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					<label id="lblBcc" for="txtBcc">Bcc:</label>
				</th>
				
				<td>
					<input id="txtBcc" accesskey="tBcc" tabindex="10" type="text" name="txtBcc" style="WIDTH:100%" runat="server" />
				</td>
			</tr>
		</table>
	</fieldset>
	<p id="hint" class="hint">Select the users and or the Groups that you wish to 
		address your message to.</p>
	<asp:Literal id="userList"></asp:Literal>
	<jenz:principalselector id="psTo" runat="server" />
</div>
<h4>Message</h4>
<div class="pSection" id="message">
	<fieldset>
		<table>
			<tr>
				<th>
					<label id="lblSub" for="txtSub">Subject:</label></th><td><input id="txtSub" accesskey="s" tabindex="30" type="text" name="txtSub" size="60" runat="server" /></td>
			</tr>
			<tr>
				<th>
					<label id="lblMessage" for="txtMessage">Body:</label></th><td><tb:TextEditorControl id="txtMessage" runat="server"></tb:TextEditorControl></td>
			</tr>
		</table>
	</fieldset>
</div>
<h4 style="DISPLAY:none">Attachments</h4>
<div class="pSection" id="attachments">
	<fieldset>
		<p class="hint"><%= Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_HOW_TO_ADD_ATTACHMENT") %></p>
		<table class="formLayout">
			<tr>
				<th>
					<label for="file1">File:</label>
				</th>
				<td>
					<cmn:MultiFileUpload id="MFUfiles" runat="server"/>
				</td>
			</tr>
		</table>
	</fieldset>
</div>
<div class="pSection">
	
	<input id="btnSend" type="button" value="Send" name="btnSend" runat="server" onclick="return preventDefaultEvent(event, btnSend_click());"/> <input id="btnCancel" type="button" value="Cancel" name="btnCancel" runat="server" onclick="btnCancel_click();return;" />
</div>
<br>

<script type="text/javascript">

	/*
	The below JS implementation is intended to handle bogus text in the input field (MFUfiles of type "File") using IE. A future implementation
	should skip much of the code depending on the browser. Upon release, the JCSFL will provide the necessary functionality to create a more
	"light-weight" cross browser solution.
	*/
	
	/*TTP 14950 - This will check for valid subject line text and eMail message text.
	This function returns true if there is missing subject or message body text and it
	will pop up a dialog box to alert the user. */
	function CheckEMailText()
	{
		
		    var subjectTextBox = document.getElementById("<%=this.txtSub.ClientID%>");
		    var editor = document.getElementById("<%=this.txtMessage.ClientID%>");
		    var msgBodyText ='';
		    var subjectText = '';
		    var modMsgBodyText = '';
		    var modSubjectText = '';
		try
		{ 
		    if(editor!=null && subjectTextBox !=null)
		    {
		        /*Check for browser version because not all browsers support
		         the innerText property of the body object.*/
		        
		        subjectText = subjectTextBox.value;
		        
		        /* Internet Explorer and Opera */
		        if (/MSIE (\d+\.\d+);/.test(navigator.userAgent) || /Opera[\/\s](\d+\.\d+)/.test(navigator.userAgent))
		        {
		            msgBodyText = editor.GetDocument().body.innerText;
		            
		        
		        }
		        else
		        {
		            var html = editor.GetDocument().createRange();
                    html.selectNodeContents(editor.GetDocument().body);
		            msgBodyText = html.toString();
		        }	        
		        
		        /*Replace all spaces in the string */		       
		        modMsgBodyText = msgBodyText.replace(/\s+/g,'');
		        modSubjectText = subjectText.replace(/\s+/g,'');
		        
		        //strips all HTML out of the string
		        // var modHTMLText = modHTMLText2.replace(/(<([^>]+)>)/ig,'');
		        
		        
		        if(modSubjectText == null || modSubjectText=='' || modMsgBodyText == null || modMsgBodyText =='')
		        {
		            if(confirm("This message has an empty subject or body.  Do you want to send it anyway?"))
		            {return false;}
		            else
		            {return true;}
		        }            
		        
		    }	    
		}
		catch(err)
		{
		    /*We don't want to stop the user from sending an eMail if
		    there is a javascript error so we'll return false*/
		    /*alert('Error: '+ err);*/
		    return false;
		}
	}

	function btnSend_click()
	{
		var file_input;  //DOMElement;
		
		
		/* TTP 14950 - If the validation function found a problem and the user clicked "OK" on the confirm
		dialog box then we will stop further validation until they've fixed the e-mail subject or body */
		if(CheckEMailText()){return;}
				
		file_input = document.getElementById(document.getElementById("<%= this.FindControl("MFUfiles").ClientID %>").getAttribute("InputFileID"));
		
		if (file_input.value.length > 0)
		{
		    if (confirm("<%= Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_FILE_NOT_ATTACHED") %>") == true)
			{
				//the below block is required for IE because it allowes the user to enter a bogus file path which is posted with 'Send' even if there was no intention to attach a file
				
				try
				{
					do_postback("<%= this.FindControl("btnSend").UniqueID %>", "");					
				}
				catch (exception)
				{
					if (exception.message.indexOf("Access is denied.") == 0) //A bogus filepath was entered so IE throws this exception
					{
						alert("<%= Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_PLEASE_ENTER_VALID_PATH") %>");
					}
					else
					{
						throw exception;
					}
				}
			}
			else return false;
		}
		else
		{
			do_postback("<%= this.FindControl("btnSend").UniqueID %>", "");
		}
	}
	
	function btnCancel_click()
	{
		var MFUfiles; //DOMElement
		
		//
		
		MFUfiles = document.getElementById(document.getElementById("<%= this.FindControl("MFUfiles").ClientID %>").getAttribute("InputFileID"));
		
		MFUfiles.parentNode.removeChild(MFUfiles);
		
		do_postback("<%= this.FindControl("btnCancel").UniqueID %>", "");
	}
	
	function do_postback(sender, args)
	{
		if (do_postback.submitted == undefined)
		{
			do_postback.submitted = true;
			
			__doPostBack(sender, args);
			
			return;
		}
		
		//
		
		theForm.__EVENTTARGET.value		= sender;
		theForm.__EVENTARGUMENT.value	= args;
		theForm.submit();
	}

</script>