<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Main_View.ascx.cs" Inherits="Jenzabar.CRM.Staff.Web.Portlets.EmploymentApplicationPortlet.Main_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="ps" TagName="PositionSearch" Src="~/Portlets/CRM/Staff/Common.Staff/Controls/PositionSearch.ascx" %>

<script language="javascript" type="text/javascript">function initIETOC(){};function resizeTheDiv(){}</script>
<jenzabar:ErrorDisplay id="error" Runat="server" />
<div id="divAdminLink" runat="server" visible="false">
	<table class="GrayBordered" align="center" cellpadding="3" border="0">
		<tr>
			<td align="center"><jenzabar:GlobalizedLabel ID="glblAdmin" runat="server" TextKey="TXT_EA_ADMIN_TEXT" />&nbsp;<jenzabar:GlobalizedLinkButton id="glnkAdmin" runat="server" TextKey="TXT_EA_CONFIGURE_SOME_SETTINGS" OnClick="glnkAdmin_Click" /></td>
		</tr>
	</table>
</div>
<div class="pSection" id="divHeader" runat="server">
    <asp:Literal ID="litContent" runat="server" />
</div>
<div class="pSection" id="divMessage" visible="False" runat="server"><asp:label id="lblMessage" Runat="server"></asp:label></div>

<div class="pSection" id="divMain" runat="server">
	<table cellspacing="0" cellpadding="0" width="50%">
		<tr id="trCcdMainSpacer" runat="server">
			<td>&nbsp;</td>
		</tr>
        <tr>
            <td>
                <table id="tblRecentApplications" runat="server" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <jenzabar:GlobalizedLabel ID="glblYourApplications" runat="server" TextKey="TXT_EA_YOUR_RECENT_APPLICATIONS" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Repeater ID="rApplications" runat="server">
                                <ItemTemplate>
                                    <asp:panel id="pApplication" runat="server" CssClass="EAApplication">
                                        <asp:LinkButton Text='<%# Eval("PositionTitle") %>' ID="lnkPositionDetail" runat="server" OnCommand="lbPosition_Command" CommandName="PositionID" CommandArgument='<%# Eval("ID") %>' CssClass="EAPositionTitle" /><br />
                                        <jenzabar:GlobalizedLabel ID="glblAppliedOn" runat="server" TextKey="TXT_EA_APPLIED_ON" CssClass="EALightText" />&nbsp;<asp:Label ID="lblApplicationDate" runat="server" Text='<%# ((DateTime)Eval("ReceivedDate")).ToShortDateString() %>' CssClass="EALightText" /><br />
                                        <asp:Literal ID="litStatus" runat="server" OnDataBinding="litStatus_DataBinding" />
                                    </asp:panel>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	<table cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td align="left">
                <div class="PositionRequestSearchPnlSearch EAMarginTopFive">
                    <ps:PositionSearch id="psSearch" runat="server" />
                </div>
			</td>
		</tr>
	</table>
</div>
