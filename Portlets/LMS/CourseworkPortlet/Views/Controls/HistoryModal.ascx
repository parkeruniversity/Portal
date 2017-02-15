<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HistoryModal.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.HistoryModal" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.CourseworkPortlet.Utils" %>
<%@ Register Src="../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<asp:HyperLink ID="_historyLink" CssClass="historyLink" runat="server" />
<div class="historyContainer">
    <lms:Modal id="_modal" runat="server">
	    <ContentArea>
		    <div class="history">
                <asp:GridView ID="_historyGrid" AutoGenerateColumns="false" UseAccessibleHeader="true" CssClass="groupedGrid cwkTableDisplay itemHover" AlternatingRowStyle-CssClass="alt" runat="server">
                    <Columns>
                        <asp:TemplateField>
		                    <ItemTemplate>
                                <img src="<%# ResolveUrl(CourseworkImgUtil.GetImageIconUrl(Eval("Icon").ToString())) %>" />
		                    </ItemTemplate>
	                    </asp:TemplateField>
                        <asp:TemplateField>
		                    <HeaderTemplate><%= Globalizer.GetString("TXT_ACTION") %></HeaderTemplate>
		                    <ItemTemplate>
                                <%# Eval("Action") %>
		                    </ItemTemplate>
	                    </asp:TemplateField>
                        <asp:TemplateField>
		                    <HeaderTemplate><%= Globalizer.GetString("TXT_NOTE") %></HeaderTemplate>
		                    <ItemTemplate>
		                        <%# Eval("Note") %>
		                    </ItemTemplate>
	                    </asp:TemplateField>
                        <asp:TemplateField>
		                    <HeaderTemplate><%= Globalizer.GetString("TXT_DATE") %></HeaderTemplate>
		                    <ItemTemplate>
                                <%# ((DateTime)Eval("Date")).ToString("g")%>
		                    </ItemTemplate>
	                    </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate><%= Globalizer.GetString("MSG_CWK_HST_NO_HISTORY") %></EmptyDataTemplate>
                </asp:GridView>
		    </div>
	    </ContentArea>
    </lms:Modal>
</div>