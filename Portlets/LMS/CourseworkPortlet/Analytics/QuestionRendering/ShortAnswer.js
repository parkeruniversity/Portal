
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$ShortAnswer()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$BaseQuestion);

    //

    //#region VAIRABLE

	    var full_credit_answer      = null;
	    var full_credit_count       = 0;
	    var full_credit_percent     = 0;
	    var no_response_count       = 0;
	    var no_response_percent     = 0;
	    var other_count             = 0;
	    var other_percent           = 0;

	    var other_answers           = [];

    //#endregino

    //#region ROUTINE

        var aggregate = function(response)
        {
	        JCSL.lang.for_item
	        (
		        this.question.ResponseSummaries,
		        function(rs)
		        {
			        if (rs.IsCorrect)
			        {
				        if (full_credit_answer == null)
				        {
					        full_credit_answer = rs.Text;
				        }
				
				        full_credit_count   += rs.Count;
				        full_credit_percent += rs.Percent;
			        }
			        else
			        {
				        if (rs.Text == "")
				        {
					        no_response_count   += rs.Count;
					        no_response_percent += rs.Percent;
				        }
				        else
				        {
					        other_count   += rs.Count;
					        other_percent += rs.Percent;

					        other_answers.push([rs.Text]);
				        }
			        }
		        }
	        );
        }

        var build = function()
        {
            aggregate.call(this);

            var table = this._element;

            table.rows[0].cells[0].innerHTML = full_credit_answer;
            table.rows[0].cells[1].innerHTML = (full_credit_count + " (" + JCSL.lang.math.round(full_credit_percent, 1) + "%)");

            table.rows[1].cells[1].innerHTML = (other_count + " (" + JCSL.lang.math.round(other_percent, 1) + "%)");

            table.rows[2].cells[1].innerHTML = (no_response_count + " (" + JCSL.lang.math.round(no_response_percent, 1) + "%)");

            table.rows[3].cells[0].appendChild(build_detail_button()[0]);

            table.rows[4].cells[0].appendChild(JCSL.element.table.create(other_answers));

            this.rows = table.rows;
        }

        var build_detail_button = function()
        {
		    var detail_button__Click = function(event_args, value)
		    {						
			    $this._element.rows[4].style.display = ((value == true) ? "none" : ""); 
		    }
		
		    ////
            		
		    var ti =
		    new JCSL.ui.controls.ToggleImage
		    (
			    [
				    {
					    image:	($this.data.paths.image + "expand_A.gif"),
					    func:	detail_button__Click
					
				    },
				    {
					    image:	($this.data.paths.image + "collapse_A.gif"),
					    func:	detail_button__Click
				    }
			    ]
			
		    );

            ti.render(document.createElement("div"));
		
		    return ti.container;
        }

    //#endregion

    //#region METHOD

        this.render = function(container)
        {
            build.call(this);

            $base.render.call(this, container);
        }

    //#endregion
}
