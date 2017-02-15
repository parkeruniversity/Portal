<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ContentAdd_View.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.CustomContentPortlet.ContentAdd_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="jics" tagname="TextEditor" src="~\UI\Controls\TextEditor.ascx" %>
<script language="JavaScript" src="<%= this.ResolveUrl("~/UI/Common/Scripts/jenz.js") %>"></script>
<script language="javascript">
<!--
	function toggleCheckbox(chkToToggle)
	{
		var relatedCheckbox = document.getElementById(chkToToggle);
		relatedCheckbox.checked = true;
	}
	
	function toggleRadioButton(radioToToggle)
	{
		var relatedRadio= document.getElementById(radioToToggle);
		relatedRadio.checked = true;
	}
	
	function validateTextBox(txtBox, chkToToggle)
	{
		var relatedCheckbox = document.getElementById(chkToToggle);
		if (txtBox.value == '')
		{
			relatedCheckbox.checked = false;
		}
	}
	
	function setRadioButtonVisibility(myself,rbLeft,rbRight,rbCenter)
	{
		if (myself.checked == true)
		{
			setRadios(rbLeft,rbRight,rbCenter, false);
		}
		else
		{
			setRadios(rbLeft,rbRight,rbCenter, true);
		}
	}
	
	function setRadios(rbLeft,rbRight,rbCenter,Disabled)
	{
		var tempRBLeft = document.getElementById(rbLeft);
		var tempRBRight = document.getElementById(rbRight);
		if (Disabled == true)
		{
			if ((tempRBLeft.checked == true) || (tempRBRight.checked == true))
			{
				document.getElementById(rbCenter).checked = true;
			}
			tempRBLeft.disabled = true;
			tempRBRight.disabled = true;
		}
		else
		{
			tempRBLeft.disabled = false;
			tempRBRight.disabled = false;
		}
	
	}
	

//-->
</script>
<div class="pSection">
<table>
	<tr>
		<td><cmn:subheader id="shPageTitle" runat="server"></cmn:subheader></td>
	</tr>
	<tr>
		<td>
			<div>
				<table>
					<tr>
						<td colSpan="2"><cmn:hint id="hntInstructions" runat="server"></cmn:hint></td>
					</tr>
					<tr>
						<td colSpan="2"><h5><asp:label id="lblHeaderHeader" Runat="server"></asp:label></h5></td>
					</tr>
					<tr>
						<td colSpan="2">
								<table>
									<tr>
										<td><asp:checkbox id="cbShowHeader" Runat="server" TextAlign="Right"></asp:checkbox></td>
									</tr>
									<tr>
										<td><cmn:formlabel id="flHeaderText" runat="server" forcontrol="txtHeaderText"></cmn:formlabel>&nbsp;
											<asp:textbox id="txtHeaderText" Runat="server" Size="35" MaxLength="255"></asp:textbox></td>
									</tr>
								</table>
						</td>
					</tr>
					<tr>
						<td colSpan="2"><h5><asp:label id="lblImageHeader" Runat="server"></asp:label></h5></td>
					</tr>
					<tr>
					    <td colspan="2"><cmn:Hint ID="hntLegacy" runat=server></cmn:Hint></td>
					</tr>
					<tr>
						<td colSpan="2">
								<table>
									<tr>
										<td colSpan="2"><asp:checkbox id="cbShowImage" Runat="server" TextAlign="Right"></asp:checkbox></td>
									</tr>
									<tr>
										<td colSpan="2"><cmn:formlabel id="flImage" runat="server" forcontrol="UFile"></cmn:formlabel>&nbsp;
											<asp:placeholder id="phUploadimage" runat="Server" Visible="False">
												<cmn:ErrorDisplay id="imgErrorDisplay" runat=Server></cmn:ErrorDisplay>
												<INPUT id="UFile" type="file" size="20" name="UFile" runat="server">
												<p><asp:label id="lblImageCriteria" Runat="server"></asp:label></p>
											</asp:placeholder>
											<asp:placeholder id="phDisplayImage" runat="Server" Visible="False">
<asp:Image id="imgElementImage" runat="Server"></asp:Image>&nbsp;&nbsp; 
<asp:Image id="imgDelete" Runat="server"></asp:Image>&nbsp; 
<asp:LinkButton id="lnkDeleteThisPhoto" Runat="Server"></asp:LinkButton> 
											</asp:placeholder>
										</td>
									</tr>
									<tr>
										<td><asp:label id="lblImagePlacement" Runat="server"></asp:label></td>
										<td>
											<ul>
												<li>
													<asp:radiobutton id="rbWithinLeftAlign" Runat="server" TextAlign="Right" GroupName="ImageAlign"></asp:radiobutton>
												<li>
													<asp:radiobutton id="rbWithinRightAlign" Runat="server" TextAlign="Right" GroupName="ImageAlign"></asp:radiobutton>
												<li>
													<asp:radiobutton id="rbAboveLeftAlign" Runat="server" TextAlign="Right" GroupName="ImageAlign"></asp:radiobutton>
												<li>
													<asp:radiobutton id="rbAboveCenterAlign" Runat="server" TextAlign="Right" GroupName="ImageAlign"></asp:radiobutton></li>
											</ul>
										</td>
									</tr>
								</table>
						</td>
					</tr>
					<tr>
						<td colSpan="2"><h5><asp:label id="lblTextHeader" Runat="server"></asp:label></h5></td>
					</tr>
					<tr>
						<td colSpan="2">
								<table>
									<!--<tr>
										<td colSpan="2"><asp:checkbox id="cbShowText" Runat="server" TextAlign="Right"></asp:checkbox></td>
									</tr>-->
                                    <tr>
										<td vAlign="top"><asp:label id="lblText" Runat="server"></asp:label></td>
										<td><jics:TextEditor id="Editor" runat="server" /></td>
									</tr>
									<tr>
										<td align="right" colSpan="2"><asp:label id="lblMaxChars" Runat="Server"></asp:label></td>
									</tr>
								</table>
						</td>
					</tr>
					<tr>
						<td align="left"><asp:button id="btnSave" Runat="server"></asp:button>&nbsp;<asp:button id="btnCancel" Runat="server"></asp:button></td>
					</tr>
				</table>
		</td>
	</tr>
</table>
			</div>
