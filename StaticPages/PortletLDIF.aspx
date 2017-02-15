<%@ Page language="c#" Codebehind="PortletLDIF.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.Portal.Web.StaticPages.PortletLDIF" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html">
<TITLE>Portlet LDIF Generator</TITLE>
<asp:Literal id="BasePath" runat="Server" enableviewstate="false" />
</HEAD>
<body>
	<form runat="server" action="StaticPages/PortletLDIF.aspx">
	    <a href="StaticPages/DeveloperTools.aspx">Back to Developer Tools</a>          
		<h1>Portlet LDIF Generator</h1>
		<table>
			<tr>
				<td nowrap="true">
					Name (must be unique)
				</td>
				<td>
					<asp:TextBox ID="txtName" runat="server" /> ex: MyCoolPortlet
				</td>
			</tr>
			<tr>
				<td>
					Friendly Name
				</td>
				<td>
					<asp:TextBox ID="txtFName" runat="server" /> ex: My Cool Portlet
				</td>
			</tr>
			<tr>
				<td>
					Application
				</td>
				<td>
					<asp:TextBox ID="txtApp" runat="server" /> ex: ICS
				</td>
			</tr>
			<tr>
				<td nowrap>
					Path (Assembly,Namespace.Class)
				</td>
				<td>
					<asp:TextBox ID="txtPath" runat="server" Columns="100" /> ex: Portlet.MyCoolPortlet,Jenzabar.ICS.Web.Portlets.MyCoolPortlet.MyCoolPortlet
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<asp:Button ID="btnSubmit" Runat="server" Text="Insert" />
				</td>
			</tr>
		</table>
		<br />
		<!--
		<b>SQL Server Script (No longer necessary -- the framework will create the FWK_PortletTemplate automatically)</b>
		<pre>
INSERT INTO FWK_PortletTemplate (PortletTemplateID) VALUES ('<asp:literal ID="litGUID" runat="server" Text="{GUID}" />')
		</pre>
		-->
		<b>LDIF Script for ADAM (No whitespace allowed before or after script, return after objectCategory required)</b>
		<pre># START - <asp:literal ID="litFName1" runat="server" Text="{FRIENDLY NAME}" />
dn: CN=[<asp:literal ID="litApp1" runat="server" Text="{APPLICATION}" />] <asp:literal ID="litName" runat="server" Text="{NAME}" />,OU=PortletTemplates,CN=Portal,O=Jenzabar,C=US
changetype: add
jenzabar-ICSNET-GUID:: <asp:literal ID="litADAMGUID" runat="server" Text="{ADAM GUID}" />
objectClass: top
objectClass: jenzabar-ICSNET-PortletTemplate
displayName: <asp:literal ID="litFName" runat="server" Text="{FRIENDLY NAME}" />
jenzabar-ICSNET-PortletPath: <asp:literal ID="litPath" runat="server" Text="{PATH}" />
jenzabar-ICSNET-ApplicationPointer: CN=<asp:literal ID="litApp" runat="server" Text="{APPLICATION}" />,OU=PortalApplications,CN=Portal,O=Jenzabar,C=US
instanceType: 4
objectCategory: CN=Portlet-Template,CN=Schema,cn=configuration,cn=x

dn: OU=Operations,CN=[<asp:literal ID="litApp2" runat="server" Text="{APPLICATION}" />] <asp:literal ID="litName2" runat="server" Text="{NAME}" />,OU=PortletTemplates,CN=Portal,O=Jenzabar,C=US
changetype: add
objectClass: top
objectClass: organizationalUnit
instanceType: 4
objectCategory: CN=Organizational-Unit,CN=Schema,CN=Configuration,CN=X
# END - <asp:literal ID="litFName2" runat="server" Text="{FRIENDLY NAME}" />
</pre>
	</form>
</body>
</HTML>
