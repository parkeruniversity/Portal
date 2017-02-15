

function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionGrid()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);
    
    //#region variable

        var Abbreviations;

    //#endregion

    //#region METHOD

        this.load = function()
        {
            Abbreviations =
            {
                "Ordering":         Globalizer.ABR_ORDERING,
                "MultipleChoice":   Globalizer.ABR_MULTIPLE_CHOICE,
                "TrueFalse":        Globalizer.ABR_MULTIPLE_CHOICE,
                "Essay":            Globalizer.ABR_ESSAY,
                "ShortAnswer":      Globalizer.ABR_SHORT_ANSWER,
                "Matching":         Globalizer.ABR_MATCHING,
                "Equation":         Globalizer.ABR_EQUATION
            };

            $base.load.call(this);
        }

        this.render = function(container)
        {
            var table = this._element;

            var TTR_group_template = this.g$("TTR_group_template").cloneNode(true);

            JCSL.element.table._clear
			(
				table,
				function(row)
                {
				    return (!((row.parentNode.tagName == "THEAD") || ((row.parentNode.tagName == "TBODY") && (row.cells[0].tagName == "TH"))));
				}
			);

            var analysis = this.parent.get_analysis();

            for (var section in analysis.Coursework.CourseworkSections)
            {
                var s = table.getElementsByTagName("TBODY")[0].appendChild(TTR_group_template.cloneNode(true));

                s.cells[0].innerHTML = analysis.Coursework.CourseworkSections[section].Name;

                //

                var rows = [];

                with ({section:section})
                {
                    JCSL.lang.for_item
			        (
				        analysis.Coursework.CourseworkSections[section].Questions,
				        function (question, index)
                        {
                            with ({question:question})
                            {
                                rows.push
                                (
				                    JCSL.element.table.create_row
					                (
						                table,
						                [
                                            function()
                                            {
                                                if (JCSL.lang.array.__contains(["High", "Low"], question.DifficultyRatingLevel) || (question.DiscriminationIndexLevel == "Low") || (question.Type == "MultipleChoice" && question.DistractorAnalysisLevel == "Poor")) return JCSL.element.create(JCSL.element.Type.image, null, {src: ($this.data.paths.image + "PortletImages/Icons/as-yellow_excl.gif")});

                                                return "";
                                            },
                                            (question.ItemOrder + 1),
							                JCSL.element.create
                                            (
                                                JCSL.element.Type.anchor,
                                                null,
                                                {
                                                    href:   "javascript:",
                                                    _text:  (question.Label + " " + JCSL.lang.string.enclose(Abbreviations[question.Type], JCSL.lang.string.enclose.round)) //("Q" + (index+1)
                                                },
                                                null,
                                                {
                                                    click:  function()
                                                            {
                                                                $this.parent.controls.find("QuestionDetailControl").show_question(section, question.ItemOrder);
                                                            }
                                                }
                                            ),
							                ((question.DifficultyRating == null) ? 0 : JCSL.lang.math.precision(question.DifficultyRating, .01)),
							                ((question.DiscriminationIndex == null) ? 0 : JCSL.lang.math.precision(question.DiscriminationIndex, .01)),
							                (JCSL.lang.math.precision(question.AveragePoints, .01) + "/" + question.TotalPoints)
						                ]
                                    )
					            );
                            }
				        }
			        )
                }
                
                var tempAltElement = $("<p class=alt />").hide().appendTo("body");
                JCSL.element.table.colorize(table, [null, null, ["White", tempAltElement.css("background-color")]], rows);
                tempAltElement.remove();
            }

            JCSL.element.table.borderize(table, {style:JCSL.element.css.BorderStyle.solid, color:"#CECFCE", width:"1px"});

            //

            $base.render.call(this, container);
        }

    //#endregion
}