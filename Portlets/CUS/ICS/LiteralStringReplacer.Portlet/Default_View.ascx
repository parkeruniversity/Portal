<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="Default_View.ascx.cs"
    Inherits="LiteralStringReplacer.Portlet.Default_View" TargetSchema="" %>
<script type="text/javascript">
    jQuery(function ($) {
        var needToSave = false;

        var helpMessages = {};

        helpMessages['LSR_TestID'] = 'When You click "Save and Test" this Host ID will be used to generate any user specific replacements in the test box.  User must exist in JICS.  Otherwise the current user will be used instead.';
        helpMessages['LSR_LiteralType'] = '<strong>Static</strong>:This is a static value that can be composed of other @@ replacement values. <br />' +
            '<strong>SQL Fragment:</strong> Will exceute the Expanded Value column as a SQL query against the selected connection string and return the first row and first column of the result.';
        helpMessages['LSR_ConnectionString'] = 'This dropdown is populated by looking in Portal/ClientConfig/ for .config files that contain:<br /> <strong>&lt;CUSConnection&gt;<br />&nbsp;&lt;CUSConnectionString&gt;<br />&nbsp;&nbsp;ConnectionStringGoesHere<br />&nbsp;&lt;/CUSConnectionString&gt;<br />&lt;/CUSConnection&gt;</strong><br />  Selecting "Other" will let you hand type an ODBC connection string.';
        helpMessages['LSR_CacheMode'] = '<strong>None:</strong> Expanded value will never be cached.  Best used for constantly changing data or static values.<br/>' +
            '<strong>User:</strong> Expanded value will be cached for each user the first time the value for that user is requested.  This is not a session cache so logging out and back in will not clear it.<br />' +
            '<strong>Application:</strong> Expanded value will be cached once for all users.  This is best used for non-user-specific values like Current Term.';
        helpMessages['LSR_Description'] = 'This field is the description of what the replacement is.';
        helpMessages['LSR_Value'] = 'This is the actual value of the replacement.';

        $('#btnTestLiteral').bind('click', function () {
            ClearError();
            $('#btnTestLiteral').attr('disabled', true);
            $('#spanLitMessage').html('Loading...').show();
            $.ajax({
                url: '<%= ResolveUrl("~/Portlets/CUS/ICS/LiteralStringReplacer.Portlet/") %>' + "Admin.asmx/TestLiteralReplacement",
                contentType: "application/json; charset=utf-8",
                data: Serialize({
                    portletId: '<%= ParentPortlet.PortletDisplay.Portlet.ID.AsGuid %>',
                    hostId: $('#tbTestId').val()
                }),
                dataType: "json",
                type: "POST",
                success: function (ret) {
                    $('#spanLitMessage').hide();
                    if (ret.d.Success) {
                        $('#btnTestLiteral').attr('disabled', false);
                        var html = ret.d.Value;
                        if (ret.d.Message != "") {
                            html += "<br /><span style='color:#FF0000'>There were errors found:</span>" + ret.d.Message;
                        }
                        
                        $('<div></div>').html(html).dialog({
                            modal: true,
                            title: 'Literal Replacement Values',
                            close: function () {
                                $(this).dialog("destroy").remove();
                            },
                            width: 800
                        });
                    } else {
                        ShowError(ret.d.Message, $('#btnTestLiteral'));
                    }
                }
            });
        });

        $('#ddlLiterals').bind('change', function () {
            CheckSave(LoadValue);
        });

        $('#ddlSourceType').bind('change', function () {
            switch ($(this).val()) {
                case "0":
                    $('#liConnectionInfo').hide();
                    $('#liConnectionInfoLiLabel').hide();
                    break;
                case "1":
                    $('#liConnectionInfo').show();
                    $('#liConnectionInfoLiLabel').show();
                    break;
            }
        });

        $('#imgAdd').bind('click', function () {
            CheckSave(NewValue);
        });

        $('#<%= ddlConnectionFiles.ClientID %>').change(function () {
            if ($(this).val() == '')
                $('#otherConnection').show();
            else {
                $('#otherConnection').hide();
            }
        });

        $('#imgRemove').bind('click', function () {
            $("<div></div>")
                    .html('Are you sure you want to delete this literal?')
                    .dialog({
                        modal: true,
                        title: 'Save Changes?',
                        buttons: {
                            "Yes": function () {
                                if ($('#ddlLiterals').val() == '00000000-0000-0000-0000-000000000000') {
                                    $($('#ddlLiterals').children()[$('#ddlLiterals').get()[0].selectedIndex]).remove();
                                    LoadValue();
                                } else {
                                    DeleteLiteral();
                                }
                                $(this).dialog('close');
                            },
                            "Cancel": function () {
                                // Do nothing.
                                $(this).dialog('close');
                            }
                        },
                        close: function () {
                            $(this).dialog('destroy').remove();

                        }
                    });
        });

        $('#taValue').change('click', function () {
            needToSave = true;
        });
        $('#btnSave').bind('click', function () {
            Save($(this), false);
        });

        $('#btnSaveAndTest').bind('click', function () {
            Save($(this), true);
        });

        function DeleteLiteral() {
            $.ajax({
                url: '<%= ResolveUrl("~/Portlets/CUS/ICS/LiteralStringReplacer.Portlet/") %>' + "Admin.asmx/DeleteLiteral",
                contentType: "application/json; charset=utf-8",
                data: Serialize({
                    literalId: $('#ddlLiterals').val()
                }),
                dataType: "json",
                type: "POST",
                success: function (ret) {
                    if (ret.d.Success) {
                        $($('#ddlLiterals').children()[$('#ddlLiterals').get()[0].selectedIndex]).remove();
                        LoadValue();
                    } else {
                        ShowError(ret.d.Message);
                    }
                }
            });

        }

        function CheckSave(callback) {
            if (needToSave) {
                $("<div></div>")
                    .html('You have unsaved changes to the current literal.  Do you wish to save first?')
                    .dialog({
                        modal: true,
                        title: 'Save Changes?',
                        buttons: {
                            "Yes": function () {
                                Save($('#btnSave'), false, callback);
                                $(this).dialog('close');
                            },
                            "No": function () {
                                needToSave = false;
                                callback();
                                $(this).dialog('close');
                            },
                            "Cancel": function () {
                                // Do nothing.
                                $(this).dialog('close');
                            }
                        },
                        close: function () {
                            $(this).dialog('destroy').remove();

                        }
                    });
            } else {
                callback();
            }
        }

        function NewValue() {
            $('<div></div>').append($('<span></span>').html('LiteralName:')).append($('<input />').val('@@LiteralName'))
                .dialog({
                    title: 'New Literal',
                    modal: true,
                    buttons: {
                        "Create New Literal": function () {
                            $('#ddlLiterals').append($('<option></option>').val('00000000-0000-0000-0000-000000000000').html($(this).find('input').first().val()));
                            $('#ddlLiterals').val('00000000-0000-0000-0000-000000000000').change();
                            $(this).dialog('close');
                        },
                        "Cancel": function () {
                            $(this).dialog('close');
                        }
                    },
                    close: function () {
                        $(this).dialog('destroy').remove();

                    }
                });
        }

        function LoadValue() {
            ClearError();
            $('#spanLitMessage').html('Loading...').show();
            $.ajax({
                url: '<%= ResolveUrl("~/Portlets/CUS/ICS/LiteralStringReplacer.Portlet/") %>' + "Admin.asmx/LoadLiteral",
                contentType: "application/json; charset=utf-8",
                data: Serialize({
                    literalId: $('#ddlLiterals').val()
                }),
                dataType: "json",
                type: "POST",
                success: function (ret) {
                    if (ret.d.Success) {
                        $('#spanLitMessage').hide();
                        $('#taValue').val(ret.d.Value);
                        $('#taDescription').val(ret.d.Description);
                        $('#ddlSourceType').val(ret.d.SourceType);
                        if (ret.d.ConnectionInfo.match(/config$/)) {
                            $('#otherConnection').hide();
                            $('#<%= ddlConnectionFiles.ClientID %>').val(ret.d.ConnectionInfo);
                        } else {
                            $('#otherConnection').show();
                            $('#tbConnectionString').val(ret.d.ConnectionInfo);
                            $('#<%= ddlConnectionFiles.ClientID %>').val('');
                        }

                        if (ret.d.SourceType == 1) {
                            $('#liConnectionInfo').show();
                            $('#liConnectionInfoLiLabel').show();
                        } else {
                            $('#tbConnectionString').val('');
                            $('#liConnectionInfo').hide();
                            $('#liConnectionInfoLiLabel').hide();
                        }
                        $('#ddlCacheMode').val(ret.d.CacheType);

                    } else {
                        ShowError(ret.d.Message);
                    }
                }
            });
        }

        function Save(buttonToControl, displayResult, callback) {
            ClearError();
            $('#spanLitMessage').html('Saving...').show();
            buttonToControl.attr('disabled', true);
            $.ajax({
                url: '<%= ResolveUrl("~/Portlets/CUS/ICS/LiteralStringReplacer.Portlet/") %>' + "Admin.asmx/SaveLiteral",
                contentType: "application/json; charset=utf-8",
                data: Serialize({
                    literalId: $('#ddlLiterals').val(),
                    value: $('#taValue').val(),
                    literal: $($('#ddlLiterals').children()[$('#ddlLiterals').get()[0].selectedIndex]).text(),
                    description: $('#taDescription').val(),
                    connectionString: $('#<%= ddlConnectionFiles.ClientID %>').val() != '' ? $('#<%= ddlConnectionFiles.ClientID %>').val() : $('#tbConnectionString').val(),
                    sourceType: $('#ddlSourceType').val(),
                    cacheType: $('#ddlCacheMode').val(),
                    portletId: '<%= ParentPortlet.PortletDisplay.Portlet.ID.AsGuid %>',
                    hostId: $('#tbTestId').val()
                }),
                dataType: "json",
                type: "POST",
                success: function (ret) {
                    if (ret.d.Success) {
                        $('#spanLitMessage').html('Save Successful!').delay(2000).fadeOut(500);
                        needToSave = false;
                        buttonToControl.attr('disabled', false);
                        $($('#ddlLiterals').children()[$('#ddlLiterals').get()[0].selectedIndex]).val(ret.d.Id);
                        if (displayResult) {
                            $('<div></div>').html(ret.d.TestValue).dialog({
                                modal: true,
                                title: ret.d.Literal,
                                close: function () {
                                    $(this).dialog("destroy").remove();
                                }
                            });
                        } else if (callback != undefined) {
                            callback();
                        }
                        if (ret.d.Message != "") {
                            ShowError("Save was successfull, but an error was found while testing the literal:<br/>" + ret.d.Message);
                        }
                    } else {
                        ShowError(ret.d.Message, buttonToControl);
                        $('#spanLitMessage').html('Save UnSuccessful!').delay(2000).fadeOut(500);
                    }
                }
            });
        }

        function ShowError(error, buttonToControl) {
            $('#error').html(error).show();
            buttonToControl.attr('disabled', false);
        }

        function ClearError() {
            $('#error').html('').hide();
        }

        function Serialize(object) {
            return Sys.Serialization.JavaScriptSerializer.serialize(object);
        }

        function showHelp(event) {
            var key = $(event.target).data('helpkey');
            $('<div></div>').attr({
                id: 'helpDivAlt'
            }).css({
                width: 210,
                height: 'auto',
                left: event.pageX + 215 > $(window).width() ? event.pageX - 230 : event.pageX + 15,
                top: event.pageY,
                position: 'absolute'
            }).html(helpMessages[key]).appendTo(document.body);
        }

        function hideHelp() {
            $('#helpDivAlt').remove();
        }

        $('.inlineHelp').each(function (index, element) {
            $(element).hover(showHelp, hideHelp);
        });

        $.ajax({
            url: '<%= ResolveUrl("~/Portlets/CUS/ICS/LiteralStringReplacer.Portlet/") %>' + "Admin.asmx/GetLiterals",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            type: "POST",
            success: function (ret) {
                if (ret.d.Success) {
                    $.each(ret.d.Literals, function (i, literal) {
                        $('#ddlLiterals').append($('<option></option>').val(literal.Id).text(literal.Literal));
                    });
                    LoadValue();
                } else {
                    ShowError(ret.d.Message);
                }
            }
        });


    });

</script>

<style type="text/css">
    #ulSettings li label
    {
        display: inline-block;
        width: 125px;
        zoom: 1;
        *display: inline;
        vertical-align: top;
    }

    #helpDivAlt
    {
        background-color: #e4e4e4;
        border: 1px solid #000000;
        padding: 3px;
    }

    #ulSettings img
    {
        cursor: pointer;
        margin-left: 3px;
        vertical-align: middle;
    }

    #ulSettings select
    {
        width: 280px;
    }

    .inlineHelp
    {
        cursor: help !important;
    }

    #tbConnectionString
    {
        margin-left: 0 !important;
    }
</style>
<div class="pSection" style="min-height: 415px;">
    <div id="error" class="feedbackError" style="display: none">
    </div>
    <ul id="ulSettings">
        <li>
            <label for="ddlLiterals">Literal:</label>
            <select id="ddlLiterals"></select><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/delete.png") %>' alt="Remove Literal" id="imgRemove"><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/add.png") %>' alt="Add New Literal" id="imgAdd"></li>
        <li>
            <label for="ddlSourceType">Literal Type:</label>
            <select id="ddlSourceType">
                <option value="0">Static</option>
                <option value="1">SQL Fragment</option>
            </select><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/help.png") %>' alt="Description" class="inlineHelp" data-helpkey="LSR_LiteralType" />
        </li>
        <li>
            <label for="tbConnectionString"><span id="spanConnectionString">Connection String:</span></label>
            <asp:DropDownList runat="server" ID="ddlConnectionFiles" /><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/help.png") %>' alt="Description" class="inlineHelp" data-helpkey="LSR_ConnectionString" />
            <div id="otherConnection" style="margin-top: 5px;">
                <input type="text" size="65" id="tbConnectionString" style="padding-left: 5px;" />
            </div>
        </li>
        <li>
            <label for="ddlCacheMode">Cache Mode:</label>
            <select id="ddlCacheMode">
                <option value="0">None</option>
                <option value="1">User</option>
                <option value="2">Application</option>
            </select><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/help.png") %>' alt="Description" class="inlineHelp" data-helpkey="LSR_CacheMode" />
        </li>
        <li>
            <label for="taDescription">Description:</label>
            <textarea id="taDescription" rows="7" cols="80"></textarea><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/help.png") %>' alt="Description" class="inlineHelp" data-helpkey="LSR_Description" />
        </li>
        <li>
            <label for="taValue">Expanded Value:</label>
            <textarea id="taValue" rows="7" cols="80"></textarea><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/help.png") %>' alt="Description" class="inlineHelp" data-helpkey="LSR_Value" />
        </li>
        <li>
            <label for="tbTestId">Test Host ID:</label>
            <input type="text" id="tbTestId" name="tbTestId" size="20" /><img src='<%= ResolveUrl("~/UI/Common/Images/PortletImages/Icons/16/help.png") %>' alt="Description" class="inlineHelp" data-helpkey="LSR_TestID" />
        </li>
    </ul>
    <div>
        <input type="button" id="btnSaveAndTest" value="Save and Test" />
        <input type="button" id="btnSave" value="Save" />
        <input type="button" id="btnTestLiteral" value="See All Expanded Values" />
        <span id="spanLitMessage"></span>
    </div>
</div>
