<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiDisplay.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.QuestionDisplay.MultiDisplay" %>
<%@ Register TagPrefix="cwk" TagName="RichText" Src="../RichTextDisplay.ascx" %>
<%@ Register TagPrefix="cmn" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<div class="multiDisplay">
	<asp:Repeater ID="_rptChoices" runat="server">
		<ItemTemplate>
			<div class="multiChoice">
				<asp:CheckBox ID="_cbx" runat="server" />
                <cmn:GroupRadioButton ID="_grb" runat="server" />
				<div class="multiContent">
					<cwk:RichText id="_rt" runat="server" />
				</div>
			</div>
		</ItemTemplate>
	</asp:Repeater>
</div>