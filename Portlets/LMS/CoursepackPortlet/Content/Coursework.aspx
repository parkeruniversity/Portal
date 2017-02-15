<%@ Page language="c#" Codebehind="Coursework.aspx.cs" AutoEventWireup="false" Inherits="Jenzabar.LMS.Portlets.CoursepackPortlet.Content.Coursework" %>
<style>

	.td_question
	{
		padding-bottom:	8px;
		
		border-top-style:	solid;
		border-top-color:	#D4D0C8;
		border-top-width:	1px;
		
		font-size:			10pt;
	}
	
	.td_answer
	{
		padding-bottom:	4px;
		padding-left:		4px;
		
		font-size:			10pt;	
	}
	
	.table_section
	{
		margin-left:		20px;
	}
	
	.table_answer
	{
		margin-left:		40px;
	}
	
	.td_title
	{
		font-weight:		bold;
		font-size:			9pt;
	}
	
	.td_title2
	{
		border-bottom-style:	solid;
		border-bottom-color:	#D4D0C8;
		border-bottom-width:	1px;
	}
	
	.span_section
	{
		font-size:			11pt;
	}
	
</style>

<script language='javascript' type='text/javascript'>

	function section_click(originator_image)
	{
		var section_table = new Object();
		
		//
		
		section_table = document.getElementById(originator_image.id.replace("IMG", "TBL"));
		
		if (section_table.style.display == "")
		{
			section_table.style.display = "none";
			
			originator_image.src = originator_image.src.replace("collapse", "expand");			
		}
		else
		{
			section_table.style.display = "";
			
			originator_image.src = originator_image.src.replace("expand", "collapse");			
		}
	}

</script>