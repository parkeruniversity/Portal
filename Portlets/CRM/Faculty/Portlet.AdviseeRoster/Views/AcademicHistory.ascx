<%@ Control Language="c#" AutoEventWireup="True" Codebehind="AcademicHistory.ascx.cs" Inherits="Jenzabar.CRM.Faculty.Web.Portlets.AdviseeRosterPortlet.AcademicHistory" %>
<%@ Register TagPrefix="jenzabar" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<%@ Import namespace="Jenzabar.Portal.Framework" %>
<jenzabar:errordisplay id="errDisplay" Runat="server"></jenzabar:errordisplay>
<h4><jenzabar:GlobalizedLiteral id="litForAdvisee" runat="server"></jenzabar:GlobalizedLiteral></h4>
<div class="pSection">
	<jenzabar:groupedgrid id="dgEdu" runat="server" RenderTableHeaders="true" ShowHeader="true">
		<TableHeaderTemplate>
			<jenzabar:GlobalizedLiteral id="litEducation" runat="server" TextKey="TXT_EDUCATION"></jenzabar:GlobalizedLiteral>
		</TableHeaderTemplate>
		<EmptyTableTemplate>
			<%=base.strNoEduData%>
		</EmptyTableTemplate>
		<Columns>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_INSTITUTION" DataField="InstitutionName" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_DEGREE" DataField="Degree" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_MAJOR" DataField="MajorDesc" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_GPA" DataField="GPA" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_GRAD_DATE" DataField="GraduationDate" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_TRANSCRIPT" DataField="AcademicTranscript" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
		</Columns>
	</jenzabar:groupedgrid>
	
	<jenzabar:groupedgrid id="dgExam" runat="server" RenderTableHeaders="true" ShowHeader="true">
		<TableHeaderTemplate>
			<jenzabar:GlobalizedLiteral id="litExam" runat="server" TextKey="TXT_EXAMS"></jenzabar:GlobalizedLiteral>
		</TableHeaderTemplate>
		<EmptyTableTemplate>
			<jenzabar:GlobalizedLiteral id="glitNoRecords" runat="server" TextKey="TXT_AR_NO_EXAM_DATA"></jenzabar:GlobalizedLiteral>
		</EmptyTableTemplate>
		<Columns>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_EXAM" DataField="TestName" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedBoundColumn HeaderTextKey="TXT_DATE" DataField="TestDate" ItemStyle-VerticalAlign="Top"></jenzabar:GlobalizedBoundColumn>
			<jenzabar:GlobalizedTemplateColumn HeaderTextKey="TXT_SCORES">
			<ItemTemplate>
				<asp:Label ID="lblCompScore" Runat="server" Text='<%# Globalizer.GetGlobalizedString("TXT_COMPOSITE") + ": " + DataBinder.Eval(Container.DataItem, "CompositeScore")%>' Visible='<%# DataBinder.Eval(Container.DataItem, "CompositeScore").ToString() != string.Empty%>'></asp:Label>
				<asp:DataList ID="lstScores" Runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "TestElement")%>'>
					<ItemTemplate>
						<asp:Label ID="lblExam" Runat="server"><%# (DataBinder.Eval(Container.DataItem, "TestElementName")!=null && DataBinder.Eval(Container.DataItem, "TestElementName")!="")? DataBinder.Eval(Container.DataItem, "TestElementName") + ": " : ""%></asp:Label><asp:Label ID="lblScore" Runat="server"><%# DataBinder.Eval(Container.DataItem, "TestElementScore")%></asp:Label>
					</ItemTemplate>
				</asp:DataList>
			</ItemTemplate>
			</jenzabar:GlobalizedTemplateColumn>
		</Columns>
	</jenzabar:groupedgrid>
</div>
