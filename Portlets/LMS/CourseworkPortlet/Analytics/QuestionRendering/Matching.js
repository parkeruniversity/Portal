
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$Matching()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$BaseQuestion);

    //#region VARIABLE

        var template_row;
        var template_row_detail;

    //#endregion

    //#region ROUTINE

        var build = function()
        {
            template_row        = $this.g$("TTR_template").cloneNode(true);
            template_row_detail = $this.g$("TTR_template_detail").cloneNode(true);

            var table = this._element;

            table.deleteRow(1);
            table.deleteRow(0);

            //

            cs = this.question.ChoiceSummaries;

            var tbody = table.getElementsByTagName("TBODY")[0]

            var data_rows = [];

            for (var i=0; i<cs.length; i++) 
            {
                var dr = build_row(cs[i], (i+1));

                data_rows.push(dr);

                tbody.appendChild(dr);

                //

                tbody.appendChild(build_row_detail(cs[i], (i+1)));
            }

            this.rows = data_rows;
        }

        var build_row = function(cs, order)
        {
            var correct_response; //Number
			
			JCSL.lang.for_each
			(
				cs.ChoiceResponseSummaries,
				function(index)
				{
					if (cs.ChoiceResponseSummaries[index].IsCorrect)
					{
						correct_response = index;
						
						arguments.callee.break_out = true;
					}
				}
			);

            //
            
            var row = template_row.cloneNode(true);

            var cells = row.cells;

            if (!cells.length)
            {
                cells = row.childNodes;
            }

            cells[0].getElementsByTagName("div")[0].innerHTML = cs.Text;
            cells[1].innerHTML = ((correct_response == null) ? "" : cs.ChoiceResponseSummaries[correct_response].Text);
            cells[2].innerHTML = (cs.CorrectCount + "(" + JCSL.lang.math.round(cs.CorrectPercent, 1) + "%)");

            cells[3].appendChild(build_detail_button()[0]);

            return row;
        }

        var build_row_detail = function(cs, template_row)
        {
            var row = template_row_detail.cloneNode(true);

            JCSL.element.find_by_data("id", "SPN_difficulty", row)[0].innerHTML = JCSL.lang.math.precision(cs.DifficultyRating, .01);
            JCSL.element.find_by_data("id", "SPN_discrimination", row)[0].innerHTML = JCSL.lang.math.precision(cs.DiscriminationIndex, .01);

            //

            var TBL_match = jQuery(row).find('TABLE[data-id="TBL_match"]');

            var tbody = TBL_match.children("tbody");

            var TTR_match_template =  TBL_match.find('TR[data-id="TTR_match_template"]').get(0);

            TTR_match_template.parentNode.removeChild(TTR_match_template);

            for (var crs in cs.ChoiceResponseSummaries)
            {
                var ttr = TTR_match_template.cloneNode(true);

                var choice_reponse_summary = cs.ChoiceResponseSummaries[crs];

                var cells = ttr.cells;

                if (!cells.length)
                {
                    cells = ttr.childNodes;
                }

                cells[0].innerHTML = ((choice_reponse_summary.Text == "") ? "&nbsp;" : choice_reponse_summary.Text); //((choice_reponse_summary.IsCorrect ? "*" : "") + 
                cells[1].innerHTML = (JCSL.lang.math.round(choice_reponse_summary.OverallPercent, 1) + "%")
                cells[2].innerHTML = (JCSL.lang.math.round(choice_reponse_summary.GroupPercents[choice_reponse_summary.GroupPercents.length-1], 1) + "%"),
				cells[3].innerHTML = (JCSL.lang.math.round(choice_reponse_summary.GroupPercents[0], 1) + "%")
                
                tbody.append(ttr);
            }

            return row;
        }

        var build_detail_button = function()
        {
		    var detail_button__Click = function(event_args, value)
		    {						
			    $this._element.rows[event_args.source.parentNode.parentNode.parentNode.rowIndex+1].style.display = ((value) ? "none" : ""); 
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
