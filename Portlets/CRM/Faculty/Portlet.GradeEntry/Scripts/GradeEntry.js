(function (gep, $) {
    'use strict';

    $(document).ready(function ($) {

        var saveChanges = false;
        var mainClass = $('#MainClass').val();
        var selectedFinalGradeColumn;
        var selectedMidtermGradeColumn;

        $('.' + mainClass).on('change', '.FinalGrade', function (e) {
            checkForDisplayNumericGradeModal($(this));
            checkForDisplayWithdrawalModal($(this));
        });

        $('.' + mainClass).on('change', '.MidtermGrade', function (e) {
            checkForDisplayWithdrawalModal($(this));
        });

        $('.' + mainClass).on('click', '.SaveButton', function (e) {

            if (!ValidateClockHoursAbsences()) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            }

            var allowLDoAEntry = $('#AllowLDoAEntry').val();

            if (allowLDoAEntry == "Y" && !ValidateLDOA()) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            }

            if (!ValidateWithdrawals($(this))) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            }

        });

        $('.' + mainClass).on('click', '.WithdrawalDetail', function (e) {
            e.preventDefault();
            e.stopPropagation();

            var gradeScaleCde = "";
            var creditTypeCde = "";
            var midtermGrade = "";
            var finalGrade = "";
            var selectGlob = getGlobalization('TXT_FACT_GE_SELECT');

            var finalGradeColumn = $(this).parents(".FinalGradeColumn");
            if (typeof (finalGradeColumn) !== 'undefined' && finalGradeColumn != null) {
                var selected = finalGradeColumn.find('.FinalGrade').find(":selected");
                if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                    finalGrade = selected.val();

                    var gradeArray = finalGrade.split(';');
                    gradeScaleCde = gradeArray[0];
                    creditTypeCde = gradeArray[1];
                }
            }
            else {
                finalGradeColumn = $(this).parents(".MidtermGradeColumn").siblings('.FinalGradeColumn');
                if (typeof (finalGradeColumn) !== 'undefined' && finalGradeColumn != null) {
                    var selected = finalGradeColumn.find('.FinalGrade').find(":selected");
                    if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                        finalGrade = selected.val();

                        var gradeArray = finalGrade.split(';');
                        gradeScaleCde = gradeArray[0];
                        creditTypeCde = gradeArray[1];
                    }
                }
            }

            var midtermGradeColumn = $(this).parents(".MidtermGradeColumn");
            if (typeof (midtermGradeColumn) !== 'undefined' && midtermGradeColumn != null) {
                var selected = midtermGradeColumn.find('.MidtermGrade').find(":selected");
                if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                    midtermGrade = selected.val();
                }
            }
            else {
                midtermGradeColumn = $(this).parents(".FinalGradeColumn").siblings('.MidtermGradeColumn');
                if (typeof (midtermGradeColumn) !== 'undefined' && midtermGradeColumn != null) {
                    var selected = midtermGradeColumn.find('.MidtermGrade').find(":selected");
                    if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                        midtermGrade = selected.val();
                    }
                }
            }

            var idNum = finalGradeColumn.siblings('.StudentId').html();
            var studentName = finalGradeColumn.siblings('.StudentName').find('.StudentNameLabel').html();

            var withdrawalReason = finalGradeColumn.siblings('.WithdrawalReason').find('.WithdrawalReasonText').val();
            var lastDateOfAttendance = finalGradeColumn.siblings('.LastDateOfAttendance').find('.dateInput').val();
            var addtoWithdrawDrop = finalGradeColumn.siblings('.AddToWithdrawDrop').find('.AddToWithdrawDropText').val();
            var withdrawalDte = finalGradeColumn.siblings('.WithdrawalDte').find('.dateInput').val();
            var excludeFromDropLimit = finalGradeColumn.siblings('.ExcludeFromDropLimit').html();

            var censusDte = $('.' + mainClass).find('.CensusDte').val();
            var lastWithdrawPassDte = $('.' + mainClass).find('.LastWithdrawPassDte').val();
            var useLimits = $('.' + mainClass).find('.UseLimits').val();

            showWithdrawalModal(idNum, studentName, withdrawalReason, lastDateOfAttendance, addtoWithdrawDrop, withdrawalDte, midtermGrade, finalGrade, censusDte, lastWithdrawPassDte, useLimits, excludeFromDropLimit, gradeScaleCde, creditTypeCde, finalGradeColumn, midtermGradeColumn);

        });

        $('#siteWrapper').on('click', '.submitAction', function (e) {
            e.preventDefault();
            e.stopPropagation();

            if ($(this).data("numericgrade") == true) {
                var outerDiv = $('#siteWrapper').find('.numericGradeContainer');
                var numericGrade = outerDiv.find('#numericGrade').val();

                if (numericGrade > 0) {
                    saveChanges = true;

                    $(this).parents('#numericGradePlugin').dialog("close");
                } else {
                    alert('Numeric grade is required for this student.');
                }
            } else {

                var outerDiv = $('#siteWrapper').find('.withdrawalContainer');
                var reasonReq = $('.' + mainClass).find('.ReasonReq').val();
                var withdrawalReason = outerDiv.find('#selWithdrawalReason').val();
                var lastDateOfAttendance = outerDiv.find('#datePicker').val();
                var addToWithdrawDrop = (outerDiv.find('#addToWithdrawDrop').is(':checked')) ? "Y" : "N";
                var withdrawalDte = outerDiv.find('#datePickerWD').val();

                var selectGlob = getGlobalization('TXT_FACT_GE_SELECT');

                if ((reasonReq == 'A' ||
                (reasonReq == 'U' && addToWithdrawDrop == 'N') ||
                (reasonReq == 'S' && addToWithdrawDrop == 'Y')) && withdrawalReason == '') {
                    alert('A Withdrawal Reason is required for withdrawal grades.');
                } else {

                    if (lastDateOfAttendance == '' || withdrawalDte == '')
                        alert('Last Date of Attendance and Withdrawal Date are both required.');
                    else {
                        saveChanges = true;

                        $(this).parents('#withdrawalPlugin').dialog("close");
                    }
                }
            }
        });


        $('#siteWrapper').on('click', '.cancelAction', function (e) {
            e.preventDefault();
            e.stopPropagation();

            saveChanges = false;

            if ($(this).data("numericgrade") == true) {
                $(this).parents('#numericGradePlugin').dialog("close");
            } else {
                $(this).parents('#withdrawalPlugin').dialog("close");
            }
        });

        function checkForDisplayWithdrawalModal(dropdown) {

            var withdrawalGrade = dropdown.find(":selected").data("withdrawalgrade");
            // if this is a withdrawal grade, show the last date of attendance column
            if (withdrawalGrade == "Y") {

                var gradeScaleCde = "";
                var creditTypeCde = "";
                var midtermGrade = "";
                var finalGrade = "";
                var selectGlob = getGlobalization('TXT_FACT_GE_SELECT');

                var finalGradeColumn = dropdown.parents(".FinalGradeColumn");
                if (typeof (finalGradeColumn) !== 'undefined' && finalGradeColumn != null && finalGradeColumn.length > 0) {
                    var selected = finalGradeColumn.find('.FinalGrade').find(":selected");
                    if (typeof (selected) !== 'undefined' && selected.val() !== undefined &&
                        selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                        finalGrade = selected.val();

                        var gradeArray = finalGrade.split(';');
                        gradeScaleCde = gradeArray[0];
                        creditTypeCde = gradeArray[1];
                    }
                }
                else {
                    finalGradeColumn = dropdown.parents(".MidTermGradeColumn").siblings('.FinalGradeColumn');
                    if (typeof (finalGradeColumn) !== 'undefined' && finalGradeColumn != null && finalGradeColumn.length > 0) {
                        var selected = finalGradeColumn.find('.FinalGrade').find(":selected");
                        if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                            finalGrade = selected.val();

                            var gradeArray = finalGrade.split(';');
                            gradeScaleCde = gradeArray[0];
                            creditTypeCde = gradeArray[1];
                        }
                    }
                }
                selectedFinalGradeColumn = finalGradeColumn;

                var midtermGradeColumn = dropdown.parents(".MidTermGradeColumn");
                if (typeof (midtermGradeColumn) !== 'undefined' && midtermGradeColumn != null && midtermGradeColumn.length > 0) {
                    var selected = midtermGradeColumn.find('.MidtermGrade').find(":selected");
                    if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                        midtermGrade = selected.val();
                    }
                }
                else {
                    midtermGradeColumn = dropdown.parents(".FinalGradeColumn").siblings('.MidTermGradeColumn');
                    if (typeof (midtermGradeColumn) !== 'undefined' && midtermGradeColumn != null && midtermGradeColumn.length > 0) {
                        var selected = midtermGradeColumn.find('.MidtermGrade').find(":selected");
                        if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                            midtermGrade = selected.val();
                        }
                    }
                }
                selectedMidtermGradeColumn = midtermGradeColumn;

                var columnToUse = finalGradeColumn;

                if (typeof (finalGradeColumn) === 'undefined' || finalGradeColumn == null)
                    columnToUse = midtermGradeColumn;

                var idNum = columnToUse.siblings('.StudentId').html();
                var studentName = columnToUse.siblings('.StudentName').find('.StudentNameLabel').html();
                var withdrawalReason = columnToUse.siblings('.WithdrawalReason').find('.WithdrawalReasonText').val();
                var lastDateOfAttendance = columnToUse.siblings('.LastDateOfAttendance').find('.dateInput').val();
                var addtoWithdrawDrop = columnToUse.siblings('.AddToWithdrawDrop').find('.AddToWithdrawDropText').val();
                var withdrawalDte = columnToUse.siblings('.WithdrawalDte').find('.dateInput').val();
                var excludeFromDropLimit = columnToUse.siblings('.ExcludeFromDropLimit').html();

                var censusDte = $('.' + mainClass).find('.CensusDte').val();
                var lastWithdrawPassDte = $('.' + mainClass).find('.LastWithdrawPassDte').val();
                var useLimits = $('.' + mainClass).find('.UseLimits').val();


                showWithdrawalModal(idNum, studentName, withdrawalReason, lastDateOfAttendance, addtoWithdrawDrop, withdrawalDte, midtermGrade, finalGrade, censusDte, lastWithdrawPassDte, useLimits, excludeFromDropLimit, gradeScaleCde, creditTypeCde, finalGradeColumn, midtermGradeColumn);

                //    dropdown.siblings('.WithdrawalGrade').val('Y');
                //    if ($('.' + mainClass).find(".LastDateOfAttendance").hasClass('DisplayNone')) {
                //        $('.' + mainClass).find(".LastDateOfAttendance").removeClass('DisplayNone');
                //    }
                //    if ($('.' + mainClass).find(".WithdrawalReason").hasClass('DisplayNone')) {
                //        $('.' + mainClass).find(".WithdrawalReason").removeClass('DisplayNone');
                //    }
            }
            //else {
            //    var isFound = false;

            //    $('.' + mainClass).find('.FinalGrade').each(function () {
            //        if ($(this).find(":selected").data("withdrawalgrade") == 'Y') {
            //            isFound = true;
            //            return false; //break out of the loop
            //        }
            //    });
            //    if (!isFound) {
            //        var allowLDoAEntry = $('#AllowLDoAEntry').val();

            //        if (allowLDoAEntry != "Y") {
            //            $('.' + mainClass).find(".LastDateOfAttendance").addClass('DisplayNone');
            //        }
            //        $('.' + mainClass).find(".WithdrawalReason").addClass('DisplayNone');
            //    }
            //}
        }

        function checkForDisplayNumericGradeModal(dropdown) {


            var numericGradeReq = null;
            var idNum = 0;
            var studentName = "";

            var finalGradeColumn = dropdown.parents(".FinalGradeColumn");
            if (typeof (finalGradeColumn) !== "undefined" && finalGradeColumn != null) {
                idNum = finalGradeColumn.siblings('.StudentId').html();
                studentName = finalGradeColumn.siblings('.StudentName').find('.StudentNameLabel').html();
                numericGradeReq = finalGradeColumn.siblings(".NumericGrade").find(".NumericGradeReq");
            }
            else {
                var midtermGradeColumn = dropdown.parents(".MidtermGradeColumn");
                idNum = midtermGradeColumn.siblings('.StudentId').html();
                studentName = midtermGradeColumn.siblings('.StudentName').find('.StudentNameLabel').html();
                numericGradeReq = midtermGradeColumn.siblings(".NumericGrade").find(".NumericGradeReq");
            }
            if (typeof (numericGradeReq) !== "undefined" && numericGradeReq != null) {
                if (numericGradeReq.val() == "Y") {
                    var numericGrade = numericGradeReq.siblings(".NumericGrade");
                    if (typeof (numericGrade) !== "undefined" && numericGrade != null) {
                        showNumericGradeModal(idNum, studentName, numericGrade.val(), finalGradeColumn);
                    }
                }
            }
        }

        function ValidateClockHoursAbsences() {
            var isValid = true;
            //Absences
            $('.' + mainClass).find('.Absences').each(function () {
                var absences = $(this).val();

                if (!$(this).hasClass('DisplayNone') && absences != "" && !$.isNumeric(absences)) {
                    var warningDiv = $('.' + mainClass).find('.divWarning');

                    warningDiv.removeClass('DisplayNone');
                    var glob = getGlobalization('TXT_NUMERIC_VALUE_REQUIRED_ABSENCES');
                    var student = $(this).parent().siblings('.StudentId').html();
                    warningDiv.find('.WarningMessage').html(glob.txt_numeric_value_required_absences.format(student));
                    isValid = false;
                    return false; // break out of loop
                }
            });
            if (!isValid) return false;

            //Clock Hours
            $('.' + mainClass).find('.ClockHours').each(function () {
                var clockHours = $(this).val();

                if (!$(this).hasClass('DisplayNone') && clockHours != "" && !$.isNumeric(clockHours)) {
                    var warningDiv = $('.' + mainClass).find('.divWarning');

                    warningDiv.removeClass('DisplayNone');
                    var glob = getGlobalization('TXT_NUMERIC_VALUE_REQUIRED_CLOCKHOURS');
                    var student = $(this).parent().siblings('.StudentId').html();
                    warningDiv.find('.WarningMessage').html(glob.txt_numeric_value_required_clockhours.format(student));
                    isValid = false;
                    return false; // break out of loop
                }
            });

            return isValid;
        }

        function ValidateLDOA() {

            var lDoAEntryType = $('#LDoAEntryType').val();
            var lDoAGradeList = $('#LDoAGradeList').val();
            var ldoaGrades = lDoAGradeList.split(',');
            var isValid = true;
            var errorType = 0;
            var names = "";
            var selectGlob = getGlobalization('TXT_FACT_GE_SELECT');

            $('.' + mainClass).find("tbody").find('.LastDateOfAttendance').each(function () {
                var ldoaDateInput = $(this).find("input");
                var ldoaDate = ldoaDateInput.val();
                if (typeof (ldoaDate) != 'undefined') {
                    if (!$(this).hasClass('DisplayNone') && !isDate(ldoaDate) && ldoaDate != "") {
                        isValid = false;
                        errorType = 1;
                        return false; // break out of loop
                    }

                    if (lDoAEntryType == "R" && ldoaDate == "") {
                        isValid = false;
                        errorType = 2;
                        return false; // break out of loop
                    }

                    if (lDoAEntryType == "G") {
                        var gradeToCheck = "";
                        //Check Final Grade First
                        var finalGradeColumn = $(this).siblings('.FinalGradeColumn').first();
                        if (typeof (finalGradeColumn) !== 'undefined' && finalGradeColumn != null) {
                            var finalGrade = finalGradeColumn.find('.FinalGrade');
                            if (typeof (finalGrade) !== 'undefined' && finalGrade != null) {
                                var selected = finalGrade.find(":selected");
                                if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                                    var gradeArray = selected.val().split(';');
                                    gradeToCheck = gradeArray[2];
                                }
                                else {
                                    var label = finalGradeColumn.find('.FinalGradeLabel');
                                    if (typeof (label) !== 'undefined' && label != null) {
                                        gradeToCheck = label.html();
                                    }
                                }
                            }
                        }

                        if (gradeToCheck == "") {
                            //Check Mid Term Grade If final is blank
                            var midtermGradeColumn = $(this).siblings('.MidTermGradeColumn');
                            if (typeof (midtermGradeColumn) !== 'undefined' && midtermGradeColumn != null) {
                                var midtermGrade = midtermGradeColumn.find('.MidtermGrade');
                                if (typeof (midtermGrade) !== 'undefined' && midtermGrade != null) {
                                    var selected = midtermGrade.find(":selected");
                                    if (typeof (selected) !== 'undefined' && selected != null && selected.val() != selectGlob.txt_fact_ge_select) {
                                        var gradeArray = selected.val().split(';');
                                        gradeToCheck = gradeArray[2];
                                    }
                                    else {
                                        var label = midtermGradeColumn.find('.MidtermGradeLabel');
                                        if (typeof (label) !== 'undefined' && label != null) {
                                            gradeToCheck = label.html();
                                        }
                                    }
                                }
                            }
                        }

                        for (var i = 0; i < ldoaGrades.length; i++) {
                            if (gradeToCheck == ldoaGrades[i]) {
                                if (ldoaDate == "") {
                                    isValid = false;
                                    errorType = 3;
                                    if (names == "") {
                                        names = $(this).siblings('.StudentName').find('.StudentNameLabel').html();
                                    }
                                    else {
                                        names += ", " + $(this).siblings('.StudentName').find('.StudentNameLabel').html();;
                                    }
                                    break;
                                }
                            }
                        }
                    }
                }
            });

            if (!isValid) {

                var warningDiv = $('.' + mainClass).find('.divWarning');
                warningDiv.removeClass('DisplayNone');

                switch (errorType) {
                    case 1:
                        var glob = getGlobalization('MSG_LDOA_NOT_DATE');
                        warningDiv.find('.WarningMessage').html(glob.msg_ldoa_not_date);
                        break;
                    case 2:
                        var glob = getGlobalization('MSG_LDOA_REQUIRED_FOR_ALL');
                        warningDiv.find('.WarningMessage').html(glob.msg_ldoa_required_for_all);
                        break;
                    case 3:
                        var glob = getGlobalization('MSG_LDOA_REQUIRED_FOR_GRADES');
                        warningDiv.find('.WarningMessage').html(glob.msg_ldoa_required_for_grades + ' ' + names);
                        break;
                }
            }

            return isValid;
        }

        function ValidateWithdrawals(saveButton) {
            var isValid = true;
            var errorType = 0;
            var names = "";


            $('.' + mainClass).find("tbody").find('.LastDateOfAttendance').each(function () {
                var ldoaDate = $(this).find("input").val();

                var withdrawalGrade = "";
                var selectGlob = getGlobalization('TXT_FACT_GE_SELECT');

                //Check Final Grade First
                var finalGradeColumn = $(this).siblings('.FinalGradeColumn');
                if (typeof (finalGradeColumn) !== 'undefined' && finalGradeColumn != null) {
                    var finalGrade = finalGradeColumn.find('.FinalGrade');
                    if (typeof (finalGrade) !== 'undefined' && finalGrade != null) {
                        //var selected = finalGrade.find(":selected");
                        //if (selected.length && selected.val() != selectGlob.txt_fact_ge_select) {
                        //withdrawalGrade = finalGrade.siblings('.WithdrawalGrade').val();
                        //}
                        withdrawalGrade = finalGrade.find(":selected").data("withdrawalgrade");
                    }
                }

                //Check Mid Term Grade If final is blank
                if (typeof (withdrawalGrade) == 'undefined' || withdrawalGrade == null || withdrawalGrade == "") {
                    var midtermGradeColumn = $(this).siblings('.MidTermGradeColumn');
                    if (typeof (midtermGradeColumn) !== 'undefined' && midtermGradeColumn != null) {
                        var midtermGrade = midtermGradeColumn.find('.MidtermGrade');
                        if (typeof (midtermGrade) !== 'undefined' && midtermGrade != null) {
                            //var selected = midtermGrade.find(":selected");
                            //if (selected.length && selected.val() != selectGlob.txt_fact_ge_select) {
                            //    withdrawalGrade = midtermGrade.siblings('.WithdrawalGrade').val();
                            //}
                            withdrawalGrade = midtermGrade.find(":selected").data("withdrawalgrade");
                        }
                    }
                }

                if (withdrawalGrade == "Y") {
                    var addName = false;
                    // validate that last date of attendance was entered, and is a valid date
                    if (!isDate(ldoaDate) && ldoaDate != "") {
                        isValid = false;
                        addName = false;
                        errorType = 1;
                    }

                    if (ldoaDate == "") {
                        isValid = false;
                        addName = true;
                        errorType = 2;
                    }

                    // validate that withdrawal reason was entered
                    //var withdrawalReason = $(this).siblings('.WithdrawalReason').find('select').find(":selected").val();

                    //if (!withdrawalReason.length || withdrawalReason == selectGlob.txt_fact_ge_select) {
                    //    isValid = false;
                    //    addName = true;
                    //    errorType = 3;
                    //}

                    if (addName)
                        if (names == "")
                            names = $(this).siblings('.StudentName').find('.StudentNameLabel').html();
                        else
                            names += ", " + $(this).siblings('.StudentName').find('.StudentNameLabel').html();
                }
            });

            if (!isValid) {

                var warningDiv = $('.' + mainClass).find('.divWarning');
                warningDiv.removeClass('DisplayNone');

                switch (errorType) {
                    case 1:
                        var glob = getGlobalization('MSG_LDOA_NOT_DATE');
                        warningDiv.find('.WarningMessage').html(glob.msg_ldoa_not_date);
                        break;
                    case 2:
                        var glob = getGlobalization('MSG_LDOA_REQUIRED_FOR_GRADES');
                        warningDiv.find('.WarningMessage').html(glob.msg_ldoa_required_for_grades + ' ' + names);
                        break;
                    case 3:
                        var glob = getGlobalization('MSG_WR_REQUIRED_FOR_GRADES');
                        warningDiv.find('.WarningMessage').html(glob.msg_wr_required_for_grades.format(names));
                        break;
                }
            }

            return isValid;
        }

        function getGlobalization(text_key) {
            var glob = null;
            $.ajax({
                type: "get",
                async: false,
                url: urlUtil.getAppRoot() + 'api/globalization/' + text_key,
                dataType: "json",
                success: function (globalizationObject) {
                    glob = globalizationObject;
                },
                error: function (xhr, status, error) {
                    alert("Failed to get the globalization values from Server.", xhr.responseText);
                }
            });
            return glob;
        }

        String.prototype.format = function () {
            var args = arguments;
            return this.replace(/\{(\d+)\}/g, function (m, n) { return args[n]; });
        };

        function isDate(val) {
            var d = new Date(val);
            return !isNaN(d.valueOf());
        }



        function showWithdrawalModal(idNum, studentName, withdrawalReason, lastDateOfAttendance, addtoWithdrawDrop, withdrawalDte, midtermGrade, finalGrade, censusDte, lastWithdrawPassDte, useLimits, excludeFromDropLimit, gradeScaleCde, creditTypeCde, finalGradeColumn, midtermGradeColumn) {


            var modalLabels = getModalLabels();

            var withdrawalReasons = getAvailableWithdrawalReasons();

            var withdrawalGrades = getAvailableWithdrawalGrades(idNum, gradeScaleCde, creditTypeCde, lastDateOfAttendance, withdrawalDte, censusDte, lastWithdrawPassDte, 0);
            var midtermWithdrawalGrades = getAvailableWithdrawalGrades(idNum, gradeScaleCde, creditTypeCde, lastDateOfAttendance, withdrawalDte, censusDte, lastWithdrawPassDte, 1);

            var withdrawDropCountDto = getWDCounts(idNum);
            var countExceeded = false;

            if (withdrawDropCountDto.TransferWDCount + withdrawDropCountDto.LocalWDCount >= withdrawDropCountDto.WDLimit) {
                countExceeded = true;
            }

            $.get(urlUtil.getAppRoot() + 'portlets/crm/faculty/portlet.gradeentry/templates/withdrawalmodal.htm')
            .then(function (source) {

                Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {

                    switch (operator) {
                        case '==':
                            return (v1 == v2) ? options.fn(this) : options.inverse(this);
                        case '===':
                            return (v1 === v2) ? options.fn(this) : options.inverse(this);
                        case '!=':
                            return (v1 != v2) ? options.fn(this) : options.inverse(this);
                        case '<':
                            return (v1 < v2) ? options.fn(this) : options.inverse(this);
                        case '<=':
                            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
                        case '>':
                            return (v1 > v2) ? options.fn(this) : options.inverse(this);
                        case '>=':
                            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
                        case '&&':
                            return (v1 && v2) ? options.fn(this) : options.inverse(this);
                        case '||':
                            return (v1 || v2) ? options.fn(this) : options.inverse(this);
                        default:
                            return options.inverse(this);
                    }
                });

                var template = Handlebars.compile(source);
                $("#modal").html(template({
                    modalLabels: modalLabels,
                    reasonList: withdrawalReasons,
                    gradeList: withdrawalGrades,
                    midtermGradeList: midtermWithdrawalGrades,
                    idNum: idNum,
                    studentName: studentName,
                    withdrawalReason: withdrawalReason,
                    lastDateOfAttendance: lastDateOfAttendance,
                    addToWithdrawDrop: addtoWithdrawDrop,
                    withdrawalDte: withdrawalDte,
                    midtermGradeVal: midtermGrade,
                    finalGradeVal: finalGrade,
                    censusDte: censusDte,
                    lastWithdrawPassDte: lastWithdrawPassDte,
                    useLimits: useLimits,
                    excludeFromDropLimit: excludeFromDropLimit,
                    gradeScaleCde: gradeScaleCde,
                    creditTypeCde: creditTypeCde,
                    countExceeded: countExceeded
                }));

                $("#withdrawalPlugin").dialog({
                    autoOpen: false,
                    width: 620,
                    modal: true,
                    close: function (event, ui) {
                        if (saveChanges) {
                            var outerDiv = $(this).find('.withdrawalContainer');
                            var withdrawalReason = outerDiv.find('#selWithdrawalReason').val();
                            var lastDateOfAttendance = outerDiv.find('#datePicker').val();
                            var addToWithdrawDrop = (outerDiv.find('#addToWithdrawDrop').is(':checked')) ? "Y" : "N";
                            var withdrawalDte = outerDiv.find('#datePickerWD').val();
                            finalGrade = outerDiv.find('#selFinalGrade').val();
                            midtermGrade = outerDiv.find('#selMidtermGrade').val();

                            if (typeof (selectedFinalGradeColumn) !== 'undefined' && selectedFinalGradeColumn != null && selectedFinalGradeColumn.length > 0) {
                                selectedFinalGradeColumn.siblings('.WithdrawalReason').find('.WithdrawalReasonText').val(withdrawalReason);
                                selectedFinalGradeColumn.siblings('.LastDateOfAttendance').find('.dateInput').val(lastDateOfAttendance);
                                selectedFinalGradeColumn.siblings('.AddToWithdrawDrop').find('.AddToWithdrawDropText').val(addToWithdrawDrop);
                                selectedFinalGradeColumn.siblings('.WithdrawalDte').find('.dateInput').val(withdrawalDte);
                                if (finalGrade.length > 0) {
                                    selectedFinalGradeColumn.find('.FinalGrade').val(finalGrade);
                                }
                            } else {
                                selectedMidtermGradeColumn.siblings('.WithdrawalReason').find('.WithdrawalReasonText').val(withdrawalReason);
                                selectedMidtermGradeColumn.siblings('.LastDateOfAttendance').find('.dateInput').val(lastDateOfAttendance);
                                selectedMidtermGradeColumn.siblings('.AddToWithdrawDrop').find('.AddToWithdrawDropText').val(addToWithdrawDrop);
                                selectedMidtermGradeColumn.siblings('.WithdrawalDte').find('.dateInput').val(withdrawalDte);
                            }

                            if (typeof (selectedMidtermGradeColumn) !== 'undefined' && selectedMidtermGradeColumn != null &&
                                midtermGrade.length > 0) {
                                selectedMidtermGradeColumn.find('.MidtermGrade').val(midtermGrade);
                            }
                        }

                        selectedFinalGradeColumn.find('.WithdrawalDetail').removeClass('DisplayNone');

                        $(this).parent().remove();
                        $("#modal").html("");
                    }
                });

                $("#withdrawalPlugin").dialog("open");

                $("#datePicker").datepicker({
                    // userSettings is a global JavaScript object included in every JICS page load.
                    dateFormat: userSettings.dateFormat,
                    onSelect: function (date) {
                        // if withdrawalDte is empty set it to what the user just picked for last date of attendance
                        if (withdrawalDte == "") {
                            $("#datePickerWD").datepicker("setDate", date);
                            withdrawalDte = date;
                        }

                        var compareDate = $('.' + mainClass).find('.CompareDate').val();

                        if (compareDate == "L") {
                            // get new list of available grades based on last date of attendance
                            var withdrawalGrades = getAvailableWithdrawalGrades(idNum, gradeScaleCde, creditTypeCde, date, date, censusDte, lastWithdrawPassDte, 0);

                            var $el = $("#selFinalGrade");
                            var selFinalGrade = $('#selFinalGrade option:gt(0)');
                            if (selFinalGrade.length > 0) {
                                selFinalGrade.remove(); // remove old options
                                $.each(withdrawalGrades.availableGrades, function(index, element) {
                                    if (finalGrade == element.gradeCode)
                                        $el.append($("<option selected></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                    else
                                        $el.append($("<option></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                });
                            }

                            // get new list of available midterm grades based on last date of attendance
                            withdrawalGrades = getAvailableWithdrawalGrades(idNum, gradeScaleCde, creditTypeCde, date, date, censusDte, lastWithdrawPassDte, 1);

                            $el = $("#selMidtermGrade");
                            var selMidtermGrade = $('#selMidtermGrade option:gt(0)');
                            if (selMidtermGrade.length > 0) {
                                selMidtermGrade.remove(); // remove old options
                                $.each(withdrawalGrades.availableGrades, function(index, element) {
                                    if (midtermGrade == element.gradeCode)
                                        $el.append($("<option selected></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                    else
                                        $el.append($("<option></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                });
                            }
                        }
                    }
                });

                $("#datePickerWD").datepicker({
                    // userSettings is a global JavaScript object included in every JICS page load.
                    dateFormat: userSettings.dateFormat,
                    onSelect: function (date) {
                        var compareDate = $('.' + mainClass).find('.CompareDate').val();

                        if (compareDate == "W") {
                            // get new list of available grades based on withdrawal date
                            var withdrawalGrades = getAvailableWithdrawalGrades(idNum, gradeScaleCde, creditTypeCde, date, date, censusDte, lastWithdrawPassDte, 0);

                            var $el = $("#selFinalGrade");
                            var selFinalGrade = $('#selFinalGrade option:gt(0)');
                            if (selFinalGrade.length > 0) {
                                selFinalGrade.remove(); // remove old options
                                $.each(withdrawalGrades.availableGrades, function(index, element) {
                                    if (finalGrade == element.gradeCode)
                                        $el.append($("<option selected></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                    else
                                        $el.append($("<option></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                });
                            }

                            // get new list of available midterm grades based on withdrawal date
                            withdrawalGrades = getAvailableWithdrawalGrades(idNum, gradeScaleCde, creditTypeCde, date, date, censusDte, lastWithdrawPassDte, 1);

                            $el = $("#selMidtermGrade");
                            var selMidtermGrade = $('#selMidtermGrade option:gt(0)');
                            if (selMidtermGrade.length > 0) {
                                selMidtermGrade.remove(); // remove old options
                                $.each(withdrawalGrades.availableGrades, function(index, element) {
                                    if (midtermGrade == element.gradeCode)
                                        $el.append($("<option selected></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                    else
                                        $el.append($("<option></option>")
                                            .attr("value", element.gradeCode).text(element.gradeDesc));
                                });
                            }
                        }
                    }
                });

                $('#updateMidtermGrade').on('click', function (e) {

                    if ($(this).is(':checked'))
                        $('#selMidtermGrade').prop("disabled", false);
                    else
                        $('#selMidtermGrade').prop("disabled", true);
                });

                $('.ui-widget-overlay').appendTo($('#MAINFORM'));
                $('.ui-dialog').appendTo($('#MAINFORM'));
            });
        }


        function showNumericGradeModal(idNum, studentName, numericGrade, finalGradeColumn) {


            var modalLabels = getModalLabels();

            $.get(urlUtil.getAppRoot() + 'portlets/crm/faculty/portlet.gradeentry/templates/numericgrademodal.htm')
            .then(function (source) {

                var template = Handlebars.compile(source);
                $("#modal").html(template({
                    modalLabels: modalLabels,
                    idNum: idNum,
                    studentName: studentName,
                    numericGrade: numericGrade
                }));

                $("#numericGradePlugin").dialog({
                    autoOpen: false,
                    width: 620,
                    modal: true,
                    close: function (event, ui) {
                        if (saveChanges) {
                            var outerDiv = $(this).find('.numericGradeContainer');
                            var numericGrade = outerDiv.find('#numericGrade').val();

                            finalGradeColumn.siblings('.NumericGrade').find('.NumericGrade').val(numericGrade);
                        }

                        $(this).parent().remove();
                        $("#modal").html("");
                    }
                });

                $("#numericGradePlugin").dialog("open");

                $('.ui-widget-overlay').appendTo($('#MAINFORM'));
                $('.ui-dialog').appendTo($('#MAINFORM'));
            });
        }

        function getModalLabels() {
            var modalLabels = null;
            $.ajax({
                url: urlUtil.getAppRoot() + 'api/exgradeentry',
                dataType: 'json',
                async: false,
                success: function (response) {
                    modalLabels = response;
                },
                error: function () {
                    alert('there was an error while fetching labels!');
                },
            });
            return modalLabels;
        }

        function getAvailableWithdrawalReasons() {
            var withdrawalReasons = null;
            $.ajax({
                url: urlUtil.getAppRoot() + 'api/exgradeentry',
                dataType: 'json',
                data: { bogusArg: 1 },
                async: false,
                success: function (response) {
                    withdrawalReasons = response;
                },
                error: function () {
                    alert('there was an error while fetching available withdrawal reasons!');
                },
            });
            return withdrawalReasons;
        }

        function getAvailableWithdrawalGrades(idNum, gradeScaleCde, creditTypeCde, lastDateofAttend, withdrawalDte, censusDte, lastWithdrawalPassDte, midterm) {
            var withdrawalGrades = null;
            $.ajax({
                url: urlUtil.getAppRoot() + 'api/exgradeentry',
                dataType: 'json',
                data: {
                    idNum: idNum,
                    gradeScaleCde: gradeScaleCde,
                    creditTypeCde: creditTypeCde,
                    lastDateofAttend: lastDateofAttend,
                    withdrawalDte: withdrawalDte,
                    censusDte: censusDte,
                    lastWithdrawalPassDte: lastWithdrawalPassDte,
                    midterm: midterm
                },
                async: false,
                success: function (response) {
                    withdrawalGrades = response;
                },
                error: function () {
                    alert('there was an error while fetching available withdrawal grades!');
                },
            });
            return withdrawalGrades;
        }

        function getWDCounts(idNum) {
            var withdrawDropCountDto = null;
            $.ajax({
                url: urlUtil.getAppRoot() + 'api/exgradeentry',
                dataType: 'json',
                data: {
                    idNum: idNum
                },
                async: false,
                success: function (response) {
                    withdrawDropCountDto = response;
                },
                error: function () {
                    alert('there was an error while fetching withdrawal/drop data!');
                },
            });
            return withdrawDropCountDto;
        }
    });
}(window.GradeEntryPortlet = window.GradeEntryPortlet || {}, jQuery));