<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OnlineAssignmentAttempts.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.StudentAssignmentDetails.OnlineAssignmentAttempts" %>
<%@ Register TagPrefix="JICS" TagName="OnlineAssignmentAttemptDetails" Src="OnlineAssignmentAttemptDetails.ascx" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:UpdatePanel runat="server" ID="upOnlineAssignmentAttempts">
    <ContentTemplate>
		<asp:HiddenField ID="_hAttempt" runat="server" />
        <ul class="onlineAssignmentAttempts" runat="server" id="_ulAttempts">
            <asp:Repeater runat="server" ID="rptrAttempts" OnItemDataBound="rptrAttempts_ItemDataBound" OnItemCommand="rptrAttempts_ItemCommand">
                <ItemTemplate>
                    <li runat="server" id="liAttempt">
                        <asp:LinkButton runat="server" ID="lbAttempt" Text='<%#DataBinder.Eval(Container.DataItem, "Title")%>'
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem, "AttemptNumber") %>' CommandName="ChangeTab" />
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <asp:Panel runat="server" ID="_panDdlAttempts" CssClass="onlineAssignmentAttempts" >
            <asp:Label runat="server" ID="_lblAttempt"></asp:Label>
            <asp:DropDownList runat="server" ID="_ddlAttempts" AutoPostBack="true" ></asp:DropDownList>
            <asp:Label runat="server" ID="_lblAttemptDescrip"></asp:Label>
        </asp:Panel>
            
        <JICS:OnlineAssignmentAttemptDetails runat="server" ID="studentAssignmentAttempt" />
    </ContentTemplate>
</asp:UpdatePanel>