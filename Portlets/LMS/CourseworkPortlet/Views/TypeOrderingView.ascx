<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TypeOrderingView.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.TypeOrderingView" %>
<%@ Register TagPrefix="framework" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<div class="cwkBorderButtonBar top">
	<framework:PortalImageAndHyperLink ID="_pihBack" ImageCategory="PortletIcon"  runat="server" />
</div>
<asp:Label ID="_lblHeader" runat="server" CssClass="cwkHeader" />
<div class="pSection">
    <asp:UpdatePanel ID="_updatePanel" runat="server">
	    <ContentTemplate>
		    <asp:Label id="_lblOrg" runat="server" /> <asp:RadioButtonList ID="_rblOrg" AutoPostBack="true" EnableViewState="true" runat="server" />
            <asp:UpdateProgress id="UpdateProgress1" runat="server" AssociatedUpdatePanelID="_updatePanel">
	            <ProgressTemplate>
		            <span>
			            <img src="UI/Common/Images/PortletImages/Icons/ajax_loader_small.gif" alt="loading" /> Loading...
		            </span>
	            </ProgressTemplate>
            </asp:UpdateProgress>
            <div class="assignReorderContainer">
                <table class="assignmentGrid reorderHeader" cellpadding="0" width="100%" runat="server" id="_tblHeader"  cellspacing="0">
			        <tr>
				        <th class="assignMetaNameHeader" > <asp:Literal ID="_litHeaderName" runat="server" /> </th>
			        </tr>
		        </table>
                <ajax:ReorderList ID="_reorderTypes" CssClass="reorderList" AllowReorder="true" DragHandleAlignment="Left" PostBackOnReorder="true" runat="server">
				    <ItemTemplate>
                        <table class="reorderAssignment" cellpadding="0" cellspacing="0" runat="server" id="_tblReorder">
						    <tr>
							    <td class="assignMetaName">
								    <asp:Literal ID="_litName" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <DragHandleTemplate>
					    <div class="dragHandle" id="_divDrag" runat="server">
						    &nbsp;
					    </div>
				    </DragHandleTemplate>
				    <ReorderTemplate>
					    <div class="dragReorder"></div>
				    </ReorderTemplate>
                </ajax:ReorderList>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HyperLink ID="hlDoneReordering" runat="server" />
</div>