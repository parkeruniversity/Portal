
function Jenzabar$LMS$Portlets$CourseworkPortlet$Analytics$Basics(location_url)
{
    typeof "Jenzabar.LMS.Portlets.CourseworkPortlet.Analytics.Basics";
	
	var $this = this;
	var $base = JCSL.lang.inherit(this, JCSL.ui.CachedControl);

    var callback = function(returned)
	{
		if (returned instanceof Error)
		{
			tabs__select.basics = undefined;
					
			return;
		}
				
		//
				
		var div = JCSL.element.create_from_html(returned);
				
		JCSL.element.next(tabs.container).appendChild(div);
				
		tabs.get_tabs()[0].element = div;
	}
			
	////
						
	JCSL.JICS.rpc
	(
		{
			url:			($this.constructor._meta.base + "AboutBasics.htm"),
			callback:		callback,
			return_type:	JCSL.ajax.ReturnType.text,
			method:			JCSL.ajax.RequestType.gget
		}
	);
}