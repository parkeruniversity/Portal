<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainView.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.CustomizeSite.Themes.MainView" EnableViewState="false" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Import Namespace="Jenzabar.Portal.Framework.Web.UI.Themes"%>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>
<div class="themeAdmin" >
    <h4><%= Globalizer.GetString("TXT_PORTAL_DESIGN_THEMES")%></h4>
    <div class="pSection">
        <div class="currentThemeContainer">
            <h5><%= Globalizer.GetString("LBL_CURRENT_THEME") %></h5>
            <div class="theme currentTheme">      
                <div class="thumbnail">
                    <img src="<%=ActiveTheme.GetThumbnailPath()%>" alt="theme image" />
                </div>
                <h6>
                    <%=ActiveTheme.DisplayName%>
                </h6>
                <div id="divAuthor" runat="server" class="author">
                    by <%=ActiveTheme.Author%>
                </div>
                <div class="desc">
                    <%=ActiveTheme.Description%>
                </div>
                <div class="link">
                    <jics:ImageAndHyperLink ID="lnkReadMore" runat="server" TextKey="MSG_THM_READ_MORE" ToolTipKey="MSG_THM_READ_MORE" />
                </div>
                <div class="link">
                    <jics:ImageAndHyperLink ID="lnkDownload" runat="server" TextKey="MSG_THM_DL_FILES" ToolTipKey="MSG_THM_DL_FILES" />
                </div>
            </div>
            <div class="theme addTheme">
                <h6>
                    <%= Globalizer.GetString("TXT_UPLOAD_THEME")%>
                </h6>
                <div class="desc">
                    <%= Globalizer.GetString("MSG_UPLOAD_THEME") %>
                </div>
                <ul class="links">
                    <li>
                        <jics:ImageAndTextButton ID="lnkUpload" runat="server" TextKey="TXT_UPLOAD_THEME" ToolTipKey="TXT_UPLOAD_THEME" />
                    </li>
                    <li>
                        <jics:ImageAndTextButton ID="lnkHelp" runat="server" TextKey="TXT_HELP" ToolTipKey="TXT_HELP" />
                    </li>
                </ul>
                 <div class="desc">
                    <%= Globalizer.GetString("MSG_CREATE_NEW_THEME") %>
                </div>
                <div>
                    <jics:ImageAndTextButton ID="lnkAdd" runat="server" TextKey="TXT_CREATE_NEW_THEME" ToolTipKey="TXT_CREATE_NEW_THEME" />
                </div>               
            </div>
        </div>
        <div class="otherThemeContainer">
            <h5><%= Globalizer.GetString("LBL_OTHER_THEMES") %></h5>
            <asp:Repeater ID="rptThemes" runat="server">
                <ItemTemplate>
                    <div class="theme">
                        <div class="thumbnail">
                            <img class="thumbnail" src="<%#((Theme)Container.DataItem).GetThumbnailPath()%>" alt="theme image" />
                        </div>
                        <h6>
                            <%#((Theme)Container.DataItem).DisplayName%>
                        </h6>
                        <div id="divAuthor" runat="server" class="author">
                            by <%#((Theme)Container.DataItem).Author%>
                        </div>
                        <div class="desc">
                            <%#((Theme)Container.DataItem).Description%>
                        </div>
                        <ul class="links">
                            <li>
                                <jics:GlobalizedButton ID="gbUseThisTheme" runat="server" CommandName="MakeActive" 
                                CommandArgument="<%#((Theme)Container.DataItem).Name%>"  TextKey="TXT_USE_THEME" />
                            </li>
                            <li>
                                <jics:ImageAndHyperlink ID="lnkReadMore" runat="server" TextKey="TXT_READ_MORE" ToolTipKey="TXT_READ_MORE" />
                            </li>                       
                            <li>
                                <jics:ImageAndHyperLink ID="lnkPreview" Target="_blank" runat="server" TextKey="TXT_PREVIEW" ToolTipKey="TXT_PREVIEW" />
                            </li>
                            <li>
                                <jics:ImageAndHyperLink ID="lnkDownload" runat="server" TextKey="TXT_DOWNLOAD" ToolTipKey="TXT_DOWNLOAD" />
                            </li>
                            <li>
                                <jics:ImageAndTextButton ID="lnkDelete" CssClass="delete" runat="server" ToolTipKey="TXT_DELETE" TextKey="TXT_DELETE" CommandName="Delete" CommandArgument="<%#((Theme)Container.DataItem).Name%>" />
                            </li>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <jics:Paging ID="paging" runat="server" />
    </div>
</div>