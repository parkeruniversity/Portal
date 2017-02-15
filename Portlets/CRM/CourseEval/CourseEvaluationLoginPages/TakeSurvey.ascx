<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TakeSurvey.ascx.cs" Inherits="Jenzabar.CRM.Web.Portlets.CourseEvaluationLoginPages.TakeSurvey" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="common" assembly="Jenzabar.Common" namespace="Jenzabar.Common.Web.UI.Controls" %>
<%@ Import namespace="Jenzabar.Common.Globalization" %>
<style>
	.courseEvalInvalidSurveyResponse
	{
		color: red;
		font-weight: bold;
	}
</style>

<h4><asp:Label ID="lblDisplayName" Runat="server" /></h4>

<div class="pSection">

<asp:PlaceHolder id="surveyPlaceHolder" runat="server"/>

<div style="text-align:right;"><input type="submit" id="submit" runat="server" onclick="return validateInput(this.parentNode.parentNode)" value="Submit"> <input type="submit" id="cancel" runat="server" value="Cancel"></div>

</div>

<script type="text/javascript">

var _maximumSurveyCommentLength = 3800;

function validateInput(o)
{
	var isValid=true;
	var tr=o.getElementsByTagName('tr');
	var j = 0;
	for (var i=0;i<tr.length;i++)
	{		
		if (!validateQuestion(tr[i]))
		{
			isValid = false;
			j = i;
		}		
	}
	if(j>0){
		alert('<%= Globalizer.GetGlobalizedString("CUS_MSG_ANSWER_QUESTION_IN_RED") %>');
	}
	return isValid;
}

function validateQuestion(tr)
{
	if (hasBeenAnswered(tr))
	{
		tr.style.color='';
		tr.style.fontWeight='';
		return true;
	}
	else
	{
		tr.style.color='red';
		tr.style.fontWeight='bold';
		return false;
	}		
}

function hasBeenAnswered(o)
{
	var rb=o.getElementsByTagName('input');
	if (rb.length > 0)
	{
		if (rb[0].value == 'False')
			return true;
	}
	else
	{
		return true;
	}
		
	var ta=o.getElementsByTagName('textarea');
	if (ta.length==1)
	{
		ta[0].q=o;
		ta[0].onkeyup=function(){validateQuestion(this.q);checkMaximumSurveyCommentLength(this.id);};
		return ta[0].value.length>0;
	}

	if (rb.length==1)
		return true;
	
	for (var i=1;i<rb.length;i++)
	{
		rb[i].q=o;
		rb[i].onclick=function(){validateQuestion(this.q);};
		if (rb[i].checked)
			return true;
	}
	return false;		
}

function checkMaximumSurveyCommentLength(controlID)
{
	var ctl = document.getElementById(controlID);
	if (ctl.value.length > _maximumSurveyCommentLength)
	{
		alert("You have exceeded the maximum length of " + _maximumSurveyCommentLength + " for comments questions.");
		ctl.value = ctl.value.substr(0, _maximumSurveyCommentLength);
	}
}

</script>
