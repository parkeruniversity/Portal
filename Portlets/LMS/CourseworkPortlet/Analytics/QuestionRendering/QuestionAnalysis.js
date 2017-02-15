function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$QuestionAnalysisControl$QuestionRendering$QuestionAnalysis()
{
    var $this = this;
    var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    var CSS = JCSL.element.css;

    //#region ROUTINE

		var highlight_table = function()
		{
		    JCSL.element.table.borderize(this._element, {style:CSS.BorderStyle.solid, color:"#CECFCE", width:"1px"});

            if
            (
                JCSL.lang.array.__contains(["High", "Low"], this.data.question.DifficultyRatingLevel)
                ||
                (this.data.question.DiscriminationIndexLevel == "Low")
                ||
                ((this.data.question.Type == "MultipleChoice") && (this.data.question.DistractorAnalysisLevel == "Poor"))
            )
			{
				JCSL.element.table.borderize(this._element, {style:CSS.BorderStyle.solid, color:"Red", width:"2px"}, null, -1);
			}
		}

		var create_detail_buttons = function()
		{
			var detail_button__Click = function(event_args, value)
			{
				var elements;
						
				JCSL.lang.for_each
				(
					JCSL.element.find_by_data("detail_view", "true", $this._element),
					function(index, elements)
					{
						elements[index].style.display = value;
					}
				);

				switch ($this.data.question.Type)
				{
					case "Essay":
					{
						//$this.g$("DIV_chart_score_distribution").style.display = value;
								
						break;
					}
					case "MultipleChoice":
					{
						$this.g$("TBL_distractor").style.display = value;

						break;
					}
				}

				if (value == "")
				{
					$this.g$("SPN_view_detail_text").innerHTML = "Collapse";
					$this.g$("SPN_view_detail_extra_text").innerHTML = "to hide details";
				}
				else
				{
					$this.g$("SPN_view_detail_text").innerHTML = "Expand";
					$this.g$("SPN_view_detail_extra_text").innerHTML = "for more details";
				}
			}
					
			var ti__init = function()
			{
				var render_score_distribution_chart = function()
				{
					var points = [];

					JCSL.lang.for_each
					(
						$this.data.question.ScoreDistribution,
						function(attribute)
						{
							points.push
							(									
								{
											
									XValue:		parseInt($this.data.question.ScoreDistribution[attribute]),
									YValues:	[parseInt(attribute)],
									Label:		""
								}
							);
						}
					);
							
					//
							
					var chart = new JCSL.ui.controls.Chart();
							
					chart.loading_image = JCSL.element.create(JCSL.element.Type.image, null, {src:(this.image_path + "AjaxImages/" + "L03b_green.gif")});
							
					JCSL.lang.extend
					(
						chart,
						{
							color:		"rgb(236, 236, 236)",
							Series:		[
											{
												ChartType:	JCSL.ui.controls.Chart.ChartSeriesType.Point,
												Points:		points
											}
										],
							ChartAreas:	[
											{
												AxisX:	{
															MajorGrid:	{
																			Enabled:	false
																		},
															Title:		""
														},
												AxisY:	{
															Enabled:	JCSL.ui.controls.Chart.AxisEnabled.True,
															MajorGrid:	{
																			Enabled:	false
																		},
															Maximum:	$this.data.question.TotalPoints,
															StripLines:	[
																			{
																				StripWidth:		1,
																				Interval:		$this.data.question.AveragePoints
																			}
																		]
														}
											}
										]
						}
					);
							
					//
											
					chart.render($this.g$("DIV_chart_score_distribution"));
				}
						
				////
						
				if ($this.data.question.Type == "Essay")
				{
					render_score_distribution_chart();
				}					
			}
					
			////
					
			var ti = new JCSL.ui.controls.ToggleImage
			(
				[
					{
						image:	($this.data.paths.image + "expand_A.gif"),
						func:	detail_button__Click,
						value:	""
					},
					{
						image:	($this.data.paths.image + "collapse_A.gif"),
						func:	detail_button__Click,
						value:	"none"
					}
				]
			);
					
			ti.init.attach(ti__init);
					
			ti.render
			(
				[
					$this.g$("TTD_view_detail"),
					$this.g$("SPN_view_detail")
				]
			);
					
			JCSL.element.attach_event($this.g$("SPN_view_detail_text"), JCSL.dom_event.Type.click, detail_button__Click);
		}

        var build_distractor_detail = function()
		{
            var calc_distractor_groups = function()
			{				
                for (var crs in choice_summary.ChoiceResponseSummaries)
                {
                    choice_response_summary = choice_summary.ChoiceResponseSummaries[crs];

                    if (choice_response_summary.IsCorrect == choice_summary.IsCorrect)
                    {
                        var gp = choice_response_summary.GroupPercents;

					    groups[1] += gp[gp.length-1];
					    groups[0] += gp[0];
                    }
                }
			}

			////

            var template_row = $this.g$("TTD_distractor_template_row").cloneNode(true);

            var table = $this.g$("TBL_distractor");

            table.deleteRow(1);

            for (var cs in $this.data.question.ChoiceSummaries)
            {
                var choice_summary = $this.data.question.ChoiceSummaries[cs];

                //
                
                var groups = [0, 0];

                calc_distractor_groups();

                var row = template_row.cloneNode(true);

                row.childNodes[0].innerHTML = ((choice_summary.Order+1) + ((choice_summary.IsCorrect) ? "*" : ""));
                row.childNodes[1].innerHTML = (parseInt((choice_summary.IsCorrect) ? choice_summary.CorrectPercent : choice_summary.IncorrectPercent) + "%");
                row.childNodes[2].innerHTML = (parseInt(groups[1]) + "%");
                row.childNodes[3].innerHTML = (parseInt(groups[0]) + "%");

                table.getElementsByTagName("tbody")[0].appendChild(row);
            }

            JCSL.element.table.borderize(table, {style:CSS.BorderStyle.solid, color:"#CECFCE", width:"1px"});
            
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
				]
			);
            tempAltElement.remove();
        }

    //#endregion

    //#region METHOD

        this.init_style = function()
        {
            $base.init_style.call(this, "~/../Analytics.css");
        }

        this.render = function(container)
        {
            JCSL.element.data.populate("title_analysis", ("Question " + this.data.order + " Analysis"), $this._element);

			highlight_table.call(this);

            create_detail_buttons.call(this);
            
            this.data_bind(this);

            if (this.data.question.Type == "MultipleChoice")
		    {
			    build_distractor_detail();
		    }

            //

            $base.render.call(this, container);
        }

        this.data_bind = function()
        {
            $base.data_bind
            (
                this.data.question,
                [
					function bind_difficulty_rating_level(value)
					{
						if (value.slice(-6) == "Medium") return "";	
									
						return (value + " difficulty");
					},
					function bind_discrimination_level(value)
					{
						if (value.slice(-3) != "Low")
						{
							value = "Good";
						}
									
						return value;
					},
					function bind_group_difficulty_rating(value)
					{	
						switch ($this.data.question.GroupDifficultyRatings.length)
						{
							case 2:
							{
								switch (value)
								{
									case "high":
									{
										value = $this.data.question.GroupDifficultyRatings[1];
													
										break;
									}
									case "middle":
									{
										$this.g$("TBL_difficulty_ratings").deleteRow($this.g$("TTD_difficulty_rating_middle").rowIndex);
													
										return null;
									}
									case "low":
									{
										value = $this.data.question.GroupDifficultyRatings[0];
													
										break;
									}
								}
											
								break;
							}
							case 3:
							{
								switch (value)
								{
									case "high":
									{
										value = $this.data.question.GroupDifficultyRatings[2];
													
										break;
									}
									case "middle":
									{
										value = $this.data.question.GroupDifficultyRatings[1];
													
										break;
									}
									case "low":
									{
										value = $this.data.question.GroupDifficultyRatings[0];
													
										break;
									}
								}
										
								break;
							}
						}
									
						if (value === null) return "N\\A";
									
						return JCSL.lang.math.precision(value, .01);
					},
                    function bind_distractor_level(value)
                    {
                        if (value == Globalizer.TXT_NONE) return Globalizer.TXT_NO;
                    }
				]
            );

			JCSL.lang.for_item
			(
				JCSL.element.find_by_data("bound", null, $this._element),
				function(element)
				{		
					var image;
						
					switch (element.getAttribute("data-bound"))
					{
						case "DifficultyRatingLevel":
						{
							if (JCSL.lang.array.__contains(["High", "Low"], $this.data.question.DifficultyRatingLevel))
							{
								image = "PortletImages/Icons/as-yellow_excl.gif";
							}
								
							break;
						}
						case "DiscriminationIndexLevel":
						{
							if ($this.data.question.DiscriminationIndexLevel == "Low")
							{
								image = "PortletImages/Icons/as-yellow_excl.gif";
							}
							else
							{
								image = "PortletImages/Icons/nys-green_check.gif";
							}
								
							break;
						}
						case "DistractorAnalysisLevel":
						{
							if ($this.data.question.DistractorAnalysisLevel == "Poor")
							{
								image = "PortletImages/Icons/as-yellow_excl.gif";
							}
								
							break;
						}
					}
						
					if (image !== undefined)
					{
						JCSL.element.insert_before
						(
							JCSL.element.create(JCSL.element.Type.image, null, {src:($this.data.paths.image + image)}, {position:CSS.Position.relative, marginBottom:"-3px", marginRight:"5px"}),
							element
						);
					}
				}
			);
        }

    //#endregion
}