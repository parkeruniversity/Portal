<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageTermsView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.PortletScreens.ManageTermsView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script language="javascript" type="text/javascript">

    function ConfirmDelete() {
        return confirm("<%= Globalizer.GetGlobalizedString("MSG_DELETE_TERM") %>");
    }

</script>

<div class="pSection">
    <br />
    <img id="imgAddTerm" src="ui/common/images/PortletImages/Icons/add.gif" /><a id="lnkAddTerm"
        runat="server"><asp:Label ID="lblAddTerm" runat="server" />
    </a>
    <br />
    <br />
    <asp:UpdatePanel ID="upTerms" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvTerms" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                Width="650px">
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Term" />
                    <asp:BoundField DataField="TermCode" HeaderText="Term Code" />
                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <asp:Label ID="lblStartDate" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Date">
                        <ItemTemplate>
                            <asp:Label ID="lblEndDate" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Number of Sections">
                      <ItemTemplate>
                        <asp:Label ID="lblNumberOfSections" runat="server" />
                      </ItemTemplate>
                    </asp:TemplateField>
                    
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDeleteTerm" runat="server" ImageUrl="~/ui/common/images/PortletImages/Icons/delete.gif"
                                OnClientClick="return ConfirmDelete()" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1D50AA" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <a id="lnkBackToMainScreen" runat="server">
        <asp:Label ID="lblBackToMainScreen" runat="server" />
    </a>
</div>
