
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$Essay()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$BaseQuestion);

    //#region VARIIABLE

	    var table;
	 
	    var total	= 0;				
	    var full	= 0;
	    var none    = 0;
	    var partial = 0;
	    var na		= 0;

    //#endregion

    //#region ROUTINE

        var aggregate = function()
        {
	        JCSL.lang.for_each
	        (
		        this.question.ScoreDistribution,
		        function(attribute)
		        {
			        total += $this.question.ScoreDistribution[attribute];
			
			        if (attribute == $this.question.TotalPoints)
			        {
				        full += $this.question.ScoreDistribution[attribute];
				
				        return;
			        }
			
			        if (attribute == 0)
			        {
				        none += $this.question.ScoreDistribution[attribute];
				
				        return;
			        }
			
			        if (attribute < $this.question.TotalPoints)
			        {
				        partial += $this.question.ScoreDistribution[attribute];
				
				        return;
			        }
		        }
	        );
	
	        JCSL.lang.for_item
	        (
		        this.question.ResponseSummaries,
		        function(rs)
		        {
			        if (rs.Text === "Response") return;
			
			        na = rs.Count;
		        }
	        );
        }

    //#endregion

    //#region METHOD

        this.render = function(container)
        {
            aggregate.call(this);

            var table = this._element;

            table.rows[0].cells[1].innerHTML = (full + " (" + JCSL.lang.math.round(((full / total) * 100), 1) + "%)");
            table.rows[1].cells[1].innerHTML = (partial + " (" + JCSL.lang.math.round(((partial / total) * 100), 1) + "%)");
            table.rows[2].cells[1].innerHTML = (none + " (" + JCSL.lang.math.round(((none / total) * 100), 1) + "%)");
            table.rows[3].cells[1].innerHTML = (na + " (" + JCSL.lang.math.round(((na / total) * 100), 1) + "%)");

            table.rows[0].style.fontWeight = "Bold";

            //

            this.rows = table.rows;

            $base.render.call(this, container);
        }

    //#endregion
}
