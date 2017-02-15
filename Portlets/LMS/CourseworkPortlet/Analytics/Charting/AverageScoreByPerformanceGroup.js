
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$Charts$AverageScoreByPerformanceGroup(analytics_control, analysis_data)
{
	var group_names;	//Array-String
	var groups;			//Array
	var points;			//Array-Object
	var chart;			//JCSL.ui.controls.Chart
	
	//
	
	switch (analysis_data.TestData.GradeGroups.length) 
	{
		case 2:
		{
			group_names = ["Low", "High"];
			groups		= [0, 0]
			
			break;
		}
		case 3:
		{
			group_names = ["Low", "Med", "High"];
			groups		= [0, 0, 0]
			
			break;
		}
	}
	
	
	JCSL.lang.for_each
	(
		analysis_data.TestData.GradeGroups,
		function(i, grade_group)
		{
			JCSL.lang.for_each
			(
				grade_group[i].Users,
				function(ii, users)
				{
					JCSL.lang.for_each
					(
						analysis_data.Grades,
						function(iii, grades)
						{
							if (grades[iii].UserID.ToString() === users[ii].ToString())
							{
								if (groups[i] > 0)
								{
									groups[i] = ((groups[i] + grades[iii].CalculateScore()) / 2);
								}
								else
								{
									groups[i] = grades[iii].CalculateScore();
								}
							}
						}
					);
				}
			);
		}
	);
	
	JCSL.lang.for_each
	(
		groups,
		function(index, groups)
		{
			groups[index] = JCSL.lang.math.round(groups[index], .01);
		}
	)
	
	points = [];
	
	JCSL.lang.for_each
	(
		groups,
		function(index)
		{
			points.push
			(
				{
					AxisLabel:	group_names[index],
					YValues:	[groups[index]],
					Label:		(groups[index] + "%")
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
											Title:		"Avg. Score by Performance Group"															
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
					
	chart.render(g$("DIV_chart_average_score_by_performance_group"));
}