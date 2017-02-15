
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl(question, order)
{
	var $cnst = this.constructor;
	var $this = this;
	var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);
	
	var CSS = JCSL.element.css;

    //#region VARIABLE

        var rows;	//DOMElement:tr

    //#endregion

    //#region ROUTINE

        var render_question = function(qr)
        {
			var populate_field = function(field, text)
			{
				JCSL.element.find_by_data("field_name", field, $this._element)[0].innerHTML = text;
			}
				
			////		

            qr.question = question;

            qr.render($this.g$("TTD_response_area"));
			
			populate_field("title", (Globalizer.TXT_QUESTION + " " + order));

            var DIV_text = $this.g$("DIV_text");

            DIV_text.innerHTML = question.Text;

            JCSL.element.get_heights
            (
                DIV_text,
                function(h)
                {
                    if (h.scrollHeight == h.clientHeight)
                    {
                        DIV_text.className = ""; //should only remove the QuestionBody style not all!
                    }
                }
            );

            if (question.IsExtraCredit)
            {
                populate_field("ExtraCredit", ("*" + Globalizer.TXT_EXTRA_CREDIT));
            }

            $this.data_bind
            (
                question,
                [
                    function bind_question_type(value)
				    {
					    switch (value)
					    {
						    case "TrueFalse":
						    {
							    value = "True/False";
											
							    break;
						    }
						    case "MultipleChoice": //replace with string function which inserts space automatically
						    {
							    value = "Multiple Choice";
											
							    break;
						    }
						    case "ShortAnswer":
						    {
							    value = "Short Answer";
											
							    break;
						    }
					    }
									
					    return ("&nbsp;(" + value + ")");
				    }
                ]
            );

            JCSL.ui.CachedControl.download
            (
                {
                    base:           ($this.constructor._meta.base + "QuestionRendering/"),
                    name:           "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.QuestionAnalysisControl.QuestionRendering.QuestionAnalysis",
                    version:        "050211.1",
                    callback:       QuestionAnalysisLoad,
                    parent:         $this
                }
            );
        }

        var QuestionAnalysisLoad = function(qa)
        {
            qa.data.question = question;
            qa.data.order    = order;

            qa.render($this.g$("TTD_analysis_area"));
        }            

    //#endregion
	
	//#region METHOD

        this.render = function(container)
		{
            $base.render.call(this, container);

            //

            $cnst.load_QuestionRendering_control(question.Type, render_question, this);
		}

        this.validate_container = function()
        {
            return true;
        }

        this.init_style = function()
        {
            $base.init_style.call(this, "~/Analytics.css");
        }
        		
	//#endregion
}

Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl.load_QuestionRendering_control = function(type, callback, qac)
{
    var QuestionAnalysisControl	= Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl;

    JCSL.ui.CachedControl.download
    (
        {
            base:           QuestionAnalysisControl._meta.base + "QuestionRendering/",
            name:           ("Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.QuestionAnalysisControl.QuestionRendering." + type),
            version:        "050211.1",
            callback:       callback,
            parent:         qac
        }
    );

}