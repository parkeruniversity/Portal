<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JenzabarDataProvider.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.SiteSettings.FSCategories.JenzabarDataProvider" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>

<tr>
    <td>
        <div id="divError" runat="server" class="ApplicationError" />
        <div id="CanvasConfigSection" runat="server">
            <h4><%= Globalizer.GetGlobalizedString("TXT_CANVAS")%></h4>
            <div class="pSection">
                <h5><%= Globalizer.GetGlobalizedString("TXT_CANVAS_SERVER")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_CANVAS_SERVER")%>
                </div>
                <div class="pSection">
                    <asp:TextBox ID="CanvasServer" runat="server" Width="200" />
                    <span id="CanvasServerRequired" class="ValidationMessage" runat="server">
                        <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%>
                    </span>
                </div>
                <h5><%= Globalizer.GetGlobalizedString("TXT_CANVAS_ACCOUNT")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_CANVAS_ACCOUNT")%>
                </div>
                <div class="pSection">
                    <asp:TextBox ID="CanvasAccount" runat="server" Width="200" />
                    <span id="CanvasAccountRequired" class="ValidationMessage" runat="server">
                        <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%>
                    </span>
                </div>
                <h5><%= Globalizer.GetGlobalizedString("TXT_CANVAS_API_KEY")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_CANVAS_API_KEY")%>
                </div>
                <div class="pSection">
                    <asp:TextBox ID="CanvasApiKey" runat="server" Width="500" />
                    <span id="CanvasApiKeyRequired" class="ValidationMessage" runat="server">
                        <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%>
                    </span>
                </div>
            </div>
        </div>
        <div id="XitracsConfigSection" runat="server">
            <h4><%= Globalizer.GetGlobalizedString("TXT_XITRACS")%></h4>
            <div class="pSection">
                <h5><%= Globalizer.GetGlobalizedString("TXT_XITRACS_SERVER")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_XITRACS_SERVER")%>
                </div>
                <div class="pSection">
                    <asp:TextBox ID="XitracsServer" runat="server" Width="200" />
                    <span id="XitracsServerRequired" class="ValidationMessage" runat="server">
                        <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%>
                    </span>
                </div>
                <h5><%= Globalizer.GetGlobalizedString("TXT_XITRACS_DATAPORT_USERNAME")%></h5>
                <div class="pSection">
                    <asp:TextBox ID="XitracsDataportUsername" runat="server" Width="200" />
                    <span id="XitracsDataportUsernameRequired" class="ValidationMessage" runat="server">
                        <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%>
                    </span>
                </div>
                <h5><%= Globalizer.GetGlobalizedString("TXT_XITRACS_DATAPORT_PASSWORD")%></h5>
                <div class="pSection">
                    <asp:TextBox ID="XitracsDataportPassword" runat="server" Width="200" />
                    <span id="XitracsDataportPasswordRequired" class="ValidationMessage" runat="server">
                        <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%>
                    </span>
                </div>
                <h5><%= Globalizer.GetGlobalizedString("TXT_XITRACS_UPLOAD_BATCH_SIZE")%></h5>
                <div class="pSection">
                    <%= Globalizer.GetGlobalizedString("MSG_XITRACS_UPLOAD_BATCH_SIZE")%>
                </div>
                <div class="pSection">
                    <asp:TextBox ID="XitracsUploadBatchSize" runat="server" Width="100" />
                    <span id="XitracsUploadBatchSizeRequired" class="ValidationMessage" runat="server">
                        <%= Globalizer.GetGlobalizedString("TXT_FB_REQUIRED")%>
                    </span>
                </div>
            </div>
        </div>
    </td>
</tr>