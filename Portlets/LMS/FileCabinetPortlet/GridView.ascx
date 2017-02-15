<%@ Control Language="c#" AutoEventWireup="false" Codebehind="GridView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.FileCabinetPortlet.GridView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<%@ Register TagPrefix="JenzabarHtmlControls" Namespace="Jenzabar.Common.Web.UI.Controls.HtmlControls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="fwk" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="prt" Namespace="Jenzabar.Portal.Web.UI.Controls" Assembly="Jenzabar.Portal.Web" %>

<link rel="Stylesheet" type="text/css" href="Portlets/LMS/CourseworkPortlet/Style/CourseworkPortletStyle.aspx" />

<fwk:BreadCrumbSubHeader id="hdrViewTitle" runat="server" EnableViewState="false">
    <JenzabarHtmlControls:HtmlAnchorWithImage id="LNK_up" runat="server" TextKey="TXT_UP_ONE_LEVEL" IconSource="/UI/Common/Images/PortletImages/Icons/up_one_level.gif" />
</fwk:BreadCrumbSubHeader>




<div class="pSection">


    <asp:placeholder id="phGrid" runat="server" />
    
    
    <prt:Paging id="PagingControl" runat="server" />


<div id="divAreaMove" class="cwkCancelButtonBar"></div>
<div id="divAreaDelete" class="cwkSaveButtonBar"></div>



    <div class="actions">
	    <cmn:MoveDelete id="ctrlMoveDelete" runat="server" DataKeyField="ID" DataTextField="DisplayName" />
	    <div class="addStuff">
	        <JenzabarHtmlControls:HtmlAnchorWithImage id="lnkAddFolder" runat="server" Visible="false" ToolTipKey="MSG_FC_CREATE_NEW_FOLDER" TextKey="TXT_CREATE_A_NEW_FOLDER" IconSource="/UI/Common/Images/PortletImages/Icons/folder_add.gif" />
	        <JenzabarHtmlControls:HtmlAnchorWithImage id="lnkAddItem" runat="server" />
	    </div>
    </div>
</div>

