<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ViewInterestsActivities.ascx.cs" Inherits="Jenzabar.CRM.AdmissionsOfficer.Web.Portlets.ViewCandidatePortlet.ViewInterestsActivities" %>
<%@ Register TagPrefix="jenzabar" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>

<h4><asp:label id="lblInterestsTitle" runat="server" Font-Bold="True"></asp:label></h4>
<div class="pSection">
<asp:label id="lblError" ForeColor="#ff0000" runat="server" Font-Bold="True"></asp:label>
<asp:datagrid id="dgInterests" runat="server" Width="100%" ShowHeader="True" AlternatingItemStyle-CssClass="alt"
	HeaderStyle-CssClass="header" FooterStyle-CssClass="header" ShowFooter="False" AutoGenerateColumns="False"
	GridLines="Vertical">
	<Columns>
		<asp:BoundColumn DataField="InterestCategoryDesc">
			<ItemStyle Wrap="False" Width="350px"></ItemStyle>
		</asp:BoundColumn>
		<asp:BoundColumn DataField="InterestDesc">
			<ItemStyle Wrap="False" Width="350px"></ItemStyle>
		</asp:BoundColumn>
		<asp:BoundColumn DataField="InterestBeginDate">
			<ItemStyle Wrap="False" Width="100px"></ItemStyle>
		</asp:BoundColumn>
		<asp:BoundColumn DataField="InterestEndDate">
			<ItemStyle Wrap="False" Width="100px"></ItemStyle>
		</asp:BoundColumn>
	</Columns>
</asp:datagrid>
<asp:Literal ID="litNoInterestMsg" Runat="server"></asp:Literal>
<br>
<h5><jenzabar:GlobalizedLiteral id="litNew" TextKey="TXT_VC_ADD_NEW" runat="server"></jenzabar:GlobalizedLiteral></h5>
<asp:datagrid id="dgNewInterests" runat="server" Width="100%" ShowHeader="True" AlternatingItemStyle-CssClass="alt"
	HeaderStyle-CssClass="header" FooterStyle-CssClass="header" ShowFooter="False" AutoGenerateColumns="False"
	GridLines="Vertical">
	<AlternatingItemStyle CssClass="alt"></AlternatingItemStyle>
	<HeaderStyle CssClass="header"></HeaderStyle>
	<FooterStyle CssClass="header"></FooterStyle>
	<Columns>
		<asp:TemplateColumn>
			<ItemStyle Wrap="False"></ItemStyle>
			<ItemTemplate>
				<asp:dropdownlist id="ddlCategory" runat="server" Width="350px" AutoPostBack="True" OnSelectedIndexChanged="dgNewInterests_SelectedIndexChanged"></asp:dropdownlist>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemStyle Wrap="False"></ItemStyle>
			<ItemTemplate>
				<asp:textbox ID="txtInterestDesc" MaxLength="50" Runat="server" Width="350px"></asp:textbox>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemStyle Wrap="False"></ItemStyle>
			<ItemTemplate>
				<asp:TextBox ID="txtInterestBeginDate" Runat="server" Width="100px"></asp:TextBox>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemStyle Wrap="False"></ItemStyle>
			<ItemTemplate>
				<asp:TextBox ID="txtInterestEndDate" Runat="server" Width="100px"></asp:TextBox>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:datagrid>
		
<p></p>
<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="100%" border="0">
	<TR>
		<TD><asp:button id="btnSubmit" runat="server"></asp:button>&nbsp;&nbsp;
			<asp:button id="btnCancel" runat="server"></asp:button></TD>
	</TR>
</TABLE>
<p></p>
<TABLE id="Table5" cellSpacing="0" cellPadding="0" width="100%" border="0">
	<TR>
		<TD><asp:LinkButton ID="lnkViewCandidate" Runat="server"></asp:LinkButton></TD>
	</TR>
</TABLE>
</div>
