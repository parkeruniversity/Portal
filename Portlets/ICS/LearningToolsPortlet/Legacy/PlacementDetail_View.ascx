<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlacementDetail_View.ascx.cs"
    Inherits="Jenzabar.ICS.Web.Portlets.LearningToolsPortlet.PlacementDetail_View" %>
<script type="text/javascript" src="Portlets/ICS/LearningToolsPortlet/ToolConsumer.js"></script>
<div class="pSection">
    <p>
        <asp:LinkButton ID="lnkButtonSavePlacementTop" Text="Save Tool Placement" CommandName="Save"
            Visible="true" runat="server" />
    </p>
    <p>
        <asp:LinkButton ID="lnkButtonReturnTop" Text="Tool Proxy Detail View..." CommandName="ReturnToToolProxy"
            Visible="false" runat="server" />
        <br />
    </p>
    <asp:LinkButton ID="lnkDeletePlacement" runat="server" Text="Delete this Tool Placement" />
    <p style="text-align: center">
        <asp:Label ID="lblToolName" runat="server" Text="" Font-Bold="false" />
    </p>
    <p>
        <asp:Label ID="lblProxyCreator" runat="server" Text="" Font-Bold="false" />
    </p>
    <p>
        <asp:Label ID="lblPlacementCreator" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <asp:Table ID="tblPlacement" runat="server" Visible="true">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Table BorderWidth="1" ID="tblContextParameters" runat="server" Visible="true">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblExplanation" runat="server" Text="Different tools may expect to receive different context-related parameters.<br />Note: null parameter values are never sent to the tool, even if the Send option is checked." />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendContextId" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send Context Id:" Value="Send" Selected="True"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Label ID="lblContextId" runat="server" Text="" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendContextType" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send Context Type:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:DropDownList ID="ddlContextType" runat="server">
                                    <asp:ListItem Text="CourseSection" Value="urn:lti:context-type:ims/lis/CourseSection"
                                        Enabled="true"></asp:ListItem>
                                    <asp:ListItem Text="Group" Value="urn:lti:context-type:ims/lis/Group" Enabled="true"></asp:ListItem>
                                    <asp:ListItem Text="CourseTemplate" Value="urn:lti:context-type:ims/lis/CourseTemplate"
                                        Enabled="true"></asp:ListItem>
                                    <asp:ListItem Text="CourseOffering" Value="urn:lti:context-type:ims/lis/CourseOffering"
                                        Enabled="true"></asp:ListItem>
                                    <asp:ListItem Text="Not a BLTI Context. Cannot Send to Tool." Value="NotBLTI" Enabled="false"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="tbLisCourseSectionSourcedid" Visible="true" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendContextLabel" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send Context Label such as a course code:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:TextBox ID="tbContextLabel" size="60" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendContextTitle" RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send Context Title such as a course name:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:TextBox ID="tbContextTitle" size="60" runat="server" />
                                <br />
                                <hr />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblOutcomesExplanation" runat="server" Text="Accept and store outcome returned by Tool" />
                                <asp:RadioButtonList ID="rblAcceptOutcomes" RepeatDirection="Horizontal" AutoPostBack="true"
                                    runat="server">
                                    <asp:ListItem Text="Yes" Selected="False" Value="true"></asp:ListItem>
                                    <asp:ListItem Text="No" Selected="True" Value="false"></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Table ID="tblOutcomesAcceptable" runat="server" Enabled="true">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblOutcomesSelectAssignment" runat="server" Text="Select assignment which will store the outcome." />
                                            <asp:DropDownList ID="ddlOutcomesSelectAssignment" runat="server">
                                            </asp:DropDownList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblSendCustomParameters" runat="server" Text="Send placement-specific Tool-required Custom Parameters? " />
                                <asp:Label ID="lblCustomParameters" runat="server" Text="Enter parameters one to a line, in name = value format (without quotes). If the name or value includes an equality sign (=) it should be entered escaped as %3D." /><br />
                                <asp:TextBox ID="tbCustomParameters" TextMode="MultiLine" Columns="60" Rows="5" runat="server">
                                </asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnShowOverrideProxySettings" runat="server" BorderStyle="Solid"
                        BorderWidth="1" Font-Bold="true" Text="+" Visible="true" />
                    <asp:Literal ID="Override_Proxy_Settings_Header" runat="server" Text="<b>Advanced: Override Tool Proxy settings for this Placement?</b>"></asp:Literal>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Table BorderWidth="1" ID="tblOverrideProxySettings" runat="server" Visible="false">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLaunchPresentationLocale" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send Language Locale:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Label ID="lblLaunchPresentationLocale" size="20" runat="server" Text="en_us_variant" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLaunchPresentationWidth" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send Width of window or frame for Tool presentation:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:TextBox ID="tbLaunchPresentationWidth" size="6" runat="server">
                                </asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLaunchPresentationHeight" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send Height of window or frame for Tool presentation:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:TextBox ID="tbLaunchPresentationHeight" size="6" runat="server">
                                </asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLaunchPresentationDocumentTarget" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send display type for Tool presentation:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:DropDownList ID="ddlLaunchPresentationDocumentTarget" runat="server">
                                    <asp:ListItem Text="in new window" Value="window" Enabled="true"></asp:ListItem>
                                    <asp:ListItem Text="in portlet frame" Value="iframe" Enabled="false"></asp:ListItem>
                                    <asp:ListItem Text="in portlet main view" Value="frame" Enabled="true"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLaunchPresentationReturnUrl" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send full URL for return from Tool presentation:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:TextBox ID="tbLaunchPresentationReturnUrl" size="60" runat="server">
                                </asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLisPersonParametersEmail" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send user's email to Tool:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLisPersonParametersNames" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send user's names to Tool:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:RadioButtonList ID="rblSendLisPersonParametersRoles" RepeatDirection="Horizontal"
                                    runat="server">
                                    <asp:ListItem Text="Do Not Send /" Value="DoNotSend"></asp:ListItem>
                                    <asp:ListItem Text="Send user's roles to Tool:" Value="Send"></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblLinkText" runat="server" Text="Link Text for this Tool Placement" />
                                <asp:TextBox ID="tbLinkText" size="60" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblDescription" runat="server" Text="Description for this Tool Placement" /><br />
                                <asp:TextBox ID="tbDescription" Columns="60" Rows="5" TextMode="MultiLine" runat="server">
                                </asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblSendExtensionsParameters" runat="server" Text="Send placement-specific Tool-required Extensions Parameters? " />
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
    </p>
</div>
