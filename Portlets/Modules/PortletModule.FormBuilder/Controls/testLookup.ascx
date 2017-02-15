<%@ Control Language="c#" AutoEventWireup="false" Codebehind="testLookup.ascx.cs" Inherits="Jenzabar.Portal.Framework.Web.PortletModules.FormBuilder.Controls.testLookup" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<style type="text/css">
.tdUpLeft{
	border-left: solid 1px #B2B2B2;
	border-top: solid 1px #B2B2B2;
	background: #E2E2E2;
	padding: 5px;
}
.tdUpRight{
	border-right: solid 1px #B2B2B2;
	border-top: solid 1px #B2B2B2;
	background: #E2E2E2;
	padding: 5px;
}
.tdRows{
	border-right: solid 1px #B2B2B2;
	border-left: solid 1px #B2B2B2;
	background: #EFEFEF;
	padding: 5px;
}
.tdBot{
	border-right: solid 1px #B2B2B2;
	border-left: solid 1px #B2B2B2;
	border-bottom: solid 1px #B2B2B2;
	background: #EFEFEF;
	padding: 5px;
}
.boxTitle{
	border-right: solid 1px #B2B2B2;
	border-left: solid 1px #B2B2B2;
	border-top: solid 1px #B2B2B2;
	background: #EFEFEF;
	/*padding: 5px;*/
	width:326px;
	background-color:#E2E2E2;
	padding: 5px 0px 5px 5px;
	font-weight: bold;
}
.hideRow{
	display: none;
}
</style>
<script type="text/javascript" language="javascript">
searchType = "";
searchType = "<%=Name%>";
if(searchType == "Individual"){
	document.getElementById("trFName").style.display = "block";
	document.getElementById("trFMame").style.display = "block";
	document.getElementById("trLName").style.display = "block";
	
	document.getElementById("trName").style.display = "none";
}
var erpObj = new function(){
	this.submitForm = f_submitForm;
	this.setVal = f_setVal;

	function f_setVal(id, disp){
		document.getElementById("<%=hiddenID.ClientID%>").value = id;
		document.getElementById("<%=hiddenDisp.ClientID%>").value = disp;
		document.getElementById("<%=labResp.ClientID%>").innerHTML = disp;
		doVis('divErpSearchForm',0);
		doVis('divErpSearchResults',0);
		doVis('divErpSearchResultsTitle',0);
	}
	
	function f_submitForm(){
		var req = null;
		//document.forms[0].dyn.value = "Started...";
		if (window.XMLHttpRequest)
		{
			req = new XMLHttpRequest();
			if (req.overrideMimeType) 
			{
				req.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject)
		{
			try {
				req = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e)
			{
				try {
					req = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		req.onreadystatechange = function()
		{
			//document.forms[0].dyn.value = "Wait server...";
			if(req.readyState == 4)
			{
				if(req.status == 200)
				{
					//document.forms[0].dyn.value = "Received:" + req.responseText;
					//document.forms[0].dyn.value = "Received:" + req.responseXML;
					
					var xmlDoc;
					if(/MSIE (\d+\.\d+);/.test(navigator.userAgent)){
						xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
						xmlDoc.async = "false";
						xmlDoc.loadXML(req.responseText);
					}else{
						var parser = new DOMParser();
						var xmlDoc = parser.parseFromString(req.responseText,"text/xml");
					}
					//Any Search Results?
					var nodeTotalResults = xmlDoc.getElementsByTagName('ConstituentSearchResults')[0].childNodes[0].childNodes[0].nodeValue;
					var resultsNode = xmlDoc.getElementsByTagName('ConstituentSearchResults')[0].childNodes[1];
					var outHTML = "";
					var tableStart = "<table border=\"0\" width=\"333\" cellpadding=\"0\" cellspacing=\"0\">";
					tableStart += "<tr><td class=\"tdUpLeft\"><b>Results</b></td><td class=\"tdUpRight\" align=\"right\"><a href=\"javascript:doVis('divErpSearchResults',0);\">X</a></td></tr>";
					var navBack = "<tr><td colspan=\"2\" class=\"tdBot\"><a href=\"javascript:doVis('divErpSearchForm',1);doVis('divErpSearchResults',0);doVis('divErpSearchResultsTitle',0);\">Search Again</a> &nbsp; <a href=\"javascript:doVis('divErpSearchResults',0);doVis('divErpSearchResultsTitle',0);\">Close</a></td></tr>";
					doVis('divErpSearchForm',0);
					doVis('divErpSearchResults',1);
					doVis('divErpSearchResultsTitle',1);
					//if( resultsNode.childNodes.length > 0 ){
					//if( (nodeTotalResults * 1) > 0 ){
					if( nodeTotalResults > 0 ){
						outHTML = tableStart;
						outHTML += "<tr><td colspan=\"2\" class=\"tdRows\">Search Results found: " + resultsNode.childNodes.length + "</td></tr>";
						var dataNode;
						for(i = 0; i < resultsNode.childNodes.length; i ++){
							dataNode = resultsNode.getElementsByTagName('Constituent')[i].childNodes[0].childNodes;
							var id = resultsNode.getElementsByTagName('Constituent')[i].childNodes[0].childNodes[0].nodeValue;
							
							var fname = "";
							try{
								fname = resultsNode.getElementsByTagName('Constituent')[i].childNodes[1].childNodes[0].nodeValue;
							}catch (err){
							
							}
							
							var lname = "";
							try{
								lname = resultsNode.getElementsByTagName('Constituent')[i].childNodes[3].childNodes[0].nodeValue;
							}catch (err){
							
							}
							
							//if( searchType == "Individual" ){
								outHTML += "<tr><td colspan=\"2\" class=\"tdRows\"><a href=\"javascript:erpObj.setVal('" + id + "','" + fname + " " + lname + "');\">" + fname + " " + lname + "</a></td></tr>";
							//}else{
							//	outHTML += "<tr><td colspan=\"2\" class=\"tdRows\"><a href=\"javascript:erpObj.setVal('" + id + "','" + fname + " " + lname + "');\">" + fname + " " + lname + "</a></td></tr>";
							//}
						}
						outHTML += navBack;
						outHTML += "</table>";
						document.getElementById("divErpSearchResults").innerHTML = outHTML;
					}else{
						outHTML = tableStart;
						outHTML += "<tr><td class=\"tdRows\" colspan=\"2\"><br/>No results found<br/><br/></td></tr>";
						outHTML += navBack;
						outHTML += "</table>";
						document.getElementById("divErpSearchResults").innerHTML = outHTML;
					}
					//document.forms[0].dyn.value = xmlDoc.getElementsByTagName('ConstituentSearchResults')[0].childNodes[1].getElementsByTagName('Constituent')[0].childNodes.length; //.length; //.getElementsByTagName('Constituent').childNodes[0].data;
				}
				else
				{
					//document.forms[0].dyn.value = "Error: returned status code " + req.status + " " + req.statusText;
				}
			}
		};
		//req.open("POST", "http://localhost/icsCandidate/Portlets/Modules/PortletModule.FormBuilder/Controls/testLookup_getData.aspx", true);
		req.open("POST", "<%=controlPath%>", true);
		//req.send(null);
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
		if( searchType == "Individual" ){
			req.send("searchType=<%=Name%>&name=" + document.forms[0].tbName.value + "&city=" + document.forms[0].tbCity.value + "&state=" + document.forms[0].tbState.value + "&zip=" + document.forms[0].tbZip.value);
		}else
			req.send("searchType=<%=Name%>&name=" + document.forms[0].tbName.value + "&city=" + document.forms[0].tbCity.value + "&state=" + document.forms[0].tbState.value + "&zip=" + document.forms[0].tbZip.value);
		}
		//Check PortalUser.Current
		
		// http://www.xul.fr/en-xml-ajax.html#ajax-xmlhttprequest
		// http://www.w3schools.com/Xml/xml_dom.asp
		// http://www.javascriptkit.com/jsref/ajax.shtml
		// http://www.xul.fr/ajax-get-xml.html
	}
}
function doVis(ele, state){
	ele = document.getElementById(ele);
	switch(state){
		case 0:
			ele.style.display = "none";
			break;
		case 1:
			ele.style.display = "block";
			break;
	}
}
</script>
<a href="javascript:doVis('divErpSearchForm',1);">Select</a> &nbsp; 
<input type="hidden" id="hiddenID" runat="server"><input type="hidden" id="hiddenDisp" runat="server"><asp:Label ID="labResp" Runat="server" />
<div id="divErpSearchForm" style="display:none;position:absolute;">
	<table border="0" width="333" cellpadding="0" cellspacing="0" style="height:180px;">
		<tr>
			<td class="tdUpLeft"><b>Lookup</b></td>
			<td class="tdUpRight" align="right"><a href="javascript:doVis('divErpSearchForm',0);">X</a></td>
		</tr>
		<tr>
			<td class="tdBot" colspan="2">
				<table>
					<tr id="trFName" class="hideRow">
						<td>First Name</td>
						<td><input type="text" name="tbFName"></td>
					</tr>
					<tr id="trMName" class="hideRow">
						<td>Middle Name</td>
						<td><input type="text" name="tbMName"></td>
					</tr>
					<tr id="trLName" class="hideRow">
						<td>Last Name</td>
						<td><input type="text" name="tbLName"></td>
					</tr>
					<tr id="trName">
						<td align="right">Name:</td>
						<td><input type="text" name="tbName"></td>
					</tr>
					<tr>
						<td align="right">City:</td>
						<td><input type="text" name="tbCity"></td>
					</tr>
					<tr>
						<td align="right">State:</td>
						<td><input type="text" name="tbState"></td>
					</tr>
					<tr>
						<td align="right">Zip Code:</td>
						<td><input type="text" name="tbZip"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<input type="button" value="Search" onclick="erpObj.submitForm();"> &nbsp; 
							<input type="button" value="Cancel" onclick="doVis('divErpSearchForm',0);">
						</td>
					</tr>
					<!--tr>
						<td colspan="2"><input type="text" name="dyn"  value=""></td>
					</tr-->
				</table>
			</td>
		</tr>
	</table>
</div>
<!--div id="divErpSearchResultsTitle" style="display:block;" class="boxTitle">Results</div-->
<div id="divErpSearchResults" style="display:none;position:absolute;height:180px;width:350px;overflow:auto;"></div>
<div id="divErpSearchResultsTitle" style="display:none;position:absolute;">
	<table border="0" width="333" cellpadding="0" cellspacing="0">
		<tr>
			<td class="tdUpLeft"><b>Results</b></td>
			<td class="tdUpRight" align="right"><a href="javascript:doVis('divErpSearchResults',0);doVis('divErpSearchResultsTitle',0);">X</a></td>
		</tr>
	</table>
</div>
<!--div id="divErpSearchResultsBot" style="display:block;position:absolute;">
	<table border="0" width="333" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" class="tdBot"><a href="javascript:doVis('divErpSearchForm',1);doVis('divErpSearchResults',0);doVis('divErpSearchResultsTitle',0);">Search Again</a> &nbsp; 
				<a href="javascript:doVis('divErpSearchResults',0);doVis('divErpSearchResultsTitle',0);">Close</a>
			</td>
		</tr>
	</table>
</div-->
