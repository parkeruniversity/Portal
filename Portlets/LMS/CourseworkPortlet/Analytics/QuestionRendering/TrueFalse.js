
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$TrueFalse()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$BaseQuestion);

    //#region VARIABLE

        var correct;

    //#endregion

    //#region ROUTINE

        var find_response = function(response)
        {
			var found_rs;
			
			JCSL.lang.for_item
			(
				this.question.ResponseSummaries,
				function(rs)
				{
					if (rs.Text.toLowerCase() == response.toLowerCase())
					{
						found_rs = rs;
					}
				}
			);
			
			//
			
			if (found_rs == null) return "0 (0%)";

			if (found_rs.IsCorrect)
			{
				correct = (/^true$/i).test(response)
					
				found_rs.Text = ("*" + found_rs.Text);
			}

            return (found_rs.Count + " ( " + JCSL.lang.math.precision(found_rs.Percent, .01) + "%)");
    }

    //#endregion

    //#region METHOD

        this.render = function(container)
        {
            var table = this._element;

            for (var i=0; i<table.rows.length; i++)
            {
                var row = table.rows[i];

                row.cells[1].innerHTML = find_response.call(this, row.cells[0].innerHTML);
            }

	        if (correct != null)
	        {
		        if (correct)
		        {
			        table.rows[0].style.fontWeight = "bold";
		        }
		        else
		        {
			        table.rows[1].style.fontWeight = "bold";
		        }
	        }
            //

            this.rows = table.rows;

            $base.render.call(this, container)
        }

    //#endregion
}