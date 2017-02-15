function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$Charts$QuestionDifficultyDistribution(analytics_control, analysis_data)
{
	var diffs;	//Array
	var dd;		//Array-Number
	var chart;	//JCSL.ui.controls.Chart
	var points;	//Array-Object
	
	//
	
	diffs = ["0-.2", ".2-.4", ".4-.6", ".6-.8", ".8-1"];
	
	dd = [0, 0, 0, 0, 0];
	
	points = [];
		
	JCSL.lang.for_each
	(
		analysis_data.GetTestQuestionSummary().QuestionSummaries,
		function(index, question)
		{
			var dr; //Number
			
			//
			
			dr = parseFloat(JCSL.lang.math.precision(question[index].DifficultyRating, .01));
			
			if (dr <= .2)
			{
				dd[0]++
			}
			else
			{
				if (dr <= .4)
				{
					dd[1]++
				}
				else
				{
					if (dr <= .6)
					{
						dd[2]++
					}
					else
					{								
						if (dr <= .8)
						{
							dd[3]++
						}
						else
						{
							dd[4]++
						}
					}
				}
			}

			(question[index].DifficultyRating);
		}
	);
	
	JCSL.lang.for_each
	(
		dd,
		function(index)
		{
			points.push
			(
				{
					AxisLabel:	diffs[index],
					YValues:	[dd[index]],
					Label:		dd[index]
				}
			);
		}
	);

	//
	
	chart = new JCSL.ui.controls.Chart();
	
	chart.loading_image = JCSL.element.create("img", null, {src:(analytics_control.data.paths.image + "AjaxImages/" + "L03b_green.gif")});
	
	JCSL.lang.extend
	(
		chart,
		{
			color:		"rgb(236, 236, 236)",
			Series:		[
							{
								ChartType:	JCSL.ui.controls.Chart.ChartSeriesType["Column"],
								Points:		points
							}
						],
			ChartAreas:	[
							{
								AxisX:	{
											MajorGrid:	{
															Enabled:	false
														},
											Title:		"Question Difficulty Distribution\n# of questions in each range"															
										},
								AxisY:	{
											Enabled:	JCSL.ui.controls.Chart.AxisEnabled.False,
											MajorGrid:	{
															Enabled:	false
														}
										}
							}
						]
		}
	);
	
	//
					
	chart.render(g$("DIV_chart_question_difficulty_distribution"));			
}