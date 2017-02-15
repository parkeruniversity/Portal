<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarSchedule.ascx.cs" Inherits="Jenzabar.LMS.Portlets.AllMyCoursesPortlet.Views.Controls.CalendarSchedule" %>
<asp:GridView ID="_gv" runat="server" AutoGenerateColumns="false" Width="100%" CellPadding="0" CellSpacing="0" GridLines="None">
    <Columns>
        <asp:TemplateField HeaderStyle-CssClass="hourColLeft" ItemStyle-Width="3%">
            <ItemTemplate>
                <asp:Literal ID="_litTime" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litTimeA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sun" HeaderStyle-CssClass="schedDayTitle" ItemStyle-Width="13%" FooterStyle-CssClass="bottomDays">
            <ItemTemplate>
                <asp:Literal ID="_litSun" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litSunA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mon" HeaderStyle-CssClass="schedDayTitle" ItemStyle-Width="13%" FooterStyle-CssClass="bottomDays">
            <ItemTemplate>
                <asp:Literal ID="_litMon" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litMonA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tue" HeaderStyle-CssClass="schedDayTitle" ItemStyle-Width="13%" FooterStyle-CssClass="bottomDays">
            <ItemTemplate>
                <asp:Literal ID="_litTue" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litTueA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Wed" HeaderStyle-CssClass="schedDayTitle" ItemStyle-Width="13%" FooterStyle-CssClass="bottomDays">
            <ItemTemplate>
                <asp:Literal ID="_litWed" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litWedA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thu" HeaderStyle-CssClass="schedDayTitle" ItemStyle-Width="13%" FooterStyle-CssClass="bottomDays">
            <ItemTemplate>
                <asp:Literal ID="_litThu" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litThuA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Fri" HeaderStyle-CssClass="schedDayTitle" ItemStyle-Width="13%" FooterStyle-CssClass="bottomDays">
            <ItemTemplate>
                <asp:Literal ID="_litFri" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litFriA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sat" HeaderStyle-CssClass="schedDayTitle" ItemStyle-Width="13%" FooterStyle-CssClass="bottomDays">
            <ItemTemplate>
                <asp:Literal ID="_litSat" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litSatA" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
        <asp:TemplateField HeaderStyle-CssClass="hourColRight" ItemStyle-Width="3%">
            <ItemTemplate>
                <asp:Literal ID="_litTime2" runat="server" />
            </ItemTemplate>
            <AlternatingItemTemplate>
                <asp:Literal ID="_litTime2A" runat="server" />
            </AlternatingItemTemplate>
            <FooterTemplate />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<br /><br />