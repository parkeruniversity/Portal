<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="SelectCourseView.ascx.cs"
    Inherits="Jenzabar.LMS.Portlets.CourseCreatorPortlet.SelectCourseView" %>
<%@ Register TagPrefix="common" Assembly="Jenzabar.Common" Namespace="Jenzabar.Common.Web.UI.Controls" %>

<script type="text/javascript" language="javascript">

document.onkeydown = doKey;


function doKey(e) 
{
    var keyID = (window.event) ? event.keyCode : e.keyCode;
    if (keyID==13)
    {
        return false;
    }
}


function GetXmlHttpObject()
{
	var xmlHttp = null;
	try
	{
		// Firefox, Opera 8.0+, Safari, IE 7.0+
		xmlHttp = new XMLHttpRequest();
	}
	catch (e)
	{
		// Internet Explorer 6 or below
		try
		{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e2)
		{
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlHttp;
}

function txtCourseTextChange(e) 
{
    txtCourseTextChange.divIndex;
    var keyID = (window.event) ? event.keyCode : e.keyCode;
    switch(keyID)
    {
        case 13:  // Enter Key     
            var divResultSelected = document.getElementById("divResult" + txtCourseTextChange.divIndex);
            window.location = divResultSelected.childNodes[0].href;            
            break;
        case 27: // Escape Key
            ClearCourseResultsTable();            
            break;
        case 38: // Up arrow key
            // Check if the divIndex has been initialized yet - if not, set it to zero.
            if (txtCourseTextChange.divIndex === null)
            {
                txtCourseTextChange.divIndex = 0;
            } 
            //In the case we are in the first result already and up is pressed, we do not want to decrease the div index
            // so check if there is another result before the one we are currently in
            // if not, then we should not decrease the index
            var divResultNextUp = document.getElementById("divResult" + (txtCourseTextChange.divIndex - 1));
            if (divResultNextUp !== null)
            {
                txtCourseTextChange.divIndex--;    
            }
            // Change the style of the div that will be selected
            var divResultSelectedUp = document.getElementById("divResult" + txtCourseTextChange.divIndex);
            if (divResultSelectedUp !== null)
            {
                divResultSelectedUp.className = "SelectCourseCourseResultsSelected";                                      
                divResultSelectedUp.childNodes[0].style.color = "#FFFFFF";  
            }
            else
            {
                return;
            }
            // Check to see if we need to change the previously selected div back to normal
            var divResultPreviousUp = document.getElementById("divResult" + (txtCourseTextChange.divIndex + 1));
            if (divResultPreviousUp !== null)
            {
                divResultPreviousUp.className = "SelectCourseCourseResultDiv";
                divResultPreviousUp.childNodes[0].style.color = "#0000FF";
            }          
            break;
        case 40: // Down arrow key
            
            // Check if the divIndex has been initialized yet - if not, set it to zero.
            if (txtCourseTextChange.divIndex === null)
            {
                txtCourseTextChange.divIndex = 0;
            }
            //In the case we are in the last result already and down is pressed, we do not want to increase the div index
            // so check if there is another result after the one we are currently in
            // if not, then we should not increase the index            
            var divResultNextDown = document.getElementById("divResult" + (txtCourseTextChange.divIndex + 1));
            if (divResultNextDown !== null)
            {
                txtCourseTextChange.divIndex++;    
            }
            // Change the style of the div that will be selected
            var divResultSelectedDown = document.getElementById("divResult" + txtCourseTextChange.divIndex);
            if (divResultSelectedDown !== null)
            {
                divResultSelectedDown.className = "SelectCourseCourseResultsSelected";                                      
                divResultSelectedDown.childNodes[0].style.color = "#FFFFFF";
            }
            else
            {
                return;
            }            
            if (txtCourseTextChange.divIndex > 0)
            {
                // Check to see if we need to change the previously selected div back to normal
                var divResultPreviousDown = document.getElementById("divResult" + (txtCourseTextChange.divIndex - 1));
                if (divResultPreviousDown !== null)
                {
                    divResultPreviousDown.className = "SelectCourseCourseResultDiv";
                    divResultPreviousDown.childNodes[0].style.color = "#0000FF";                    
                }
            }             
            break;
        default:
            txtCourseTextChange.divIndex = 0;
            var textInput = document.getElementById("txtCourse").value;
            var deptCode = document.getElementById("<%= this.FindControl("ddlDepartments").ClientID %>").options[document.getElementById("<%= this.FindControl("ddlDepartments").ClientID %>").selectedIndex].value;
            var url = "Portlets/LMS/CourseCreator/Services/GetCoursesFromTextInput.aspx?TextInput=" + textInput + "&DeptCode=" + deptCode;
            xmlHttp = GetXmlHttpObject();
            xmlHttp.onreadystatechange = UpdateCourses;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null); 
            break;
    }    
} 

function FormatCourseText(courseString)
{  
    var indexOfSearch = 0;
    var endIndex = 0;

    var textInput = document.getElementById("txtCourse").value;
    var beginingOfTags = "<div style='text-decoration: underline; display: inline;'>";
    var endOfTags = "</div>";     
    // Use toLowerCase() to make the search case insensitive
    indexOfSearch = courseString.toLowerCase().indexOf(textInput.toLowerCase(), 0);
    var resultString = courseString;
        
    while (indexOfSearch != -1) // there are occurances of the search string
    {
        //  index of the character after the search text occurance
        endIndex = indexOfSearch + textInput.length - 1;
        // Get the portion of the string that is before the search text occurance
        var stringBeforeDiv = resultString.substr(0, indexOfSearch);
        // Get the string of the text that matches the case insensetive search
        var stringInDiv = resultString.substr(indexOfSearch, textInput.length);
        // Get the string that exists after the search text occurance
        var stringAfterDiv = resultString.substr(endIndex + 1);
        // Add the pieces together and insert the DIV tags                      
        resultString = stringBeforeDiv + beginingOfTags + stringInDiv + endOfTags + stringAfterDiv;
        // Get the index to start from for the next search of the same search text (in case it occurs in the course code and title more than once)
        indexOfSearch = stringBeforeDiv.length + beginingOfTags.length + stringInDiv.length + endOfTags.length;
        // See if there are any more occurances of search text
        indexOfSearch = resultString.toLowerCase().indexOf(textInput.toLowerCase(), indexOfSearch);
    }    
    return resultString;
}

function UpdateCourses()
{
    if (xmlHttp.readyState == 4) 
	{		
	    var textInput = document.getElementById("txtCourse").value;	    
	    
	    var xmlDoc = xmlHttp.responseXML;
	    
	    if (xmlDoc !== null)
	    {
	        ClearCourseResultsTable();
	        var divCoursesTable = document.getElementById("divCoursesTable");
	        
	        var names = xmlDoc.getElementsByTagName("CourseDisplay");
	        var ids = xmlDoc.getElementsByTagName("CourseID");
	        
	        var firstRow = divCoursesTable.insertRow(0);
	        var firstCell = firstRow.insertCell(0);
	        
	        if (names.length > 0)
	        {
	            var firstCellHtml = "<div id='resultsIntruction' class='SelectCourseDivResultsInstructions'>";
	            firstCellHtml += "On the next screen you will add a new section to the course:";
	            firstCellHtml += "</div>";    	        
	            firstCell.innerHTML = firstCellHtml;
        	    
	            for (i=0; i < names.length; i++)
	            {
	                var newRow = divCoursesTable.insertRow(i + 1);
	                var newCell = newRow.insertCell(0);
    	            
	                var cellHTML = "<div class='SelectCourseCourseResultDiv' id='divResult" + (i+1) + "'";
	                cellHTML += "onmouseover='HighlightResult(this)' ";
	                cellHTML += "onmouseout='RemoveHightlight(this)'>";	            
	                cellHTML += "<a href=";
                    cellHTML += "'<%= this.ParentPortlet.GetNextScreenURL("Add Section")%>";
                    cellHTML += "&CourseID=" + ids[i].childNodes[0].nodeValue + "' class='LinkNoUnderline'>";
	                if (textInput.length > 0)
	                {
	                    cellHTML += FormatCourseText(names[i].childNodes[0].nodeValue);
	                }
	                else
	                {
	                    cellHTML += names[i].childNodes[0].nodeValue;
	                }
	                cellHTML += "</a>";
	                cellHTML += "</div>";	            
    	            
	                newCell.innerHTML = cellHTML;   
	                newCell.className = "SelectCourseScreenCourseDivTableRow";	                       
	            }
	        }
	    }
   	}
}

function HighlightResult(div)
{
    div.className = "SelectCourseCourseResultsSelected";
    div.childNodes[0].style.color = "#FFFFFF"; 
}

function RemoveHightlight(div)
{
    div.className = "SelectCourseCourseResultDiv";
    div.childNodes[0].style.color = "#0000FF"; 
}

function ClearCourseResultsTable()
{
    var divCoursesTable = document.getElementById("divCoursesTable");
    var numberOfRows = divCoursesTable.rows.length;
    for (i = 0; i < numberOfRows; i++) 
    {
        divCoursesTable.deleteRow(0);
    }   
}

function ddlDepartmentsChange()
{    
    var textInput = document.getElementById("txtCourse").value;
    var deptCode = document.getElementById("<%= this.FindControl("ddlDepartments").ClientID %>").options[document.getElementById("<%= this.FindControl("ddlDepartments").ClientID %>").selectedIndex].value;
    var url = "Portlets/LMS/Portlet.CourseCreator/Services/GetCoursesFromTextInput.aspx?TextInput=" + textInput + "&DeptCode=" + deptCode;
    xmlHttp = GetXmlHttpObject();
    xmlHttp.onreadystatechange = UpdateCourses;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);   
}




</script>

<common:Subheader ID="hdrAddNewCourse" runat="server" />
<div class="pSection">
    <asp:Label ID="lblIntro" runat="server" />
    <br />
    <br />
    <table border="0" cellspacing="10">
        <tr>
          <td>
            <asp:Label ID="lblSelectCourse" runat="server"  style="font-weight: bold;"/>
          </td>
          <td>
            <asp:Label ID="lblFilter" runat="server" />
          </td>
        </tr>
        
        <tr>
          <td>
            <input id="txtCourse" type="text" size="50" onkeyup="txtCourseTextChange(event)" 
                  style="width: 350px" />
                <br />
                <div id="div1">
                    <table id="divCoursesTable" width="100%" cellpadding="0" cellspacing="0">
                    </table>
                </div>
          </td>
          <td valign="top">
            <select id="ddlDepartments" runat="server" onchange="ddlDepartmentsChange()" 
                  style="width: 350px" />
          </td>
        </tr>
        
        <tr>
          <td>
          </td>
          <td>
          </td>
        </tr>
        
        <tr>
          <td>
          </td>
          <td>
          </td>
        </tr>
        
        
        
        <tr>
            
            <td>
                <a id="lnkBackToMainScreen" runat="server">
                    <asp:Label ID="lblBackToMainScreen" runat="server" />
                </a>
            </td>
            <td>
            </td>
        </tr>
    </table>
</div>
