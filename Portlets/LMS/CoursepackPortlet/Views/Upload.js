
function Jenzabar$LMS$Portlets$CoursepackPortlet$Views$Upload(element_id_prefix, extend)
{
	typeof "Jenzabar.LMS.Portlets.CoursepackPortlet.Views.Upload";
	
	var $this = this;
	var $base = JCSL.lang.inherit(this, JCSL.JICS.Portlet, [element_id_prefix]);
	
	//#region METHOD
	
		this.init = function()
		{		
			var BTN_load = this.FindControl("BTN_load").get_element();
			
			JCSL.element.attach_events
			(
				[this.FindControl("BTN_upload").get_element(),	JCSL.dom_event.Type.click,  load__click	],
				[BTN_load,										JCSL.dom_event.Type.click,  load__click	],
				[this.get_element("CHK_fc"),					JCSL.dom_event.Type.click,  CHK_fc__click]
			);
			
			//
			
			if ((!$this.has_fc) || (this.FindControl("SELcoursepacks").get_element().length == 0))
			{
				this.get_element("TBLload_fc").disabled = true;
				
				BTN_load.disabled = true;
				
				if (!$this.has_fc)
				{
					this.get_element("CHK_fc").disabled = true;
				}
			}
		}
		
	//#endregion
	
	//#region ROUTINE
	
		var CHK_fc__click = function(event)
		{
			if (this.checked === true)
			{
				JCSL.window.document.append_to_postback("CUSTOM_save_to_fc", "true");
			}
			else
			{
				JCSL.window.document.remove_from_postback("CUSTOM_save_to_fc");
			}			
		}
	
		var load__click = function()
		{
			var show_loading = function()
			{
				var loading_increment = function()
				{
					var SPNloading = $this.get_element("SPNloading");
					
					var dots = SPNloading.innerHTML;
					
					if (dots.length > 5)
					{
						SPNloading.innerHTML = ".";
					}
					else
					{
						SPNloading.innerHTML = (dots + ".");
					}
					
					window.setTimeout(arguments.callee, 500);
				}
				
				////
				
				$this.get_element("DIVloading").style.display = JCSL.element.css.Display.block;
			
				loading_increment();
			}

			////

			//
			//disable background
			
			JCSL.window.document.disable(JCSL.JICS.DocumentProcessing);
			
			//
			
			var portlet_div = $this.get_element("DIVmain").parentNode.parentNode; //get portlet div

			var portlet_div_state = new JCSL.element.StateHolder(portlet_div, ["offsetWidth", "offsetHeight"]);
			
			with (portlet_div.style)
			{
				position	= JCSL.element.css.Position.absolute;
				width		= portlet_div_state.state.offsetWidth + "px";
				height		= portlet_div_state.state.offsetHeight + "px";
				zIndex		= (JCSL.layering.get_top_z_index() + 1);
				cursor		= JCSL.element.css.Cursor.wait;
			}
			
			//
			//create document placeholder for floating portlet
			
			JCSL.element.create_placeholder(portlet_div);
			
			//
			//portlet anchors
			
			JCSL.element.anchor.disable(portlet_div.getElementsByTagName(JCSL.element.Type.anchor), JCSL.element.css.Cursor.wait);
						
			//
			//show the user loading dots
			
			show_loading();
		}
			
	//#endregion
	
	//#region contructor
			
		JCSL.lang.extend($this, extend, false);
	
	//#endregion
}
