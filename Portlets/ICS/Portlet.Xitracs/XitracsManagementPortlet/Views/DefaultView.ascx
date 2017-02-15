<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="Portlet.DataProvider.XitracsManagementPortlet.Views.DefaultView" %>
<h5>Manually export data</h5>
<p>
    <label for="systemTarget">Export to:</label>
    <select id="systemTarget">
        <option value="">&lt;select a system&gt;</option>
    </select>
</p>
<p>
    <label for="termList">Select a term:</label>
    <select id="termList">
        <option value="">All terms</option>
    </select>
</p>
<ul style="-webkit-column-count: 3; -moz-column-count: 3; column-count: 3;">
    <li>
        <input type="checkbox" id="importFaculty" checked />
        <label for="importFaculty">Faculty</label>
    </li>
    <li>
        <input type="checkbox" id="importDepartments" checked />
        <label for="importDepartments">Departments</label>
    </li>

    <li>
        <input type="checkbox" id="importTerms" checked />
        <label for="importTerms">Terms</label>
    </li>
    <li>
        <input type="checkbox" id="importCourses" checked />
        <label for="importCourses">Courses <small>(For all terms)</small></label>
    </li>
    <li>
        <input type="checkbox" id="importSections" checked />
        <label for="importSections">Sections</label>
    </li>
    <li>
        <input type="checkbox" id="importSectionEnrollment" checked />
        <label for="importSectionEnrollment">Section Enrollments</label>
    </li>
</ul>


<input type="button" value="Export" id="generateFiles" />


<script>
    $(document).ready(function () {
        var termList = $('#termList');
        $.ajax({ url: 'api/xitracs/getterms/' }).then(function (response) {
            response.forEach(function (item) {
                termList.append('<option value="' + item.termCode + '">' + item.termName + '</option>');
            });
        });
        $.ajax({ url: 'api/canvas/checkinstallation/' }).then(function (response) {
            if (response) {
                $('#systemTarget').append('<option value="canvas">Canvas</option>');
            }
        });
        $.ajax({ url: 'api/xitracs/checkinstallation/' }).then(function (response) {
            if (response) {
                $('#systemTarget').append('<option value="xitracs">Xitracs</option>');
            }
        });


       $('#generateFiles').click(function (e) {
            var generateButton = $(e.currentTarget);
            generateButton.attr('disabled', true);
            var generateCriteria = {};

            var termCode = $('#termList').val();
            if (termCode !== '') {
                generateCriteria.termCode = termCode;
            }
            if ($('#importFaculty').is(':checked')) {
                generateCriteria.importFaculty = true;
            }
            if ($('#importTerms').is(':checked')) {
                generateCriteria.importTerms = true;
            }

            if ($('#importDepartments').is(':checked')) {
                generateCriteria.importDepartments = true;
            }

            if ($('#importCourses').is(':checked')) {
                generateCriteria.importCourses = true;
            }

            if ($('#importSections').is(':checked')) {
                generateCriteria.importSections = true;
            }

            if ($('#importSectionEnrollment').is(':checked')) {
                generateCriteria.importSectionEnrollment = true;
            }


            var targetUrl;
            switch ($('#systemTarget').val()) {
                case 'canvas':
                    targetUrl = 'api/canvas/runjob';
                    break;
                case 'xitracs':
                    targetUrl = 'api/xitracs/runjob';
                    break;
                default :
                    alert('Please pick a system to export to');
                    generateButton.attr('disabled', false);
                    return;
            }
            $.ajax({
                type: 'POST',
                url: targetUrl,
                data: JSON.stringify(generateCriteria),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) { console.log(data); }
            }).then(function (response) {
                generateButton.attr('disabled', false);
            });
        });
        $('#refreshStatus').click(function (e) {
            var refreshButton = $(e.currentTarget);
            refreshButton.attr('disabled', true);
            $.ajax({ url: 'api/xitracs/getjobs' }).then(function (response) {
                var tbody = $('#jobTable tbody');
                refreshButton.attr('disabled', false);
                response.forEach(function (item) {
                    var row = $('<tr>')
                        .append('<td>').text(item.started)
                        .append('<td>').text(item.finished)
                        .append('<td>').text(item.status)
                        .append('<td>').append($('<a>').attr('href', item.link).text('Download'));
                    tbody.append(row);
                });
            });

        });
        $('#testRun').click(function () {
            var data = { 'code': 'hljkll' };
            $.ajax({ url: '/ics/api/xitracs/testcode', type: 'GET', contentType: 'application/json', data: JSON.stringify(data) }).then(function (response) {
                console.log(response);
            });
        });
    });
</script>
