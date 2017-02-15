function CollapsiblePanel_ExpandCollapse(hd, cht, cha, st, tc, te)
{ 
	if(MM_findObj(hd).style.display == '')
	{ 
		MM_findObj(hd).style.display = 'none';
		if(cht != '')
		{
			MM_findObj(cht).title = te;
		}
		if(MM_findObj(cha) != null)
		{
			MM_findObj(cha).innerHTML = te;
		}
		MM_findObj(st).value = 'true';
	}
	else
	{ 
		MM_findObj(hd).style.display = '';
		if(cht != '')
		{
			MM_findObj(cht).title = tc;
		}
		if(MM_findObj(cha) != null)
		{
			MM_findObj(cha).innerHTML = tc;
		}
		MM_findObj(st).value = 'false';
	}
}

function CollapsiblePanel_ExpandCollapseImage(hd, cht, cha, st, ex, cl, tc, te)
{
	var elImg = (MM_findObj(cha)).getElementsByTagName("img");
	if(MM_findObj(hd).style.display == '')
	{ 
		MM_findObj(hd).style.display = 'none';
		if(cht != '')
		{
			MM_findObj(cht).title = te;
		}
		elImg[0].src = ex;
		elImg[0].alt = te;
		MM_findObj(st).value = 'true';
	}
	else
	{ 
		MM_findObj(hd).style.display = '';
		if(cht != '')
		{
			MM_findObj(cht).title = tc;
		}
		elImg[0].src = cl;
		elImg[0].alt = tc;
		MM_findObj(st).value = 'false';
	}
}