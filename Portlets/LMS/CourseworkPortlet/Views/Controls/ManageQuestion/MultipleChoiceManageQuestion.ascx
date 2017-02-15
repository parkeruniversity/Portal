<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultipleChoiceManageQuestion.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ManageQuestion.MultipleChoiceManageQuestion" %>
<%@ Register Src="ChoiceManage.ascx" TagName="ChoiceManage" TagPrefix="cwk" %>
<%@ Register Src="../../../../Common/Controls/FeedbackEditor.ascx"  TagName="Feedback" TagPrefix="cwk" %>
<%@ Register Src="../../../../Common/Controls/Modal.ascx" TagName="Modal" TagPrefix="lms" %>
<div>
    <asp:Label ID="lblErrGeneral" runat="server" />
</div>
<div class="multiChoiceEditor">
	<asp:GridView ID="_gvMutli" EnableViewState='false' CssClass="questionTable" GridLines="None" AutoGenerateColumns="false" runat="server">
		<Columns>
			<asp:TemplateField>
				<ItemTemplate>
					<asp:HiddenField ID="_hideOrder" runat="server" />
					<asp:CheckBox ID="_cbxCorrect" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField>
				<ItemTemplate>
                    <asp:Label ID="lblErrOption" runat="server" />
					<cwk:ChoiceManage id="_choice" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField>
				<ItemTemplate>
					<asp:Panel ID="_panHiddenFeedback" style="display:none;" runat="server"></asp:Panel>
					<cwk:Feedback id="_feedback" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField >
				<ItemTemplate>
					<div id="_divCorrect" runat="server">
						<asp:Label ID="_lblCorrect" runat="server" />
					</div>
					<div id="_divPartial" runat="server">
                        <div><asp:Label ID="lblErrPartial" runat="server" /></div>
						<asp:Label ID="_lblWorth" runat="server" />
						<asp:TextBox ID="_txtPartial" CssClass="partialInput" runat="server" />
						<asp:Label ID="_lblPercent" runat="server" />
					</div>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField>
				<ItemTemplate>
					<asp:LinkButton ID="_lbtnClear" CssClass="clearButton" runat="server" />
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
</div>
<div class="questionOptions">
	<div>
		<asp:CheckBox ID="_cbxRandomize" runat="server" />
	</div>
	<div>
		<asp:CheckBox ID="_cbxPartial" AutoPostBack="true" runat="server" />
	</div>
	<div>
		<asp:CheckBox ID="_cbxLimit" runat="server" />
	</div>
</div>
<div >
    <asp:HyperLink runat="server" ID="_hypHelp" CssClass="helpLink" NavigateUrl="#"></asp:HyperLink>
    <lms:Modal id="_modal" runat="server">
	    <ContentArea>
            <div class="helpContent">
                <asp:Literal ID="_litInfo" runat="server" />
            </div>
        </ContentArea>
    </lms:Modal>
</div>