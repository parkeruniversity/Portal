<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="AddEditSectionView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.AddEditSectionView" %>
<%@ Import Namespace="Jenzabar.Common.Globalization" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="jenzabar" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Register TagPrefix="web" Assembly="Jenzabar.Portal.Framework.Web" Namespace="Jenzabar.Portal.Framework.Web.UI.Controls" %>


<script type="text/javascript" language="javascript">
    
    function AddMeetingTimeOnClick()
    {
        var addMeetingLabel = $("#<%= FindControl("lblPopupAddMeetingTime").ClientID %>")[0];
        addMeetingLabel.innerHTML = "<%= Globalizer.GetGlobalizedString("TXT_ADD_A_MEETING_TIME") %>";
        ShowMeetingsPopup();
    }
    
    function ShowMeetingsPopup() {            
        var popup = document.getElementById("<%= FindControl("divMeetingPopup").ClientID %>");
        popup.style.display = "block";
        popup.style.position = "absolute";
    }

    function HideMeetingsPopup() {
        var popup = document.getElementById("<%= FindControl("divMeetingPopup").ClientID %>");
        popup.style.display = "none";
    }
    
    function ConfirmDeleteMeetingTime(){
        return confirm("<%= Globalizer.GetGlobalizedString("MSG_DELETE_MEETING_TIME_CONFIRMATION") %>");    
    }
    
    function CheckForFaculty()
    {
        if (getQueryStringVariable("CourseID") != null)
        {    
            var ps = document.getElementById("<%= ((PSTwo)FindControl("psFaculty")).NumberofSelectedUsersHiddenFieldID %>");
            if (ps.value === "0")
            {
                return confirm("<%= Globalizer.GetGlobalizedString("MSG_COURSE_CREATOR_NO_FACULTY_IN_SECTION_WARNING") %>");
            }
            else
                return true;        
        }
        else
            return true;
    }
    
    function ValidateMeeting()
    {
        return (ValidateDays() && ValidateMeetingTimes());
    }
    
    function ValidateDays()
    {
        var chkMon = document.getElementById("<%= FindControl("chkMon").ClientID %>");
        var chkTue = document.getElementById("<%= FindControl("chkTue").ClientID %>");
        var chkWed = document.getElementById("<%= FindControl("chkWed").ClientID %>");
        var chkThr = document.getElementById("<%= FindControl("chkThr").ClientID %>");
        var chkFri = document.getElementById("<%= FindControl("chkFri").ClientID %>");
        var chkSat = document.getElementById("<%= FindControl("chkSat").ClientID %>");
        var chkSun = document.getElementById("<%= FindControl("chkSun").ClientID %>");
        
        if ((!chkMon.checked) && (!chkTue.checked) && (!chkWed.checked) && (!chkThr.checked) && (!chkFri.checked) && (!chkSat.checked) && (!chkSun.checked))
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_MUST_SELECT_DAY_OF_WEEK") %>");
            return false;
        }
        else
        {
            return true;
        }
    }
    
    function ValidateMeetingTimes(){
        var startHour = document.getElementById("<%= FindControl("txtMeetingStartHour").ClientID %>").value;
        
        var startMinute = document.getElementById("<%= FindControl("txtMeetingStartMinute").ClientID %>").value;
        var endHour = document.getElementById("<%= FindControl("txtMeetingEndHour").ClientID %>").value;        
        var endMinute = document.getElementById("<%= FindControl("txtMeetingEndMinute").ClientID %>").value;
        var startAmPm = document.getElementById("<%= FindControl("ddlMeetingStartAmPm").ClientID %>").value;
        var endAmPm = document.getElementById("<%= FindControl("ddlMeetingEndAmPm").ClientID %>").value;
        
        if (startAmPm === "PM" && endAmPm === "AM")
        {
            alert("<%= Globalizer.GetGlobalizedString("MSG_START_TIME_CANNOT_START_PM_AND_END_TIME_END_AM") %>");
            return false;
        } 
        
        if (startHour.trim().length == 0)
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_MUST_ENTER_START_HOUR") %>");
            return false;
        }        
        if (startMinute.trim().length == 0)
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_MUST_ENTER_START_MINUTE") %>");
            return false;
        }        
        if (endHour.trim().length == 0)
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_MUST_ENTER_END_HOUR") %>");
            return false;
        }        
        if (endMinute.trim().length == 0)
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_MUST_ENTER_END_MINUTE") %>");
            return false;
        }   
        
        if (!isIntegerInRange(startHour, 1, 12))
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_START_HOUR_MUST_BE_BETWEEN_1_AND_12") %>");
            return false;
        }
        if (!isIntegerInRange(startMinute, 0, 59))
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_START_MINUTE_MUST_BE_BETWEEN_00_AND_59") %>");
            return false;
        }
        if (!isIntegerInRange(endHour, 1, 12))
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_END_HOUR_MUST_BE_BETWEEN_1_AND_12") %>");
            return false;
        }
        if (!isIntegerInRange(endMinute, 0, 59))
        {
            alert("<%= Globalizer.GetGlobalizedString("TXT_END_MINUTE_MUST_BE_BETWEEN_00_AND_59") %>");
            return false;
        }
        // Parse the strings into int's        
        startHour = parseInt(startHour, 10);
        startMinute = parseInt(startMinute, 10);
        endHour = parseInt(endHour, 10);
        endMinute = parseInt(endMinute, 10);            
        
        if (startAmPm === "AM" && endAmPm === "AM")
        {
            if (startHour > endHour && startHour != 12)
            {
                alert("<%= Globalizer.GetGlobalizedString("TXT_START_HOUR_CANNOT_BE_GREATER_THAN_END_HOUR") %>");
                return false;  
            }            
        }
        
        if (startAmPm === "PM" && endAmPm === "PM")
        {
            if (startHour > endHour && startHour != 12)
            {
                alert("<%= Globalizer.GetGlobalizedString("TXT_START_HOUR_CANNOT_BE_GREATER_THAN_END_HOUR") %>");
                return false;  
            }
        }
        
        if (startHour === endHour)
        {
            if (startAmPm === endAmPm && startMinute > endMinute)
            {
                alert("<%= Globalizer.GetGlobalizedString("TXT_START_TIME_CANNOT_BE_GREATER_THAN_END_TIME") %>");
                return false;
            }            
        }
        return true;
    }
    
    // isIntegerInRange (STRING s, INTEGER a, INTEGER b)
   function isIntegerInRange (s, a, b)
   {   if (isEmpty(s))
         if (isIntegerInRange.arguments.length == 1) return false;
         else return (isIntegerInRange.arguments[1] == true);

      // Catch non-integer strings to avoid creating a NaN below,
      // which isn't available on JavaScript 1.0 for Windows.
      if (!isInteger(s, false)) return false;

      // Now, explicitly change the type to integer via parseInt
      // so that the comparison code below will work both on
      // JavaScript 1.2 (which typechecks in equality comparisons)
      // and JavaScript 1.1 and before (which doesn't).
      var num = parseInt (s, 10);
      return ((num >= a) && (num <= b));
   }

   function isInteger (s)
   {
      var i;

      if (isEmpty(s))
      if (isInteger.arguments.length == 1) return 0;
      else return (isInteger.arguments[1] == true);

      for (i = 0; i < s.length; i++)
      {
         var c = s.charAt(i);

         if (!isDigit(c)) return false;
      }
      return true;
   }

   function isEmpty(s)
   {
      return ((s == null) || (s.length == 0))
   }

   function isDigit (c)
   {
      return ((c >= "0") && (c <= "9"))
   }
    
    
</script>

<jenzabar:Subheader ID="hdrAddEditCourseSection" runat="server" />
<div class="pSection">
    <table class="AddEditSectionCourseInfo" cellpadding="5">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblCourseCodeTitle" runat="server" CssClass="AddEditSectionCourseCodeTitle" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblInDepartment" runat="server" />
            </td>
            <td align="right">
                <img src="ui/common/images/PortletImages/Icons/icon_arrowleft_grey.gif" />
                <a id="lnkSelectDifferentCourse" runat="server">
                    <asp:Label ID="lblSelectDifferentCourse" runat="server" />
                </a>
            </td>
        </tr>
    </table>
    <br />
    <h5>
        <asp:Label ID="lblAddEditSection" runat="server" />
    </h5>
    <br />
    <asp:UpdatePanel ID="upAddEditSection" runat="server">
        <ContentTemplate>
            <table cellpadding="10" width="100%">
                <tr>
                    <td style="text-align: right;">
                        <asp:Label ID="lblTerm" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlTerms" runat="server" AutoPostBack="true" />
                        <div id="divAddTerm" runat="server" style="display: inline;">
                            <img src="ui/common/images/PortletImages/Icons/add.gif" />
                            <asp:LinkButton ID="lnkAddTerm" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <asp:Label ID="lblSectionCode" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtSectionCode" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvSectionCode" runat="server" ControlToValidate="txtSectionCode"
                            EnableClientScript="False" />
                        <asp:Label ID="lblOtherSections" runat="server" CssClass="LightColorText" />
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="text-align: right;">
                        <asp:Label ID="lblSectionTitle" runat="server" />
                    </td>
                    <td valign="top" colspan="2">
                        <asp:TextBox ID="txtSectionTitle" runat="server" />
                        <br />
                        <asp:Label ID="lblSectionTitleOptional" runat="server" CssClass="LightColorText" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" valign="top">
                        <asp:Label ID="lblFaculty" runat="server" />
                    </td>
                    <td colspan="2">
                        <web:PrincipalSelector ID="psFaculty" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" valign="top">
                        <asp:Label ID="lblStudents" runat="server" />
                    </td>
                    <td colspan="2">
                        <web:PrincipalSelector ID="psStudents" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td colspan="2">
                        <div class="feedbackError" id="divMeetingError" runat="server" visible="false">
                            <asp:Label ID="lblMeetingError" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" valign="top">
                        <asp:Label ID="lblWeeklySchedule" runat="server" />
                    </td>
                    <td valign="top" colspan="2">
                        <span onclick="AddMeetingTimeOnClick()">
                            <img src="ui/common/images/PortletImages/Icons/add.gif" />
                            <asp:Label ID="lblAddMeetingTime" runat="server" Style="text-decoration: underline;
                                color: blue; cursor: pointer;" />
                        </span>
                        <br />
                        <div id="divStoredMeetingTimes">
                            <asp:Repeater ID="rptMeetingTimes" runat="server">
                                <ItemTemplate>
                                    <asp:Label ID="lblStoredMeetingTime" runat="server" />
                                    <asp:ImageButton ID="btnEditMeetingTime" runat="server" ImageUrl="~/ui/common/images/PortletImages/Icons/edit.gif" />
                                    <asp:ImageButton ID="btnDeleteMeetingTime" runat="server" ImageUrl="~/ui/common/images/PortletImages/Icons/delete.gif"
                                        OnClientClick="return ConfirmDeleteMeetingTime()" />
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div id="divMeetingPopup" runat="server" style="display: none">
                            <table cellspacing="0">
                                <tr>
                                    <td class="AddEditSectionMeetingPopupHeaderLeftCell">
                                        <asp:Label ID="lblPopupAddMeetingTime" runat="server" />
                                    </td>
                                    <td class="AddEditSectionMeetingPopupHeaderRightCell">
                                        <img src="ui/common/images/PortletImages/Icons/close_me.gif" onclick="HideMeetingsPopup()" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="AddEditSectionMeetingPopupDaysCell">
                                        <input type="checkbox" id="chkMon" runat="server" /><asp:Label ID="lblMon" runat="server" /><br />
                                        <input type="checkbox" id="chkTue" runat="server" /><asp:Label ID="lblTue" runat="server" /><br />
                                        <input type="checkbox" id="chkWed" runat="server" /><asp:Label ID="lblWed" runat="server" /><br />
                                        <input type="checkbox" id="chkThr" runat="server" /><asp:Label ID="lblThr" runat="server" /><br />
                                        <input type="checkbox" id="chkFri" runat="server" /><asp:Label ID="lblFri" runat="server" /><br />
                                        <input type="checkbox" id="chkSat" runat="server" /><asp:Label ID="lblSat" runat="server" /><br />
                                        <input type="checkbox" id="chkSun" runat="server" /><asp:Label ID="lblSun" runat="server" />
                                    </td>
                                    <td class="AddEditSectionMeetingPopupTimesCell">
                                        <asp:Label ID="lblStart" runat="server" />
                                        <br />
                                        <asp:TextBox ID="txtMeetingStartHour" runat="server" Columns="2" MaxLength="2" />
                                        :
                                        <asp:TextBox ID="txtMeetingStartMinute" runat="server" Columns="2" MaxLength="2" />
                                        <asp:DropDownList ID="ddlMeetingStartAmPm" runat="server" />
                                        <br />
                                        <br />
                                        <asp:Label ID="lblEnd" runat="server" />
                                        <br />
                                        <asp:TextBox ID="txtMeetingEndHour" runat="server" Columns="2" MaxLength="2" />
                                        :
                                        <asp:TextBox ID="txtMeetingEndMinute" runat="server" Columns="2" MaxLength="2" />
                                        <asp:DropDownList ID="ddlMeetingEndAmPm" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="AddEditSectionMeetingPopupLocationCell">
                                        <br />
                                        <asp:Label ID="lblLocation" runat="server" />
                                        <asp:TextBox ID="txtMeetingLocation" runat="server" />
                                        <br />
                                        *
                                        <asp:Label ID="lblOptional" runat="server" />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr class="AddEditSectionMeetingPopupBottomRow">
                                    <td class="AddEditSectionMeetingPopupSaveCell">
                                        <asp:Button ID="btnSaveMeetingTime" runat="server" OnClick="btnSaveMeetingTime_Click"
                                            OnClientClick="return ValidateMeeting();" />
                                        <asp:HiddenField ID="hdnScheduleSerialNumber" runat="server" />
                                        <asp:HiddenField ID="hdnScheduleID" runat="server" />
                                    </td>
                                    <td class="AddEditSectionMeetingPopupCancelCell">
                                        <asp:Button ID="btnCancelMeetingTime" runat="server" OnClick="btnCancelMeetingTime_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <div>
                <table cellspacing="0" width="100%">
                    <tr>
                        <td valign="top" class="ButtonTableSaveCell" align="center">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnAddSection" runat="server" OnClientClick="return CheckForFaculty();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAndExit" runat="server" CssClass="ItalicText" />
                                        <img src="ui/common/images/PortletImages/Icons/icon_arrowright_blue.gif" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" class="ButtonTableAddAnotherCell" id="tdAddAnotherButtonCell" runat="server"
                            align="center">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnAddSectionAnother" runat="server" OnClientClick="return CheckForFaculty();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAndAddAnother" runat="server" CssClass="ItalicText" />
                                        <img src="ui/common/images/PortletImages/Icons/icon_addanother.gif" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" class="ButtonTableCancelCell">
                            <asp:Button ID="btnCancelAddEditSection" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
