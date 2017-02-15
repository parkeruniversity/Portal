<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="AddEditAccount.ascx.cs"
    Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.AddEditAccount" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="acc" TagName="BaseRoleSelector" Src="BaseRoleSelector.ascx" %>
<%@ Import Namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>

<script language="javascript" type="text/javascript">
    <!--
    function USERCREATOR()
    {    
        var isUsernameTaken= false;
        var strUsernameAlreadyTaken = "<%= JavaScriptMethods.GetUsernameAlreadyExistString() %>";
        
        String.prototype.trim= function(){
            return this.replace(/^\s+|\s+$/g, '');
        };
        
        function removeChildren(element)
        {
            for(var i= 0, iLength= element.childNodes.length; i< iLength; i++){
                element.removeChild(element.firstChild);
            }    
        }
        
        function getXMLHTTP()
        {
            if (window.XMLHttpRequest)
            {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                return new XMLHttpRequest();
            }
            else if (window.ActiveXObject)
            {
                // code for IE6, IE5
                return new ActiveXObject("Microsoft.XMLHTTP");
            }
            alert("<%= JavaScriptMethods.GetAJAXNotSupportedString() %>");
            return null;
        }
                        
        function isBlank(value)
        {
            value = value.trim();
            if(value=== "")
            {
                return true;
            }
            return false;
        }
        
        function getCheckUsername()
        {
            if(document.getElementById("<%= FindControl("chkChangeUsername").ClientID %>")=== null)
            { 
                return true;
            }
            else
            {
                return document.getElementById("<%= FindControl("chkChangeUsername").ClientID %>").checked;                                        
            }
        }
        
        function getCheckPassword()
        {
            if(document.getElementById("<%= FindControl("chkChangePassword").ClientID %>")=== null)
            { 
                return true;
            }
            else
            {
                return document.getElementById("<%= FindControl("chkChangePassword").ClientID %>").checked;                                        
            }
        }
        
        return{            
            seeIfUniqueUsername: function seeIfUniqueUsername(username){
                var vmUsername= document.getElementById("usernameValidationMessage");                
                var checkUsername= getCheckUsername();
                var usernameResponse;                
                
                removeChildren(vmUsername);                
                if(checkUsername)
                {
                    username= username.trim();
                    if(username!== "")
                    {
                        var xmlHttp= getXMLHTTP();
                        if(xmlHttp!== null)
                        {
                            xmlHttp.open("GET", "<%= Page.ResolveUrl("~/UI/CommonPortlets/CustomizeSite/AccountCreator/AJAXFiles/CheckUsername.aspx") %>?Username="+ username+ "&ms="+ new Date().getTime(), false);                  
                            xmlHttp.send(null);
                            
                            usernameResponse= eval('(' + xmlHttp.responseText + ')');                                                                  
                            if(!usernameResponse.isValid)
                            {
                              vmUsername.appendChild(document.createTextNode(strUsernameAlreadyTaken + " "));
                              isUsernameTaken= true;
                            }
                            else
                            {
                              isUsernameTaken= false;
                            }
                        }
                    }
                }
            },
            
            isFormValid: function isFormValid(){
                var firstName= document.getElementById("<%= FindControl("txtFirstName").ClientID %>").value;
                var lastName= document.getElementById("<%= FindControl("txtLastName").ClientID %>").value;
                var email= document.getElementById("<%= FindControl("txtEmail").ClientID %>").value;
                var lblFirstNameRequired= document.getElementById("<%= FindControl("lblFirstNameRequired").ClientID %>");
                var lblLastNameRequired= document.getElementById("<%= FindControl("lblLastNameRequired").ClientID %>");
                var lblEmailRequired= document.getElementById("<%= FindControl("lblEmailRequired").ClientID %>");
                var username= document.getElementById("<%= FindControl(GetUsernameID()).ClientID %>").value.trim();
                var password= document.getElementById("<%= FindControl(GetPasswordID()).ClientID %>").value;
                var vmEmail= document.getElementById("emailValidationMessage");
                var vmUsername= document.getElementById("usernameValidationMessage");
                var vmPassword= document.getElementById("passwordValidationMessage");
                var strEnterValidEmail= "<%= JavaScriptMethods.GetEnterValidEmailString() %>";
                var strInvalidUsername= "<%= JavaScriptMethods.GetInvalidUsernameString() %>";
                var valid= true;
                removeChildren(vmEmail);
                removeChildren(vmUsername);
                removeChildren(vmPassword);
                if(isBlank(firstName))
                {
                    lblFirstNameRequired.className = "validation-error";
                    valid= false;
                }
                else
                {
                    lblFirstNameRequired.className = "validation-message";
                }
                if(isBlank(lastName))
                {
                    lblLastNameRequired.className = "validation-error";
                    valid= false;
                }
                else
                {
                    lblLastNameRequired.className = "validation-message";
                }
                if(isBlank(email))
                { 
                    lblEmailRequired.className = "validation-error";                   
                    valid= false;
                }
                else
                {
                    lblEmailRequired.className = "validation-message";
                    if(!email.match(/<%= JavaScriptMethods.GetEmailValidationString() %>/))
                    {
                       vmEmail.appendChild(document.createTextNode(strEnterValidEmail + " "));
                       valid= false;
                    }
                }
                if(getCheckUsername())
                {
                    if((username.search(/\s/)> -1) || (username.search(/\+/)> -1) || (username.search(/,/)> -1) || (username.search(/;/)> -1) || (username.search(/</)> -1) || (username.search(/=/)> -1) || (username.search(/>/)> -1) || (username.search(/\\/)> -1) || (username.search(/\//)> -1) || (username.search(/\#/)> -1)  || (username.search(/\?/)> -1) || (username.search(/\|/)> -1) || (username.search(/%/)> -1) || (username.search(/&/)> -1) || (username.search(/\*/)> -1) || (username.search(/:/)> -1))
                    {
                       vmUsername.appendChild(document.createTextNode(strInvalidUsername + " "));
                       valid= false;
                    }
                    else
                    {
                       this.seeIfUniqueUsername(username);
                       if(isUsernameTaken)
                       {
                           valid= false;
                       }
                    }  
                }
                if(getCheckPassword())
                {
                   if(!isBlank(password))
                   {
                       if((password.length < <%= JavaScriptMethods.GetMinPasswordString() %>) || (password.length > <%= JavaScriptMethods.GetMaxPasswordString() %>))
                       {
                           vmPassword.appendChild(document.createTextNode("<%= JavaScriptMethods.GetPasswordValidLengthString() %> "));
                           valid = false;
                       }
                   } 
                }   
                return valid;
            },
            
            isEditFormValid: function isEditFormValid(){
                if(this.isFormValid())
                {
                    return this.displayConfirmation();                    
                }
                else
                {
                    return false;
                }
            },
            
            toggleChangeUsername: function toggleChangeUsername(value)
            {
                var usernameRow= document.getElementById("usernameRow");
                
                usernameRow.style.display= "inline";
                if(value===true){                    
                    usernameRow.style.display= "inline";
                }
                else{
                    usernameRow.style.display= "none";
                }
            },
            
            toggleChangePassword: function toggleChangePassword(value)
            {
                var passwordRow= document.getElementById("passwordRow");
                var vmPassword= document.getElementById("passwordValidationMessage");
                var txtPassword= document.getElementById("<%= FindControl(GetPasswordID()).ClientID %>");
                
                passwordRow.style.display= "inline";
                if(value===true){
                    passwordRow.style.display= "inline";
                }
                else{
                    txtPassword.value = "";
                    removeChildren(vmPassword);
                    passwordRow.style.display= "none";
                }
            },
            
            displayConfirmation: function displayConfirmation()
            {            
                var strConfirm= "<%= JavaScriptMethods.GetConfirmChangeLoginString() %>";
                var checkUsername= getCheckUsername();
                var txtUsername= document.getElementById("<%= FindControl(GetUsernameID()).ClientID %>");
                var checkPassword= document.getElementById("<%= FindControl("chkChangePassword").ClientID %>").checked;
                var changedItem;
                
                if((checkUsername) && (checkPassword))
                {
                    changedItem= "<%= JavaScriptMethods.GetUsernameAndPasswordString() %>";
                }
                else if(checkPassword)
                {
                    changedItem= "<%= JavaScriptMethods.GetPasswordString() %>";
                }
                else if(checkUsername)
                {
                    changedItem= "<%= JavaScriptMethods.GetUsernameString() %>";
                }
                else
                {
                    return true;
                }  
                return confirm(strConfirm.replace("{0}", changedItem));                                                      
            },
            
            displayDeleteThisUserConfirmation: function displayDeleteThisUserConfirmation()
            {
                return confirm("<%= JavaScriptMethods.GetDeleteThisPortalOnlyString() %>");
            }
        };
    }   
    
    var userCreator= new USERCREATOR();   
    // -->
</script>

<style type="text/css">
    .validation-message
    {
        color: #707070;
    }
    .validation-error
    {
        color: #FF0000;
    }
</style>
<cmn:Subheader ID="hdrAddEditAccount" runat="server" />
<div class="pSection">
    <asp:PlaceHolder ID="plhEditDisplaySetup" runat="server">
        <table cellspacing="0" width="30%" style="border: 1px solid #b2b2b2; background-color: #efefef">
            <tr>
                <td style="padding-left: 10px; padding-top: 5px; padding-bottom: 5px; width: 45px">
                    <asp:Image ID="imgUserPhoto" runat="server" />
                </td>
                <td align="left" style="padding-left: 10px; padding-top: 5px; padding-bottom: 5px;">
                    <asp:Label ID="lblFullName" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:LinkButton ID="lnkEmail" runat="server" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:LinkButton ID="lnkDelete" OnClientClick="return userCreator.displayDeleteThisUserConfirmation();"
                        Style="color: #790000" runat="server" />
                </td>
            </tr>
        </table>
    </asp:PlaceHolder>
    <table cellpadding="5">
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblFirstName" runat="server" TextKey="LBL_FIRST_NAME"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <cmn:GlobalizedLabel ID="lblFirstNameRequired" CssClass="validation-message" runat="server"
                    TextKey="TXT_FB_REQUIRED"></cmn:GlobalizedLabel>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblLastName" runat="server" TextKey="LBL_LAST_NAME"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <cmn:GlobalizedLabel ID="lblLastNameRequired" CssClass="validation-message" runat="server"
                    TextKey="TXT_FB_REQUIRED"></cmn:GlobalizedLabel>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblEmail" runat="server" TextKey="LBL_EMAIL_ADDRESS"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <span id="emailValidationMessage" class="validation-error"></span>
                <cmn:GlobalizedLabel ID="lblEmailRequired" CssClass="validation-message" runat="server"
                    TextKey="TXT_FB_REQUIRED"></cmn:GlobalizedLabel>
            </td>
        </tr>
        <tr>
            <td align="right" style="padding: 5px 0px 0px 0px">
                <cmn:GlobalizedLabel ID="lblUsername" runat="server" TextKey="LBL_USER_NAME"></cmn:GlobalizedLabel>
            </td>
            <asp:PlaceHolder ID="plhUsernameEditSetup" runat="server">
                <td align="left" style="padding: 5px 0px 0px 0px">
                    <asp:CheckBox ID="chkChangeUsername" onclick="userCreator.toggleChangeUsername(this.checked);"
                        runat="server" />
                    <cmn:GlobalizedLabel ID="lblChangeUsername" runat="server" TextKey="TXT_CHANGE_USERNAME"></cmn:GlobalizedLabel>
                </td>
        </tr>
        <tr>
            <td align="left" style="padding: 0px">
            </td>
            <td align="left" style="padding: 0px">
                <div id="usernameRow" style="display: none">
                    <table>
                        <tr>
                            <td align="left">
                                <asp:TextBox ID="txtEditUsername" onchange="userCreator.seeIfUniqueUsername(this.value)"
                                    runat="server"></asp:TextBox>
                                <span id="usernameValidationMessage" class="validation-error"></span>
                                <cmn:GlobalizedLabel ID="lblEditUsernameNote" CssClass="validation-message" runat="server"
                                    TextKey="TXT_CHANGE_USERNAME_NOTE"></cmn:GlobalizedLabel>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="plhUsernameAddSetup" runat="server">
            <td align="left">
                <asp:TextBox ID="txtAddUsername" onchange="userCreator.seeIfUniqueUsername(this.value);"
                    runat="server"></asp:TextBox>
                <span id="usernameValidationMessage" class="validation-error"></span>
                <cmn:GlobalizedLabel ID="lblAddUsernameNote" CssClass="validation-message" runat="server"
                    TextKey="TXT_USERNAME_NOTE"></cmn:GlobalizedLabel>
            </td>
            </tr> </asp:PlaceHolder>
        <tr>
            <td align="right" style="padding: 5px 0px 0px 0px">
                <cmn:GlobalizedLabel ID="lblPassword" runat="server" TextKey="LBL_PASSWORD"></cmn:GlobalizedLabel>
            </td>
            <asp:PlaceHolder ID="plhPasswordEditSetup" runat="server">
                <td align="left" style="padding: 5px 0px 0px 0px">
                    <asp:CheckBox ID="chkChangePassword" onclick="userCreator.toggleChangePassword(this.checked)"
                        runat="server" />
                    <cmn:GlobalizedLabel ID="lblChangePassword" runat="server" TextKey="TXT_CHANGE_PASSWORD"></cmn:GlobalizedLabel>
                </td>
        </tr>
        <tr>
            <td align="left" style="padding: 0px">
            </td>
            <td align="left" style="padding: 0px">
                <div id="passwordRow" style="display: none">
                    <table>
                        <tr>
                            <td align="left">
                                <asp:TextBox ID="txtEditPassword" TextMode="Password" runat="server"></asp:TextBox>
                                <span id="passwordValidationMessage" class="validation-error"></span>
                                <cmn:GlobalizedLabel ID="lblEditPasswordNote" CssClass="validation-message" runat="server"
                                    TextKey="TXT_CHANGE_PASSWORD_NOTE"></cmn:GlobalizedLabel>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="plhPasswordAddSetup" runat="server">
            <td align="left">
                <asp:TextBox ID="txtAddPassword" TextMode="Password" runat="server"></asp:TextBox>
                <span id="passwordValidationMessage" class="validation-error"></span>
                <cmn:GlobalizedLabel ID="lblAddPasswordNote" CssClass="validation-message" runat="server"
                    TextKey="TXT_PASSWORD_NOTE"></cmn:GlobalizedLabel>
            </td>
            </tr> </asp:PlaceHolder>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblAdminNote" runat="server" TextKey="LBL_ADMIN_NOTE"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtAdminNote" runat="server"></asp:TextBox>
                <cmn:GlobalizedLabel ID="lblAdminNoteNote" CssClass="validation-message" runat="server"
                    TextKey="TXT_ADMIN_NOTE_NOTE"></cmn:GlobalizedLabel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="left">
                <div id="divExternalAuth" runat="server">
                    <asp:CheckBox ID="chkUseExternalAuthentication" runat="server" />
                    <asp:Label ID="lblUsesExternalAuthentication" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" style="padding-top: 20px">
                <cmn:GlobalizedLabel ID="lblRoles" runat="server" TextKey="LBL_ROLE(S)"></cmn:GlobalizedLabel>
            </td>
            <td align="left" style="padding-top: 20px">
                <acc:BaseRoleSelector ID="cblBRS" runat="server" />
            </td>
        </tr>
        <asp:PlaceHolder ID="plhPeronalMessageSetup" runat="server">
            <tr>
                <td align="right" valign="top">
                    <cmn:GlobalizedLabel ID="lblPersonalMessage" runat="server" TextKey="LBL_PERSONAL_MESSAGE"></cmn:GlobalizedLabel>
                </td>
                <td align="left">
                    <cmn:GlobalizedLabel ID="lblPersonalMessageNote" CssClass="validation-message" runat="server"
                        TextKey="TXT_PERSONAL_MESSAGE_NOTE"></cmn:GlobalizedLabel>
                    <br />
                    <br />
                    <asp:TextBox ID="txtPersonalMessage" runat="server" TextMode="MultiLine" Rows="3"
                        Columns="60"></asp:TextBox>
                </td>
            </tr>
        </asp:PlaceHolder>
        <tr>
            <td align="left">
            </td>
            <td align="left">
                <asp:Button ID="btnSave" runat="server" />
                <cmn:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_CANCEL" />
            </td>
        </tr>
    </table>
</div>
