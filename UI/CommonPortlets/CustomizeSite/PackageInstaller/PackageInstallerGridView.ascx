<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PackageInstallerGridView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.PackageInstaller.PackageInstallerGridView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>

<!--<link href="PackageInstallerStylesheet.css" rel="stylesheet" /> -->

<h4><%= Globalizer.GetString("TXT_UPLOAD_PACKAGE_INSTALLER_ZIP") %></h4>
<fieldset style="border: 1px solid black; margin: 10px; padding: 5px">
    <legend>Package Installer</legend>
    <div class="pSection">
        <p><%= Globalizer.GetString("MSG_UPLOAD_PACKAGE_INSTALLER_ZIP") %></p>
        <div>
            <asp:label id="lblInstallerFileUpload" runat="server" AssociatedControlID="InstallerFileUpload">Choose a file to upload:</asp:label>
            <asp:FileUpload ID="InstallerFileUpload"  runat="server" Width="400" /> 
            <br/>
            <asp:Label ID="lblPathToZip" runat="server" Font-Bold="true" />
            <br/>
            <jics:GlobalizedButton ID="btnUploadZip" runat="server" TextKey="TXT_UPLOAD_ZIP" Visible="True" />
            <br/>
            <asp:Label ID="lblZipContents" runat="server" Font-Bold="true" />
            
        </div>
        
        <div id="divMeetings">
            <asp:Label ID="lblWebServiceUrlRootValue" runat="server" Font-Bold="true" AssociatedControlID="txtWebServiceUrlRootValue">Enter the url provided:  </asp:Label>
            <asp:TextBox ID="txtWebServiceUrlRootValue" runat="server"  Width="400"></asp:TextBox>
            <br/>
            <asp:Label ID="lblSaltValue" runat="server" Font-Bold="true" AssociatedControlID="txtSaltValue">Enter the shared key provided:  </asp:Label>
            <asp:TextBox ID="txtSaltValue" runat="server"  Width="400"></asp:TextBox>
            <br/>
        </div>
        
        <div>
            <jics:GlobalizedButton ID="btnInstallPackage" runat="server" TextKey="TXT_INSTALL_ZIP" Visible="False"/>
            <jics:GlobalizedButton ID="btnCancel" runat="server" TextKey="TXT_CANCEL" />
        </div>

        <hr />
        <div>
            <h4>Package Install Log</h4>

            <div>
                <asp:Label ID="lblFileName" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Label ID="SummaryTextBox" runat="server"/>

            </div>
        </div>
    </div>
</fieldset> 