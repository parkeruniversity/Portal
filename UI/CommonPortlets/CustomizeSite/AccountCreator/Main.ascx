<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="Main.ascx.cs" Inherits="Jenzabar.Portal.Web.UI.CommonPortlets.Main" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="cmn" Namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common" %>
<%@ Import Namespace="Jenzabar.Portal.Web.UI.CommonPortlets" %>

<script language="javascript" type="text/javascript">
    <!--
        function USERCREATOR()
        {
            return{
                displayConfirmation: function displayConfirmation()
                {   
                    var hfCheckBoxesIDsValue= document.getElementById("<%= this.FindControl("hfCheckBoxesIDs").ClientID %>").value;
                    var checkBoxesIDs= hfCheckBoxesIDsValue.split(';');
                    var isSomeoneSelected= false;
                                
                    for(var i= 0; i< checkBoxesIDs.length- 1; i++)
                    {
                        if(document.getElementById(checkBoxesIDs[i]).checked=== true)
                        {
                            isSomeoneSelected= true;
                            break;
                        }
                    }
                    
                    if(isSomeoneSelected)
                    {                           
                        return confirm("<%= JavaScriptMethods.GetDeletePortalOnlyString() %>");            
                    }
                    else
                    {
                        alert("<%= JavaScriptMethods.GetNoUserDeleteString() %>");
                        return false;
                    }
                },
                
                toggleGridViewChks: function toggleGridViewChks(value)
                {
                    var hfCheckBoxesIDsValue= document.getElementById("<%= this.FindControl("hfCheckBoxesIDs").ClientID %>").value;
                    var checkBoxesIDs= hfCheckBoxesIDsValue.split(';'); 
                               
                    for(var i= 0; i< checkBoxesIDs.length- 1; i++)
                    {
                        document.getElementById(checkBoxesIDs[i]).checked= value;
                    }                       
                }
            };
        }
        
        var userCreator= new USERCREATOR();
    // -->
</script>

<cmn:subheader id="hdrAccountCreator" runat="server" />
<div class="pSection">
    <table cellspacing="0" style="border: 1px solid #432501;" cellpadding="10">
        <tr>
            <td style="width: 25%; background-color: #d6e2fb" align="center" valign="top">
                <table cellpadding="2">
                    <tr>
                        <td>
                            <asp:Image ID="ImgPlusSign" ImageUrl="~/UI/Common/Images/PortletImages/Icons/add_post.gif"
                                runat="server" />
                        </td>
                        <td>
                            <cmn:globalizedlinkbutton id="lnkAddAccount" textkey="TXT_ADD_AN_ACCOUNT" runat="server"></cmn:globalizedlinkbutton>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%; background-color: #efefef; padding: 10px; font-size: 10; border-left: 1px solid #432501"
                valign="middle">
                <cmn:globalizedlabel id="lblAddAccountNote" runat="server" textkey="TXT_ADD_AN_ACCOUNT_NOTE" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:PlaceHolder ID="plhMainSetup" runat="server">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="text-align: left; border: 1px solid #b2b2b2; background-color: #b2b2b2;
                    font-weight: bold; font-size: medium; margin: 0px; padding: 8px">
                    <cmn:globalizedlabel id="lblPortalOnlyAccounts" runat="server" textkey="TXT_PORTAL_ONLY_ACCOUNTS"></cmn:globalizedlabel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="upAccountCreatorMain" runat="server">
                        <ContentTemplate>
                            <asp:GridView ShowFooter="true" Font-Size="Small" BorderColor="#b2b2b2" CellPadding="8"
                                ID="gvAccounts" OnRowDataBound="gvAccounts_OnRowDataBound" runat="server" AutoGenerateColumns="False"
                                Width="100%">
                                <RowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-BorderColor="#b2b2b2" HeaderStyle-BorderColor="#b2b2b2"
                                        ItemStyle-Width="11" HeaderStyle-Font-Bold="False">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkCheckAll" onclick="userCreator.toggleGridViewChks(this.checked);"
                                                runat="server" />
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#b2b2b2" HeaderStyle-BorderColor="#b2b2b2"
                                        HeaderStyle-Font-Bold="False"></asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#b2b2b2" HeaderStyle-BorderColor="#b2b2b2"
                                        HeaderStyle-Font-Bold="False"></asp:TemplateField>
                                    <asp:TemplateField ItemStyle-BorderColor="#b2b2b2" HeaderStyle-BorderColor="#b2b2b2"
                                        HeaderStyle-Font-Bold="False"></asp:TemplateField>
                                    <asp:BoundField ItemStyle-BorderColor="#b2b2b2" HeaderStyle-BorderColor="#b2b2b2"
                                        HeaderStyle-Font-Bold="False" DataField="AdministratorDescription" />
                                </Columns>
                                <%--
                            Would of put Font-Bold in HeaderStyle tag below but its not being picked up on a workaround on the internet mention putting it in each TemplateField...
                        --%>
                                <HeaderStyle BackColor="#efefef" />
                                <AlternatingRowStyle BackColor="#efefef" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <cmn:globalizedbutton id="btnDeleteUsers" onclientclick="return userCreator.displayConfirmation();"
                        runat="server" textkey="TXT_DELETE_SELECTED_USERS" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfCheckBoxesIDs" runat="server" />
    </asp:PlaceHolder>
</div>
