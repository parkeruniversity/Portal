<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Content.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Controls.Content" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Portal.Framework.Web" namespace="Jenzabar.Portal.Framework.Web.TextEditor" %>

<div id="newsContent">
    <div class="newsHeadline">
        <asp:Label ID="_lblHeadline" CssClass="contentTitle" runat="server" AssociatedControlID="_txtHeadline"></asp:Label><asp:TextBox ID="_txtHeadline" runat="server" MaxLength="255"></asp:TextBox>
    </div>
    <div class="newsPriority">
        <asp:Label ID="_lblPriority" runat="server"></asp:Label>
        <asp:RadioButton ID="_radRegular" runat="server" />
        <asp:RadioButton ID="_radHigh" CssClass="postPriority" runat="server" />
    </div>
    <div>
        <asp:Label CssClass="contentTitle" ID="_lblContent" runat="server"></asp:Label>
        <div class="textEditor">
            <cmn:TextEditorControl id="_txtContent" runat="server" MaxLength="100000" Columns="95"></cmn:TextEditorControl>
        </div>
    </div>
    
     <div>
        <table width="100%">
            <tr>
                <td class="imagesTitle" >
                    <cmn:GlobalizedLabel ID="_lblImages" TextKey="LBL_NEWS_IMAGES" runat="server"></cmn:GlobalizedLabel>
                </td>
                <td valign="top">
                    <asp:PlaceHolder ID="_phFileUpload" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
        </table>
     </div>

</div>

