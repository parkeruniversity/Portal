<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Email.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.Email" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import namespace="Jenzabar.Common.Globalization" %>

<tr><td>
        <div id="divError" runat="server" class="ApplicationError" />
        <div>
            <%= Globalizer.GetGlobalizedString("MSG_FS_EMAIL") %>
        </div>

        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SMTP_SERVER") %></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_SMTP_SERVER") %>
        </div>
        <div class="pSection">
            <asp:TextBox ID="txtSMTPServer" Runat="server" Width="500" />
        </div>
        
        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SMTP_PORT") %></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_SMTP_PORT") %>
        </div>
        <div class="pSection">
            <asp:TextBox ID="txtSMTPPort" Runat="server" Width="50" />
        </div>
    
        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SMTP_ENABLE_SSL") %></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_SMTP_ENABLE_SSL") %>
        </div>
        <div class="pSection">
            <asp:DropDownList ID="ddlEnableSsl" Runat="server">
	            <asp:ListItem Value="true" Text="True" />
	            <asp:ListItem Value="false" Text="False" Selected="True" />
	        </asp:DropDownList>
        </div>
    
        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SMTP_USERNAME") %></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_SMTP_USERNAME") %>
        </div>
        <div class="pSection">
            <asp:TextBox ID="txtSmtpInfo1" Runat="server" Width="500" />
        </div>
    
        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SMTP_PASSWORD") %></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_SMTP_PASSWORD") %>
        </div>
        <div class="pSection">
            <!-- Chrome autocomplete hack -->
            <input style="width: 0; visibility: hidden; margin-left: -8px;"  type="password" name="fakepassword" />
            <asp:TextBox ID="txtSmtpInfo2" Runat="server" Width="200" TextMode="Password" />
            <asp:Label ID="lblSmtpPassword" runat="server"></asp:Label>
        </div>

        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SMTP_DEFAULT_EMAIL_ADDRESS") %></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_SMTP_DEFAULT_EMAIL_ADDRESS")%>
        </div>
        <div class="pSection" id="divEmail" runat="server">
            <asp:Label ID="labValEmail" runat="server" Text="Please enter a valid email address." ForeColor="Red" />
        </div>
        <div class="pSection">
            <asp:TextBox ID="txtEmail" Runat="server" Width="500" />
        </div>
        
        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_CAMPUS_GROUPS_FROM_ADDRESS") %></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_CAMPUS_GROUPS_FROM_ADDRESS")%>
        </div>
        <div class="pSection" id="divCGEmail" runat="server">
            <asp:Label ID="labValCGEmail" runat="server" Text="Please enter a valid email address." ForeColor="Red" />
        </div>
        <div class="pSection">
            <asp:TextBox ID="txtCGEmail" Runat="server" Width="500" />
        </div>

        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_SEND_EMAIL_FROM_USER")%></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_SEND_EMAIL_FROM_USER") %>
        </div>
        <div class="pSection">
            <asp:DropDownList ID="ddlSendMailFromUser" Runat="server">
	            <asp:ListItem Value="true" Text="True" />
	            <asp:ListItem Value="false" Text="False" Selected="True" />
	        </asp:DropDownList>
        </div>        

        <h5><%= Globalizer.GetGlobalizedString("TXT_FS_LOG_EMAIL")%></h5>
        <div class="pSection">
            <%= Globalizer.GetGlobalizedString("MSG_FS_LOG_EMAIL") %>
        </div>
        <div class="pSection">
            <asp:DropDownList ID="ddlLogEmail" Runat="server">
	            <asp:ListItem Value="true" Text="True" />
	            <asp:ListItem Value="false" Text="False" Selected="True" />
	        </asp:DropDownList>
        </div>
</td></tr>