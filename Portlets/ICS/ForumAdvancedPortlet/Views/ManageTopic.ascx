<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageTopic.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.ForumPortlet.Views.ManageTopic" %>
<%@ Register TagPrefix="cmn" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="jenz" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" Assembly="Jenzabar.Portal.Framework.Web" %>
<%@ Register src="Controls/Access.ascx" tagname="Access" tagprefix="JICS" %>
<%@ Register src="Controls/DateSelector.ascx" tagname="DateSelector" tagprefix="JICS" %>
<%@ Register src="Controls/TruncateText.ascx" tagname="Truncate" tagprefix="JICS" %>
<%@ Register TagPrefix="jics" Namespace="Jenzabar.Portal.Framework.Web.TextEditor" Assembly="Jenzabar.Portal.Framework.Web" %> 

<script language="javascript" type="text/javascript">
    $(document).ready(function () {

        $("input:radio[name='<%=_rblModeration.UniqueID%>']").click(function () { if ($(this).val() == "NoModeration") { $('#<%=_divModSelector.ClientID%>').hide('normal'); } else { $('#<%=_divModSelector.ClientID %>').show('normal'); } });
        $("input:radio[id='<%=_radPrivate.ClientID%>']").click(function () { $('#<%=_divModSection.ClientID%>').slideToggle('slow'); });
        $("input:radio[id='<%=_radPostFirst.ClientID%>'],input:radio[id='<%=_radNoPrivacy.ClientID%>']").click(function () { $('#<%=_divModSection.ClientID%>').show('slow'); });
    });
</script>


<JICS:Truncate id="_truncate" CtrToTruncateID="_lblCatDescrip" runat="server" />
 <div class="navHeader navHeaderTopic">
    <asp:Label ID="_lblCatName" runat="server" CssClass="navTitle" />
    <asp:Label ID="_lblCatDescrip" runat="server" CssClass="navSubTitle" />
 </div>
<div class="manageOuterContainer">
    <div class="manageContainer">
        <div class="manageTitle">
            <asp:Label ID="_lblTitle" runat="server" />
        </div>
            <div class="manageNameDescrip">
                <div class="manageIcon">
                    <asp:Image ID="_imgFolder" runat="server" />
                </div>
                <div class="manageName">
                    <asp:Label ID="_lblName" CssClass="selTitle" AssociatedControlID="_txtName" runat="server" />
                    <asp:TextBox ID="_txtName" runat="server" MaxLength="250" TabIndex="1" />
                </div>
                <div class="manageDescrip topic">
                    <div class="label">
                        <asp:Label ID="_lblDescription" CssClass="selTitle" runat="server" /> 
                        <asp:Label ID="_lblDescripMaxChar" CssClass="catDescrip" runat="server" />
                    </div>
                    <jics:TextEditorControl id="_txtDescription" runat="server" Columns="95" ></jics:TextEditorControl>
                </div>
            </div>
        <div class="manageArea" id="_divAssessAssignment" runat="server">
            <div class="facultyManageTopicContent">
                <asp:Label ID="_lblAssignmentTitle" CssClass="facultyManageTopicTitle" runat="server" />
                <div id="_divCreateNewAssignment" runat="server">
                    <asp:Label ID="_lblCreateNewAssignment" runat="server" />
                </div>
                <div id="_divExistingAssignment" runat="server">
                    <asp:Label ID="_lblAssignmentLink" runat="server" />
                    <asp:Label ID="_lblAssignmentSettingsLink" CssClass="facultyManageTopicLink" runat="server" />
                </div>
            </div>
        </div>
        <div class="manageArea">
            <asp:Label ID="_lblActiviation" runat="server" CssClass="selTitle" />
                <div class="manageSelection">
                    <JICS:DateSelector id="_dateSelector" runat="server" />
                </div>
        </div>
        <div class="manageArea">
            <asp:Label runat="server" ID="_lblRestriction" AssociatedControlID="_ddlRestriction" CssClass="selTitle" ></asp:Label>
            <div class="manageSelection">
                <asp:DropDownList runat="server" ID="_ddlRestriction" style="float:left;"></asp:DropDownList>
                <asp:Label runat="server" ID="_lblRestrictInfo" CssClass="restrictInfo"></asp:Label>
                            
            </div>
        </div>
        <JICS:Access id="_access" runat="server" />
        <div class="manageArea">
            <asp:Label id="_lblPrivateTopic" CssClass="selTitle" runat="server" />
            <div class="manageSelection">
                <asp:RadioButton ID="_radNoPrivacy" GroupName="privacy" runat="server" />
            </div>
            <div class="manageSelection">
                <asp:RadioButton ID="_radPostFirst" GroupName="privacy" runat="server" />
            </div>
            <div class="manageSelection">
                <asp:RadioButton ID="_radPrivate" GroupName="privacy" runat="server" />
            </div>
            <div class="manageSelection manageSpacer">
                <asp:CheckBox ID="_cbxMod"  runat="server" />
            </div>
        </div>

        <div id="_divModSection" runat="server" class="manageArea">
            <asp:Label ID="_lblModeration"  CssClass="selTitle" runat="server" />
            <div class="manageSelection">
                    <asp:RadioButtonList ID="_rblModeration" runat="server" />
                    <div id="_divModSelector" runat="server">
                        <jenz:PrincipalSelector id="_pSelectModerator" runat="server" ></jenz:PrincipalSelector>    
                    </div>
            </div>
        </div>

        <div class="actionButtons">
            <asp:Button id="_btnSave" runat="server" TabIndex="6" Font-Bold="true" />
            <asp:Button ID="_btnCancel" runat="server" CausesValidation="False" TabIndex="7" />
        </div>
    </div>
</div>

<cmn:Mirror id="_mirBreadcrumbs" ControlID="_panBreadcrumbs" runat="server" />
