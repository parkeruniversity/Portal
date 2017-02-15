
var TestAnalysisView = new function () {
    var $this = this;

    var divAnalysisLoading;
    var divAnalysis;

    this.AssignmentID;
    this.ImagePath;
    this.StudentLinkTemplate;

    this.Load = function () {
        divAnalysisLoading = JCSL.element.find("divAnalysisLoading");
        divAnalysis = JCSL.element.find("divAnalysis");

        //

        divAnalysisLoading.className = "CWK_Analytics_Loading";

        load_analysis_control();
    }

    var load_analysis_control = function () {
        JCSL.ui.CachedControl.download
        (
            {
                base: ($this.url + "../Analytics/"),
                name: "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics",
                version: "v050212.0",
                callback: render_analysis,
                data: {
                    assignment_id: $this.AssignmentID.ToString(),
                    paths: { image: $this.ImagePath + "/" },
                    student_link_template: $this.StudentLinkTemplate
                }
            }
        );
    }

    var render_analysis = function (analytics) {
        var on_error = function (header, error) {
            divAnalysisLoading.style.display = "none";

            divAnalysis.innerHTML = error;

            new JCSL.ui.windows.MessageBox(header, error, exitTestAnalysis).open(null);
        }

        //

        analytics.on_error = on_error;

        analytics.render(divAnalysis);
    }


    var exitTestAnalysis = function () {
        window.location.href = $('.cwkBorderButtonBar.mainScreenLink a:first-child').attr('href');
    }
}