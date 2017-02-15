<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddToCalendar.ascx.cs" Inherits="Jenzabar.ICS.Web.Portlets.MeetingPortlet.Views.Controls.AddToCalendar" %>
<%@ Register Src="Modal.ascx" TagName="Modal" TagPrefix="JICS" %>
<%@ Register tagPrefix="jics" namespace="Jenzabar.Common.Web.UI.Controls" Assembly="Jenzabar.Common"  %> 
<%@ Register tagPrefix="jics" namespace="Jenzabar.Portal.Framework.Web.TextEditor"  Assembly="Jenzabar.Portal.Framework.Web" %>
<div >
    <div class="meetingAddToCalendarIconContainer">
        <div class="meetingCalendarIconContainer"></div>
    </div>
    <div class="meetingAddToCalendarLinkContainer">
        <asp:HyperLink runat="server" ID="lnkOpenModal"></asp:HyperLink>
    </div>
</div>



<jics:Modal Id="modal" runat="server">
    <contentarea>
        
        <div class="meetingAddToCalemdarModalHeader">
            <div class="meetingAddToCalendarIconContainer">
                <div class="meetingCalendarIconContainer"></div> 
            </div>
            <div>
                <asp:Label runat="server" ID="lblAddThe" />
                <strong>
                    <asp:Label runat="server" ID="lblMeetingName" />
                </strong>
                <asp:Label runat="server" ID="lblMeetingToCalendar" />
            </div>
        </div>
        
        <div id="divNoCalendarPortlet" runat="server" Visible="False" class="meetingNoCalendarPortletContainer">
            <asp:Label runat="server" ID="lblNoCalendarPortlet" /> 
        </div>
        
        <div id="divNoCalendar" runat="server" Visible="False" class="meetingNoCalendarPortletContainer">
            <asp:Label runat="server" ID="lblNoCalendar" />
        </div>
        
        <div id="divNoPermissions" runat="server" Visible="False" class="meetingNoCalendarPortletContainer">
            <asp:Label runat="server" ID="lblNoPermissions" />
        </div>

        <div id="divCalendarEntry" runat="server" Visible="True">
            <table cellpadding="5px">
                <tr>
                    <td align="right">
                        <asp:Label runat="server" ID="lblEventName" AssociatedControlID="txtEventName" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtEventName" Width="400" />
                    </td>
                </tr>
                 <tr>
                    <td style="vertical-align: top;" align="right">
                        <asp:Label runat="server" ID="lblDescription" />
                    </td>
                    <td>
                        <jics:TextEditorControl ID="txtDescription" Width="650px" Height="150px" runat="server" />
                    </td>
                </tr>
                
                
                <tr>
                   <td align="right" valign="top">
                        <asp:Label runat="server" ID="lblCalendar" AssociatedControlID="ddlCalendars" />
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddlCalendars" />
                    </td>
                </tr>
                
                <tr>
                    <td align="right" valign="top">
                         <asp:Label runat="server" ID="lblLocation" AssociatedControlID="txtLocation" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtLocation" />
                        <br/>
                        <asp:CheckBox runat="server" ID="chkAllDayEvent"/>
                        <asp:Label runat="server" ID="lblAllDayEvent" AssociatedControlID="chkAllDayEvent" />
                    </td>
                </tr>
                
                <tr>
                    <td align="right" valign="top">
                         <asp:Label runat="server" ID="lblStartDate" />
                    </td>
                    <td>
                        <jics:DatePicker ID="dpStartDate" runat="server" />
                    </td>
                </tr>
                
                <tr>
                   <td align="right" valign="top">
                         <asp:Label runat="server" ID="lblEndDate" />
                    </td>
                    <td>
                        <jics:DatePicker ID="dpEndDate" runat="server" />
                    </td>
                </tr>
                
                <tr>
                    <td align="right" valign="top">
                         <asp:Label runat="server" ID="lblOccurs" />
                    </td>
                    <td>
                        <asp:RadioButton runat="server" ID="rbOnce" Checked="True" GroupName="CalendarOccurs"/>
                        <asp:Label runat="server" ID="lblOnce" AssociatedControlID="rbOnce" />
                        <br/>
                        <asp:RadioButton runat="server" ID="rbRepeat" GroupName="CalendarOccurs" />
                        <asp:Label runat="server" ID="lblRepeat" AssociatedControlID="rbRepeat"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlRepeats"/>
                        <div style="padding-left: 30px;">
                            <asp:RadioButton runat="server" ID="rbIndefinitely" GroupName="radioRepeatUntil"/>
                            <asp:Label runat="server" ID="lblIndefinitely" AssociatedControlID="rbIndefinitely" />
                            <br/>
                            <asp:RadioButton runat="server" ID="rbUntil" GroupName="radioRepeatUntil" />
                            <asp:Label runat="server" ID="lblUntil" AssociatedControlID="rbUntil" />
                            <jics:DatePicker ID="dpRepeatUntil" runat="server" /> 
                        </div>
                    </td>
                </tr> 
                
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            
            <div class="emailerButtons">
                <div class="emailerSendMail">
                    <asp:Button runat="server" ID="btnSave"/> 
                </div>
                <div class="emailerCancelMail">
                    <asp:HyperLink runat="server" ID="lnkCancel" />
                </div>
            </div>
        </div>
        
        
        
        
        

        </contentarea>
</jics:Modal>








