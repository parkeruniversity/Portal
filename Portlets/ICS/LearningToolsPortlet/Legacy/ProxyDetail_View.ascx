<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProxyDetail_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.ProxyDetail_View" %>
<div class="pSection">
    <p>
        <asp:LinkButton ID="lnkbtnExitTop" Text="Return to Main view" CommandName="Exit"
            Visible="true" runat="server" />
    </p>
    <hr />
    <p>
        <asp:LinkButton ID="lnkbtnSaveProxyTop" Text="Save ToolProxy" CommandName="Save"
            Visible="true" runat="server" />
    </p>
    <p>
        <asp:LinkButton ID="lnkButtonPlacementTop" Text="This Tool Placement..." CommandName="Placements"
            Visible="true" runat="server" />
    </p>
    <hr />
    <p>
        <asp:Label ID="lblToolCreator" runat="server" Text="Tool Proxy Creator: "></asp:Label>
    </p>
    <p>
        <asp:Literal ID="ltrl1" Text="<b>Tool Definitions</b>" runat="server"></asp:Literal>
    </p>
    <p>
        <asp:Label ID="lblToolName" runat="server" Text="Tool Name (required):  " />
        <asp:TextBox ID="tbToolName" runat="server" Size="50" Font-Bold="true"></asp:TextBox>
    </p>
    <asp:Table ID="tblProxy" runat="server" Visible="true">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblUri" runat="server" Text="URL for Tool (required):" /><br />
                <asp:TextBox ID="tbUri" size="60" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell>
                <asp:Label ID="lblKey" runat="server" Text="Key for OAuth signing:" /><br />
                <asp:TextBox ID="tbKey" size="60" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSecret" runat="server" Text="Secret for OAuth signing:" /><br />
                <asp:TextBox ID="tbSecret" Size="60" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblTCWide" runat="server" Text="e-Racer wide configuration of Tool?" />&nbsp;
                <asp:CheckBox ID="cbTCWide" Checked="true" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDescription" runat="server" Text="Tool Description:" /><br />
                <asp:TextBox ID="tbDescription" TextMode="MultiLine" Columns="60" Rows="5" runat="server">
                </asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAdvancedSettings" runat="server" Text="Advanced Settings" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="Tool_Display" runat="server">
            <asp:TableCell>
                <asp:Button ID="btnShowToolDisplayOptions" runat="server" BorderStyle="Solid" BorderWidth="1"
                    Font-Bold="true" Text="+" Visible="true" />
                <asp:Literal ID="Tool_Display_Header" Text="<b>Tool Display (Optional)</b>" runat="server"></asp:Literal>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="tblToolDisplayOptions" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblLinkText" runat="server" Text="Tool Link Text (overrides Tool Name)" /><br />
                            <asp:TextBox ID="tbLinkText" size="60" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLaunchPresentationDocumentTarget" runat="server" Checked="true"
                                Text="Send default LaunchPresentationDocumentTarget and display : " />
                            <asp:DropDownList ID="ddlLaunchPresentationDocumentTarget" runat="server">
                                <asp:ListItem Text="in new window" Value="window" Enabled="true"></asp:ListItem>
                                <asp:ListItem Text="in portlet frame" Value="iframe" Enabled="false"></asp:ListItem>
                                <asp:ListItem Text="in portlet main view" Value="frame" Enabled="true"></asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLaunchPresentationWidth" runat="server" Checked="false" Text="Send default Width for Launch Presentation:" />
                            <asp:TextBox ID="tbLaunchPresentationWidth" size="4" runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLaunchPresentationHeight" runat="server" Checked="false"
                                Text="Send default Height for Launch Presentation:" />
                            <asp:TextBox ID="tbLaunchPresentationHeight" size="4" runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="Tool_User_Parameters" runat="server">
            <asp:TableCell>
                <asp:Button ID="btnShowToolUserParameters" runat="server" BorderStyle="Solid" BorderWidth="1"
                    Font-Bold="true" Text="+" Visible="true" />
                <asp:Literal ID="Tool_User_Parameters_Header" Text="<b>Tool User Parameters (Optional)</b>"
                    runat="server"></asp:Literal>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="tblToolUserParameters" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLisPersonParameters_Email" runat="server" Checked="true"
                                Text="Send User email to Tool." />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLisPersonParameters_Names" runat="server" Checked="true"
                                Text="Send User names to Tool." />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLisPersonParameters_Roles" runat="server" Checked="true"
                                Text="Send User roles to Tool." />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="Tool_Parameters" runat="server">
            <asp:TableCell>
                <asp:Button ID="btnShowToolParameters" runat="server" BorderStyle="Solid" BorderWidth="1"
                    Font-Bold="true" Text="+" Visible="true" />
                <asp:Literal ID="Tool_Parameters_Header" Text="<b>Miscellaneous Tool Parameters (Optional)</b>"
                    runat="server"></asp:Literal>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="tblToolParameters" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLaunchPresentationLocale" runat="server" Checked="false"
                                Text="Send default Locale for Launch Presentation" />
                            <asp:TextBox ID="tbLaunchPresentationLocale" size="20" runat="server" Text="en_us_variant">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendLaunchPresentationReturnUrl" runat="server" Checked="false"
                                Text="Send default Return Url for Launch Presentation" />
                            <asp:TextBox ID="tbLaunchPresentationReturnUrl" size="60" runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendToolConsumerInstanceName" runat="server" Checked="false"
                                Text="Send e-Racer Name sent to Tool:" />
                            <asp:TextBox ID="tbToolConsumerInstanceName" size="60" runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendToolConsumerInstanceDescription" runat="server" Checked="false"
                                Text="Send e-Racer Description sent to Tool" /><br />
                            <asp:TextBox ID="tbToolConsumerInstanceDescription" TextMode="MultiLine" Columns="60"
                                Rows="5" runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendToolConsumerInstanceContactEmail" runat="server" Checked="false"
                                Text="Contact Email sent to Tool:" />
                            <asp:TextBox ID="tbToolConsumerInstanceContactEmail" size="60" runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendCustomParameters" runat="server" Text="Send additional Tool-required Custom Parameters. "
                                Checked="false" />
                            <asp:Label ID="lblCustomParameters" runat="server" Text="Enter parameters one to a line, in name = value format (without quotes). If the name or value includes an equality sign (=) it should be entered escaped as %3D." /><br />
                            <asp:TextBox ID="tbCustomParameters" TextMode="MultiLine" Columns="60" Rows="5" runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBox ID="cbSendExtensionsParameters" runat="server" Text="Send additional Tool-required Extensions Parameters. "
                                Checked="false" />
                            <asp:Label ID="lblExtensionsParameters" runat="server" Text="Enter parameters one to a line, in name = value format (without quotes). If the name or value includes an equality sign (=) it should be entered escaped as %3D." /><br />
                            <asp:TextBox ID="tbExtensionsParameters" TextMode="MultiLine" Columns="60" Rows="5"
                                runat="server">
                            </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</div>
