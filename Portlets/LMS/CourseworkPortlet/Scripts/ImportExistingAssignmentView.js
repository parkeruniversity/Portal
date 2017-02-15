
var Jenzabar$LMS$Portlets$CourseworkPortlet$Views$ImportExistingAssignmentView = ImportExistingAssignmentView = new function()
{
    var windows = JCSL.ui.windows;

    var wb;

    //

    this.import_complete = function(count, redirect)
    {
        wb.close();

        new windows.MessageBox
        (
            "",
            JCSL.lang.string.format(Globalizer.MSG_FORMAT_CWK_CONFIRM_IMPORTED_ASSIGNMENTS, [count]),
            function()
            {
                JCSL.window.document.disable(JCSL.JICS.DocumentProcessing);

                window.location.href = redirect;
            }

        ).open(null);
    }

    this.selFormat_OnChange = function()
    {
        JCSL.window.document.disable(JCSL.JICS.DocumentProcessing);

        var qs = JCSL.window.parse_qs(window);

        if (this.selectedIndex == 0)
        {
            delete qs["AssignmentFormat"];
        }
        else
        {
            qs["AssignmentFormat"] = JCSL.element.select.get_selected_option(this).value;
        }

        document.location = (window.location.href.split("?")[0] + JCSL.window.generate_qs(qs));
    }

    this.btnImport__Click = function()
    {
        function do_export(button)
        {
            if (button !== Globalizer.TXT_YES) return;

            wb = new windows.WaitBox(Globalizer.MSG_CWK_WAIT_WHILE_IMPORTING_ASSIGNMENTS, "UI/Common/Images/AJAXImages/L03b_green.gif");
            
            wb.open(null);

            //

            JCSL.web_form.postback(JCSL.element.find("*btnImport"));
        }

        ////

        var checked = false;

        $("table[id$='grdMain'] tbody input[type='checkbox']").each
        (
            function()
            {
                if (!this.checked) return;

                checked = true;
            }
        );

        if (checked)
        {
            new windows.MessageBox
            (
                "",
                Globalizer.MSG_CWK_CONFIRM_IMPORT_ASSIGNMENTS,
                do_export,
                [
                    {caption:Globalizer["TXT_YES"]},
                    {caption:Globalizer["TXT_CANCEL"]}
                ]
            )
            .open(null);
        }
        else
        {
            new windows.MessageBox("", Globalizer.MSG_CWK_SELECT_ASSIGNMENT_TO_IMPORT).open(null);
        }
    }

    this.btnCancel__Click = function()
    {
        JCSL.window.document.disable(JCSL.JICS.DocumentProcessing);

        window.location.href = document.getElementById('pg0_V_lnkBack').getAttribute("data-url");
    }
}