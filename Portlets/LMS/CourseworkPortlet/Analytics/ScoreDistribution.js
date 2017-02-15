
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$ScoreDistribution()
{
    var $this = this;
	var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    //#region VARIABLE

        var dw;

    //#endregion

    //#region METHOD

        this.load = function()
        {
            JCSL.element.attach_event(this.g$("LNK_score_distribution"), "click", LNK_score_distribution__Click);

            $base.load.call(this);
        }

        this.load_images = function()
        {
            $base.load_images.call(this, this.data.paths.image);
        }

        this.render = function(container)
        {
            $base.render.call(this, container);
        }

    //#endregion

    //#region ROUTINE

	    var LNK_score_distribution__Click = function()
	    {
		    var cell_override = function(cell)
		    {
			    if (cell.cellIndex === 0) return;
			
			    //
			
			    cell.innerHTML = JCSL.lang.string.enclose(cell.innerHTML, JCSL.lang.string.enclose.round);
			
			    //
			
			    var score = parseFloat(JCSL.lang.math.precision(cell.parentNode.cells[0].innerHTML, .01));
			
			    if (score === parseFloat(JCSL.lang.math.precision($this.parent.get_analysis().GetTestGradeSummary().Average, .01)))
			    {
				    cell.innerHTML += JCSL.lang.string.enclose(Globalizer.TXT_AVERAGE, JCSL.lang.string.enclose.round);
			    }
			
			    if ($this.parent.get_analysis().GetTestGradeSummary().Mode.length < $this.parent.get_analysis().Grades.length)
			    {
				    if
				    (			
					    JCSL.lang.array.contains
					    (
						    $this.parent.get_analysis().GetTestGradeSummary().Mode,
						    score,
						    null,
						    function(index)
						    {
							    return (parseFloat(JCSL.lang.math.precision($this.parent.get_analysis().GetTestGradeSummary().Mode[index], .01)) === score);
						    }
					    )
				    )
				    {
					    cell.innerHTML += JCSL.lang.string.enclose(Globalizer.TXT_MODE, JCSL.lang.string.enclose.round);
				    }
			    }
			
			    if (score === parseFloat(JCSL.lang.math.precision($this.parent.get_analysis().GetTestGradeSummary().Median, .01)))
			    {
				    cell.innerHTML += JCSL.lang.string.enclose(Globalizer.TXT_MEDIAN, JCSL.lang.string.enclose.round);
			    }
		    }
		
		    ////

            eval("var TBL_body = $this.g$(\"TBL_body\")");
            eval("var TBL_head = $this.g$(\"TBL_head\")");
            eval("var DIV_dw = $this.g$(\"DIV_dw\")");
		
		    if (dw === undefined)
		    {
			    JCSL.element.table._clear(TBL_body);
			
			    JCSL.element.table.populate(TBL_body, $this.parent.get_analysis().GetTestGradeSummary().ScoreDistribution, cell_override);
							
			    TBL_body.rows[0].cells[0].style.width = JCSL.element.get_css(TBL_head.rows[0].cells[0]).width;
			
			    dw = new JCSL.ui.windows.DialogWindow(DIV_dw, Globalizer.TXT_SCORE_DISTRIBUTION);
			
			    dw.sized = true;
			
			    JCSL.object.set_position_properties(dw, JCSL.element.__get_position($this.parent.g$("TTD_score_distribution")));
			
			    dw.opened.attach
			    (
				    function()
				    {
					    dw.display_imitator = new JCSL.ui.Imitator(dw.window_div, $this.parent.g$("DIV_analytics"));
				    }
			    );
			
			    dw.closed.attach
			    (
				    function()
				    {
					    //
					    //call dispplay imitator canceller function
					
					    dw.display_imitator();
					
					    //
					
					    $this.g$("SPN_score_distribution").style.visibility = "";
					
					    JCSL.element.enable(this);
				    },
				    this
			    );
			
			    //
			
			    $this.g$("SPN_score_distribution").style.visibility = "hidden";
			
			    JCSL.element.disable(this);
			
			    //
			
			    JCSL.element.attach_event($this.g$("LNK_score_distribution_close"), "click", dw.close);
		    }
		
		    dw.open(null);
	    }

    //#endregion
}