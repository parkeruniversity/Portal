
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$MultipleChoice()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$BaseQuestion);

    //#region VARIABLE

        var row_template;

    //#endregion

    //#region ROUTINE

        var build = function()
        {
            row_template = $this.g$("TTR_row_template").cloneNode(true);

            var table = this._element;

            table.deleteRow(0);

            //

            cs = this.question.ChoiceSummaries;

            for (var i=0; i<cs.length; i++) 
            {
                table.getElementsByTagName("TBODY")[0].appendChild(build_row.apply(this, [cs[i], (i+1)]));
            }

            this.rows = table.rows;
        }

        var build_row = function(cs, order)
        {
            var row = row_template.cloneNode(true);

            var cells = row.cells;

            if (!cells.length)
            {
                cells = row.childNodes;
            }

            if (cs.Text != "No Response") 
            {
                 cells[0].innerHTML = (order + ")");
            }
            cells[1].getElementsByTagName("div")[0].innerHTML = cs.Text;

            if (cs.IsCorrect)
            {
                cells[2].innerHTML = (cs.CorrectCount + " (" + JCSL.lang.math.round(cs.CorrectPercent, 1) + "%)");

                row.style.fontWeight = "bold";
            }
            else
            {
                cells[2].innerHTML = (cs.IncorrectCount + " (" + JCSL.lang.math.round(cs.IncorrectPercent, 1) + "%)");
            }

            return row;
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