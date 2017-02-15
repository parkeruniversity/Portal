/*
This script was originally written by Greg Swearingen in January 2004 when the
previous method, based on Tommy Simmons script, was found not to work in later
versions of RH.
It was then found that the new script was not compatible with RH X4 or later.
Paul Symonds of Cedar Software rewrote part of it in March 2004 to make it
work with RH X4 and has made it backwards compatible.
At the same time he has amended it so that only one javascript file is required
for topics at all folder levels.
Peter Grainge 090304 */

//arrayofDivs contains each entire div tag as an individual object
//arrayofSpans contains each entire span tag as an individual object
//arrayofLinks contains all of the href values for the a tag
//jobCheck determines whether you want to Show All or Hide All based on the button image

var arrayofDivs = document.all.tags("DIV");
var arrayofSpans = document.all.tags("SPAN");
var arrayofLinks = document.all.tags("a");

// ****************************************

function jobCheck(imageName) 
{
	matchpattern = /btnshowall.gif/;
	if (matchpattern.test(imageName.src)) 
	{
		showEm();
	}
	matchpattern2 = /btnhideall.gif/;
	if (matchpattern2.test(imageName.src)) 
	{
		hideEm();
	}
}

// ****************************************
//PSymonds added 8/3/2004

function findRef(divId)
{
	try
	{
		for (var i=0;i<gPopupData.length;i++)
		{
			linkAttribute=gPopupData[i].popupId;
			linkAttribute = linkAttribute.substr(1, linkAttribute.length-1); 
			//alert("checking mappings: " + linkAttribute);
			
			if (linkAttribute==divId)
			{
				aId = gPopupData[i].el;
				//alert("matching id found: link id: " + aId);
				return aId;
			}
		}    
	}
	catch(e)
	{
		//Silently swallow exceptions  
		//Bad practice but allows this script to work with
		//versions < x4 that don't have a ref to 'gPopupData'
	}
}

// ****************************************

function showEm() 
{
	if ( arrayofDivs != null ) 
	{
		for (m = 0; m < arrayofDivs.length; m++) 
		{
			if ( arrayofDivs[m].style.display == "none") 
			{
				gergLink = arrayofDivs[m].id;
				gergLink = gergLink.substr(0, gergLink.length-4); //this is the id of the "a" link
				for (l = 0; l < arrayofLinks.length; l++) 
				{
					linkAttribute = arrayofLinks[l].getAttribute( "x-use-popup" );
					if( linkAttribute ) 
					{
						if( linkAttribute.substr(0,1) == "#" ) 
						{
							linkAttribute = linkAttribute.substr(1, linkAttribute.length-1);
						}
					}
					else
					{
						//find a ref for this div
						aId = findRef(arrayofDivs[m].id);
						
						if(arrayofLinks[l].id == aId)
						{
						 	//alert("got matching id");
						 	kadovTextPopup(arrayofLinks[l]);
						}
					}
					
					if (linkAttribute == gergLink) 
					{
						kadovTextPopup(arrayofLinks[l]);
					}
				}
			}
		}
	}
	
	if ( arrayofSpans != null ) 
	{
		for (n = 0; n < arrayofSpans.length; n++) 
		{
			if ( arrayofSpans[n].style.display == "none") 
			{
				
				gergLink = arrayofSpans[n].id; 
				gergLink = gergLink.substr(0, gergLink.length-4); //this is the id of the "a" link
				for (k = 0; k < arrayofLinks.length; k++) 
				{
					
					linkAttribute = arrayofLinks[k].getAttribute( "x-use-popup" );
					if( linkAttribute ) 
					{
						if( linkAttribute.substr(0,1) == "#" ) 
						{
							linkAttribute = linkAttribute.substr(1, linkAttribute.length-1);
						}
					}
					else
					{
						//find a ref for this span
						aId = findRef(arrayofSpans[n].id);
					
						if(arrayofLinks[k].id == aId)
						{
						 	//alert("got matching id");
						 	kadovTextPopup(arrayofLinks[k]);
						} 
					}
					
					if (linkAttribute == gergLink) 
					{
						kadovTextPopup(arrayofLinks[k]);
					}
				}
			}
		}
	}
}

// ****************************************

function hideEm() 
{
	if ( arrayofDivs != null ) 
	{
		for (m = 0; m < arrayofDivs.length; m++) 
		{
			if ( arrayofDivs[m].style.display == "") 
			{
				gergLink = arrayofDivs[m].id; 
				gergLink = gergLink.substr(0, gergLink.length-4); //this is the id of the "a" link
				for (l = 0; l < arrayofLinks.length; l++) 
				{
					linkAttribute = arrayofLinks[l].getAttribute( "x-use-popup" );
					if( linkAttribute ) 
					{
						if( linkAttribute.substr(0,1) == "#" ) 
						{
							linkAttribute = linkAttribute.substr(1, linkAttribute.length-1);
						}
					}
					else
					{
						//find a ref for this div
						aId = findRef(arrayofDivs[m].id);
						
						if(arrayofLinks[l].id == aId)
						{
						 	//alert("got matching id");
						 	kadovTextPopup(arrayofLinks[l]);
						} 	
					}
					
					if (linkAttribute == gergLink) 
					{
						kadovTextPopup(arrayofLinks[l]);
					} 
				}
			}
		}
	}
	if ( arrayofSpans != null ) 
	{
		for (n = 0; n < arrayofSpans.length; n++) 
		{
			if ( arrayofSpans[n].style.display == "") 
			{
				gergLink = arrayofSpans[n].id;
				gergLink = gergLink.substr(0, gergLink.length-4); //this is the id of the "a" link
				for (k = 0; k < arrayofLinks.length; k++) 
				{
					 
					linkAttribute = arrayofLinks[k].getAttribute( "x-use-popup" );
					if( linkAttribute ) 
					{
						if( linkAttribute.substr(0,1) == "#" ) 
						{
							linkAttribute = linkAttribute.substr(1, linkAttribute.length-1);
						}
					}
					else
					{
						//find a ref for this span
						aId = findRef(arrayofSpans[n].id);
						
						if(arrayofLinks[k].id == aId)
						{
						 	//alert("got matching id");
						 	kadovTextPopup(arrayofLinks[k]);
						} 
					}
					
					if (linkAttribute == gergLink) 
					{
						kadovTextPopup(arrayofLinks[k]);
					} 
				}
			} 
		}
	}
}

// ****************************************

function replaceSubstring(inputString, fromString, toString) 
{
	// Goes through the inputString and replaces every occurrence of fromString with toString
	var temp = inputString;
	
	if (fromString == "") 
	{
		return inputString;
	}
	
	if (toString.indexOf(fromString) == -1) 
	{ 
		while (temp.indexOf(fromString) != -1) 
		{
			 var toTheLeft = temp.substring(0, temp.indexOf(fromString));
			 var toTheRight = temp.substring(temp.indexOf(fromString)+fromString.length, temp.length);
			 temp = toTheLeft + toString + toTheRight;
		}
	}
	// Send the updated string back to the user
	return temp; 
} 

function swapImages(imageName) 
{
	matchpattern = /btnhideall.gif/;
	if (matchpattern.test(imageName.src)) 
	{
		//Replace image name leaving path intact
		newName = replaceSubstring(imageName.src, "btnhideall.gif", "btnshowall.gif") 
		 
		document.images[imageName.name].src=newName;
	}
	else 
	{       //Replace image name leaving path intact
		newName = replaceSubstring(imageName.src, "btnshowall.gif", "btnhideall.gif" ) 
		document.images[imageName.name].src=newName;
	}
}

/*The function below can ONLY be used with the two button method.
If you require this function, delete "// " from the next three lines. */

// function printEm() {
// showEm(this);setTimeout('window.print()',50);
// }


/*
Remove "// " from the last two lines if you also want the browser Print icon
to also print all expanding and dropdown text. This will cause all hotspots to show,
print with the rest of the topic, and then hide.
Leave "// " on the last line if you want all expanding and dropdown
text to be shown after printing. This is perhaps more intuitive for the user.*/

// window.onbeforeprint = showEm;
// window.onafterprint = hideEm;