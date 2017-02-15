<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditSubscription.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.EditSubscription" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<cmn:SubHeader id="_hdrSub" runat="server" ></cmn:SubHeader>
<div class="pSection newsEditSubscription">
<div>
    <cmn:GlobalizedLabel ID="_glblSubName" runat="server" TextKey="LBL_NEWS_SUB_NAME" />
    <asp:TextBox ID="_txtSubName" runat="server" MaxLength="255" />
    <asp:LinkButton ID="_lbtnResetName" runat="server" OnClick="_lbtnResetName_Click" />
</div>
<div>
    <cmn:GlobalizedLabel ID="_glblOriginal" runat="server" TextKey="LBL_NEWS_ORIGINAL" />
    <asp:HyperLink ID="_hypOriginal" runat="server" />
</div>
<div class="subActions">
    <div>
        <cmn:GlobalizedButton ID="_btnSave" runat="server" TextKey="TXT_SAVE" OnClick="_btnSave_Click" />
        &nbsp;&nbsp;
        <cmn:GlobalizedButton ID="_btnCancel" runat="server" TextKey="TXT_CANCEL" OnClick="_btnCancel_Click" />
    </div>
    <div class="subRemove" >
        <asp:Image runat="server" ID="_imgRemove" runat="server" />
        <asp:LinkButton ID="_lbtnRemove" runat="server" CssClass="subRemoveLink" OnClick="_lbtnRemove_Click" />
    </div>
    <div style="clear:both;float:none;"></div>
</div>
</div>