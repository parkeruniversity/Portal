<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReadingDetails.ascx.cs" Inherits="Jenzabar.LMS.Portlets.CourseworkPortlet.Views.Controls.ReadingDetails" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.CourseworkPortlet.Entities" %>
<%@ Import Namespace="Jenzabar.LMS.Portlets.CourseworkPortlet.Utils" %>
<script type="text/javascript">
    function deleteReading(thisReading) {
        var thisAssignmentReading = $(thisReading).closest('.assignmentReading');
        if ($(".assignmentReading").length == 1)
            thisAssignmentReading.find("input").val("");
        else
            thisAssignmentReading.remove();
    }

    function addReading() {
        var addAnotherReadingForm = $(".assignmentReading").last().clone();
        $(addAnotherReadingForm).find("input").val("");
        var findGroupNumberRegEx = /<%=GetReadingDetailNumberRegEx.ToString()%>/;
        var groupNumber = +findGroupNumberRegEx.exec($(addAnotherReadingForm).find("input").last().attr('name'))[2];
        var inputNames = $(addAnotherReadingForm).find("input").attr("name", function () {
            return this.name.replace(findGroupNumberRegEx, "$1" + (groupNumber + 1) + "$3");
        });
        $('#assignmentReadings').append(addAnotherReadingForm);
        $('.assignmentReading').last().find('input').first().focus();
    }
</script>
<div id="assignmentReadings">
    <asp:Repeater runat="server" ID="AdditionalReadingsRepeater">
        <ItemTemplate>
            <div class="assignmentReading">
                <div>
                    <table cellpadding="5">
                        <tr>
                            <td valign="top" align="right">
                                <%=Globalizer.GetLabel("TXT_TITLE")%>
                            </td>
                            <td colspan="2">
                                <input type="text" maxlength="255" name="<%#GetFormElementId("txtTitle", Container.ItemIndex)%>" id="<%#GetFormElementId("txtTitle", Container.ItemIndex)%>" style="width:300px" value="<%#((ReadingDetailDto)Container.DataItem).Title %>" />
                                <asp:Label ID="labErrTitle" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">
                                <%=Globalizer.GetLabel("TXT_AUTHOR")%>
                            </td>
                            <td colspan="2">
                                <input type="text" maxlength="255" name="<%#GetFormElementId("txtAuthor", Container.ItemIndex)%>" id="<%#GetFormElementId("txtAuthor", Container.ItemIndex)%>" style="width:300px" value="<%#((ReadingDetailDto)Container.DataItem).Author %>" />
                                <asp:Label ID="labErrAuthor" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">
                                <%=Globalizer.GetLabel("MSG_CWK_EDDITION_ISSUE")%>
                            </td>
                            <td colspan="2">
                                <input type="text" maxlength="255" name="<%#GetFormElementId("txtEdition", Container.ItemIndex)%>" id="<%#GetFormElementId("txtEdition", Container.ItemIndex)%>" style="width:300px" value="<%#((ReadingDetailDto)Container.DataItem).Edition %>" />
                                <asp:Label ID="labErrEdition" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">
                                <%=Globalizer.GetLabel("MSG_CWK_LIBRARY_OR_BOOKSTORE_LINK")%>
                            </td>
                            <td><%=Globalizer.GetLabel("TXT_URL")%></td>
                            <td>
                                <input type="text" maxlength="255" name="<%#GetFormElementId("txtUrl", Container.ItemIndex)%>" id="<%#GetFormElementId("txtUrl", Container.ItemIndex)%>" style="width:300px" value="<%#((ReadingDetailDto)Container.DataItem).Url %>" /> 
                                <asp:Label ID="labErrUrl" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><%=Globalizer.GetLabel("TXT_LABEL")%></td>
                            <td>
                                <input type="text" maxlength="255" name="<%#GetFormElementId("txtLabel", Container.ItemIndex)%>" id="<%#GetFormElementId("txtLabel", Container.ItemIndex)%>" style="width:300px" value="<%#((ReadingDetailDto)Container.DataItem).Label %>" />
                                <asp:Label ID="labErrLabel" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">
                                <%=Globalizer.GetLabel("MSG_CWK_CHAPTERS_OR_PAGES")%>
                            </td>
                            <td colspan="2">
                                <input type="text" maxlength="255" name="<%#GetFormElementId("txtChapterPages", Container.ItemIndex)%>" id="<%#GetFormElementId("txtChapterPages", Container.ItemIndex)%>" style="width:300px" value="<%#((ReadingDetailDto)Container.DataItem).ChapterPages %>" />
                                <asp:Label ID="labErrChapterPages" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">
                                <%=Globalizer.GetLabel("MSG_NOTES")%>
                            </td>
                            <td colspan="2">
                                <input type="text" maxlength="2000" name="<%#GetFormElementId("txtNotes", Container.ItemIndex)%>" id="<%#GetFormElementId("txtNotes", Container.ItemIndex)%>" style="width:300px" value="<%#((ReadingDetailDto)Container.DataItem).Notes %>" />
                                <asp:Label ID="labErrNotes" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
                <img src="<%=ResolveUrl(CourseworkImgUtil.GetImageIconUrl(CourseworkImgUtil.DELETE)) %>" />
                <a href="#" onclick="deleteReading(this); return false;"><%=Globalizer.GetString("TXT_REMOVE_THIS_READING")%></a>
                <div class="lineSeparator"></div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<p>
    <img src="<%=ResolveUrl(CourseworkImgUtil.GetImageIconUrl(CourseworkImgUtil.ADD)) %>" />
    <a href="#" onclick="addReading();return false;"><%= Globalizer.GetString("TXT_ADD_ANOTHER_READING")%></a>
</p>