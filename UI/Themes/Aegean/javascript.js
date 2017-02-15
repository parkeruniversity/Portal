/*
JICS THEME SCRIPT - ReLiant
*/
// Execute on DOM Ready
$(function(){
  $("#errorMessage:empty").remove();
  Tabs();
  hidePipes();
  csPortletHeaders()
  sideBarDropDowns()
}); 

// Execute on Window Resize
$(window).resize(function(){
  Tabs();
});


/*-------------------Function Definitions----------------------*/

function csPortletHeaders() {
  $('.pHead div').hide();
  // Show Portlet Head icons on mouseover
  $(".pHead").mouseover(function(){$("div",this).show();}).mouseout(function(){$("div",this).hide();});
  // Move edit icon to Portlet Head
  $("div[id*=divEditOrAdd]").each(function(){$(this).appendTo($(this).closest('.portlet').find('.pHead div'));$(this).css({'display':'block','margin':'0 32px 0 0','width':'100px'})});
}

/* This will remove those annoying pipes hard-coded inbetween the footer links */
function hidePipes() {	
 var f = $("#policies"); 
 if(f.length){
	f.html( f.html().replace(/\|/g,"") ); 	
 }
}
function Tabs() {
  csTabOverflow();
  $('#more').mouseenter(function(){showMore();});
  $('#more').mouseleave(function(){hideMore();});
}

function showMore(){
  $('#moreList').css('display','block');
}

function hideMore(){
  $('#moreList').css('display','none');
}

function deleteEmptyTab(){
	var DIV = document.getElementById('headerTabs');
    var LI = DIV.getElementsByTagName('li');
    LI[0].parentNode.removeChild(LI[0]);
}

function csTabOverflow()
{
  try
  {
    //Move all tabs to tab container
    $('#moreList li').each(function(){
      $('#headerTabs ul').append($(this));
    });
    
  	$('#moreList').empty();
	$('#more').remove();
    //Check width and move as needed
    tabTotalWidth = 0;
	var moreList= $('<ul id="moreList" />');
    var flag=0;
	$('#headerTabs ul li').each(function(){
      tabTotalWidth += $(this).width();
	  tabTotalWidth += 30;
      if (tabTotalWidth+100>($('#headerTabs').width()))
      {
		//$(this).removeClass('selected'); //Un-Comment this if you don't want to highlight a drop-down if it's selected.
		moreList.append($(this));
		flag++;
      }
    });
	//Now that we have a UL object that is all full of our overlow tabs, and we've left room for a "MORE" Option, lets append another <li> to the headerTabs UL and then append our newly built submenu to this
	if (flag > 0){
		$('#more').css('display','block');
		$('#headerTabs ul').append("<li id='more'><a>more</a></li>");
 		$('#more').append(moreList);
		$('#moreList').css('display','none');
	}
  } catch(e){}
}
function sideBarDropDowns() {
  if ($('li.currentPage ul').length>0){ 
    $('li.currentPage').prepend('<a id="xpndPrtlts" href="javascript:void(0);" title="View Portlets">view</a>');
    $('#xpndPrtlts').click(function(){
      $('li.currentPage ul').toggle();
      if($('li.currentPage ul').is(':visible')){
        $(this).addClass('expanded');
      }else{
       $(this).removeClass('expanded');      
    }
    });  
    //If portlet is clicked, expand portlet list
    $('li.currentPage ul li a').each(function(){
      if (location.href.indexOf($(this).attr('href'),0)>-1){
        $('li.currentPage ul').show();
        $(this).addClass('selected');
      }else{
     	 $('li.currentPage ul').hide().removeClass('expanded');
      }
    });

  }
}