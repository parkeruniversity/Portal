/*
function ieInitMenu(){
	var navRoot = document.getElementsByTagName('div');
	for( var z=0;z<navRoot.length;z++){
		if(navRoot[z].className=='pTool'&&navRoot[z].getElementsByTagName('ul').length>0){
			navRoot[z].onmouseover=function(){toggleHtmlSelectElements('hidden');}
			navRoot[z].onmouseout=function(){toggleHtmlSelectElements('visible');}
		}
	}
}*/
function toggleHtmlSelectElements(v){
	var s=document.getElementsByTagName('select');
	for(var i=0;i<s.length;i++)
		s[i].style.visibility=v;
}
