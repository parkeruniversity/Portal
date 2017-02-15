
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$Ordering()
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

            var tbody = table.getElementsByTagName("TBODY")[0];

            var data_rows = [];

            for (var i=0; i<cs.length; i++) 
            {
                var dr = build_row(cs[i], (i+1))

                data_rows.push(dr);
                
                tbody.appendChild(dr);

                //
                
                tbody.appendChild(build_row_detail(cs[i]));
            }

            this.rows = data_rows;
        }

        var build_row = function(cs, order)
        {
            var row = template_row.cloneNode(true);

            var cells = row.cells;

            if (!cells.length)
            {
                cells = row.childNodes;
            }

            cells[0].getElementsByTagName("div")[0].innerHTML = cs.Text;
            cells[1].innerHTML = (cs.CorrectCount + " (" + JCSL.lang.math.round(cs.CorrectPercent, 1) +  "%)")

            cells[2].appendChild(build_detail_button()[0]);

            return row;
        }

        var build_row_detail = function(cs)
        {
            var row = template_row_detail.cloneNode(true);

            table = row.getElementsByTagName("TABLE")[0];

            table.rows[0].cells[0].innerHTML = (Globalizer["TXT_CWK_ITEM_DIFFICULTY"] + ":");
            table.rows[0].cells[1].innerHTML = JCSL.lang.math.precision(cs.DifficultyRating, .01)

            table.rows[1].cells[0].innerHTML = (Globalizer["TXT_CWK_ITEM_DISCRIMINATION"] + ":");
            table.rows[1].cells[1].innerHTML = JCSL.lang.math.precision(cs.DiscriminationIndex, .01)

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