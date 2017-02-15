    <%@ Control Language="c#" AutoEventWireup="false" Codebehind="ErpIDLookup.ascx.cs" Inherits="Jenzabar.CRM.Common.Web.PortletModule.EX.FormBuilder.Controls.ErpIDLookup" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<style type="text/css">
/*
Styles used in by html elements in this ascx file.
The prefix "$_" is changed at run-time to the unique identifying Guid of this file.
This is done to prevent Ajaxian naming conflicts if more than one of these files is contained in a Form. 
*/
#$_divErpSearchForm{
	display: none;
	width: 445px;
	height: 375px;
	background: #efefef;
	border-left: solid 1px #B2B2B2;
	border-right: solid 1px #B2B2B2;
	border-top: solid 1px #B2B2B2;
	border-bottom: solid 1px #B2B2B2;
}
#$_trLoadingGraphic{
	display: none;
}
#$_divResultsContainer{
	display:none;
	height: 375px;
	width: 445px;
	border-left: solid 1px #B2B2B2;
	border-right: solid 1px #B2B2B2;
	border-top: solid 1px #B2B2B2;
	border-bottom: solid 1px #B2B2B2;
	background: #EFEFEF;
}
#$_divResultsItems{
	overflow:auto;
	height: 328px;
	width: 445px;
}
#$_divNetworkError{
	display: none;
	height: 374px;
	width:445px;
	border-left: solid 1px #B2B2B2;
	border-right: solid 1px #B2B2B2;
	border-top: solid 1px #B2B2B2;
	border-bottom: solid 1px #B2B2B2;
	background: #EFEFEF;
}
</style>
<script type="text/javascript" language="javascript">
    $_searchType = "";
    $_searchType = $this.Name;
    $_individualOrNot = "individual";
    var w = new JCSL.ui.windows.DialogWindow();



    var $_pTitle = "Search for " + $this.prefix + " " + $this.Name;
    if ($this.Name == "Not Specified") {
        $_pTitle = "Search";
    }
    var $_erpObj = new function() {
        this.submitForm = f_submitForm;
        this.setVal = f_setVal;
        this.doClear = f_doClear;
        this.showSearch = f_showSearch;
        this.searchAgain = f_searchAgain;
        this.toggleIndividualOrNot = f_toggleIndividualOrNot;

        function f_searchAgain() {
            doVis('$_divResultsContainer', 0);
            doVis('$_divErpSearchForm', 1);
            doVis('$_tableSearchEles', 1);
        }

        function f_showSearch() {
            w.fade = true;
            w.set_title($_pTitle);
            w.closing.attach(idCloseWin);
            w.closed.attach(idCloseWinCleanup);
            w.content = document.getElementById("$_divErpSearchForm");
            w.fixed = true;
            w.open(null);

            document.getElementById("$_divErpSearchForm").parentNode.appendChild(document.getElementById("$_divResultsContainer"));
            document.getElementById("$_divErpSearchForm").parentNode.appendChild(document.getElementById("$_divNetworkError"));

            document.getElementById("$_tbName").value = "";
            document.getElementById("$_tbFName").value = "";
            document.getElementById("$_tbLName").value = "";
            document.getElementById("$_tbMName").value = "";
            document.getElementById("$_tbCity").value = "";
            document.getElementById("$_selState").selectedIndex = 0;
            document.getElementById("$_tbZip").value = "";
        }

        function idCloseWin() {
            window.document.body.appendChild(document.getElementById("$_divResultsContainer"));
            window.document.body.appendChild(document.getElementById("$_divNetworkError"));
            return true;
        }

        function idCloseWinCleanup() {
            doVis('$_divResultsContainer', 0);
            doVis('$_tableSearchEles', 1);
            doVis('$_divNetworkError', 0);
            doVis('$_trLoadingGraphic', 0);
            doVis('$_divErpSearchForm', 0);
        }

        function f_setVal(id, disp) {
            disp = unescape(disp);
            $this.FindControl("hiddenID").get_element().value = id;
            $this.FindControl("hiddenDisp").get_element().value = disp;
            $this.FindControl("labResp").get_element().innerHTML = disp;
            doVis("$_spanSeachAgainLink", 1);
            doVis("$_divSearchLink", 0);
            w.close();
            eval($this.jsFunctionReload);
        }

        function f_doClear() {
            $this.FindControl("hiddenID").get_element().value = "";
            $this.FindControl("hiddenDisp").get_element().value = "";
            $this.FindControl("labResp").get_element().innerHTML = "";
            doVis("$_divSearchLink", 1);
            doVis("$_spanSeachAgainLink", 0);
            eval($this.jsFunctionReload);
        }

        function f_toggleIndividualOrNot(val) {
            if (val == "individual") {
                document.getElementById("$_trFName").style.visibility = "visible";
                document.getElementById("$_trMName").style.visibility = "visible";
                document.getElementById("$_trLName").style.visibility = "visible";
                document.getElementById("$_trFName").style.display = ""; // "block";
                document.getElementById("$_trMName").style.display = ""; // "block";
                document.getElementById("$_trLName").style.display = ""; // "block";

                document.getElementById("$_trName").style.visibility = "hidden";
                document.getElementById("$_trName").style.display = "none";
                document.getElementById("$_tbName").value = "";
            } else {
                document.getElementById("$_trFName").style.display = "none";
                document.getElementById("$_trMName").style.display = "none";
                document.getElementById("$_trLName").style.display = "none";
                document.getElementById("$_tbFName").value = "";
                document.getElementById("$_tbMName").value = "";
                document.getElementById("$_tbLName").value = "";

                document.getElementById("$_trName").style.visibility = "visible";
                document.getElementById("$_trName").style.display = ""; // "block";
            }
            $_individualOrNot = val;
        }

        function f_submitForm() {
            doVis("$_trLoadingGraphic", 1);
            doVis("$_tableSearchEles", 0);
            var req = null;
            if (window.XMLHttpRequest) {
                req = new XMLHttpRequest();
                if (req.overrideMimeType) {
                    req.overrideMimeType('text/xml');
                }
            }
            else if (window.ActiveXObject) {
                try {
                    req = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        req = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) { }
                }
            }
            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    if (req.status == 200) {
                        //document.forms[0].dyn.value = "Received:" + req.responseText;
                        //document.forms[0].dyn.value = "Received:" + req.responseXML;
                        var xmlDoc;
                        if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
                            xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                            xmlDoc.async = "false";
                            xmlDoc.loadXML(req.responseText);
                        } else {
                            var parser = new DOMParser();
                            var xmlDoc = parser.parseFromString(req.responseText, "text/xml");
                        }
                        //Any Search Results?
                        try {
                            validString = xmlDoc.getElementsByTagName('ConstituentSearchResults')[0].childNodes[0].childNodes[0].nodeValue;
                        }
                        catch (e) {
                            //We are currently experiencing Network problems, please try again later.
                            doVis('$_divErpSearchForm', 0);
                            doVis('$_divNetworkError', 1);
                            return;
                        }
                        var nodeTotalResults = xmlDoc.getElementsByTagName('ConstituentSearchResults')[0].childNodes[0].childNodes[0].nodeValue;
                        var resultsNode = xmlDoc.getElementsByTagName('ConstituentSearchResults')[0].childNodes[1];
                        var outHTML = "";
                        var tableStart = "<table border=\"0\" width=\"425\" cellpadding=\"6\" cellspacing=\"0\">";

                        doVis('$_divErpSearchForm', 0);
                        doVis("$_trLoadingGraphic", 0);
                        doVis('$_divResultsContainer', 1);

                        if (nodeTotalResults > 0) {
                            outHTML = tableStart;
                            outHTML += "<tr><td colspan=\"2\">Search Results found: " + resultsNode.childNodes.length + "</td></tr>";
                            var dataNode;
                            var arrNodes = new Array();
                            for (i = 0; i < resultsNode.childNodes.length; i++) {
                                for (j = 0; j < resultsNode.childNodes[i].childNodes.length; j++) {
                                    arrNodes[j] = "";
                                    try {
                                        arrNodes[j] = resultsNode.getElementsByTagName('Constituent')[i].childNodes[j].childNodes[0].nodeValue;
                                    } catch (err) {

                                    }
                                }
                                var rowBG = (i % 2 == 0) ? "fbLookupDef" : "fbLookupAlt";
                                if ($_searchType == "Individual" || ($_searchType == "Not Specified" && $_individualOrNot == "individual")) {
                                    outHTML += "<tr class=\"" + rowBG + "\"><td valign=\"top\"><a href=\"javascript:$_erpObj.setVal('" + arrNodes[0] + "','" + escape(arrNodes[1].replace("'", "%27")) + " " + escape(arrNodes[3].replace("'", "%27")) + "');\">" + arrNodes[1] + " " + arrNodes[3] + "</a></td>" +
				                    "<td valign=\"top\">(" + arrNodes[4] + ", " + arrNodes[5] + ")</td></tr>";
                                }
                                else {
                                    outHTML += "<tr class=\"" + rowBG + "\"><td valign=\"top\"><a href=\"javascript:$_erpObj.setVal('" + arrNodes[0] + "','" + escape(arrNodes[1].replace("'", "%27")) + "');\">" + arrNodes[1] + "</a></td>" +
				                    "<td valign=\"top\">(" + arrNodes[2] + ", " + arrNodes[3] + ")</td></tr>";
                                }
                            }
                            outHTML += "</table>";
                            document.getElementById("$_divResultsItems").innerHTML = outHTML;
                        } else {
                            outHTML = tableStart;
                            outHTML += "<tr><td><br/>No results found<br/><br/></td></tr>";
                            outHTML += "</table>";
                            document.getElementById("$_divResultsItems").innerHTML = outHTML;
                        }
                    }
                    else {
                        //document.forms[0].dyn.value = "Error: returned status code " + req.status + " " + req.statusText;
                    }
                }
            };
            req.open("POST", $this.controlPath, true);
            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            if ($_searchType == "Individual") {
                req.send("searchType=" + $this.Name + "&fName=" + document.getElementById("$_tbFName").value + "&lName=" + document.getElementById("$_tbLName").value + "&mName=" + document.getElementById("$_tbMName").value + "&city=" + document.getElementById("$_tbCity").value + "&state=" + document.getElementById("$_selState").value + "&zip=" + document.getElementById("$_tbZip").value);
            } else if ($_searchType == "Not Specified") {
                req.send("searchType=" + $this.Name + "&name=" + document.getElementById("$_tbName").value + "&fName=" + document.getElementById("$_tbFName").value + "&lName=" + document.getElementById("$_tbLName").value + "&mName=" + document.getElementById("$_tbMName").value + "&city=" + document.getElementById("$_tbCity").value + "&state=" + document.getElementById("$_selState").value + "&zip=" + document.getElementById("$_tbZip").value + "&IndividualOrNot=" + $_individualOrNot);
            } else {
                req.send("searchType=" + $this.Name + "&name=" + document.getElementById("$_tbName").value + "&city=" + document.getElementById("$_tbCity").value + "&state=" + document.getElementById("$_selState").value + "&zip=" + document.getElementById("$_tbZip").value);
            }
        }
    }
</script>
<div id="$_divSearchLink">
	<a href="javascript:$_erpObj.showSearch();"><script language="javascript" type="text/javascript">document.write($_pTitle);</script></a> &nbsp; 
</div>	
<input type="hidden" id="hiddenID" runat="server" NAME="hiddenID"><input type="hidden" id="hiddenDisp" runat="server" NAME="hiddenDisp"><asp:Label ID="labResp" Runat="server" CssClass="fbFloatLeft" />
<span id="$_spanSeachAgainLink">
	&nbsp; (<a href="javascript:$_erpObj.showSearch();">Select Again</a> | <a href="javascript:$_erpObj.doClear();">Clear</a>)
</span>
<div id="$_divErpSearchForm">
	<table border="0" width="100%" cellpadding="4" cellspacing="4">
		<tr>
			<td id="$_trLoadingGraphic" colspan="2" align="center"><br/><br/><img src="UI/Common/Images/wait.gif"><br/>Searching...</td>
		</tr>
		<tr>
			<td colspan="2">
				<table id="$_tableSearchEles" border="0">
				    <tr id="$_trIndividualOrNot" class="lookup_hideRow">
				        <td colspan="2">
				            <input type="radio" id="$_radioIndividualOrNot" name="$_radioIndividualOrNot" value="individual" checked="checked" onclick="$_erpObj.toggleIndividualOrNot(this.value);" /> Search for an Individual<br />
				            <input type="radio" id="$_radioIndividualOrNot" name="$_radioIndividualOrNot" value="notAnIndividual" onclick="$_erpObj.toggleIndividualOrNot(this.value);" /> Search for a non-Individual
				        </td>
				    </tr>
					<tr id="$_trFName" class="lookup_hideRow">
						<td align="right" width="90">First Name</td>
						<td><input type="text" name="$_tbFName" id="$_tbFName"></td>
					</tr>
					<tr id="$_trMName" class="lookup_hideRow">
						<td align="right">Middle Name</td>
						<td><input type="text" name="$_tbMName" id="$_tbMName"></td>
					</tr>
					<tr id="$_trLName" class="lookup_hideRow">
						<td align="right">Last Name</td>
						<td><input type="text" name="$_tbLName" id="$_tbLName"></td>
					</tr>
					<tr id="$_trName">
						<td align="right" width="90">Name:</td>
						<td><input type="text" name="$_tbName" id="$_tbName"></td>
					</tr>
					<tr>
						<td align="right">City:</td>
						<td><input type="text" name="$_tbCity" id="$_tbCity"></td>
					</tr>
					<tr>
						<td align="right">State:</td>
						<td>
							<select name="$_selState" id="$_selState">
								<option value="">Select a State</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">Zip Code:</td>
						<td><input type="text" name="$_tbZip" id="$_tbZip"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<input type="button" value="Search" onclick="$_erpObj.submitForm();"> &nbsp; 
							<input type="button" value="Cancel" onclick="w.close();">
						</td>
					</tr>
				</table>&nbsp;
			</td>
		</tr>
	</table>
</div>
<div id="$_divResultsContainer">
	<div class="lookup_divResultsTitle">
		<table width="100%">
			<tr>
				<td><b>Results</b></td>
			</tr>
		</table>
	</div>
	<div id="$_divResultsItems">
		<table border="0" width="100%"></table>
	</div>
	<div id="lookup_divResultsBot">
		<table width="100%">
			<tr>
				<td><a href="javascript:$_erpObj.searchAgain();">Search Again</a></td>
				<td align="right"><a href="javascript:w.close();">Close</a></td>
			</tr>
		</table>
	</div>
</div>
<div id="$_divNetworkError">
	<div class="lookup_divResultsTitle">
		<table width="100%">
			<tr>
				<td><b>Results</b></td>
			</tr>
		</table>
	</div>
	<table border="0" cellpadding="4" cellspacing="4">
		<tr>
			<td>
				<br/>We are currently experiencing Network problems, please try again later. 
			</td>
		</tr>
	</table>
</div>
<script language="javascript" type="text/javascript">
    if ($_searchType == "Individual" || $_searchType == "Not Specified") {
        document.getElementById("$_trFName").style.visibility = "visible";
        document.getElementById("$_trMName").style.visibility = "visible";
        document.getElementById("$_trLName").style.visibility = "visible";

        document.getElementById("$_trName").style.visibility = "hidden";
        document.getElementById("$_trName").style.display = "none";
    } else {
        document.getElementById("$_trFName").style.display = "none";
        document.getElementById("$_trMName").style.display = "none";
        document.getElementById("$_trLName").style.display = "none";
    }
    if ($_searchType == "Not Specified") {
        document.getElementById("$_trIndividualOrNot").style.visibility = "visible";
    } else {
        document.getElementById("$_trIndividualOrNot").style.display = "none";
    }
    if ($this.FindControl("hiddenID").get_element().value.length > 0 && $this.FindControl("hiddenID").get_element().value != "0") {
        doVis("$_divSearchLink", 0);
        doVis("$_spanSeachAgainLink", 1);
    } else {
        doVis("$_divSearchLink", 1);
        doVis("$_spanSeachAgainLink", 0);
        $this.FindControl("labResp").get_element().innerHTML = "";
    }

    var objStates = JSON.parse($this.StatesCodes)
    c = 1;
    for (i = 0; i < objStates.length; i++) {
        try
        {
            document.getElementById("$_selState").options[c++] = new Option(objStates[i].Description, objStates[i].Code);
        } catch (err) {

        }
    }
</script>

