<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Subscribe.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.NewsPortlet.Subscribe" %>
<%@ Register TagPrefix = "cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls"%>
<cmn:SubHeader id="_hdrSubscribe" runat="server"></cmn:SubHeader>
<div class="pSection newsSubscribe">
    <div>
	    <asp:Label CssClass="subInstruction" ID="_lblInstructions" runat="server"></asp:Label>
	</div>
	<div id="_divSubOptions" runat="server" class="subscribeOptions">
	    <asp:Label ID="_lblSubTxt" runat="server"></asp:Label>
	    <div>
	        <asp:CheckBox ID="_cbxMySub" runat="server" />
	        <asp:Panel ID="_panMySub" CssClass="mySubInfo" runat="server">
	            <asp:Literal ID="_litMySub" runat="server" />
	            <asp:LinkButton ID="_lbtnMySub" runat="server" OnClick="_lbtnMySub_Click" />
	        </asp:Panel>
	        <br />
	        <asp:CheckBox ID="_cbxEMail" runat="server" />
	        <br />
	        <asp:CheckBox CssClass="subCheckMesg" ID="_cbxMsgCenter" runat="server" />
	    </div>
	</div>
	<div runat="server" id="_divRss" class="rssContainer">
	    <div class="rssIconContainer" >
	        <asp:Image ID="_imgRss" runat="server" />
	    </div>
	    <div class="rssLinkContainer">
	        <asp:Label ID="_lblRssInstructions" runat="server"></asp:Label>
	        <br />
	        <asp:HyperLink ID="_hypRssLink" Font-Bold="true" runat="server" Target="_blank"></asp:HyperLink>
	    </div>
	</div>
	<div>
	    <asp:Button ID="_btnSubmit" runat="server" onclick="_btnSubmit_Click" />
	    &nbsp;&nbsp;
	    <asp:Button ID="_btnCancel" runat="server" onclick="_btnCancel_Click" />
	</div>
</div>