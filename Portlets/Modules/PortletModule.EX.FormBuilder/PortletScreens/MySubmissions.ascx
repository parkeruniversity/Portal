<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="MySubmissions.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.PortletScreens.MySubmissions" %>
<%@ Register src="UserControls/User_Submissions.ascx" tagname="User_Submissions" tagprefix="JICS" %>
<h4><asp:Literal ID="litPTitle" runat="server" /></h4>
<div class="FormBuilder">
	<div class="pSection">
        <asp:Repeater ID="rptrCats" runat="server">
            <HeaderTemplate>
                <table width="100%" border="0">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td colspan="2"><h5 style="padding:0px;margin:5px;"><b><%#DataBinder.Eval(Container.DataItem, "Name")%></b></h5></td>
                </tr>
                <asp:Repeater ID="rptrForms" runat="server" DataSource=<%#DataBinder.Eval(Container.DataItem, "FormCategories")%> >
                    <ItemTemplate>
                        <tr id="trFName" runat="server">
                            <td>&nbsp;</td>
                            <td><b><%#DataBinder.Eval(Container.DataItem, "Form.Name")%></b></td>
                        </tr>
                        <tr id="trFSubs" runat="server">
                            <td>&nbsp;</td>
                            <td>
                                <JICS:User_Submissions ID="_user_Submissions" Runat="server" FormName=<%#DataBinder.Eval(Container.DataItem, "Form.Name")%> />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>   
        </asp:Repeater>
        <asp:HyperLink ID="_backToMainScreenLink" runat="server" /><br /><br />
    </div>
</div>             