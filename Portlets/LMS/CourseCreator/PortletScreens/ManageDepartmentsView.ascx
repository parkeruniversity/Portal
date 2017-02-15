<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageDepartmentsView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.PortletScreens.ManageDepartmentsView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<script language="javascript" type="text/javascript">

    function ConfirmDelete() {
        return confirm("<%= Globalizer.GetGlobalizedString("MSG_DELETE_DEPARTMENT") %>");
    }

</script>

<div class="pSection">
    <br />
    <img id="imgAddDepartment" src="ui/common/images/PortletImages/Icons/add.gif" /><a
        id="lnkAddDepartment" runat="server"><asp:Label ID="lblAddDepartment" runat="server" />
    </a>
    <br />
    <br />
    <asp:UpdatePanel ID="upDepartments" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvDepartments" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                Width="650px">
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Department" />
                    <asp:BoundField DataField="OrganizationCode" HeaderText="Code" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div id="divManageDepartment" runat="server">
                                <a id="lnkEditDepartment" runat="server">
                                    <img id="imgEdit" src="ui/common/images/PortletImages/Icons/edit.gif" />
                                </a>
                                <asp:ImageButton ID="btnDeleteDepartment" runat="server" ImageUrl="~/ui/common/images/PortletImages/Icons/delete.gif"
                                    OnClientClick="return ConfirmDelete()" />
                            </div>
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
