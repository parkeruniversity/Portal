<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="AddAccount.ascx.cs"
    Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.AddAccount" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="acc" TagName="BaseRoleSelector" Src="BaseRoleSelector.ascx" %>
<%@ Import Namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>
<cmn:Subheader ID="hdrAddAccount" runat="server" />
<%--<script type="text/javascript" language="javascript" src="<%= this.ResolveUrl("~/UI/CommonPortlets/CustomizeSite/UserCreator/Validation.js") %>"></script>--%>
<script language="javascript" type="text/javascript">
    <!--
    //Would of used a ".js" file but could seem to import it in...
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
        return{
            seeIfUniqueUsername: function seeIfUniqueUsername(username){
                var vmUsername= document.getElementById("usernameValidationMessage");
                username= username.trim();
                if(username!== "")
                {
                    var xmlHttp= getXMLHTTP();
                    if(xmlHttp!== null)
                    {
                        xmlHttp.onreadystatechange=function()
                        {
                              var username;      
                              if(xmlHttp.readyState==4)
                              {                  
                                  username= eval('(' + xmlHttp.responseText + ')');
                                  removeChildren(vmUsername);
                                  if(!username.isValid)
                                  {
                                      vmUsername.appendChild(document.createTextNode(strUsernameAlreadyTaken));
                                      isUsernameTaken= true;
                                  }
                                  else
                                  {
                                      isUsernameTaken= false;
                                  }                      
                              }
                        };
                        xmlHttp.open("GET", "UI/CommonPortlets/CustomizeSite/UserCreator/CheckUsername.aspx?Username="+ username, true);                  
                        xmlHttp.send(null);
                    }
                }
            },
            
            isFormValid: function isFormValid(){
                var firstName= document.getElementById("<%= FindControl("txtFirstName").ClientID %>").value;
                var lastName= document.getElementById("<%= FindControl("txtLastName").ClientID %>").value;
                var email= document.getElementById("<%= FindControl("txtEmail").ClientID %>").value;
                var username= document.getElementById("<%= FindControl("txtUsername").ClientID %>").value.trim();
                var vmFirstName= document.getElementById("firstNameValidatationMessage");
                var vmLastName= document.getElementById("lastNameValidatationMessage");
                var vmEmail= document.getElementById("emailValidatationMessage");
                var vmUsername= document.getElementById("usernameValidationMessage");
                var strRequired= "<%= JavaScriptMethods.GetRequiredString() %>";
                var strEnterValidEmail= "<%= JavaScriptMethods.GetEnterValidEmailString() %>";
                var strInvalidUsername= "<%= JavaScriptMethods.GetInvalidUsernameString() %>";
                var valid= true;
                removeChildren(vmFirstName);
                removeChildren(vmLastName);
                removeChildren(vmEmail);
                removeChildren(vmUsername);
                if(isBlank(firstName))
                {
                    vmFirstName.appendChild(document.createTextNode(strRequired));
                    valid= false;
                }
                if(isBlank(lastName))
                {
                    vmLastName.appendChild(document.createTextNode(strRequired));
                    valid= false;
                }
                if(isBlank(email))
                {
                    vmEmail.appendChild(document.createTextNode(strRequired));
                    valid= false;
                }
                else
                {
                    if(!email.match(/<%= JavaScriptMethods.GetEmailValidationString() %>/))
                    {
                       vmEmail.appendChild(document.createTextNode(strEnterValidEmail));
                       valid= false;
                    }
                }
                if((username.search(/\s/)> -1) || (username.search(/\+/)> -1) || (username.search(/,/)> -1) || (username.search(/;/)> -1) || (username.search(/</)> -1) || (username.search(/=/)> -1) || (username.search(/>/)> -1) || (username.search(/\\/)> -1) || (username.search(/\//)> -1) || (username.search(/\#/)> -1)  || (username.search(/\?/)> -1) || (username.search(/\|/)> -1) || (username.search(/%/)> -1) || (username.search(/&/)> -1) || (username.search(/\*/)> -1) || (username.search(/:/)> -1))
                {
                   vmUsername.appendChild(document.createTextNode(strInvalidUsername));
                   valid= false;
                }
                if(isUsernameTaken)
                {
                    valid= false;
                    vmUsername.appendChild(document.createTextNode(strUsernameAlreadyTaken));
                }       
                return valid;
            }
        };
    }
    var userCreator= new USERCREATOR();     
    // -->
</script>

<style type="text/css">
    span.validation-message
    {
        color: Red;
    }
</style>
<div class="pSection">
    <table>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblFirstName" runat="server" TextKey="LBL_FIRST_NAME"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                    ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>--%>
                <span id="firstNameValidatationMessage" class="validation-message"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblLastName" runat="server" TextKey="LBL_LAST_NAME"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                    ControlToValidate="txtLastName"></asp:RequiredFieldValidator>--%>
                <span id="lastNameValidatationMessage" class="validation-message"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblEmail" runat="server" TextKey="LBL_EMAIL_ADDRESS"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"></asp:RequiredFieldValidator>--%>
                <span id="emailValidatationMessage" class="validation-message"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblUsername" runat="server" TextKey="LBL_USER_NAME"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtUsername" onclick="userCreator.seeIfUniqueUsername(this.value);" runat="server"></asp:TextBox>
                <span id="usernameValidationMessage" class="validation-message"></span>
                <cmn:GlobalizedLabel ID="lblUsernameNote" runat="server" TextKey="TXT_USERNAME_NOTE"></cmn:GlobalizedLabel>
                <%--<asp:CustomValidator ID="cvUsername" runat="server" ClientValidationFunction="checkUsername"></asp:CustomValidator>--%>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblPassword" runat="server" TextKey="LBL_PASSWORD"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                <cmn:GlobalizedLabel ID="lblPasswordNote" runat="server" TextKey="TXT_PASSWORD_NOTE"></cmn:GlobalizedLabel>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblAdminNote" runat="server" TextKey="LBL_ADMIN_NOTE"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <asp:TextBox ID="txtAdminNote" runat="server"></asp:TextBox>
                <cmn:GlobalizedLabel ID="lblAdminNoteNote" runat="server" TextKey="TXT_ADMIN_NOTE_NOTE"></cmn:GlobalizedLabel>
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblRoles" runat="server" TextKey="LBL_ROLES"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <acc:BaseRoleSelector ID="cblBRS" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <cmn:GlobalizedLabel ID="lblPersonalMessage" runat="server" TextKey="LBL_PERSONAL_MESSAGE"></cmn:GlobalizedLabel>
            </td>
            <td align="left">
                <cmn:GlobalizedLabel ID="lblPersonalMessageNote" runat="server" TextKey="TXT_PERSONAL_MESSAGE_NOTE"></cmn:GlobalizedLabel><br />
                <asp:TextBox ID="txtPersonalMessage" runat="server" TextMode="MultiLine" Rows="3"
                    Columns="60"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="left">
                <cmn:GlobalizedButton ID="btnSave" runat="server" TextKey="TXT_SAVE" />
                <cmn:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_CANCEL" />
            </td>
        </tr>
    </table>
</div>
