  
function MM_reloadPage(init) {
   //Updated by PVII. Reloads the window if Nav4 resized
   if (init == true) with (navigator) {
      if ((appName == "Netscape") && (parseInt(appVersion) == 4)) {
         document.MM_pgW = innerWidth;
         document.MM_pgH = innerHeight;
         onresize = MM_reloadPage;
         }
      }
   else if (innerWidth != document.MM_pgW || innerHeight != document.MM_pgH) location.reload();
   }
MM_reloadPage(true);
function MM_findObj(n, d) {
   // v4.01
   var p, i, x;
   if(!d) d = document;
   if((p = n.indexOf("?")) > 0 && parent.frames.length) {
      d = parent.frames[n.substring(p + 1)].document;
      n = n.substring(0, p);
      }
   if(!(x = d[n]) && d.all) x = d.all[n];
   for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
   for(i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
   if(!x && d.getElementById) x = d.getElementById(n);
   return x;
   }
function flvFSL1() {
   //v2.3
   // Copyright 2002-2004, Marja Ribbers-de Vroed, FlevOOware (www.flevooware.nl/dreamweaver/)
   var v1 = arguments, v2 = v1[0], v3 = MM_findObj(v2), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20 = window, v21 = navigator;
   if (v3) {
      v4 = parseInt(v1[1]);
      v5 = parseInt(v1[2]);
      v6 = parseInt(v1[3]);
      v7 = (v1.length > 4) ? parseInt(v1[4]) : 0;
      v8 = (v1.length > 5) ? parseInt(v1[5]) : 0;
      v9 = 10;
      v10 = document.layers ? v3 : v3.style;
      if (v3.SL1 != null) {
         clearTimeout(v3.SL1);
         }
      v11 = isNaN(parseInt(v10.left)) ? v3.offsetLeft : parseInt(v10.left);
      v12 = isNaN(parseInt(v10.top)) ? v3.offsetTop : parseInt(v10.top);
      if (v8 != 0) {
         if (v8 == 1) {
            v4 = v11 - v4;
            v5 = v12;
            }
         else if (v8 == 2) {
            v4 = v11 + v4;
            v5 = v12;
            }
         else if (v8 == 3) {
            v5 = v12 - v5;
            v4 = v11;
            }
         else {
            v5 = v12 + v5;
            v4 = v11;
            }
         }
      v13 = v4;
      v14 = v5;
      if ((v11 != v4) || (v12 != v5)) {
         if (v7 > 0) {
            v9 = v6;
            v15 = v7;
            v16 = v7, v17 = Math.abs(v11 - v4), v18 = Math.abs(v12 - v5);
            if (v17 < v18) {
               v16 = (v17 != 0) ? ((v18 / v17) * v7) : v7;
               }
            else {
               v15 = (v18 != 0) ? ((v17 / v18) * v7) : v7;
               }
            if (v15 >= v17) {
               v15 = Math.min(Math.ceil(v15), v7);
               }
            if (v16 >= v18) {
               v16 = Math.min(Math.ceil(v16), v7);
               }
            if ((v11 < v4) && (v11 + v15 < v4)) {
               v4 = v11 + v15;
               }
            if ((v11 > v4) && (v11 - v15 > v4)) {
               v4 = v11 - v15;
               }
            if ((v12 < v5) && (v12 + v16 < v5)) {
               v5 = v12 + v16;
               }
            if ((v12 > v5) && (v12 - v16 > v5)) {
               v5 = v12 - v16;
               }
            }
         else {
            v17 = ((v4 - v11)/v6);
            v18 = ((v5 - v12)/v6);
            v17 = (v17 > 0) ? Math.ceil(v17) : Math.floor(v17);
            v4 = v11 + v17;
            v18 = (v18 > 0) ? Math.ceil(v18) : Math.floor(v18);
            v5 = v12 + v18;
            }
         v19 = ((parseInt(v21.appVersion) > 4 || v21.userAgent.indexOf("MSIE") >- 1) && (!v20.opera)) ? "px" : "";
         if (v17 != 0) {
            v10.left = v4 + v19;
            }
         if (v18 != 0) {
            v10.top = v5 + v19;
            }
         var v22 = "flvFSL1('" + v2 + "'," + v13 + "," + v14 + "," + v6 + "," + v7 + ",0)";
         v3.SL1 = setTimeout(v22, v9);
         }
      else {
         if (v20.onSlideEnd) {
            onSlideEnd(v2);
            }
         }
      }
   }

	
	function getHeight (id) {  
		var gh = document.getElementById(id).offsetHeight;
		
		return gh;
	}

	function getWidth (id) {  
		var gh = document.getElementById(id).offsetWidth;
		return gh;
		
	}
	function getWidthByID (id) {
		var gh = id.offsetWidth;
		return gh;
	}
	
	function setHeight (id) {  
		id.getHeight('Layer1');
	}

	
	function ProcessPage()
	{
		
		resizeTheDiv();
	
	}

	function initIETOC() {
	    _toc = document.getElementById("Layer2");
	    _toc.style.width = (document.body.offsetWidth - 209) + "px";
	    _toc.style.height = 25 + "px";
	    _toc.style.left = 196 + "px";
	    setTimeout('resizeTheDiv()', 700);
	}
	
	function resizeTheDiv() {
	
   /*if (window.innerWidth) {
      var w = window.innerWidth;
      var h = window.innerHeight;
   }
   else {*/
      //var w = getWidth ('PORTLETGRID');
      var parentOfLayer1 = document.getElementById("Layer1").parentNode.parentNode;
      var w = getWidthByID(parentOfLayer1);
      w = w - 4;
   //}
   //w = (w < 200) ? 0 : w - 200;
   //h = (h < 200) ? 0 : h - 200;
   var theDiv = document.getElementById("Layer2");
   
   //find the location of the layer
   theDiv.style.visibility = "hidden";
   
   var mainwindow = document.getElementById("Layer1");

   

	
	var xlocation = findPos(parentOfLayer1)[0];
	xlocation = xlocation+1;
	var ylocation = findPos(document.getElementById("Layer1"))[1];
	ylocation = ylocation + 11;
   
   theDiv.style.width = w + "px";
   //theDiv.style.height = h + "px";
  // alert(xlocation + ' ' + ylocation);
  var ystart = (ylocation + getHeight("Layer1")) - getHeight("Layer3");
   
   flvFSL1('Layer2',xlocation,ystart, 10,3,0);
   
	theDiv.style.height = getHeight ('Layer3') + "px";
	theDiv.style.visibility = "visible";

	}
	window.onload = resizeTheDiv;
	window.onresize = resizeTheDiv;
	
	var tocvis = 0;
	
	function moveTOC()
	{
		if (tocvis == 0)
		{viewTOC();
		tocvis=1;
		}
		else
		{hideTOC();
		tocvis=0;
		}
	
	}
	
	function viewTOC()
	{	
		var theDiv = document.getElementById("Layer2");
		
		var tocShow = document.getElementById("Layer4");
		
		theDiv.style.height = (getHeight ('Layer3') + getHeight ('Layer4') + 20) + "px";
		var ystart = (findPos(document.getElementById("Layer1"))[1] + 10 + getHeight("Layer1")) - (getHeight ('Layer3') + getHeight ('Layer4') + 20);
		flvFSL1('Layer2',(findPos(document.getElementById("Layer1").parentNode.parentNode)[0] + 1),ystart,10);
		tocShow.style.visibility = "visible";
	}
	
	function hideTOC()
	{	
		var theDiv = document.getElementById("Layer2");
		
		var tocShow = document.getElementById("Layer4");
		
		theDiv.style.height = getHeight ('Layer3')+"px";
		var ystart = (findPos(document.getElementById("Layer1"))[1] + 11 + getHeight("Layer1")) - getHeight ('Layer2');
		flvFSL1('Layer2',(findPos(document.getElementById("Layer1").parentNode.parentNode)[0] + 1),ystart,10);
		tocShow.style.visibility = "hidden";
	}
	
	
	function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		curleft = obj.offsetLeft
		curtop = obj.offsetTop
		while (obj = obj.offsetParent) {
			curleft += obj.offsetLeft
			curtop += obj.offsetTop
		}
	}
	return [curleft,curtop];
}
   
