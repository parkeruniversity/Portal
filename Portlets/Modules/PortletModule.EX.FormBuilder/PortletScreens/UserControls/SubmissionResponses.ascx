<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmissionResponses.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.UserControls.SubmissionResponses" %>
<b><asp:Literal ID="litSName" runat="server" /></b>
<asp:Repeater ID="_questionResponsesRepeater" runat="server">
    <HeaderTemplate>
        <table>
    </HeaderTemplate>
    <ItemTemplate>
            <tr>
                <td colspan="4"><asp:Literal ID="litHeaderTxt" runat="server" /> </td>
            </tr>
            <tr>
                <td align="right" valign="top"><asp:Literal ID="litQOrder" runat="server" /></td>
                <td valign="top"><asp:Literal ID="litQText" runat="server" /></td>
                <td valign="top"><asp:Literal ID="litValue" runat="server" />
                
                    <asp:Repeater ID="rptrUploadFiles" runat="server">
                        <ItemTemplate>
                            <div>
                                <asp:HyperLink ID="FileLink" 
				                NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Path") %>' 
				                Target="_blank" Runat="server">
			                        <%# DataBinder.Eval(Container.DataItem, "Name") %>
		                        </asp:HyperLink> 
		                        (<%# DataBinder.Eval(Container.DataItem, "Size") %>)
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater> 