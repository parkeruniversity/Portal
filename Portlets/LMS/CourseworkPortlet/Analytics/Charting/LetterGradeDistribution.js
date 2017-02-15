function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$Charts$LetterGradeDistribution(analytics_control, analysis_data)
{
	var prep_grade_distribution = function()
	{
		var confirm_grade = function(item, array)
		{
			if (grade_distribution[array[item]] === undefined)
			{
				grade_distribution[array[item]] = 0;
			}
		}
		
		////
		
		JCSL.lang.for_each(grades, confirm_grade);
	}
	
	////
	
	var grades;					//Array-String
	var grade_distribution;		//Object				
	var points;					//Array-Object
	var chart;					//JCSL.ui.controls.Chart
	
	//
	
	grades = ["F", "D", "C", "B", "A"];
	
	grade_distribution = analysis_data.GetTestGradeSummary().GradeDistribution;
	
	if (grade_distribution === null)
	{
		g$("DIV_chart_grade_distribution").innerHTML = "You can’t view the \"Letter Grade Distribution\" graph until you have configured the Gradebook.";
		
		return;
	}
	
	prep_grade_distribution();
	
	//				
								
	points = [];
					
	JCSL.lang.for_each
	(
		grades,
		function(index)
		{					
			points.push
			(
				{
					AxisLabel:	grades[index],
					YValues:	[grade_distribution[grades[index]]],
					Label:		grade_distribution[grades[index]]
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
											Title:		"Letter Grade Distribution"															
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
					
	chart.render(g$("DIV_chart_grade_distribution"));			
}