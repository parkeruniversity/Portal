<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestionFileUpload.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Controls.QuestionFileUpload" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<div style="float:left;">
    <asp:Literal ID="litDebug" runat="server" />
    <asp:Repeater ID="rptrFiles" runat="server">
        <HeaderTemplate>
            <b><%= Globalizer.GetGlobalizedString("TXT_FB_TEMPLATE_FILES")%></b>
        </HeaderTemplate>
        <ItemTemplate>
            <div>
                <asp:Literal ID="SavedFileID" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Visible="false" runat="server" />
		        <asp:HyperLink ID="FileLink" 
				        NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Path") %>' 
				        Target="_blank" Runat="server">
			        <%# DataBinder.Eval(Container.DataItem, "Name") %>
		        </asp:HyperLink> 
		        (<%# DataBinder.Eval(Container.DataItem, "Size") %>)
	        </div>
        </ItemTemplate>
        <FooterTemplate>
            <br /><br />
        </FooterTemplate>
    </asp:Repeater>
    <div id="divMaxFileTXT" runat="server">
        You are allowed to upload <%=MaxFileNumber%> files
    </div>
    <div id="divFileUpload" runat="server">
        <input type="file" id="FileInput" runat="server" NAME="FileInput" /> &nbsp; 
        <common:GlobalizedButton ID="UploadButton" TextKey="FORMBUILDER_FORM_SETTINGS_BASIC_ADDFILE_TXT" CausesValidation="true" Runat="server" />
    </div>
    <asp:Repeater ID="rptrResponseFiles" runat="server">
        <HeaderTemplate>
            <b>My Submissions</b><br />
        </HeaderTemplate>
        <ItemTemplate>
            <div>
                <asp:Literal ID="SavedFileID" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Visible="false" runat="server" />
                <asp:HyperLink ID="FileLink" 
				        NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Path") %>' 
				        Target="_blank" Runat="server">
			        <%# DataBinder.Eval(Container.DataItem, "Name") %>
		        </asp:HyperLink> 
		        (<%# DataBinder.Eval(Container.DataItem, "Size") %>) 
		        <asp:LinkButton ID="DeleteButton" CommandName="Delete" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure to delete?');">
			        <asp:Image id="imgDeleteButton" Runat="server" ImageUrl="~/UI/Common/Images/PortletImages/Icons/delete.gif" AlternateText='<%# Jenzabar.Common.Globalization.Globalizer.GetGlobalizedString("TXT_DELETE") %>' />
		        </asp:LinkButton>
            </div> 
        </ItemTemplate>
        <FooterTemplate>
            <br />
        </FooterTemplate>
    </asp:Repeater>
</div>