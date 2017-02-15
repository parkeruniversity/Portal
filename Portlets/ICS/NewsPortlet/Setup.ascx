<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setup.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Setup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<cmn:SubHeader id="_hdrSetup" runat="server" ></cmn:SubHeader>
<div class="pSection newsSetup">

    <div class="section sectionTop">
        <h5><cmn:GlobalizedLabel ID="_glblRss" runat="server"></cmn:GlobalizedLabel></h5>
        <div class="sectionContent">
            <cmn:GlobalizedLabel CssClass="setupInfo" ID="_glblRssInfo" runat="server"></cmn:GlobalizedLabel>
            <div class="sectionRSS">
                <cmn:GlobalizedLabel ID="_glblRssTxt" runat="server"></cmn:GlobalizedLabel>  <cmn:GlobalizedCheckBox ID="_gcbxRss" runat="server" />
            </div>
        </div>
    </div>
    <div class="section">
        <h5><cmn:GlobalizedLabel ID="_glblDefault" runat="server"></cmn:GlobalizedLabel></h5>
        <div class="sectionContent">
            <cmn:GlobalizedLabel CssClass="setupInfo" ID="_glblDefaultInfo" runat="server"></cmn:GlobalizedLabel>
            <div class="selection">
                <cmn:GlobalizedLabel id="_glblEnableComments" runat="server" ></cmn:GlobalizedLabel>
                <cmn:GlobalizedCheckBox ID="_gcbxEnableComments" runat="server" />
            </div>
            <div  class="selection">
                <cmn:GlobalizedLabel id="_glblAttribution" runat="server"></cmn:GlobalizedLabel>
                <cmn:GlobalizedCheckBox ID="_gcbxAttribution" runat="server" />
            </div>
            <div  class="selection roleSelector">
                <cmn:GlobalizedLabel id="_glblShowTo" runat="server"></cmn:GlobalizedLabel>
                <jenz:PrincipalSelector ID="_pSelectorShowTo" runat="server"></jenz:PrincipalSelector>
            </div>
        </div>
    </div>
    <div class="section">
        <h5><cmn:GlobalizedLabel ID="_glblItemList" runat="server"></cmn:GlobalizedLabel></h5>
        <div class="sectionContent">
            <cmn:GlobalizedLabel CssClass="setupInfo" ID="_glblItemListInfo" runat="server"></cmn:GlobalizedLabel>
            <div class="itemList">
                <span style="float:left;display:block;">
                    <cmn:GlobalizedLabel ID="_glblFormat" runat="server"></cmn:GlobalizedLabel>
                </span>
                <div style="margin-left:20px;">
                    <asp:Image ID="_imgHeadline" runat="server" />
                    <br />
                    <cmn:GlobalizedRadioButton ID="_gradHeadline" runat="server" />
                </div>
                <div>
                    <asp:Image ID="_imgSummary" runat="server" />
                    <br />
                    <cmn:GlobalizedRadioButton ID="_gradSummary" runat="server" />
                </div>
                <div>
                    <asp:Image ID="_imgFull" runat="server" />
                    <br />
                    <cmn:GlobalizedRadioButton ID="_gradFull" runat="server" />
                </div>
            </div>
            <div class="displayCount" >
                <cmn:GlobalizedLabel ID="_glblNumber" runat="server"></cmn:GlobalizedLabel>
                <span style="margin-left:10px;">
                    <asp:Literal ID="_litDisplayFront" runat="server" /> <asp:TextBox ID="_txtDisplayCount" runat="server" MaxLength="3" Width="30px" /> <asp:Label AssociatedControlID="_txtDisplayCount" ID="_litDisplayBack" runat="server" />
                    <cc1:FilteredTextBoxExtender ID="_ftbDisplayCount" FilterMode="ValidChars" FilterType="Numbers" TargetControlID="_txtDisplayCount" runat="server">
                    </cc1:FilteredTextBoxExtender>
                </span>
            
            </div>
        </div>

    </div>
    <div class="section">
        <h5><cmn:GlobalizedLabel ID="_glblComment" runat="server"></cmn:GlobalizedLabel></h5>
        <div class="sectionContent">
            <cmn:GlobalizedLabel CssClass="setupInfo" ID="_glblCommentInfo" runat="server"></cmn:GlobalizedLabel>
            <div  class="selection  selComments roleSelector">
                <cmn:GlobalizedLabel id="_glblCommentsFrom" runat="server" ></cmn:GlobalizedLabel>
                <jenz:PrincipalSelector ID="_pSelectorComments" runat="server"></jenz:PrincipalSelector>
            </div>
        </div>
    </div>
    <div  style="clear:both;">
        <cmn:GlobalizedButton ID="_gbtnSave" runat="server" OnClick="_gbtnSave_Click" />
        &nbsp;&nbsp;
        <cmn:GlobalizedButton ID="_gbtnCancel" runat="server" OnClick="_gbtnCancel_Click" />
    </div>
</div>
