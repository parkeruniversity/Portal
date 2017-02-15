<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AddEditHiddenData_View.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Questions.AddEditHiddenData_View" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" namespace="Jenzabar.Common.Web.UI.Controls" assembly="Jenzabar.Common" %>
<%@ Register TagPrefix="JICS" TagName="SQLInstrux" Src="../Controls/DynamicSQLInstrux.ascx" %>
<%@ Import Namespace="Jenzabar.Common.Globalization"%>
<%@ Import Namespace="Jenzabar.FRM" %>
<script language="javascript" type="text/javascript">
    function hideShowReadOnly(i, val)
    {
        isSelectOne = (val == '<%=Globalizer.GetGlobalizedString("TXT_NONE")%>');
        isDashes = (document.getElementById("<%=this.ddlPrepopulate.ClientID%>").options[i].text == '<%=Globalizer.GetGlobalizedString("FB_STATIC_DASHES")%>');
        isNone = (isSelectOne || isDashes);
        isStatic = (val == '<%=Globalizer.GetGlobalizedString("FB_TXT_STATIC")%>');
        isDyn = (val == '<%=FRMConstants.PrepopDynamicSqlOption%>');
        prePopDDL = document.getElementById("<%=this.ddlPrepopulate.ClientID%>");
        divButtons = document.getElementById("<%=this.divButtons.ClientID%>");

        divButtons.style.display = "none";
        if (isNone)
        {
            prePopDDL.selectedIndex = 0;
            isStatic = true;
            $('#<%=this.divButtons.ClientID%>').fadeIn();
        }
        else
        {
            $('#<%=this.divButtons.ClientID%>').fadeIn();
        }
        disp = (isStatic) ? "block" : "none";
        
        if (isStatic)
        {
            $('#<%=this.divStatic.ClientID%>').fadeIn();
        }
        else
        {
            document.getElementById("<%=this.divStatic.ClientID%>").style.display = disp;
        }

        disp = (isDyn) ? "block" : "none";
        
        if (isDyn)
        {
            $('#<%=this.divDynamicSqlTextBox.ClientID%>').fadeIn();
        }
        else
        {
            document.getElementById("<%=this.divDynamicSqlTextBox.ClientID%>").style.display = disp;
        }
    }
    function setEnableValidators()
    {
        ddlPrepop = document.getElementById("<%=ddlPrepopulate.ClientID%>");
        switch (ddlPrepop.options[ddlPrepop.selectedIndex].value) {
            case '<%=Globalizer.GetGlobalizedString("FB_TXT_STATIC") %>':
                ValidatorEnable(document.getElementById("<%=rfvSql.ClientID %>"), false);
                break;
            case '<%=FRMConstants.PrepopDynamicSqlOption %>':
                ValidatorEnable(document.getElementById("<%=rfvValue.ClientID%>"), false);
                break;
            default:
                ValidatorEnable(document.getElementById("<%=rfvValue.ClientID%>"), false);
                ValidatorEnable(document.getElementById("<%=rfvSql.ClientID %>"), false);
                break;
        }
    }
</script>
<div class="FormBuilder">
	<div class="MainHeader MainHeaderSecondary">
		<h4><i><%= Globalizer.GetGlobalizedString("LBL_FORM_BUILDER") %></i>&nbsp;<asp:Literal ID="litFormName" Runat="server"></asp:Literal></h4>
	</div>
	<div class="pSection">
		<common:SuperBreadcrumbs ID="brdCrumbs" runat="server"></common:SuperBreadcrumbs>
		<h5><strong>
			<common:GlobalizedLiteral Runat="server" id="litAddEditHiddenData" TextKey="TXT_ADD_HIDDEN_DATA"></common:GlobalizedLiteral>
		</strong></h5>
		<fieldset>
			<div class="FormBuilder"><div class="ErrorMsg"><p><asp:literal id="litErrorMsg" Runat="server" Visible="False" /></p></div></div>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
				<TBODY>
					<tr>
						<td width="90">
							<common:GlobalizedLiteral Runat="server" TextKey="LBL_LABEL" />
						</td>
						<td>
							<asp:TextBox ID="tbLabel" Runat="server"></asp:TextBox> &nbsp; 
							<asp:RequiredFieldValidator ControlToValidate="tbLabel" Runat=server ID="rfvLabel"/>
						</td>
					</tr>
					<tr class="hiddenFB">
					    <td>Choose Type:</td>
					    <td>
					        <asp:DropDownList ID="ddlPrepopulate" Runat="server" DataTextField="Text" DataValueField="Value" />
                        </td>
					</tr>					
				</TBODY>
			</table>
			<div id="divStatic" runat="server">
			    <table cellSpacing="3" cellPadding="3" class="SmallText">
			        <tr>
						<td width="90">
							<common:GlobalizedLiteral ID="GlobalizedLiteral1" Runat="server" TextKey="LBL_VALUE" />
						</td>
						<td>
							<asp:TextBox ID="tbValue" Runat="server"></asp:TextBox> &nbsp; 
							<asp:RequiredFieldValidator ControlToValidate="tbValue" Runat=server ID="rfvValue" />
						</td>
					</tr>
			    </table>
			</div>
			<div id="divDynamicSqlTextBox" runat="server">
			    <div class="SmallText">
			        <br /><asp:Literal ID="litDynamicIntroTB" Runat="server" />&nbsp;
			        <JICS:SQLInstrux ID="_sqlInstruxTB" runat="server" />
			        <br />
			        <br /><%=Globalizer.GetGlobalizedString("TXT_ENTER_YOUR_SQL_STATEMENT")%> <asp:RequiredFieldValidator ID="rfvSql" runat="server" ControlToValidate="tbDynamicSqlTB" /><br />
			        <asp:TextBox ID="tbDynamicSqlTB" runat="server" TextMode="MultiLine" Height="50" Width="100%" Wrap="True" />			        
			    </div>
			</div>
			<table cellSpacing="3" cellPadding="3" class="SmallText">
			    <tr>
			        <td width="90">&nbsp;</td>
			        <td>
			            <div id="divButtons" runat="server">
			                <common:GlobalizedButton ID="btnSave" TextKey="TXT_SAVE" Runat="server" /> &nbsp; 
							<common:GlobalizedButton ID="btnCancel" TextKey="TXT_CANCEL" CausesValidation="False" Runat="server" />
			            </div>
			        </td>
			    </tr>
			</table>
		</fieldset>
	</div>
</div>