
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$BaseQuestion()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    //#region PROPERTY

        this.question = null;
        this.rows = null;

    //#endregion

    //#region METHOD

        this.init_style = function()
        {
            $base.init_style.call(this, "~/../Analytics.css");
        }

        this.load_images = function()
        {
        }

        this.render = function(container)
        {
            var css   = JCSL.element.css;
            var table = this._element;

		    JCSL.element.table.populate_colgroup
		    (
			    table,
			    [
				    {verticalAlign: css.VerticalAlign.top},
				    {verticalAlign: css.VerticalAlign.top},
				    {verticalAlign: css.VerticalAlign.top}
			    ]
		    );
								
		    JCSL.element.table.borderize(table, {style:css.BorderStyle.solid, color:"#CECFCE", width:"1px"});
		    var tempAltElement = $("<p class=alt />").hide().appendTo("body");
		    JCSL.element.table.colorize
		    (
			    table,
			    [
				    null,
				    null,
				    [
					    "White",
					    tempAltElement.css("background-color")
				    ]
			    ],
			    this.rows
		    );
            tempAltElement.remove();

            //

            $base.render.call(this, container);
        }

    //#endregion
}