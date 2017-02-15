<%@ Import namespace="Jenzabar.ICS" %>
<%@ Register TagPrefix="framework" namespace="Jenzabar.Portal.Framework.Web.UI.Controls" assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register TagPrefix="cmn" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Admin_Privacy_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MyInfoPortlet.Admin_Privacy_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<cmn:subheader id="shPrivacySettings" runat="server"></cmn:subheader>
	<div class="pSection">
	
		<cmn:GroupedGrid RenderTableHeaders="true" id="ggPrivacySettings" DataKeyField="PrivacyElementID" runat="server">
			<columns>
				<ASP:TEMPLATECOLUMN HeaderText="MYINFOPRIVACY">
					<ITEMTEMPLATE>
						<asp:CheckBox runat="server" ID="cbMakePublic"></asp:CheckBox>
					</ITEMTEMPLATE>
				</ASP:TEMPLATECOLUMN>
			</columns>
		</cmn:GroupedGrid>
		
		<cmn:GroupedGrid RenderTableHeaders="true" id="ggPrivacySettingsCons" DataKeyField="PrivacyElementID" runat="server" >
			<columns>
				<ASP:TEMPLATECOLUMN HeaderText="MYINFOPRIVACYCONS">
					<ITEMTEMPLATE>
						<asp:CheckBox Runat="server" ID="cbMakePublicCons" />
					</ITEMTEMPLATE>				
				</ASP:TEMPLATECOLUMN>
			</columns>		
		</cmn:GroupedGrid>

		<p style="MARGIN-TOP:10px;MARGIN-BOTTOM:10px"><asp:Literal ID="litAdminMsg" Runat="server" /><asp:CheckBox runat="server" ID="cbShowInDirectory"></asp:CheckBox></p>
		
		<div>
		<cmn:GlobalizedButton textkey="TXT_SUBMIT" id="btnUpdate" runat="server" />&nbsp;&nbsp;
		<cmn:GlobalizedButton textkey="TXT_CANCEL" id="btnCancel" runat="server" />
		</div>
	</div>

